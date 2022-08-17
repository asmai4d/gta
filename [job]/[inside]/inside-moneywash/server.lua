ESX = nil
local WashedMoney = nil

lastDrivers = 0
Laundry1 = false
Laundry2 = false
Laundry3 = false
Laundry4 = false
Laundry = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('inside-moneywash:checkLaundryCard', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
    local itemCard = xPlayer.getInventoryItem('LaundryCard').count

	if itemCard > 0 then
		xPlayer.removeInventoryItem('LaundryCard', 1)
		cb(true)
	else
		cb(false)
	end
end)

RegisterServerEvent('inside-moneywash:returnLaundryCard')
AddEventHandler('inside-moneywash:returnLaundryCard', function()
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.addInventoryItem('LaundryCard', 1)
end)

ESX.RegisterServerCallback('inside-moneywash:LoadBlackMoney', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	local BlackMoney = xPlayer.getAccount('black_money').money

    if BlackMoney > icfg.LaundryMaxMoneyWash then
        amount = math.random(icfg.LaundryMinMoneyWash, icfg.LaundryMaxMoneyWash)
        xPlayer.removeAccountMoney('black_money', amount)
		cb(amount)
		WashedMoney = amount
	elseif BlackMoney < icfg.LaundryMaxMoneyWash then
		xPlayer.removeAccountMoney('black_money', BlackMoney)
		cb(BlackMoney)
		WashedMoney = BlackMoney
	elseif BlackMoney <= 0 then
		cb(false)
    end
end)

RegisterServerEvent('inside-moneywash:GetWashedMoney')
AddEventHandler('inside-moneywash:GetWashedMoney', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	local MoneyAfterTax = WashedMoney * icfg.WashingTax

	chance = math.random(0,100)
	if chance > icfg.DropWorkPermitChance then
		xPlayer.addInventoryItem('WorkPermit', 1)
		xPlayer.addMoney(MoneyAfterTax)
		TriggerClientEvent("pNotify:SendNotification", source, {text = "<b>Laundry</b></br>You Laundered <b style='color: red;'>" ..WashedMoney.. "$</b> Black Money. You got <b style='color: green;'>" ..MoneyAfterTax.. "$</b> Clean Money from it.", timeout = 5000})
		TriggerClientEvent("pNotify:SendNotification", source, {text = "<b>Laundry</b></br>You found a Work Permit in a Washing Machine. There is some information on it, Check it out!", timeout = 5000})
	else
		xPlayer.addMoney(MoneyAfterTax)
		TriggerClientEvent("pNotify:SendNotification", source, {text = "<b>Laundry</b></br>You Laundered <b style='color: red;'>" ..WashedMoney.. "$</b> Black Money. You got <b style='color: green;'>" ..MoneyAfterTax.. "$</b> Clean Money from it.", timeout = 5000})
	end
end)

ESX.RegisterServerCallback('inside-moneywash:checkWorkPermit', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
    local itemCount = xPlayer.getInventoryItem('WorkPermit').count

	if itemCount > 0 then
		xPlayer.removeInventoryItem('WorkPermit', 1)
		cb(true)
	else
		cb(false)
	end
end)

ESX.RegisterServerCallback('inside-moneywash:payforVehicle', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
    local Money = xPlayer.getMoney()

	if Money > icfg.DepositPrice then
		xPlayer.removeMoney(icfg.DepositPrice)
		cb(true)
	else
		cb(false)
	end
end)


RegisterServerEvent('inside-moneywash:ExchangeMoney')
AddEventHandler('inside-moneywash:ExchangeMoney', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	local BlackMoney = xPlayer.getAccount('black_money').money

	if BlackMoney > icfg.LaundererMaxMoneyWash then
		RandomCount = math.random(icfg.LaundererMinMoneyWash, icfg.LaundererMaxMoneyWash)
        xPlayer.removeAccountMoney('black_money', RandomCount)
		xPlayer.addMoney(RandomCount)
		TriggerClientEvent("pNotify:SendNotification", source, {text = "<b>Laundry</b></br>You Laundered <b style='color: red;'>" ..RandomCount.. "$</b> Black Money", timeout = 5000})
	elseif BlackMoney < icfg.LaundererMaxMoneyWash and BlackMoney > 0 then
		xPlayer.removeAccountMoney('black_money', BlackMoney)
		xPlayer.addMoney(BlackMoney)
		TriggerClientEvent("pNotify:SendNotification", source, {text = "<b>Laundry</b></br>You Laundered <b style='color: red;'>" ..BlackMoney.. "$</b> Black Money", timeout = 5000})
	end
end)

ESX.RegisterServerCallback('inside-moneywash:checkBlackMoney', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
    local BlackMoney = xPlayer.getAccount('black_money').money

	if BlackMoney > 0 then
		cb(true)
	elseif BlackMoney <= 0 then
		cb(false)
	end
end)

RegisterServerEvent('inside-moneywash:returnWorkPermit')
AddEventHandler('inside-moneywash:returnWorkPermit', function()
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.addInventoryItem('WorkPermit', 1)
end)

RegisterServerEvent('inside-moneywash:addnotifyCops')
AddEventHandler('inside-moneywash:addnotifyCops', function(coords)
    TriggerClientEvent('inside-moneywash:notifyCops', -1, coords)
end)


RegisterServerEvent('inside-moneywash:addDriver')
AddEventHandler('inside-moneywash:addDriver', function()
    TriggerClientEvent('inside-moneywash:startLaundering', -1)
	onDuty = true
	lastDrivers = lastDrivers + 1
	print(lastDrivers)
end)

RegisterServerEvent('inside-moneywash:removeDriver')
AddEventHandler('inside-moneywash:removeDriver', function()
    TriggerClientEvent('inside-moneywash:stopLaundering', -1)
	onDuty = false
	lastDrivers = lastDrivers - 1
	print(lastDrivers)
end)

ESX.RegisterServerCallback('inside-moneywash:lastDrivers', function(source, cb)
	lastDrivers = lastDrivers
	cb(lastDrivers)
end)

RegisterServerEvent('inside-moneywash:blockLaundry1')
AddEventHandler('inside-moneywash:blockLaundry1', function()
    TriggerClientEvent('inside-moneywash:startLaundry1', -1)
	Laundry = "1"
	Laundry1 = true
end)

RegisterServerEvent('inside-moneywash:unlockLaundry1')
AddEventHandler('inside-moneywash:unlockLaundry1', function()
    TriggerClientEvent('inside-moneywash:stopLaundry1', -1)
	Laundry = nil
	Laundry1 = false
end)

RegisterServerEvent('inside-moneywash:blockLaundry2')
AddEventHandler('inside-moneywash:blockLaundry2', function()
    TriggerClientEvent('inside-moneywash:startLaundry2', -1)
	Laundry = "2"
	Laundry2 = true
end)

RegisterServerEvent('inside-moneywash:unlockLaundry2')
AddEventHandler('inside-moneywash:unlockLaundry2', function()
    TriggerClientEvent('inside-moneywash:stopLaundry2', -1)
	Laundry = nil
	Laundry2 = false
end)

RegisterServerEvent('inside-moneywash:blockLaundry3')
AddEventHandler('inside-moneywash:blockLaundry3', function()
    TriggerClientEvent('inside-moneywash:startLaundry3', -1)
	Laundry = "3"
	Laundry3 = true
end)

RegisterServerEvent('inside-moneywash:unlockLaundry3')
AddEventHandler('inside-moneywash:unlockLaundry3', function()
    TriggerClientEvent('inside-moneywash:stopLaundry3', -1)
	Laundry = nil
	Laundry3 = false
end)

RegisterServerEvent('inside-moneywash:blockLaundry4')
AddEventHandler('inside-moneywash:blockLaundry4', function()
    TriggerClientEvent('inside-moneywash:startLaundry4', -1)
	Laundry = "4"
	Laundry4 = true
end)

RegisterServerEvent('inside-moneywash:unlockLaundry4')
AddEventHandler('inside-moneywash:unlockLaundry4', function()
    TriggerClientEvent('inside-moneywash:stopLaundry4', -1)
	Laundry = nil
	Laundry4 = false
end)

RegisterServerEvent('inside-moneywash:getBusyLaundry')
AddEventHandler('inside-moneywash:getBusyLaundry', function()
	if Laundry1 then
		TriggerClientEvent('inside-moneywash:startLaundry1', -1)
	end
	if Laundry2 then
		TriggerClientEvent('inside-moneywash:startLaundry2', -1)
	end
	if Laundry3 then
		TriggerClientEvent('inside-moneywash:startLaundry3', -1)
	end
	if Laundry4 then
		TriggerClientEvent('inside-moneywash:startLaundry4', -1)
	end
end)

AddEventHandler('playerDropped', function ()
	if onDuty then
		TriggerClientEvent('inside-moneywash:stopLaundering', -1)
		onDuty = false
		lastDrivers = lastDrivers - 1
		print(lastDrivers)
	end
	if Laundry == "1" then
		TriggerClientEvent('inside-moneywash:stopLaundry1', -1)
		Laundry1 = false
		Laundry = nil
	elseif Laundry == "2" then
		TriggerClientEvent('inside-moneywash:stopLaundry2', -1)
		Laundry2 = false
		Laundry = nil
	elseif Laundry == "3" then
		TriggerClientEvent('inside-moneywash:stopLaundry3', -1)
		Laundry3 = false
		Laundry = nil
	elseif Laundry == "4" then
		TriggerClientEvent('inside-moneywash:stopLaundry4', -1)
		Laundry4 = false
		Laundry = nil
	end
end)  