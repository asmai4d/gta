ESX = nil

local Addictions = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

MySQL.ready(function()
	Addictions = MySQL.Sync.fetchAll('SELECT * FROM addiction')

	-- send information after db has loaded
	TriggerClientEvent('addiction:sendAddiction', -1, Addictions)
end)

RegisterNetEvent('addiction:test')
AddEventHandler('addiction:test', function()
    print("test 1")
    ChangeAddiction(1)
end)

RegisterServerEvent('addiction:increaseAddiction')
AddEventHandler('addiction:increaseAddiction', function()
    print("1")
    ChangeAddiction(1)
end)

RegisterServerEvent('addiction:decreaseAddiction')
AddEventHandler('addiction:decreaseAddiction', function()
    print("-1")
    ChangeAddiction(-1)
end)

RegisterServerEvent('addiction:removeAddiction')
AddEventHandler('addiction:removeAddiction', function()
    print("0")
    ChangeAddiction(0)
end)

function ChangeAddiction(changeValue)

    print("ChangeAddiction")

	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
    local newAddictionValue = 0
    local index = 0

    local actionType = 'insert'

    if #Addictions > 0 then
        for i=1, #Addictions, 1 do
            if Addictions[i].playerId == xPlayer.identifier then
                actionType = 'update'
                index = i
                break
            end
        end
    end

    if actionType == 'insert' then
        MySQL.Async.execute('INSERT INTO addiction (playerId, addictionValue) VALUES (@owner, @addictionValue)',
        {
            ['@owner']   = xPlayer.identifier,
            ['@addictionValue']   = 1
        }, function(rowsChanged)
            TriggerClientEvent('esx:showNotification', _source, 'Появилось привыкание.', 1))
        end)

        Addictions[#Addictions+1].playerId = xPlayer.identifier
        Addictions[#Addictions+1].addictionValue = 1
    end

    if actionType == 'update' then
        
        Addictions[index].playerId = xPlayer.identifier
        if changeValue == 0 then

            Addictions[index].addictionValue = 0

        elseif (changeValue == -1) then
            Addictions[index].addictionValue = Addictions[index].addictionValue - changeValue

            if Addictions[index].addictionValue < 0 then
                Addictions[index].addictionValue = 0
            end

        elseif (changeValue == 1) then
            Addictions[index].addictionValue = Addictions[index].addictionValue + changeValue
        end

        MySQL.Async.execute('UPDATE addiction SET `addictionValue` = @addictionValue WHERE playerId = @owner', {
            ['@owner'] = xPlayer.identifier,
            ['@addictionValue'] = Addictions[index].addictionValue
        }, function(rowsChanged)
            TriggerClientEvent('esx:showNotification', _source, 'Привыкание изменилось.', Addictions[index].addictionValue))
        end)
    end
end

ESX.RegisterServerCallback('addiction:getPlayerAddiction', function(source, cb, type)
	local xPlayer = ESX.GetPlayerFromId(source)

	MySQL.Async.fetchAll('SELECT * FROM addiction WHERE playerId = @owner', {
		['@owner'] = xPlayer.identifier,
	}, function(result)
		cb(result)
	end)
end)