ESX = nil
TriggerEvent( 'esx:getSharedObject', function(obj) ESX = obj end)

local npcsBeingTalkedTo = {}

RegisterServerEvent('esx_tk_npcrobbery:addPedToTable')
AddEventHandler('esx_tk_npcrobbery:addPedToTable', function(ped)
    npcsBeingTalkedTo[ped] = true
end)

RegisterServerEvent('esx_tk_npcrobbery:removePedFromTable')
AddEventHandler('esx_tk_npcrobbery:removePedFromTable', function(ped)
    if npcsBeingTalkedTo[ped] ~= nil then
        npcsBeingTalkedTo[ped] = nil
    end
end)

ESX.RegisterServerCallback('esx_tk_npcrobbery:isPedInTable', function(src, cb, ped)
    if npcsBeingTalkedTo[ped] then
        cb(true)
    else
        cb(false)
    end
end)

ESX.RegisterServerCallback('esx_tk_npcrobbery:checkCops', function(src, cb)
    local xPlayers = ESX.GetPlayers()

    local police = 0
    for i=1, #xPlayers, 1 do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        if Config.PoliceJobs[xPlayer.job.name] then
            police = police + 1
        end
    end

    if police >= Config.PoliceRequired then
        cb(true)
    else
        cb(false)
    end
end)

RegisterServerEvent('esx_tk_npcrobbery:alertPolice')
AddEventHandler('esx_tk_npcrobbery:alertPolice', function(coords, street, gender)
    local src = source
    local xPlayers = ESX.GetPlayers()
    if gender == 'female' then
        gender = _('female')
    else
        gender = _('male')
    end

    for i=1, #xPlayers, 1 do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        if Config.PoliceJobs[xPlayer.job.name] then
            TriggerClientEvent('esx_tk_npcrobbery:alertPolice', xPlayer.source, coords, street, gender)
        end
    end
end)

RegisterServerEvent('esx_tk_npcrobbery:npcRobbedPlayer')
AddEventHandler('esx_tk_npcrobbery:npcRobbedPlayer', function()
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local cash = xPlayer.getMoney()
    local amount = math.random(Config.MinRobNPCAmount, Config.MaxRobNPCAmount)
    if cash <= amount then
        amount = cash
    end
    xPlayer.removeMoney(amount)
    notify(src, _U('were_robbed', amount), 'error')
end)

RegisterServerEvent('esx_tk_npcrobbery:playerRobbedNpc')
AddEventHandler('esx_tk_npcrobbery:playerRobbedNpc', function()
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local done = false
    local attempt = 0

    local maxItemTypes = math.random(1, #Config.RobRewardItems)
    local itemIndexesArray = {}
    local randomIndex = 0
    local iteration = 1
    local indexAlreadyUsed = false
	local attempt = 0
	
    while iteration <= maxItemTypes and attempt < 30 do
	
		indexAlreadyUsed = false
		attempt = attempt + 1
		
        randomIndex = math.random(1, #Config.RobRewardItems)
		
        if #itemIndexesArray > 0 then
            for i=1, #itemIndexesArray do
                if itemIndexesArray[i] == randomIndex then
                    indexAlreadyUsed = true
                end
            end

            if not indexAlreadyUsed then
                itemIndexesArray[iteration] = randomIndex
                iteration = iteration + 1                
            end
        else
            itemIndexesArray[iteration] = randomIndex
            iteration = iteration + 1
        end
    end

    done = true
	
    for i=1, #itemIndexesArray do
	
        local item = Config.RobRewardItems[itemIndexesArray[i]]
		if math.random() <= (item.chance / 100) then
        
			local amount = math.random(item.min, item.max)
			
			if item.name == 'money' then
				xPlayer.addMoney(amount)
				notify(src, _U('got_money', amount), 'success')
			elseif item.name == 'black_money' then
				xPlayer.addAccountMoney('black', amount)
				notify(src, _U('got_money', amount), 'success')
			elseif string.upper(string.sub(item.name, 0, 7)) == 'WEAPON_' then
				local loadoutNum, weapon = xPlayer.getWeapon(item)
				if weapon then
					done = false
				else
					xPlayer.addWeapon(item.name, amount)
					notify(src, _U('got_weapon', string.lower(ESX.GetWeaponLabel(item.name))), 'success')
				end
			else
				xPlayer.addInventoryItem(item.name, amount)
				notify(src, _U('got_item', amount, string.lower(ESX.GetItemLabel(item.name))), 'success')            
			end
		end
		Wait(0)
    end

    -- while not done and attempt < 10000 do
    --     attempt = attempt + 1
    --     local rnd = math.random(1, #Config.RobRewardItems)
    --     local item = Config.RobRewardItems[rnd]
    --     if math.random() <= (item.chance / 100) then
    --         local amount = math.random(item.min, item.max)
    --         local item = item.name
    --         done = true
    --         if item == 'money' then
    --             xPlayer.addMoney(amount)
    --             notify(src, _U('got_money', amount), 'success')
    --         elseif item == 'black_money' then
    --             xPlayer.addAccountMoney('black', amount)
    --             notify(src, _U('got_money', amount), 'success')
    --         elseif string.upper(string.sub(item, 0, 7)) == 'WEAPON_' then
    --             local loadoutNum, weapon = xPlayer.getWeapon(item)
    --             if weapon then
    --                 done = false
    --             else
    --                 xPlayer.addWeapon(item, amount)
    --                 notify(src, _U('got_weapon', string.lower(ESX.GetWeaponLabel(item))), 'success')
    --             end
    --         else
    --             if xPlayer.canCarryItem(item, amount) then
    --                 xPlayer.addInventoryItem(item, amount)
    --                 notify(src, _U('got_item', amount, string.lower(ESX.GetItemLabel(item))), 'success')
    --             else
    --                 done = false
    --             end
    --         end
    --     end
    --     Wait(0)
    -- end
    -- if not done then
    --     notify(src, _U('not_enough_space'), 'error')
    -- end


end)

function notify(src, text, type)
    if Config.NotificationType == 'mythic' then
        TriggerClientEvent('mythic_notify:client:SendAlert', src, { type = type, text = text})
    else
        TriggerClientEvent('esx:showNotification', src, text)
    end
end