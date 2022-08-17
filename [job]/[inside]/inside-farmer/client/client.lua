ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

--------------------------------------------------------------------------------

local JobStart = Config.Farmer.JobStart
local Cloakroom = Config.Farmer.Cloakroom
local Container = Config.Farmer.Container
local Payout = Config.Farmer.Payout
local PlayerData = {}
local lock, JobStarted, clothes, vegetable, block, CreateMarkerJob = false, false, false, false, false, false
local Type
local done, AmountPayout = 0, 0

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	PlayerData.job = job
end)


Citizen.CreateThread(function()
	while true do
		local sleep = 500
		local ped = PlayerPedId()
		local coords = GetEntityCoords(ped)
		
		if PlayerData.job ~= nil and PlayerData.job.grade_name == 'farmer' then
			if(GetDistanceBetweenCoords(coords, JobStart.Pos.x, JobStart.Pos.y, JobStart.Pos.z, true) < 8.0) and not JobStarted then
				sleep = 5

				DrawMarker(JobStart.Type, JobStart.Pos.x, JobStart.Pos.y, JobStart.Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, JobStart.Size.x, JobStart.Size.y, JobStart.Size.z, JobStart.Color.r, JobStart.Color.g, JobStart.Color.b, 100, false, true, 2, false, false, false, false)
				DrawMarker(29, JobStart.Pos.x, JobStart.Pos.y, JobStart.Pos.z+0.90, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.0, 1.0, 1.0, 143, 235, 77, 100, false, true, 2, false, false, false, false)
				if(GetDistanceBetweenCoords(coords, JobStart.Pos.x, JobStart.Pos.y, JobStart.Pos.z, true) < 1.5) then
					DrawText3Ds(JobStart.Pos.x, JobStart.Pos.y, JobStart.Pos.z+1.4, 'Чтобы начать выполнение заказа, нажмите [E]')
				end	
			elseif(GetDistanceBetweenCoords(coords, Cloakroom.Pos.x, Cloakroom.Pos.y, Cloakroom.Pos.z, true) < 8.0) and JobStarted then
				sleep = 5

				DrawMarker(Cloakroom.Type, Cloakroom.Pos.x, Cloakroom.Pos.y, Cloakroom.Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Cloakroom.Size.x, Cloakroom.Size.y, Cloakroom.Size.z, Cloakroom.Color.r, Cloakroom.Color.g, Cloakroom.Color.b, 100, false, true, 2, false, false, false, false)
				DrawMarker(30, Cloakroom.Pos.x, Cloakroom.Pos.y, Cloakroom.Pos.z+0.90, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.5, 0.5, 0.5, 255, 255, 255, 100, false, true, 2, false, false, false, false)
				if(GetDistanceBetweenCoords(coords, Cloakroom.Pos.x, Cloakroom.Pos.y, Cloakroom.Pos.z, true) < 1.5) then
					if not clothes then
						DrawText3Ds(Cloakroom.Pos.x, Cloakroom.Pos.y, Cloakroom.Pos.z+1.4, 'Чтобы переодеться в рабочую одежду, нажмите [E]')
					elseif clothes then
						DrawText3Ds(Cloakroom.Pos.x, Cloakroom.Pos.y, Cloakroom.Pos.z+1.4, 'Чтобы переодеться в одежду гражданина, нажмите [E]')
					end	
				end	
			elseif(GetDistanceBetweenCoords(coords, Container.Pos.x, Container.Pos.y, Container.Pos.z, true) < 8.0) and clothes then
				sleep = 5

				if(GetDistanceBetweenCoords(coords, Container.Pos.x, Container.Pos.y, Container.Pos.z, true) < 1.5) and not vegetable then
					DrawText3Ds(Container.Pos.x, Container.Pos.y, Container.Pos.z+1.4, 'Чтобы взять овощи, нажмите [E]')
				end
			end
		end
	Citizen.Wait(sleep)
	end
end)

Citizen.CreateThread(function()
	while true do
		local sleep = 500
		local ped = PlayerPedId()
		local coords = GetEntityCoords(ped)

	if PlayerData.job ~= nil and PlayerData.job.grade_name == 'farmer' then
		if(GetDistanceBetweenCoords(coords, JobStart.Pos.x, JobStart.Pos.y, JobStart.Pos.z, true) < 1.5) and not JobStarted then
			sleep = 0

			if IsControlJustReleased(0, Keys['E']) and not IsPedInAnyVehicle(ped, false) then
				exports.pNotify:SendNotification({text = '<b>Фермер</b></br>Работа начата, отправляйтесь на склад!', timeout = 1500})
				JobStarted = true
				WarehouseBlip()
			elseif IsControlJustReleased(0, Keys['E']) and IsPedInAnyVehicle(ped, false) then
				exports.pNotify:SendNotification({text = '<b>Фермер</b></br>Покинуть автомобиль!', timeout = 1500})
			end
		elseif(GetDistanceBetweenCoords(coords, Cloakroom.Pos.x, Cloakroom.Pos.y, Cloakroom.Pos.z, true) < 1.5) and JobStarted then
			sleep = 0

			if IsControlJustReleased(0, Keys['E']) and not clothes and not IsPedInAnyVehicle(ped, false) then
				exports.rprogress:Custom({
					Duration = 2500,
					Label = "Изменение износа...",
					Animation = {
						scenario = "WORLD_HUMAN_COP_IDLES", -- https://pastebin.com/6mrYTdQv
						animationDictionary = "idle_a", -- https://alexguirre.github.io/animations-list/
					},
					DisableControls = {
						Mouse = false,
						Player = true,
						Vehicle = true
					}
				})
				Citizen.Wait(2500)
				ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
					if skin.sex == 0 then
						TriggerEvent('skinchanger:loadClothes', skin, Config.Clothes.male)
					else
						TriggerEvent('skinchanger:loadClothes', skin, Config.Clothes.female)
					end
					clothes = true
					exports.pNotify:SendNotification({text = '<b>Фермер</b></br>Перейдите к контейнеру!', timeout = 1500})
					ContainerBlip()
				end)				
			elseif IsControlJustReleased(0, Keys['E']) and clothes and not IsPedInAnyVehicle(ped, false)  then
				exports.rprogress:Custom({
					Duration = 3000,
					Label = "Changing wear...",
					Animation = {
						scenario = "WORLD_HUMAN_COP_IDLES", -- https://pastebin.com/6mrYTdQv
						animationDictionary = "idle_a", -- https://alexguirre.github.io/animations-list/
					},
					DisableControls = {
						Mouse = false,
						Player = true,
						Vehicle = true
					}
				})
				Citizen.Wait(3000)
				ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
					TriggerEvent('skinchanger:loadSkin', skin)
					clothes = false
					RemoveBlip(Containerblip)
					RemoveBlip(FarmBlip)
					CreateMarkerJob = false
					vegetable = false
					done = 0
					for i, v in ipairs(Config.CucumbersPositions) do
						v.planted = false
						RemoveBlip(v.blip)
					end
					for i, v in ipairs(Config.LettucePositions) do
						v.planted = false
						RemoveBlip(v.blip)
					end	
					for i, v in ipairs(Config.PotatoesPositions) do
						v.planted = false
						RemoveBlip(v.blip)
					end					
				end)				
			elseif IsControlJustReleased(0, Keys['E']) and clothes and IsPedInAnyVehicle(ped, false) then 
				exports.pNotify:SendNotification({text = '<b>Фермер</b></br>Покинуть автомобиль!', timeout = 1500})
			end
		elseif(GetDistanceBetweenCoords(coords, Container.Pos.x, Container.Pos.y, Container.Pos.z, true) < 1.5) and clothes then
			sleep = 0

			if IsControlJustReleased(0, Keys['E']) and not vegetable and not IsPedInAnyVehicle(ped, false) then
				vegetable = true
				exports.rprogress:Custom({
					Duration = 5000,
					Label = "Сбор овощей...",
					Animation = {
						scenario = "WORLD_HUMAN_CLIPBOARD", -- https://pastebin.com/6mrYTdQv
						animationDictionary = "idle_a", -- https://alexguirre.github.io/animations-list/
					},
					DisableControls = {
						Mouse = false,
						Player = true,
						Vehicle = true
					}
				})
				Citizen.Wait(5000)
				RemoveBlip(Containerblip)
				VegetableType = Randomize(Config.Farms)	
				exports.pNotify:SendNotification({text = '<b>Фермер</b></br>Сегодня мы посадим '..VegetableType.FarmName, timeout = 1500})
				CreateFarmBlip(VegetableType)
				lock = false
				StartLoop()
			elseif IsControlJustReleased(0, Keys['E']) and not vegetable and IsPedInAnyVehicle(ped, false) then 
				exports.pNotify:SendNotification({text = '<b>Фермер</b></br>Покиньте автомобиль!', timeout = 1500})
			end
		end
	end
	Citizen.Wait(sleep)
	end
end)

function StartLoop()
	while true and not lock do
		local sleep = 500
		local ped = PlayerPedId()
		local coords = GetEntityCoords(ped)

		if(GetDistanceBetweenCoords(coords, VegetableType.x, VegetableType.y, VegetableType.z, true) < 20) and vegetable then
			sleep = 5
			lock = true
			RemoveBlip(FarmBlip)
			CreateWork(VegetableType.FarmName)
		end
		Citizen.Wait(sleep)
	end
end

function CreateWork(type)

		if type == "Cucumbers" then
			for i, v in ipairs(Config.CucumbersPositions) do
				v.blip = AddBlipForCoord(v.x, v.y, v.z)
				SetBlipSprite(v.blip, 1)
				SetBlipColour(v.blip, 0)
				SetBlipScale(v.blip, 0.3)
				SetBlipAsShortRange(v.blip, true)
				BeginTextCommandSetBlipName("STRING")
				AddTextComponentString('cucumber')
				EndTextCommandSetBlipName(v.blip)
			end
		elseif type == "Lettuce" then
			for i, v in ipairs(Config.LettucePositions) do
				v.blip = AddBlipForCoord(v.x, v.y, v.z)
				SetBlipSprite(v.blip, 1)
				SetBlipColour(v.blip, 0)
				SetBlipScale(v.blip, 0.3)
				SetBlipAsShortRange(v.blip, true)
				BeginTextCommandSetBlipName("STRING")
				AddTextComponentString('lettuce')
				EndTextCommandSetBlipName(v.blip)
			end
		elseif type == "Potatoes" then
			for i, v in ipairs(Config.PotatoesPositions) do
				v.blip = AddBlipForCoord(v.x, v.y, v.z)
				SetBlipSprite(v.blip, 1)
				SetBlipColour(v.blip, 0)
				SetBlipScale(v.blip, 0.3)
				SetBlipAsShortRange(v.blip, true)
				BeginTextCommandSetBlipName("STRING")
				AddTextComponentString('potato')
				EndTextCommandSetBlipName(v.blip)
			end
		end

		CreateMarkerJob = true
		Type = type
end

Citizen.CreateThread(function()
	while true do
		sleep = 500
		local ped = PlayerPedId()
		coords = GetEntityCoords(ped)
		if PlayerData.job ~= nil and PlayerData.job.grade_name == 'farmer' then
			if CreateMarkerJob then
				if Type == "Cucumbers" then
					sleep = 5
					for i, v in ipairs(Config.CucumbersPositions) do
						if(GetDistanceBetweenCoords(coords, v.x, v.y, v.z, true) < 8) and vegetable and not v.planted then
							DrawMarker(20, v.x, v.y, v.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.5, 0.5, 0.5, 255, 255, 255, 100, false, true, 2, false, false, false, false)
							DrawText3Ds(v.x, v.y, v.z+0.5, 'Чтобы посадить, нажмите [E]')
							if(GetDistanceBetweenCoords(coords, v.x, v.y, v.z, true) < 1.5) and vegetable and not v.planted then
								if IsControlJustReleased(0, Keys['E']) and vegetable and not block and not IsPedInAnyVehicle(ped, false) then
									block = true
									exports.rprogress:Custom({
										Duration = 8000,
										Label = "Посадка огурцов...",
										Animation = {
											scenario = "WORLD_HUMAN_GARDENER_PLANT", -- https://pastebin.com/6mrYTdQv
											animationDictionary = "enter", -- https://alexguirre.github.io/animations-list/
										},
										DisableControls = {
											Mouse = false,
											Player = true,
											Vehicle = true
										}
									})
									Citizen.Wait(8000)
									v.planted = true
									RemoveBlip(v.blip)
									done = done + 1
									block = false
									if done == #Config.CucumbersPositions then
										JobDone(Config.CucumbersPositions)
									end
								elseif IsControlJustReleased(0, Keys['E']) and vegetable and not block and IsPedInAnyVehicle(ped, false) then 
									exports.pNotify:SendNotification({text = '<b>Фермер</b></br>Покинуть автомобиль!', timeout = 1500})
								end
							end
						end
					end
				elseif Type == "Potatoes" then
					sleep = 5
					for i, v in ipairs(Config.PotatoesPositions) do
						if(GetDistanceBetweenCoords(coords, v.x, v.y, v.z, true) < 8) and vegetable and not v.planted then
							DrawMarker(20, v.x, v.y, v.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.5, 0.5, 0.5, 255, 255, 255, 100, false, true, 2, false, false, false, false)
							DrawText3Ds(v.x, v.y, v.z+0.5, 'Чтобы посадить, нажмите [E]')
							if(GetDistanceBetweenCoords(coords, v.x, v.y, v.z, true) < 1.5) and vegetable and not v.planted then
								if IsControlJustReleased(0, Keys['E']) and vegetable and not block and not IsPedInAnyVehicle(ped, false) then
									block = true
									exports.rprogress:Custom({
										Duration = 8000,
										Label = "Посадка картофеля...",
										Animation = {
											scenario = "WORLD_HUMAN_GARDENER_PLANT", -- https://pastebin.com/6mrYTdQv
											animationDictionary = "enter", -- https://alexguirre.github.io/animations-list/
										},
										DisableControls = {
											Mouse = false,
											Player = true,
											Vehicle = true
										}
									})
									Citizen.Wait(8000)
									v.planted = true
									RemoveBlip(v.blip)
									done = done + 1
									block = false
									if done == #Config.PotatoesPositions then
										JobDone(Config.PotatoesPositions)
									end
								elseif IsControlJustReleased(0, Keys['E']) and vegetable and not block and IsPedInAnyVehicle(ped, false) then 
									exports.pNotify:SendNotification({text = '<b>Фермер</b></br>Покинуть автомобиль!', timeout = 1500})
								end
							end
						end
					end
				elseif Type == "Lettuce" then
					sleep = 5
					for i, v in ipairs(Config.LettucePositions) do
						if(GetDistanceBetweenCoords(coords, v.x, v.y, v.z, true) < 8) and vegetable and not v.planted then
							DrawMarker(20, v.x, v.y, v.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.5, 0.5, 0.5, 255, 255, 255, 100, false, true, 2, false, false, false, false)
							DrawText3Ds(v.x, v.y, v.z+0.5, 'Чтобы посадить, нажмите [E]')
							if(GetDistanceBetweenCoords(coords, v.x, v.y, v.z, true) < 1.5) and vegetable and not v.planted then
								if IsControlJustReleased(0, Keys['E']) and vegetable and not block and not IsPedInAnyVehicle(ped, false) then
									block = true
									exports.rprogress:Custom({
										Duration = 8000,
										Label = "Посадка салата-латука...",
										Animation = {
											scenario = "WORLD_HUMAN_GARDENER_PLANT", -- https://pastebin.com/6mrYTdQv
											animationDictionary = "enter", -- https://alexguirre.github.io/animations-list/
										},
										DisableControls = {
											Mouse = false,
											Player = true,
											Vehicle = true
										}
									})
									Citizen.Wait(8000)
									v.planted = true
									RemoveBlip(v.blip)
									done = done + 1
									block = false
									if done == #Config.LettucePositions then
										JobDone(Config.LettucePositions)	
									end
								elseif IsControlJustReleased(0, Keys['E']) and vegetable and not block and IsPedInAnyVehicle(ped, false) then 
									exports.pNotify:SendNotification({text = '<b>Фермер</b></br>Покинуть автомобиль!', timeout = 1500})
								end
							end
						end
					end
				end
			end
		end
		Citizen.Wait(sleep)
	end
end)

function JobDone(type)
	CreateMarkerJob = false
	vegetable = false
	done = 0
	AmountPayout = AmountPayout + 1
	exports.pNotify:SendNotification({text = '<b>Фермер</b></br>Выплату можно забрать', timeout = 1500})
	RemoveBlip(PayoutBlip)
	CreatePayoutBlip()
	ContainerBlip()
	for i, v in ipairs(type) do
		v.planted = false
		RemoveBlip(v.blip)
	end
end

Citizen.CreateThread(function()
	while true do
		sleep = 500
		local ped = PlayerPedId()
		local coords = GetEntityCoords(ped)
		if PlayerData.job ~= nil and PlayerData.job.grade_name == 'farmer' then			
			if(GetDistanceBetweenCoords(coords, Payout.Pos.x, Payout.Pos.y, Payout.Pos.z, true) < 3) and AmountPayout > 0 and JobStarted then
				sleep = 0

				DrawMarker(Payout.Type, Payout.Pos.x, Payout.Pos.y, Payout.Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Payout.Size.x, Payout.Size.y, Payout.Size.z, Payout.Color.r, Payout.Color.g, Payout.Color.b, 100, false, true, 2, false, false, false, false)
				DrawMarker(29, Payout.Pos.x, Payout.Pos.y, Payout.Pos.z+0.90, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.0, 1.0, 1.0, 143, 235, 77, 100, false, true, 2, false, false, false, false)
				DrawText3Ds(Payout.Pos.x, Payout.Pos.y, Payout.Pos.z+1.4, 'Чтобы получить зарплату, нажмите [E]')
				if(GetDistanceBetweenCoords(coords, Payout.Pos.x, Payout.Pos.y, Payout.Pos.z, true) < 1.5) and AmountPayout > 0 and JobStarted then
					if IsControlJustReleased(0, Keys['E']) and AmountPayout > 0 and JobStarted and not IsPedInAnyVehicle(ped, false) then
						exports.pNotify:SendNotification({text = '<b>Фермер</b></br>Вы заслужили '..AmountPayout*Config.Payout..'$', timeout = 1500})
						TriggerServerEvent('inside-farmer:payout', AmountPayout)
						AmountPayout = 0
						RemoveBlip(PayoutBlip)
					elseif IsControlJustReleased(0, Keys['E']) and AmountPayout > 0 and JobStarted and IsPedInAnyVehicle(ped, false) then 
						exports.pNotify:SendNotification({text = '<b>Фермер</b></br>Покинуть автомобиль!', timeout = 1500})
					end
				end
			end
		end
		Citizen.Wait(sleep)
	end
end)


function Randomize(tb)
	local keys = {}
	for k in pairs(tb) do table.insert(keys, k) end
	return tb[keys[math.random(#keys)]]
end

function DrawText3Ds(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

function CreatePayoutBlip()
	PayoutBlip = AddBlipForCoord(Payout.Pos.x, Payout.Pos.y, Payout.Pos.z)
  
	SetBlipSprite (PayoutBlip, 500)
	SetBlipDisplay(PayoutBlip, 4)
	SetBlipScale  (PayoutBlip, 0.6)
	SetBlipColour (PayoutBlip, 11)
	SetBlipAsShortRange(PayoutBlip, true)

	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString('Выплаты')
	EndTextCommandSetBlipName(PayoutBlip)
end

function CreateFarmBlip(type)
	FarmBlip = AddBlipForCoord(type.x, type.y, type.z)
  
	SetBlipSprite (FarmBlip, 280)
	SetBlipDisplay(FarmBlip, 4)
	SetBlipScale  (FarmBlip, 0.8)
	SetBlipColour (FarmBlip, 11)
	SetBlipAsShortRange(FarmBlip, true)

	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString(type.FarmName)
	EndTextCommandSetBlipName(FarmBlip)
end

function WarehouseBlip()
	local blip = AddBlipForCoord(Cloakroom.Pos.x, Cloakroom.Pos.y, Cloakroom.Pos.z)
  
	SetBlipSprite (blip, 478)
	SetBlipDisplay(blip, 4)
	SetBlipScale  (blip, 0.6)
	SetBlipColour (blip, 0)
	SetBlipAsShortRange(blip, true)

	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString('Склад')
	EndTextCommandSetBlipName(blip)
end

function ContainerBlip()
	Containerblip = AddBlipForCoord(Container.Pos.x, Container.Pos.y, Container.Pos.z)
  
	SetBlipSprite (Containerblip, 479)
	SetBlipDisplay(Containerblip, 4)
	SetBlipScale  (Containerblip, 0.5)
	SetBlipColour (Containerblip, 0)
	SetBlipAsShortRange(Containerblip, true)

	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString('Контейнер')
	EndTextCommandSetBlipName(Containerblip)
end

Citizen.CreateThread(function()
	local blip = AddBlipForCoord(JobStart.Pos.x, JobStart.Pos.y, JobStart.Pos.z)
  
	SetBlipSprite (blip, 456)
	SetBlipDisplay(blip, 4)
	SetBlipScale  (blip, 1.2)
	SetBlipColour (blip, 5)
	SetBlipAsShortRange(blip, true)

	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString('Фермер')
	EndTextCommandSetBlipName(blip)
end)

