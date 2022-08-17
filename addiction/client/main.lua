local Addiction = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end


end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
end)

RegisterCommand('AddAddiction', function()
	print("AddAddiction")
    TriggerServerEvent('addiction:increaseAddiction')
end)

Citizen.CreateThread(function()
	while true do
		local opacity = 0

		ESX.TriggerServerCallback('addiction:getAddiction', function(addiction)
			Addiction = addiction
		end)

		Citizen.Wait(13500)

		if Addiction ~= nil then
			opacity = Addiction / 10
			-- print(opacity)
		else
			-- print("test")
		end

		if opacity == 0 then
			SendNUIMessage({displayWindow = 'false'})
		else
			SendNUIMessage({displayWindow = 'true', opacityValue = opacity })
		end
	
	end
end)