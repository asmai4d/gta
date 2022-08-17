ESX = nil
-- polo © License | Discord : https://discord.gg/czW6Jqj
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
-- polo © License | Discord : https://discord.gg/czW6Jqj

RegisterServerEvent("utku_wh:checkMoney")
AddEventHandler("utku_wh:checkMoney", function(amount, action)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    if xPlayer.getMoney() >= amount then
        xPlayer.removeMoney(amount)
        TriggerClientEvent("utku_wh:start", _source ,action)
    else
        TriggerClientEvent('mythic_notify:client:SendAlert', _source, {type = 'inform', text = _("enough_m"), length = 3000, style = { ['background-color'] = '#FF0000', ['color'] = '#000000' } })
    end
end)