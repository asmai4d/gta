ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


 
ESX.RegisterServerCallback('sc-vehicleshop:checkPlatePrice', function(source, cb, plate) 
    local xPlayer = ESX.GetPlayerFromId(source)
    if tonumber(xPlayer.getQuantity("cash")) >= 3000 then 
      cardata = exports.ghmattimysql:executeSync("SELECT plate FROM owned_vehicles WHERE plate='"..plate.."' ", {})
      if #cardata == 0 then 
        cb(true)
        xPlayer.removeInventoryItem("cash", 3000)
      end
    else
        TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Sie haben nicht genug Bargeld'})
    end
end)

RegisterNetEvent('esx_vehicleshop:setJobVehicleState')
AddEventHandler('esx_vehicleshop:setJobVehicleState', function(plate, state)
	local xPlayer = ESX.GetPlayerFromId(source)

	exports.ghmattimysql:execute('UPDATE owned_vehicles SET `stored` = @stored WHERE plate = @plate AND job = @job', {
		['@stored'] = state,
		['@plate'] = plate,
		['@job'] = xPlayer.job.name
	}, function(rowsChanged)
		if rowsChanged == 0 then
			print(('[esx_vehicleshop] [^3WARNING^7] %s exploited the garage!'):format(xPlayer.identifier))
		end
	end)
end)


ESX.RegisterServerCallback('esx_vehicleshop:retrieveJobVehicles', function(source, cb, type)
	local xPlayer = ESX.GetPlayerFromId(source)

	exports.ghmattimysql:execute('SELECT * FROM owned_vehicles WHERE owner = @owner AND type = @type AND job = @job', {
		['@owner'] = xPlayer.identifier,
		['@type'] = type,
		['@job'] = xPlayer.job.name
	}, function(result)
		cb(result)
	end)
end)

ESX.RegisterServerCallback('esx_vehicleshop:isPlateTaken', function (source, cb, plate)
    exports.ghmattimysql:execute('SELECT * FROM owned_vehicles WHERE plate = @plate', {
        ['@plate'] = plate
    }, function (result)
        cb(result[1] ~= nil)
    end)
end)


ESX.RegisterServerCallback('s4-vehicleshop:checkPrice', function(source, cb, data) 
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local item = "money"
    
    if data.blackMoney == true then 
       item = "blackmoney"
    end
    
    local i = tonumber(xPlayer.getMoney(item))

    if i >= data.price then 
       xPlayer.removeInventoryItem(item, data.price)
       
       if tonumber(xPlayer.getMoney(item)) == (i - data.price) then -- two auth
          cb(true)
       end
    end
end)
 

RegisterNetEvent('s4-vehicleshop:server:givecar')
AddEventHandler('s4-vehicleshop:server:givecar', function(props)
    local src = source
    local Player = ESX.GetPlayerFromId(src)
    exports.ghmattimysql:execute("INSERT INTO owned_vehicles (owner, plate, vehicle) VALUES ('"..Player.identifier.."', '"..props.plate.."', '"..json.encode(props).."')", {  })
    local info = {model = props.model, plaka = props.plate}
    Player.addInventoryItem('carkey', 1, false, info)
    print(Player.source..' ARAC SATIN ALDI')
end)
