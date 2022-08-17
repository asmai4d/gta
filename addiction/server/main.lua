ESX = nil

local Addictions = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('addiction:increaseAddiction')
AddEventHandler('addiction:increaseAddiction', function()
    ChangeAddiction(1)
end)

RegisterServerEvent('addiction:decreaseAddiction')
AddEventHandler('addiction:decreaseAddiction', function()
    ChangeAddiction(-1)
end)

RegisterServerEvent('addiction:removeAddiction')
AddEventHandler('addiction:removeAddiction', function()
    ChangeAddiction(0)
end)

function ChangeAddiction(changeValue)

	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
    local newAddictionValue = 0
    local index = 0

    local actionType = 'insert'

	MySQL.Async.fetchAll('SELECT * FROM addiction', {
	}, function(result)
        TriggerClientEvent('addiction:updateAddiction', result)
        Addictions = result
	end)

    Citizen.Wait(1500)

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
            TriggerClientEvent('esx:showNotification', _source, 'Появилось привыкание.', 1)
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
            TriggerClientEvent('esx:showNotification', _source, 'Привыкание изменилось.', Addictions[index].addictionValue)
        end)
    end
end

ESX.RegisterServerCallback('addiction:getAddiction', function(source, cb)

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    MySQL.ready(function()
        MySQL.Async.fetchAll('SELECT * FROM addiction WHERE playerId = @owner',
        {
            ['@owner']   = xPlayer.identifier,
        }, function(result)
            cb(tonumber(result[1].addictionValue))
        end)
    end)
end)

ESX.RegisterServerCallback('addiction:loadDrugsPerks', function(source, cb)

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    MySQL.ready(function()
        MySQL.Async.fetchAll('SELECT settings FROM drugs_perks WHERE `id` = 1',
        {
        }, function(result)
            cb(tostring(result[1].settings))
        end)
    end)
end)

RegisterServerEvent('addiction:saveDrugsPerks')
AddEventHandler('addiction:saveDrugsPerks', function(settings)

    local _source = source

    MySQL.Async.execute('UPDATE drugs_perks SET `settings` = @settings WHERE `id` = 1', {
        ['@settings'] = settings
    }, function(rowsChanged)
        TriggerClientEvent('esx:showNotification', _source, 'Перки сохранены в базу данных.', rowsChanged)
    end)

end)

-- SetHttpHandler(function(req, res)
-- 	local path = req.path
--     local _source = source

--     TriggerClientEvent('esx:showNotification', _source, 'TEST.', path)

-- 	if req.method == 'POST' then
-- 		return handlePost(req, res)
-- 	end

-- 	if req.path == '/saveSettings' then
--         TriggerClientEvent('esx:showNotification', _source, 'Перки сохранены в базу данных.', path)
-- 	end

-- end)

-- local function handlePost(req, res)
-- 	req.setDataHandler(function(body)
--         local _source = source
-- 		local data = json.decode(body)

--         TriggerClientEvent('esx:showNotification', _source, 'TEST2222.', data)

-- 	end)
-- end


