ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('rd-animations:GetStarredAnimations', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
	local identifier = xPlayer.identifier
    MySQL.Async.fetchAll(
      'SELECT * FROM ulubioneanimacje WHERE identifier = @identifier',
      {
          ['@identifier'] = identifier
      },
      function(result)
        cb(result)  
    end)
end)

RegisterServerEvent('rd-animations:StarAnimation')
AddEventHandler('rd-animations:StarAnimation', function(animacja)
    local xPlayer = ESX.GetPlayerFromId(source)
	local identifier = xPlayer.identifier
    MySQL.Async.execute('INSERT INTO ulubioneanimacje (identifier, nazwaanimacji) VALUES (@identifier, @nazwaanimacji)', {
        ['@identifier'] = identifier,
        ['@nazwaanimacji'] = animacja
    })
end)

RegisterServerEvent('rd-animations:UnstarAnimation')
AddEventHandler('rd-animations:UnstarAnimation', function(animacja)
    local xPlayer = ESX.GetPlayerFromId(source)
	local identifier = xPlayer.identifier
    MySQL.Async.execute('DELETE FROM ulubioneanimacje WHERE identifier = @identifier AND nazwaanimacji = @animacja', {
        ['@identifier'] = identifier,
        ['@animacja'] = animacja,
    })
end)

RegisterServerEvent('rd-animations:load')
AddEventHandler('rd-animations:load', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	if xPlayer ~= nil then
		MySQL.Async.fetchAll('SELECT animacje FROM users WHERE identifier = @identifier', {
			['@identifier'] = xPlayer.identifier
		}, function(result)
			if result[1].animacje then
				TriggerClientEvent('rd-animations:bind', _source, json.decode(result[1].animacje))
			else
				MySQL.Async.execute('UPDATE users SET animacje = @animacje WHERE identifier = @identifier',
				{
					['@animacje'] = "[[],[],[],[],[],[]]",
					['@identifier'] = xPlayer.identifier
				})
				TriggerClientEvent('rd-animations:bind', _source, json.decode("[[],[],[],[],[],[]]"))
			end
		end)
	end
end)


RegisterServerEvent('rd-animations:SaveFavourites')
AddEventHandler('rd-animations:SaveFavourites', function(binds)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	MySQL.Async.execute('UPDATE users SET animacje = @animacje WHERE identifier = @identifier',
	{
		['@animacje'] = json.encode(binds),
		['@identifier'] = xPlayer.identifier
	})
end)

RegisterServerEvent('rd-animations:saveWalk')
AddEventHandler('rd-animations:saveWalk', function(style)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	MySQL.Async.execute('UPDATE users SET stylchodzenia = @stylchodzenia WHERE identifier = @identifier',
	{
		['@stylchodzenia'] = json.encode(style),
		['@identifier'] = xPlayer.identifier
	})
end)

RegisterServerEvent('rd-animations:loadWalk')
AddEventHandler('rd-animations:loadWalk', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	if xPlayer ~= nil then
		MySQL.Async.fetchAll('SELECT stylchodzenia FROM users WHERE identifier = @identifier', {
			['@identifier'] = xPlayer.identifier
		}, function(result)
			if result[1].stylchodzenia then
				TriggerClientEvent('rd-animations:walkLoad', _source, json.decode(result[1].stylchodzenia))
			end
		end)
	end
end)

RegisterServerEvent('rd-animations:saveFace')
AddEventHandler('rd-animations:saveFace', function(style)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	MySQL.Async.execute('UPDATE users SET wyraztwarzy = @wyraztwarzy WHERE identifier = @identifier',
	{
		['@wyraztwarzy'] = json.encode(style),
		['@identifier'] = xPlayer.identifier
	})
end)

RegisterServerEvent('rd-animations:loadFace')
AddEventHandler('rd-animations:loadFace', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	if xPlayer ~= nil then
		MySQL.Async.fetchAll('SELECT wyraztwarzy FROM users WHERE identifier = @identifier', {
			['@identifier'] = xPlayer.identifier
		}, function(result)
			if result[1].wyraztwarzy then
				TriggerClientEvent('rd-animations:faceLoad', _source, json.decode(result[1].wyraztwarzy))
			end
		end)
	end
end)

RegisterServerEvent("rd-animations:animrequest")
AddEventHandler("rd-animations:animrequest", function(target, emotename, etype)
	local revicer = source 
	TriggerClientEvent("rd-animations:animationrequest", target, emotename, etype, revicer)
end)

RegisterServerEvent("rd-animations:animationaccepted") 
AddEventHandler("rd-animations:animationaccepted", function(target, requestedemote, otheremote)
	local player2 = source
	TriggerClientEvent("rd-animations:playshared", source, otheremote, source)
	TriggerClientEvent("rd-animations:playsharedsource", target, requestedemote, player2)
end)