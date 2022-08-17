-- Leaked By: Leaking Hub | J. Snow | leakinghub.com
ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('inside-shoprobbery:payout', function(source, cb, money)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.addMoney(money)
    cb(money)
end)

ESX.RegisterServerCallback('inside-shoprobbery:cassettepayout', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	money = math.random(Config.CassetteMin, Config.CassetteMax)
	xPlayer.addMoney(money)
    cb(money)
end)

ESX.RegisterServerCallback('inside-shoprobbery:SecBetwNextRob', function(source, cb)
	if (os.time() - Config.Lastrobbed) < Config.SecBetwNextRob and Config.Lastrobbed ~= 0 then
		cb(false)
	else
		cb(true)
	end
end)

RegisterServerEvent('inside-shoprobbery:RobberyTimeStart')
AddEventHandler('inside-shoprobbery:RobberyTimeStart', function()
    Config.Lastrobbed = os.time()
end)

AddEventHandler('playerDropped', function()
    TriggerClientEvent('inside-shoprobbery:playerdropped', source)
end)

RegisterServerEvent('inside-shoprobbery:Ssomeonestart')
AddEventHandler('inside-shoprobbery:Ssomeonestart', function(type)
    TriggerClientEvent('inside-shoprobbery:Csomeonestart', -1, type)
end)

RegisterServerEvent('inside-shoprobbery:playerdroppedStop')
AddEventHandler('inside-shoprobbery:playerdroppedStop', function()
    TriggerClientEvent('inside-shoprobbery:playerdroppedStopC', -1)
end)

ESX.RegisterServerCallback('inside-shoprobbery:PoliceAmount', function(source, cb)
    police = 0
	for _, playerId in pairs(ESX.GetPlayers()) do
		xPlayer = ESX.GetPlayerFromId(playerId)
		if xPlayer.job.name == 'police' then
			police = police + 1
		end
	end
    cb(police)
end)

RegisterServerEvent('inside-shoprobbery:PoliceNotfiy')
AddEventHandler('inside-shoprobbery:PoliceNotfiy', function(coords)
    TriggerClientEvent('inside-shoprobbery:PoliceNotifyC', -1, coords)
end)