ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent('esx_ballasdog:hasClosestDrugs')
AddEventHandler('esx_ballasdog:hasClosestDrugs', function(playerId)
    local target = ESX.GetPlayerFromId(playerId)
    local src = source
    local inventory = target.inventory
    for i = 1, #inventory do
        for k, v in pairs(Config.Drugs) do
            if inventory[i].name == v and inventory[i].count > 0 then
                TriggerClientEvent('esx_ballasdog:hasDrugs', src, true)
                return
            end
        end
    end
    TriggerClientEvent('esx_ballasdog:hasDrugs', src, false)
end)