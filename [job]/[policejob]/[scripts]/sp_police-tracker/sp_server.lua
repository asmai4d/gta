local ESX = nil
local time_out = {}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


RegisterServerEvent("sp_police-tracker")
AddEventHandler("sp_police-tracker", function(plate) 

    local xPlayers = ESX.GetPlayers()

    for i=1, #xPlayers, 1 do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])


        if xPlayer.getJob().name == 'police' then
            TriggerClientEvent("sp_police-tracker:plate", xPlayers[i], plate)

        end

    end
end)

RegisterServerEvent("sp_police-tracker:setActivePlates")
AddEventHandler("sp_police-tracker:setActivePlates", function(plate)
    time_out[plate] = false
end)

RegisterServerEvent("sp_police-tracker:removeActivePlate")
AddEventHandler("sp_police-tracker:removeActivePlate", function(plate)
    time_out[plate] = time_out[nil]
    local xPlayers = ESX.GetPlayers()

    for i=1, #xPlayers, 1 do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])


        if xPlayer.getJob().name == 'police' then
            TriggerClientEvent("sp_police-tracker:updateActivePlate", xPlayers[i], plate)
        end

    end

end)

RegisterServerEvent("sp_police-tracker:getActivePlates")
AddEventHandler("sp_police-tracker:getActivePlates", function()
    TriggerClientEvent("sp_police-tracker:getActivePlates", source, time_out)
end)


RegisterServerEvent("sp_police-tracker:triggerTimer")
AddEventHandler("sp_police-tracker:triggerTimer", function(plate)
    local xPlayers = ESX.GetPlayers()
    local startTimer = os.time() + Config.removeTimer
    Citizen.CreateThread(function()
        while os.time() < startTimer and time_out[plate] ~= nil do 
            Citizen.Wait(5)
        end

        for i=1, #xPlayers, 1 do
            local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
    
    
            if xPlayer.getJob().name == 'police' then
                TriggerClientEvent("sp_police-tracker:updateTimer", xPlayers[i], plate)
            end
    
        end
    
    end)
end)

