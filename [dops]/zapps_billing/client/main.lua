ESX = nil
local isDead = false

PlayerData = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	PlayerData.job = job
end)

function inarray(set, key)
	for k, val in ipairs(set) do
		if val == key then
			return true
		end
	end

	return false
end

function ShowBillsMenu()
	ESX.TriggerServerCallback('zapps_billing:getUnpaidBills', function(bills)
		ESX.UI.Menu.CloseAll()
		local elements = {}

		hasjobs = {}
		isboss = {}

		nearby = ESX.Game.GetPlayersInArea(GetEntityCoords(GetPlayerPed(-1), true), 15)
		nearbyTable = {}

		for k, v in ipairs(nearby) do
			ESX.TriggerServerCallback("zapps_billing:getPlayerName", function(name)
				table.insert(nearbyTable, {name = name, id = GetPlayerServerId(v)})
			end, GetPlayerServerId(v))
		end

		-- Technically, one job could be set to manage more than one society, and as such we need to keep a list of all the societies a player can run
		for k, v in ipairs(Config.Societies) do
			-- The player has one of the whitelisted jobs
			if inarray(v.jobs, PlayerData.job.name) then
				table.insert(hasjobs, v)

				-- Should the player be able to be boss in this society?
				if PlayerData.job.grade >= v.boss then
					table.insert(isboss, v)

					table.insert(elements, {
						label = _U("manage_society", v.name),
						value = 'manageinvoices',
						society = v,
					})
				end
			end
		end

		if #hasjobs > 0 then
			table.insert(elements, {
				label = _U('add_invoice'),
				value = 'addinvoice',
				jobs = hasjobs
			})
		end

		table.insert(elements, {
			label  = _U('show_invoices', #bills),
			value = 'showbills'
		})

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'billing',
		{
			title    = _U('invoices'),
			align    = 'bottom-right',
			elements = elements
		}, function(data, menu)
			menu.close()

			if data.current.value == 'addinvoice' then
				SetNuiFocus(true, true)
				SendNUIMessage({
					action = 'addinvoice',
					jobs = hasjobs,
					societies = Config.Societies,
					nearby = nearbyTable,
					canSetPaytime = Config.AllowAuthorSetMaxDelay,
					paytimeMin = Config.AuthorMinDelay,
					paytimeMax = Config.AuthorMaxDelay
				})
			elseif data.current.value == "manageinvoices" then
				ESX.TriggerServerCallback('zapps_billing:getSocietyAccount', function(account)
					ESX.TriggerServerCallback('zapps_billing:getSocietyBills', function(bills_author, bills_receiver)
						print(ESX.DumpTable(bills_author))
						print(ESX.DumpTable(bills_receiver))
						print(ESX.DumpTable(account))
						SetNuiFocus(true, true)
						SendNUIMessage({
							action = 'manageinvoices',
							jobs = hasjobs,
							society = data.current.society,
							societyMoney = account.money,
							societyBillsAuthor = bills_author,
							societyBillsReceiver = bills_receiver
						})
					end, data.current.society)
				end, data.current.society)
			elseif data.current.value == "showbills" then
				ESX.TriggerServerCallback('zapps_billing:getAllBills', function(billsAll)
					ESX.TriggerServerCallback("zapps_billing:getClientAccountMoney", function(money)
						SetNuiFocus(true, true)
						SendNUIMessage({
							action = 'showbills',
							bills = billsAll,
							accountMoney = money,
						})
					end)
				end)
			end
		end, function(data, menu)
			menu.close()
		end)
	end)
end

-- Key controls
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if IsControlJustReleased(0, Config.OpenMenuKey) and not isDead and not ESX.UI.Menu.IsOpen('default', GetCurrentResourceName(), 'billing') then
			ShowBillsMenu()
		end
	end
end)

AddEventHandler('esx:onPlayerDeath', function(data)
	isDead = true
end)

AddEventHandler('playerSpawned', function(spawn)
	isDead = false
end)

RegisterNUICallback('closeNUI', function(data, cb)
	SetNuiFocus(false)
	SendNUIMessage({
		action = 'close'
	})
end)

RegisterNUICallback('addNewInvoice', function(data, cb)
	-- Because this is a NUI return, run the checks again to make sure this user SHOULD indeed have access
	access = false

	for k, v in ipairs(Config.Societies) do
		if inarray(v.jobs, PlayerData.job.name) and v.account == data.sendingSociety then
			-- Does indeed have access
			access = true
			break
		end
	end

	if access then
		-- Proceed with sending the invoice
		TriggerServerEvent("zapps_billing:sendNewInvoice", data)
	else
		-- Send a webhook with info that an unahtorised user tried adding an invoice without the required job
	end
end)

RegisterNUICallback('payInvoice', function(data, cb)
	TriggerServerEvent("zapps_billing:payInvoice", data.billId)
end)

RegisterNUICallback('paySocietyInvoice', function(data, cb)
	TriggerServerEvent("zapps_billing:paySocietyInvoice", data.billId)
end)

RegisterNUICallback('cancelInvoice', function(data, cb)
	TriggerServerEvent("zapps_billing:cancelInvoice", data.billId)
end)
