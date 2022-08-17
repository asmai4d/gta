ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('jk_jobs:setJobt')
AddEventHandler('jk_jobs:setJobt', function(job)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	xPlayer.setJob("unemployed", 0)
end)

RegisterServerEvent('jk_jobs:setJobm')
AddEventHandler('jk_jobs:setJobm', function(job)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	xPlayer.setJob("burgerownia", 0)
end)

RegisterServerEvent('jk_jobs:setJobp')
AddEventHandler('jk_jobs:setJobp', function(job)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	xPlayer.setJob("piekarz", 0) 
end)

RegisterServerEvent('jk_jobs:setJobn')
AddEventHandler('jk_jobs:setJobn', function(job)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	xPlayer.setJob("sadownik", 0) 
end)

RegisterServerEvent('jk_jobs:setJobb')
AddEventHandler('jk_jobs:setJobb', function(job)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	xPlayer.setJob("stolarz", 0)
end)

RegisterServerEvent('jk_jobs:setJobtk')
AddEventHandler('jk_jobs:setJobtk', function(job)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	xPlayer.setJob("zlomiarz", 0)
end)