ESX = nil

local Drugs = Config.Drugs

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('inside-selldrugs:checkMoneyWholesale', function(playerId, cb)
	local xPlayer = ESX.GetPlayerFromId(playerId)

	if xPlayer.getMoney() >= Config.VehiclePrice then
        xPlayer.removeMoney(Config.VehiclePrice)
		cb(true)
	else
		cb(false)
	end
end)

ESX.RegisterServerCallback('inside-selldrugs:checkMoneySingly', function(playerId, cb)
	local xPlayer = ESX.GetPlayerFromId(playerId)

	if xPlayer.getMoney() >= Config.CustomersFindPrice then
        xPlayer.removeMoney(Config.CustomersFindPrice)
		cb(true)
	else
		cb(false)
	end
end)

ESX.RegisterServerCallback('inside-selldrugs:checkWholesaleItems', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)

	local weed = xPlayer.getInventoryItem(Drugs.Weed.ItemName).count
	local meth = xPlayer.getInventoryItem(Drugs.Meth.ItemName).count
	local opium = xPlayer.getInventoryItem(Drugs.Opium.ItemName).count
	local coke = xPlayer.getInventoryItem(Drugs.Coke.ItemName).count

	if weed >= Config.MinWholesaleCount then
		cb('hasWeed')
	elseif meth >= Config.MinWholesaleCount then
		cb('hasMeth')
	elseif opium >= Config.MinWholesaleCount then
		cb('hasOpium')
	elseif coke >= Config.MinWholesaleCount then
		cb('hasCoke')
	elseif weed <= Config.MinWholesaleCount and meth <= Config.MinWholesaleCount and opium <= Config.MinWholesaleCount and coke <= Config.MinWholesaleCount then
		cb('hasNothing')
	end
end)

ESX.RegisterServerCallback('inside-selldrugs:sellWholesale', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)

	local weed = xPlayer.getInventoryItem(Drugs.Weed.ItemName).count
	local meth = xPlayer.getInventoryItem(Drugs.Meth.ItemName).count
	local opium = xPlayer.getInventoryItem(Drugs.Opium.ItemName).count
	local coke = xPlayer.getInventoryItem(Drugs.Coke.ItemName).count

	local AmountPayoutWeed = weed * Drugs.Weed.ItemWholesalePrice
	local AmountPayoutMeth = meth * Drugs.Meth.ItemWholesalePrice
	local AmountPayoutOpium = opium * Drugs.Opium.ItemWholesalePrice
	local AmountPayoutCoke = coke * Drugs.Coke.ItemWholesalePrice

	if weed >= Config.MinWholesaleCount then
		xPlayer.removeInventoryItem(Drugs.Weed.ItemName, weed)
		xPlayer.addAccountMoney('black_money', AmountPayoutWeed)
		TriggerClientEvent("pNotify:SendNotification", source, {text = "<b>Dealer</b></br>You sold Weed for <b style='color: green;'>" ..AmountPayoutWeed.. "$</b> Black Money!", timeout = 2500})
		cb('hasWeed')
	elseif meth >= Config.MinWholesaleCount then
		xPlayer.removeInventoryItem(Drugs.Meth.ItemName, meth)
		xPlayer.addAccountMoney('black_money', AmountPayoutMeth)
		TriggerClientEvent("pNotify:SendNotification", source, {text = "<b>Dealer</b></br>You sold Methamphetamine for <b style='color: green;'>" ..AmountPayoutMeth.. "$</b> Black Money!", timeout = 2500})
		cb('hasMeth')
	elseif opium >= Config.MinWholesaleCount then
		xPlayer.removeInventoryItem(Drugs.Opium.ItemName, opium)
		xPlayer.addAccountMoney('black_money', AmountPayoutOpium)
		TriggerClientEvent("pNotify:SendNotification", source, {text = "<b>Dealer</b></br>You sold Opium for <b style='color: green;'>" ..AmountPayoutOpium.. "$</b> Black Money!", timeout = 2500})
		cb('hasOpium')
	elseif coke >= Config.MinWholesaleCount then
		xPlayer.removeInventoryItem(Drugs.Coke.ItemName, coke)
		xPlayer.addAccountMoney('black_money', AmountPayoutCoke)
		TriggerClientEvent("pNotify:SendNotification", source, {text = "<b>Dealer</b></br>You sold Cocaine for <b style='color: green;'>" ..AmountPayoutCoke.. "$</b> Black Money!", timeout = 2500})
		cb('hasCoke')
	elseif weed <= Config.MinWholesaleCount and meth <= Config.MinWholesaleCount and opium <= Config.MinWholesaleCount and coke <= Config.MinWholesaleCount then
		cb('hasNothing')
	end
end)

RegisterServerEvent('inside-selldrugs:clearDrugs')
AddEventHandler('inside-selldrugs:clearDrugs', function()
	local xPlayer = ESX.GetPlayerFromId(source)

	local weed = xPlayer.getInventoryItem(Drugs.Weed.ItemName).count
	local meth = xPlayer.getInventoryItem(Drugs.Meth.ItemName).count
	local opium = xPlayer.getInventoryItem(Drugs.Opium.ItemName).count
	local coke = xPlayer.getInventoryItem(Drugs.Coke.ItemName).count

	if weed > 0 then
		xPlayer.removeInventoryItem(Drugs.Weed.ItemName, weed)
	end
	if meth > 0 then
		xPlayer.removeInventoryItem(Drugs.Meth.ItemName, meth)
	end
	if opium > 0 then
		xPlayer.removeInventoryItem(Drugs.Opium.ItemName, opium)
	end
	if coke > 0 then
		xPlayer.removeInventoryItem(Drugs.Coke.ItemName, coke)
	end
end)

RegisterServerEvent('inside-selldrugs:sellSingly')
AddEventHandler('inside-selldrugs:sellSingly', function(AmountPayout)	
	local xPlayer = ESX.GetPlayerFromId(source)

	local weed = xPlayer.getInventoryItem(Drugs.Weed.ItemName).count
	local meth = xPlayer.getInventoryItem(Drugs.Meth.ItemName).count
	local opium = xPlayer.getInventoryItem(Drugs.Opium.ItemName).count
	local coke = xPlayer.getInventoryItem(Drugs.Coke.ItemName).count
	
	if weed > 0 then
		if weed == 1 then
			amount = math.random(1,1)
			AmountPayoutWeed = amount * Drugs.Weed.ItemSinglyPrice * AmountPayout
			xPlayer.removeInventoryItem(Drugs.Weed.ItemName, amount)
			xPlayer.addAccountMoney('black_money', AmountPayoutWeed)
		elseif weed == 2 then
			amount = math.random(1,2)
			AmountPayoutWeed = amount * Drugs.Weed.ItemSinglyPrice * AmountPayout
			xPlayer.removeInventoryItem(Drugs.Weed.ItemName, amount)
			xPlayer.addAccountMoney('black_money', AmountPayoutWeed)
		elseif weed == 3 then
			amount = math.random(1,3)
			AmountPayoutWeed = amount * Drugs.Weed.ItemSinglyPrice * AmountPayout
			xPlayer.removeInventoryItem(Drugs.Weed.ItemName, amount)
			xPlayer.addAccountMoney('black_money', AmountPayoutWeed)
		elseif weed == 4 then
			amount = math.random(1,4)
			AmountPayoutWeed = amount * Drugs.Weed.ItemSinglyPrice * AmountPayout
			xPlayer.removeInventoryItem(Drugs.Weed.ItemName, amount)
			xPlayer.addAccountMoney('black_money', AmountPayoutWeed)
		elseif weed >= 5 then
			amount = math.random(1,5)
			AmountPayoutWeed = amount * Drugs.Weed.ItemSinglyPrice * AmountPayout
			xPlayer.removeInventoryItem(Drugs.Weed.ItemName, amount)
			xPlayer.addAccountMoney('black_money', AmountPayoutWeed)
		end
		TriggerClientEvent("pNotify:SendNotification", source, {text = "<b>Dealer</b></br>You sold Weed for <b style='color: green;'>" ..AmountPayoutWeed.. "$</b> Black Money!", timeout = 2500})
	elseif meth > 0 then
		if meth == 1 then
			amount = math.random(1,1)
			AmountPayoutMeth = amount * Drugs.Meth.ItemSinglyPrice * AmountPayout
			xPlayer.removeInventoryItem(Drugs.Meth.ItemName, amount)
			xPlayer.addAccountMoney('black_money', AmountPayoutMeth)
		elseif meth == 2 then
			amount = math.random(1,2)
			AmountPayoutMeth = amount * Drugs.Meth.ItemSinglyPrice * AmountPayout
			xPlayer.removeInventoryItem(Drugs.Meth.ItemName, amount)
			xPlayer.addAccountMoney('black_money', AmountPayoutMeth)
		elseif meth == 3 then
			amount = math.random(1,3)
			AmountPayoutMeth = amount * Drugs.Meth.ItemSinglyPrice * AmountPayout
			xPlayer.removeInventoryItem(Drugs.Meth.ItemName, amount)
			xPlayer.addAccountMoney('black_money', AmountPayoutMeth)
		elseif meth == 4 then
			amount = math.random(1,4)
			AmountPayoutMeth = amount * Drugs.Meth.ItemSinglyPrice * AmountPayout
			xPlayer.removeInventoryItem(Drugs.Meth.ItemName, amount)
			xPlayer.addAccountMoney('black_money', AmountPayoutMeth)
		elseif meth >= 5 then
			amount = math.random(1,5)
			AmountPayoutMeth = amount * Drugs.Meth.ItemSinglyPrice * AmountPayout
			xPlayer.removeInventoryItem(Drugs.Meth.ItemName, amount)
			xPlayer.addAccountMoney('black_money', AmountPayoutMeth)
		end
		TriggerClientEvent("pNotify:SendNotification", source, {text = "<b>Dealer</b></br>You sold Methamphetamine for <b style='color: green;'>" ..AmountPayoutMeth.. "$</b> Black Money!", timeout = 2500})
	elseif opium > 0 then
		if opium == 1 then
			amount = math.random(1,1)
			AmountPayoutOpium = amount * Drugs.Opium.ItemSinglyPrice * AmountPayout
			xPlayer.removeInventoryItem(Drugs.Opium.ItemName, amount)
			xPlayer.addAccountMoney('black_money', AmountPayoutOpium)
		elseif opium == 2 then
			amount = math.random(1,2)
			AmountPayoutOpium = amount * Drugs.Opium.ItemSinglyPrice * AmountPayout
			xPlayer.removeInventoryItem(Drugs.Opium.ItemName, amount)
			xPlayer.addAccountMoney('black_money', AmountPayoutOpium)
		elseif opium == 3 then
			amount = math.random(1,3)
			AmountPayoutOpium = amount * Drugs.Opium.ItemSinglyPrice * AmountPayout
			xPlayer.removeInventoryItem(Drugs.Opium.ItemName, amount)
			xPlayer.addAccountMoney('black_money', AmountPayoutOpium)
		elseif opium == 4 then
			amount = math.random(1,4)
			AmountPayoutOpium = amount * Drugs.Opium.ItemSinglyPrice * AmountPayout
			xPlayer.removeInventoryItem(Drugs.Opium.ItemName, amount)
			xPlayer.addAccountMoney('black_money', AmountPayoutOpium)
		elseif opium >= 5 then
			amount = math.random(1,5)
			AmountPayoutOpium = amount * Drugs.Opium.ItemSinglyPrice * AmountPayout
			xPlayer.removeInventoryItem(Drugs.Opium.ItemName, amount)
			xPlayer.addAccountMoney('black_money', AmountPayoutOpium)
		end
		TriggerClientEvent("pNotify:SendNotification", source, {text = "<b>Dealer</b></br>You sold Opium for <b style='color: green;'>" ..AmountPayoutOpium.. "$</b> Black Money!", timeout = 2500})
	elseif coke > 0 then
		if coke == 1 then
			amount = math.random(1,1)
			AmountPayoutCoke = amount * Drugs.Coke.ItemSinglyPrice * AmountPayout
			xPlayer.removeInventoryItem(Drugs.Coke.ItemName, amount)
			xPlayer.addAccountMoney('black_money', AmountPayoutCoke)
		elseif coke == 2 then
			amount = math.random(1,2)
			AmountPayoutCoke = amount * Drugs.Coke.ItemSinglyPrice * AmountPayout
			xPlayer.removeInventoryItem(Drugs.Coke.ItemName, amount)
			xPlayer.addAccountMoney('black_money', AmountPayoutCoke)
		elseif coke == 3 then
			amount = math.random(1,3)
			AmountPayoutCoke = amount * Drugs.Coke.ItemSinglyPrice * AmountPayout
			xPlayer.removeInventoryItem(Drugs.Coke.ItemName, amount)
			xPlayer.addAccountMoney('black_money', AmountPayoutCoke)
		elseif coke == 4 then
			amount = math.random(1,4)
			AmountPayoutCoke = amount * Drugs.Coke.ItemSinglyPrice * AmountPayout
			xPlayer.removeInventoryItem(Drugs.Coke.ItemName, amount)
			xPlayer.addAccountMoney('black_money', AmountPayoutCoke)
		elseif coke >= 5 then
			amount = math.random(1,5)
			AmountPayoutCoke = amount * Drugs.Coke.ItemSinglyPrice * AmountPayout
			xPlayer.removeInventoryItem(Drugs.Coke.ItemName, amount)
			xPlayer.addAccountMoney('black_money', AmountPayoutCoke)
		end
		TriggerClientEvent("pNotify:SendNotification", source, {text = "<b>Dealer</b></br>You sold Cocaine for <b style='color: green;'>" ..AmountPayoutCoke.. "$</b> Black Money!", timeout = 2500})
	end
end)

ESX.RegisterServerCallback('inside-selldrugs:checkSinglyItems', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)

	local weed = xPlayer.getInventoryItem(Drugs.Weed.ItemName).count
	local meth = xPlayer.getInventoryItem(Drugs.Meth.ItemName).count
	local opium = xPlayer.getInventoryItem(Drugs.Opium.ItemName).count
	local coke = xPlayer.getInventoryItem(Drugs.Coke.ItemName).count
	local amount = 0

	if weed > 0 then
		cb('hasWeed')
	elseif meth > 0 then
		cb('hasMeth')
	elseif opium > 0 then
		cb('hasOpium')
	elseif coke > 0 then
		cb('hasCoke')
	else
		cb('hasNothing')
	end
end)

RegisterServerEvent('inside-selldrugs:addnotifyCops')
AddEventHandler('inside-selldrugs:addnotifyCops', function(coords)
    TriggerClientEvent('inside-selldrugs:notifyCops', -1, coords)
end)

ESX.RegisterServerCallback('inside-selldrugs:PoliceOnDuty', function(source, cb)
    police = 0

		for _, playerId in pairs(ESX.GetPlayers()) do
			xPlayer = ESX.GetPlayerFromId(playerId)
			if xPlayer.job.name == 'police' then
				police = police + 1
			end
		end
    cb(police)
end)