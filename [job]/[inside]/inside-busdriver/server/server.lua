ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('inside-busdriver:payout', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
    local money = math.random(Config.MinPayout, Config.MaxPayout)
	xPlayer.addMoney(money)
    cb(money)
end)
