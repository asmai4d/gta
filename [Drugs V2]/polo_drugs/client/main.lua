-- polo � License | Discord : https://discord.gg/czW6Jqj
local Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}
-- polo � License | Discord : https://discord.gg/czW6Jqj
local PlayerData                = {}
local GUI                       = {}
local HasAlreadyEnteredMarker   = false
local LastZone                  = nil
local CurrentAction             = nil
local CurrentActionMsg          = ''
local CurrentActionData         = {}
ESX                             = nil
GUI.Time                        = 0

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)



AddEventHandler('polo_drugs:hasEnteredMarker', function(zone)
	if zone == 'Weed' then
		CurrentAction     = 'weed_recolte'
		CurrentActionMsg  = '~g~Harvesting Weed'
		CurrentActionData = {zone= zone}
	end

	if zone == 'Weed2'  then
		CurrentAction     = 'weed_recolte'
		CurrentActionMsg  = '~g~Harvesting Weed'
		CurrentActionData = {zone= zone}
	end

	if zone == 'Weed3'  then
		CurrentAction     = 'weed_recolte'
		CurrentActionMsg  = '~g~Harvesting Weed'
		CurrentActionData = {zone= zone}
	end

	if zone == 'Weed4'  then
		CurrentAction     = 'weed_recolte'
		CurrentActionMsg  = '~g~Harvesting Weed'
		CurrentActionData = {zone= zone}
	end

	if zone == 'Weed5'  then
		CurrentAction     = 'weed_recolte'
		CurrentActionMsg  = '~g~Harvesting Weed'
		CurrentActionData = {zone= zone}
	end

	if zone == 'Weed6'  then
		CurrentAction     = 'weed_recolte'
		CurrentActionMsg  = '~g~Harvesting Weed'
		CurrentActionData = {zone= zone}
	end

	if zone == 'Weed7'  then
		CurrentAction     = 'weed_recolte'
		CurrentActionMsg  = '~g~Harvesting Weed'
		CurrentActionData = {zone= zone}
	end

	if zone == 'Weed8'  then
		CurrentAction     = 'weed_recolte'
		CurrentActionMsg  = '~g~Harvesting Weed'
		CurrentActionData = {zone= zone}
	end

	if zone == 'Weed9'  then
		CurrentAction     = 'weed_traitement'
		CurrentActionMsg  = '~b~Harvest Weed'
		CurrentActionData = {zone= zone}
	end

	if zone == 'Weed10'  then
		CurrentAction     = 'weed_traitement'
		CurrentActionMsg  = '~b~Processing Weed'
		CurrentActionData = {zone= zone}
	end

	if zone == 'Weed11'  then
		CurrentAction     = 'weed_traitement'
		CurrentActionMsg  = '~b~Processing Weed'
		CurrentActionData = {zone= zone}
	end

	if zone == 'Weed12'  then
		CurrentAction     = 'weed_traitement'
		CurrentActionMsg  = '~b~Processing Weed'
		CurrentActionData = {zone= zone}
	end

	if zone == 'Coke'  then
		CurrentAction     = 'coke_recolte'
		CurrentActionMsg  = '~p~Harvest Coke'
		CurrentActionData = {zone= zone}
	end

	if zone == 'Coke2'  then
		CurrentAction     = 'coke_recolte'
		CurrentActionMsg  = '~p~Harvest Coke'
		CurrentActionData = {zone= zone}
	end

	if zone == 'Coke3'  then
		CurrentAction     = 'coke_recolte'
		CurrentActionMsg  = '~p~Harvest Coke'
		CurrentActionData = {zone= zone}
	end

	if zone == 'Coke4'  then
		CurrentAction     = 'coke_recolte'
		CurrentActionMsg  = '~p~Harvest Coke'
		CurrentActionData = {zone= zone}
	end

	if zone == 'Coke5'  then
		CurrentAction     = 'coke_recolte'
		CurrentActionMsg  = '~p~Harvest Coke'
		CurrentActionData = {zone= zone}
	end

	if zone == 'Coke6'  then
		CurrentAction     = 'coke_recolte'
		CurrentActionMsg  = '~p~Harvest Coke'
		CurrentActionData = {zone= zone}
	end

	if zone == 'Coke7'  then
		CurrentAction     = 'coke_recolte'
		CurrentActionMsg  = '~p~Harvest Coke'
		CurrentActionData = {zone= zone}
	end

	if zone == 'Coke8'  then
		CurrentAction     = 'coke_recolte'
		CurrentActionMsg  = '~p~Harvest Coke'
		CurrentActionData = {zone= zone}
	end

	if zone == 'Coke9'  then
		CurrentAction     = 'coke_recolte'
		CurrentActionMsg  = '~p~Harvest Coke'
		CurrentActionData = {zone= zone}
	end

	if zone == 'Coke10'  then
		CurrentAction     = 'coke_recolte'
		CurrentActionMsg  = '~p~Harvest Coke'
		CurrentActionData = {zone= zone}
	end

	if zone == 'Coke11'  then
		CurrentAction     = 'coke_traitement'
		CurrentActionMsg  = '~w~Process Coke'
		CurrentActionData = {zone= zone}
	end

	if zone == 'Coke12'  then
		CurrentAction     = 'coke_traitement'
		CurrentActionMsg  = '~w~Process Coke'
		CurrentActionData = {zone= zone}
	end

	if zone == 'Coke13'  then
		CurrentAction     = 'coke_traitement'
		CurrentActionMsg  = '~w~Process Coke'
		CurrentActionData = {zone= zone}
	end

	if zone == 'Coke14'  then
		CurrentAction     = 'coke_traitement'
		CurrentActionMsg  = '~w~Process Coke'
		CurrentActionData = {zone= zone}
	end

	if zone == 'Opium'  then
		CurrentAction     = 'opium_recolte'
		CurrentActionMsg  = '~o~Recolter de l\'opium'
		CurrentActionData = {zone= zone}
	end

	if zone == 'Opium2'  then
		CurrentAction     = 'opium_recolte'
		CurrentActionMsg  = '~o~Recolter de l\'opium'
		CurrentActionData = {zone= zone}
	end

	if zone == 'Opium3'  then
		CurrentAction     = 'opium_recolte'
		CurrentActionMsg  = '~o~Recolter de l\'opium'
		CurrentActionData = {zone= zone}
	end

	if zone == 'Opium4'  then
		CurrentAction     = 'opium_recolte'
		CurrentActionMsg  = '~o~Recolter de l\'opium'
		CurrentActionData = {zone= zone}
	end

	if zone == 'Opium5'  then
		CurrentAction     = 'opium_recolte'
		CurrentActionMsg  = '~o~Recolter de l\'opium'
		CurrentActionData = {zone= zone}
	end

	if zone == 'Opium6'  then
		CurrentAction     = 'opium_recolte'
		CurrentActionMsg  = '~o~Recolter de l\'opium'
		CurrentActionData = {zone= zone}
	end

	if zone == 'Opium7'  then
		CurrentAction     = 'opium_recolte'
		CurrentActionMsg  = '~o~Recolter de l\'opium'
		CurrentActionData = {zone= zone}
	end

	if zone == 'Opium8'  then
		CurrentAction     = 'opium_recolte'
		CurrentActionMsg  = '~o~Recolter de l\'opium'
		CurrentActionData = {zone= zone}
	end

	if zone == 'Opium9'  then
		CurrentAction     = 'opium_recolte'
		CurrentActionMsg  = '~o~Recolter de l\'opium'
		CurrentActionData = {zone= zone}
	end

	if zone == 'Opium10'  then
		CurrentAction     = 'opium_recolte'
		CurrentActionMsg  = '~o~Recolter de l\'opium'
		CurrentActionData = {zone= zone}
	end

	if zone == 'Opium11'  then
		CurrentAction     = 'opium_recolte'
		CurrentActionMsg  = '~o~Recolter de l\'opium'
		CurrentActionData = {zone= zone}
	end

	if zone == 'Opium12'  then
		CurrentAction     = 'opium_traitement'
		CurrentActionMsg  = '~o~Traiter de l\'opium'
		CurrentActionData = {zone= zone}
	end

	if zone == 'Ketamine'  then
		CurrentAction     = 'ketamine_recolte'
		CurrentActionMsg  = '~o~Harvest Ketamine'
		CurrentActionData = {zone= zone}
	end

	if zone == 'Ketamine2'  then
		CurrentAction     = 'ketamine_traitement'
		CurrentActionMsg  = '~b~Process Ketamine'
		CurrentActionData = {zone= zone}
	end

	if zone == 'LSD'  then
		CurrentAction     = 'LSD_recolte'
		CurrentActionMsg  = '~o~Harvest LSD'
		CurrentActionData = {zone= zone}
	end

	if zone == 'LSD2'  then
		CurrentAction     = 'LSD_traitement'
		CurrentActionMsg  = '~b~Process LSD'
		CurrentActionData = {zone= zone}
	end

	if zone == 'Morphine'  then
		CurrentAction     = 'morphine_recolte'
		CurrentActionMsg  = '~o~Harvest Morphine'
		CurrentActionData = {zone= zone}
	end

	if zone == 'Morphine2'  then
		CurrentAction     = 'morphine_recolte'
		CurrentActionMsg  = '~o~Harvest Morphine'
		CurrentActionData = {zone= zone}
	end

	if zone == 'Morphine3'  then
		CurrentAction     = 'morphine_traitement'
		CurrentActionMsg  = '~b~Process Morphine'
		CurrentActionData = {zone= zone}
	end

	if zone == 'Lean'  then
		CurrentAction     = 'lean_recolte'
		CurrentActionMsg  = '~o~Harvest Lean'
		CurrentActionData = {zone= zone}
	end

	if zone == 'Lean2'  then
		CurrentAction     = 'lean_traitement'
		CurrentActionMsg  = '~b~Process Lean'
		CurrentActionData = {zone= zone}
	end

	if zone == 'Heroine'  then
		CurrentAction     = 'heroine_recolte'
		CurrentActionMsg  = '~o~Harvest Heroine'
		CurrentActionData = {zone= zone}
	end

	if zone == 'Heroine2'  then
		CurrentAction     = 'heroine_traitement'
		CurrentActionMsg  = '~b~Process Heroine'
		CurrentActionData = {zone= zone}
	end

	if zone == 'Ecstasy'  then
		CurrentAction     = 'ecstasy_recolte'
		CurrentActionMsg  = '~o~Recolter de l\'Ecstasy'
		CurrentActionData = {zone= zone}
	end

	if zone == 'Ecstasy2'  then
		CurrentAction     = 'ecstasy_traitement'
		CurrentActionMsg  = '~b~Traiter de l\'Ecstasy'
		CurrentActionData = {zone= zone}
	end

	if zone == 'Amphetamines'  then
		CurrentAction     = 'amphetamines_recolte'
		CurrentActionMsg  = '~o~Recolter de l\'Amphetamine'
		CurrentActionData = {zone= zone}
	end

	if zone == 'Amphetamines2'  then
		CurrentAction     = 'amphetamines_traitement'
		CurrentActionMsg  = '~b~Traiter de l\'Amphetamine'
		CurrentActionData = {zone= zone}
	end

	if zone == 'Crack'  then
		CurrentAction     = 'crack_recolte'
		CurrentActionMsg  = '~b~Recolter du Crack'
		CurrentActionData = {zone= zone}
	end

	if zone == 'Crack2'  then
		CurrentAction     = 'crack_recolte'
		CurrentActionMsg  = '~o~Recolter du Crack'
		CurrentActionData = {zone= zone}
	end

	if zone == 'Crack3'  then
		CurrentAction     = 'crack_traitement'
		CurrentActionMsg  = '~b~Traiter du Crack'
		CurrentActionData = {zone= zone}
	end

	if zone == 'Marijuana'  then
		CurrentAction     = 'marijuana_recolte'
		CurrentActionMsg  = '~b~Harvest Marijuana'
		CurrentActionData = {zone= zone}
	end

	if zone == 'Marijuana2'  then
		CurrentAction     = 'marijuana_recolte'
		CurrentActionMsg  = '~b~Harvest Marijuana'
		CurrentActionData = {zone= zone}
	end

	if zone == 'Marijuana3'  then
		CurrentAction     = 'marijuana_recolte'
		CurrentActionMsg  = '~b~Harvest Marijuana'
		CurrentActionData = {zone= zone}
	end

	if zone == 'Marijuana4'  then
		CurrentAction     = 'marijuana_recolte'
		CurrentActionMsg  = '~b~Harvest Marijuana'
		CurrentActionData = {zone= zone}
	end

	if zone == 'Marijuana5'  then
		CurrentAction     = 'marijuana_traitement'
		CurrentActionMsg  = '~b~Process Marijuana'
		CurrentActionData = {zone= zone}
	end

	if zone == 'LaptopCoke'  then
		CurrentAction     = 'laptop_coke'
		CurrentActionMsg  = '~b~Turn on the computer'
		CurrentActionData = {zone= zone}
	end

	if zone == 'LaptopWeed'  then
		CurrentAction     = 'laptop_weed'
		CurrentActionMsg  = '~b~Turn on the computer'
		CurrentActionData = {zone= zone}
	end
	
end)

AddEventHandler('polo_drugs:hasExitedMarker', function(zone)
	ESX.UI.Menu.CloseAll()
	CurrentAction = nil
end)

-- Display markers
RegisterCommand("weed_drugs", function(source, args, rawCommand)
Citizen.CreateThread(function()
	while true do
		Wait(0)
		local coords = GetEntityCoords(GetPlayerPed(-1))

		for k,v in pairs(Config.Weed) do
				if(v.Type ~= -1 and GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < Config.DrawDistance) then
					DrawMarker(v.Type, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 100, false, true, 2, false, false, false, false)
			end
		end
	end
end)
end)

RegisterCommand("coke_drugs", function(source, args, rawCommand)
Citizen.CreateThread(function()
	while true do
		Wait(0)
		local coords = GetEntityCoords(GetPlayerPed(-1))

		for k,v in pairs(Config.Coke) do
				if(v.Type ~= -1 and GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < Config.DrawDistance) then
					DrawMarker(v.Type, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 100, false, true, 2, false, false, false, false)
			end
		end
	end
end)
end)

-- Enter / Exit marker events
Citizen.CreateThread(function()
	while true do

		Wait(0)

			local coords      = GetEntityCoords(GetPlayerPed(-1))
			local coords2     = GetEntityCoords(GetPlayerPed(-1))
			local coords3     = GetEntityCoords(GetPlayerPed(-1))
			local coords4     = GetEntityCoords(GetPlayerPed(-1))
			local coords5     = GetEntityCoords(GetPlayerPed(-1))
			local coords6     = GetEntityCoords(GetPlayerPed(-1))
			local coords7     = GetEntityCoords(GetPlayerPed(-1))
			local coords8     = GetEntityCoords(GetPlayerPed(-1))
			local coords9     = GetEntityCoords(GetPlayerPed(-1))
			local coords10     = GetEntityCoords(GetPlayerPed(-1))
			local coords11     = GetEntityCoords(GetPlayerPed(-1))
			local coords12     = GetEntityCoords(GetPlayerPed(-1))
			local coords13     = GetEntityCoords(GetPlayerPed(-1))
			local coords14     = GetEntityCoords(GetPlayerPed(-1))
			local isInMarker  = false
			local currentZone = nil

			for k,v in pairs(Config.Weed) do
				if(GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < v.Size.x) then
					isInMarker  = true
					currentZone = k
				end
			end

			for k,v in pairs(Config.Coke) do
				if(GetDistanceBetweenCoords(coords2, v.Pos.x, v.Pos.y, v.Pos.z, true) < v.Size.x) then
					isInMarker  = true
					currentZone = k
				end
			end

			for k,v in pairs(Config.Opium) do
				if(GetDistanceBetweenCoords(coords4, v.Pos.x, v.Pos.y, v.Pos.z, true) < v.Size.x) then
					isInMarker  = true
					currentZone = k
				end
			end

			for k,v in pairs(Config.Ketamine) do
				if(GetDistanceBetweenCoords(coords5, v.Pos.x, v.Pos.y, v.Pos.z, true) < v.Size.x) then
					isInMarker  = true
					currentZone = k
				end
			end

			for k,v in pairs(Config.LSD) do
				if(GetDistanceBetweenCoords(coords6, v.Pos.x, v.Pos.y, v.Pos.z, true) < v.Size.x) then
					isInMarker  = true
					currentZone = k
				end
			end

			for k,v in pairs(Config.Morphine) do
				if(GetDistanceBetweenCoords(coords7, v.Pos.x, v.Pos.y, v.Pos.z, true) < v.Size.x) then
					isInMarker  = true
					currentZone = k
				end
			end

			for k,v in pairs(Config.Lean) do
				if(GetDistanceBetweenCoords(coords8, v.Pos.x, v.Pos.y, v.Pos.z, true) < v.Size.x) then
					isInMarker  = true
					currentZone = k
				end
			end

			for k,v in pairs(Config.Heroine) do
				if(GetDistanceBetweenCoords(coords9, v.Pos.x, v.Pos.y, v.Pos.z, true) < v.Size.x) then
					isInMarker  = true
					currentZone = k
				end
			end

			for k,v in pairs(Config.Ecstasy) do
				if(GetDistanceBetweenCoords(coords10, v.Pos.x, v.Pos.y, v.Pos.z, true) < v.Size.x) then
					isInMarker  = true
					currentZone = k
				end
			end

			for k,v in pairs(Config.Amphetamines) do
				if(GetDistanceBetweenCoords(coords11, v.Pos.x, v.Pos.y, v.Pos.z, true) < v.Size.x) then
					isInMarker  = true
					currentZone = k
				end
			end

			for k,v in pairs(Config.Crack) do
				if(GetDistanceBetweenCoords(coords12, v.Pos.x, v.Pos.y, v.Pos.z, true) < v.Size.x) then
					isInMarker  = true
					currentZone = k
				end
			end

			for k,v in pairs(Config.Marijuana) do
				if(GetDistanceBetweenCoords(coords13, v.Pos.x, v.Pos.y, v.Pos.z, true) < v.Size.x) then
					isInMarker  = true
					currentZone = k
				end
			end

			for k,v in pairs(Config.Laptop) do
				if(GetDistanceBetweenCoords(coords14, v.Pos.x, v.Pos.y, v.Pos.z, true) < v.Size.x) then
					isInMarker  = true
					currentZone = k
				end
			end

			if (isInMarker and not HasAlreadyEnteredMarker) or (isInMarker and LastZone ~= currentZone) then
				HasAlreadyEnteredMarker = true
				LastZone                = currentZone
				TriggerEvent('polo_drugs:hasEnteredMarker', currentZone)
			end

			if not isInMarker and HasAlreadyEnteredMarker then
				HasAlreadyEnteredMarker = false
				TriggerEvent('polo_drugs:hasExitedMarker', LastZone)
		end
	end
end)

-- Key Controls
Citizen.CreateThread(function()
	while true do

		Citizen.Wait(0)

		if CurrentAction ~= nil then

			SetTextComponentFormat('STRING')
			AddTextComponentString(CurrentActionMsg)
			DisplayHelpTextFromStringLabel(0, 0, 1, -1)

			if IsControlPressed(0,  Keys['E']) and (GetGameTimer() - GUI.Time) > 300 then
				if CurrentAction == 'weed_recolte' then
					TriggerServerEvent('drugs1:animation' , source)
					TriggerServerEvent('polo_drugs:startHarvest', CurrentActionData.zone)
					Citizen.Wait(15000)
				end
				if CurrentAction == 'weed_traitement' then
					TriggerServerEvent('drugs2:animation2' , source)
					TriggerServerEvent('polo_drugs:startHarvest2', CurrentActionData.zone)
					Citizen.Wait(15000)
				end
				if CurrentAction == 'coke_recolte' then
					TriggerServerEvent('drugs2:animation2' , source)
					TriggerServerEvent('polo_drugs:startHarvest3', CurrentActionData.zone)
					Citizen.Wait(15000)
				end
				if CurrentAction == 'coke_traitement' then
					TriggerServerEvent('drugs2:animation2' , source)
					TriggerServerEvent('polo_drugs:startHarvest4', CurrentActionData.zone)
					Citizen.Wait(15000)
				end
				if CurrentAction == 'opium_recolte' then
					TriggerServerEvent('opium3:animation3' , source)
					TriggerServerEvent('polo_drugs:startHarvest7', CurrentActionData.zone)
					Citizen.Wait(15000)
				end
				if CurrentAction == 'opium_traitement' then
					TriggerServerEvent('drugs2:animation2' , source)
					TriggerServerEvent('polo_drugs:startHarvest8', CurrentActionData.zone)
					Citizen.Wait(15000)
				end
				if CurrentAction == 'ketamine_recolte' then
					TriggerServerEvent('drugs2:animation2' , source)
					TriggerServerEvent('polo_drugs:startHarvest9', CurrentActionData.zone)
					Citizen.Wait(15000)
				end
				if CurrentAction == 'ketamine_traitement' then
					TriggerServerEvent('rien:rien' , source)
					TriggerServerEvent('polo_drugs:startHarvest10', CurrentActionData.zone)
					Citizen.Wait(15000)
				end
				if CurrentAction == 'LSD_recolte' then
					TriggerServerEvent('drugs2:animation2' , source)
					TriggerServerEvent('polo_drugs:startHarvest11', CurrentActionData.zone)
					Citizen.Wait(15000)
				end
				if CurrentAction == 'LSD_traitement' then
					TriggerServerEvent('rien:rien' , source)
					TriggerServerEvent('polo_drugs:startHarvest12', CurrentActionData.zone)
					Citizen.Wait(15000)
				end
				if CurrentAction == 'morphine_recolte' then
					'rien:rien' , source)
					TriggerServerEvent('polo_drugs:startHarvest13', CurrentActionData.zone)
					Citizen.Wait(15000)
				end
				if CurrentAction == 'morphine_recolte' then
					TriggerServerEvent('drugs2:animation2' , source)
					TriggerServerEvent('polo_drugs:startHarvest13', CurrentActionData.zone)
					Citizen.Wait(15000)
				end
				if CurrentAction == 'morphine_traitement' then
					TriggerServerEvent('none:none' , source)
					TriggerServerEvent('polo_drugs:startHarvest14', CurrentActionData.zone)
					Citizen.Wait(15000)
				end
				if CurrentAction == 'lean_recolte' then
					TriggerServerEvent('drugs2:animation2' , source)
					TriggerServerEvent('polo_drugs:startHarvest15', CurrentActionData.zone)
					Citizen.Wait(15000)
				end
				if CurrentAction == 'lean_traitement' then
					TriggerServerEvent('none:none' , source)
					TriggerServerEvent('polo_drugs:startHarvest16', CurrentActionData.zone)
					Citizen.Wait(15000)
				end
				if CurrentAction == 'heroine_recolte' then
					TriggerServerEvent('drugs2:animation2' , source)
					TriggerServerEvent('polo_drugs:startHarvest17', CurrentActionData.zone)
					Citizen.Wait(15000)
				end
				if CurrentAction == 'heroine_traitement' then
					TriggerServerEvent('none:none' , source)
					TriggerServerEvent('polo_drugs:startHarvest18', CurrentActionData.zone)
					Citizen.Wait(15000)
				end
				if CurrentAction == 'ecstasy_recolte' then
					TriggerServerEvent('none:none' , source)
					TriggerServerEvent('polo_drugs:startHarvest19', CurrentActionData.zone)
					Citizen.Wait(15000)
				end
				if CurrentAction == 'ecstasy_traitement' then
					TriggerServerEvent('none:none' , source)
					TriggerServerEvent('polo_drugs:startHarvest20', CurrentActionData.zone)
					Citizen.Wait(15000)
				end
				if CurrentAction == 'amphetamines_recolte' then
					TriggerServerEvent('drugs2:animation2' , source)
					TriggerServerEvent('polo_drugs:startHarvest21', CurrentActionData.zone)
					Citizen.Wait(15000)
				end
				if CurrentAction == 'amphetamines_traitement' then
					TriggerServerEvent('drugs2:animation2' , source)
					TriggerServerEvent('polo_drugs:startHarvest22', CurrentActionData.zone)
					Citizen.Wait(15000)
				end
				if CurrentAction == 'crack_recolte' then
					TriggerServerEvent('drugs2:animation2' , source)
					TriggerServerEvent('polo_drugs:startHarvest23', CurrentActionData.zone)
					Citizen.Wait(15000)
				end
				if CurrentAction == 'crack_recolte' then
					TriggerServerEvent('drugs2:animation2' , source)
					TriggerServerEvent('polo_drugs:startHarvest23', CurrentActionData.zone)
					Citizen.Wait(15000)
				end
				if CurrentAction == 'crack_traitement' then
					TriggerServerEvent('none:none' , source)
					TriggerServerEvent('polo_drugs:startHarvest24', CurrentActionData.zone)
					Citizen.Wait(15000)
				end
				if CurrentAction == 'marijuana_recolte' then
					TriggerServerEvent('drug1:animation' , source)
					TriggerServerEvent('polo_drugs:startHarvest25', CurrentActionData.zone)
					Citizen.Wait(15000)
				end
				if CurrentAction == 'marijuana_traitement' then
					TriggerServerEvent('drug2:animation2' , source)
					TriggerServerEvent('polo_drugs:startHarvest26', CurrentActionData.zone)
					Citizen.Wait(15000)
				end

				-- Laptop in addition in case you do not have the point, if you have it delete this one.
				if CurrentAction == 'laptop_coke' then
					TaskPlayAnim(ped, "anim@amb@warehouse@laptop@", "exit", 8.0, 8.0, 0.1, 0, 1, false, false, false)
					OpenLaptopCoke()
					Citizen.Wait(5000)
				end
				
				-- Laptop in addition in case you do not have the point, if you have it delete this one.
				if CurrentAction == 'laptop_weed' then
					TaskPlayAnim(ped, "anim@amb@warehouse@laptop@", "exit", 8.0, 8.0, 0.1, 0, 1, false, false, false)
					OpenLaptop()
					Citizen.Wait(5000)
				end
	end
end
end
end)

-- polo � License | Discord : https://discord.gg/czW6Jqj
local PlayerData              = {}
local isBlip              = false
-- polo � License | Discord : https://discord.gg/czW6Jqj
ESX = nil
-- polo � License | Discord : https://discord.gg/czW6Jqj
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
	
	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	PlayerData = ESX.GetPlayerData()
	
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	PlayerData = xPlayer
	PlayerData.job = job
	Citizen.Wait(5000)
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	PlayerData.job = job
	
	Citizen.Wait(5000)
end)

Citizen.CreateThread(function()
    Holograms()
end)

function Holograms()
		while true do
			Citizen.Wait(0)			
		if GetDistanceBetweenCoords( -708.94, 642.13, 155.17, GetEntityCoords(GetPlayerPed(-1))) < 10.0 then
			Draw3DText( -708.94, 642.13, 155.17  -1.400, "~g~Process Marijuana", 4, 0.1, 0.1)
		end
		if GetDistanceBetweenCoords( 3680.40, 4937.00, 17.31, GetEntityCoords(GetPlayerPed(-1))) < 10.0 then
			Draw3DText( 3680.40, 4937.00, 17.31  -1.600, "~g~Harvest Marijuana", 4, 0.1, 0.1)
		end
		if GetDistanceBetweenCoords( -541.49, 3554.43, 237.96, GetEntityCoords(GetPlayerPed(-1))) < 10.0 then
			Draw3DText( -541.49, 3554.43, 237.96  -1.600, "~d~Harvest Opium", 4, 0.1, 0.1)
		end
		if GetDistanceBetweenCoords( -2087.97, 2621.70, 1.02, GetEntityCoords(GetPlayerPed(-1))) < 10.0 then
			Draw3DText( -2087.97, 2621.70, 1.02  -1.600, "~d~Traiter de l' Opium", 4, 0.1, 0.1)
		end
		if GetDistanceBetweenCoords( -3205.11, 1198.80, 9.54, GetEntityCoords(GetPlayerPed(-1))) < 10.0 then
			Draw3DText( -3205.11, 1198.80, 9.54  -1.600, "~p~Harvest Ketamine", 4, 0.1, 0.1)
		end
		if GetDistanceBetweenCoords( -1797.97, 408.92, 113.66, GetEntityCoords(GetPlayerPed(-1))) < 10.0 then
			Draw3DText( -1797.97, 408.92, 113.66  -1.600, "~p~Process Ketamine", 4, 0.1, 0.1)
		end
		if GetDistanceBetweenCoords( 2510.50, 3786.05, 50.83, GetEntityCoords(GetPlayerPed(-1))) < 10.0 then
			Draw3DText( 2510.50, 3786.05, 50.83  -1.600, "~y~Harvest LSD", 4, 0.1, 0.1)
		end
		if GetDistanceBetweenCoords( 244.67, 374.58, 105.73, GetEntityCoords(GetPlayerPed(-1))) < 10.0 then
			Draw3DText( 244.67, 374.58, 105.73  -1.600, "~y~Process LSD", 4, 0.1, 0.1)
		end
		if GetDistanceBetweenCoords( 3559.88, 3673.40, 28.12, GetEntityCoords(GetPlayerPed(-1))) < 10.0 then
			Draw3DText( 3559.88, 3673.40, 28.12  -1.600, "~j~Harvest ~j~Morphine", 4, 0.1, 0.1)
		end
		if GetDistanceBetweenCoords( 166.64, 2229.20, 90.76, GetEntityCoords(GetPlayerPed(-1))) < 10.0 then
			Draw3DText( 166.64, 2229.20, 90.76  -1.600, "~j~Process ~j~Morphine", 4, 0.1, 0.1)
		end
		if GetDistanceBetweenCoords( -1358.80,-757.95,22.30, GetEntityCoords(GetPlayerPed(-1))) < 10.0 then
			Draw3DText( -1358.80,-757.95,22.30  -1.600, "~m~Harvest ~p~Lean", 4, 0.1, 0.1)
		end
		if GetDistanceBetweenCoords( 725.79, -1071.51, 28.31, GetEntityCoords(GetPlayerPed(-1))) < 10.0 then
			Draw3DText( 725.79, -1071.51, 28.31  -1.600, "~m~Process ~p~Lean", 4, 0.1, 0.1)
		end
		if GetDistanceBetweenCoords( -1337.31, -1164.44, 4.54, GetEntityCoords(GetPlayerPed(-1))) < 10.0 then
			Draw3DText( -1337.31, -1164.44, 4.54  -1.600, "~r~Harvest Heroine", 4, 0.1, 0.1)
		end
		if GetDistanceBetweenCoords( 414.62, 344.27, 102.42, GetEntityCoords(GetPlayerPed(-1))) < 10.0 then
			Draw3DText( 414.62, 344.27, 102.42  -1.600, "~r~Traiter de l' Heroine", 4, 0.1, 0.1)
		end
		if GetDistanceBetweenCoords( -1202.17, -1793.12, 3.90, GetEntityCoords(GetPlayerPed(-1))) < 10.0 then
			Draw3DText( -1202.17, -1793.12, 3.90  -1.600, "~y~Harvest Ecstasy", 4, 0.1, 0.1)
		end
		if GetDistanceBetweenCoords( -157.35, -2206.26, 8.71, GetEntityCoords(GetPlayerPed(-1))) < 10.0 then
			Draw3DText( -157.35, -2206.26, 8.71  -1.600, "~y~Traiter de l' Ecstasy", 4, 0.1, 0.1)
		end
		if GetDistanceBetweenCoords( 462.50, -1323.20, 28.94, GetEntityCoords(GetPlayerPed(-1))) < 10.0 then
			Draw3DText( 462.50, -1323.20, 28.94  -1.600, "~y~Harvest Amphetamines", 4, 0.1, 0.1)
		end
		if GetDistanceBetweenCoords( 1268.44, -1710.14, 54.77, GetEntityCoords(GetPlayerPed(-1))) < 10.0 then
			Draw3DText( 1268.44, -1710.14, 54.77  -1.600, "~y~Traiter de l' Amphetamines", 4, 0.1, 0.1)
		end
		if GetDistanceBetweenCoords( 710.34, -1416.28, 26.19, GetEntityCoords(GetPlayerPed(-1))) < 10.0 then
			Draw3DText( 710.34, -1416.28, 26.19  -1.600, "~y~Harvest Crack", 4, 0.1, 0.1)
		end
		if GetDistanceBetweenCoords( 983.82, 3572.65, 33.57, GetEntityCoords(GetPlayerPed(-1))) < 10.0 then
			Draw3DText( 983.82, 3572.65, 33.57  -1.600, "~y~Traiter du Crack", 4, 0.1, 0.1)
		end
		if GetDistanceBetweenCoords( -320.50, -1347.99, 24.5, GetEntityCoords(GetPlayerPed(-1))) < 3.0 then
			Draw3DText( -320.50, -1347.99, 24.5  -1.600, "~p~Use the Laptop", 4, 0.1, 0.1)
		end
		if GetDistanceBetweenCoords( -1260.90, -1114.60, 0.80, GetEntityCoords(GetPlayerPed(-1))) < 3.0 then
			Draw3DText( -1260.90, -1114.60, 0.80  -1.600, "~p~Use the Laptop", 4, 0.1, 0.1)
		end
	end
end

-------------------------------------------------------------------------------------------------------------------------
function Draw3DText(x,y,z,textInput,fontId,scaleX,scaleY)
         local px,py,pz=table.unpack(GetGameplayCamCoords())
         local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)    
         local scale = (1/dist)*20
         local fov = (1/GetGameplayCamFov())*100
         local scale = scale*fov   
         SetTextScale(scaleX*scale, scaleY*scale)
         SetTextFont(fontId)
         SetTextProportional(1)
         SetTextColour(250, 250, 250, 255)
         SetTextDropshadow(1, 1, 1, 1, 255)
         SetTextEdge(2, 0, 0, 0, 150)
         SetTextDropShadow()
         SetTextOutline()
         SetTextEntry("STRING")
         SetTextCentre(1)
         AddTextComponentString(textInput)
         SetDrawOrigin(x,y,z+2, 0)
         DrawText(0.0, 0.0)
         ClearDrawOrigin()
        end

RegisterNetEvent('drug1:animation')
AddEventHandler('drug1:animation', function()
	TaskStartScenarioInPlace(PlayerPedId(), "world_human_gardener_plant", 0, true)
	Citizen.Wait(10000)
	ClearPedTasksImmediately(PlayerPedId())
end)

RegisterNetEvent('drugs2:animation2')
AddEventHandler('drugs2:animation2', function()
	TaskStartScenarioInPlace(PlayerPedId(), "PROP_HUMAN_BUM_BIN", 0, true)
	Citizen.Wait(10000)
	ClearPedTasksImmediately(PlayerPedId())
end)

RegisterNetEvent('opium3:animation3')
AddEventHandler('opium3:animation3', function()
	TaskStartScenarioInPlace(PlayerPedId(), "CODE_HUMAN_MEDIC_TEND_TO_DEAD", 0, true)
	Citizen.Wait(10000)
	ClearPedTasksImmediately(PlayerPedId())
end)

RegisterNetEvent('meth4:animation4')
AddEventHandler('meth4:animation4', function()
	TaskStartScenarioInPlace(PlayerPedId(), "world_human_stand_fire", 0, true)
	Citizen.Wait(10000)
	ClearPedTasksImmediately(PlayerPedId())
end)

RegisterNetEvent('none:none')
AddEventHandler('none:none', function()
	TaskStartScenarioInPlace(PlayerPedId(), "none", 0, true)
	Citizen.Wait(10000)
	ClearPedTasksImmediately(PlayerPedId())
end)

local Keys = {
	["ESC"] = 322, ["BACKSPACE"] = 177, ["E"] = 38, ["ENTER"] = 18,	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173
}

local menuIsShowed				  = false
local hasAlreadyEnteredMarker     = false
local lastZone                    = nil
local isInjaillistingMarker 		  = false

ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

function OpenPoloDrugsMenu(data)
	

		ESX.UI.Menu.CloseAll()

		ESX.UI.Menu.Open(
			'default', GetCurrentResourceName(), 'drugs',
			{
				title    = 'Laboratory outfit',
				elements = {
				{label = 'Citizen outfit', value = 'citizen_wear'},
				{label = 'Drugs outfit', value = 'drugs_wear'},			
			},
			},
			function(data, menu)
			local ped = GetPlayerPed(-1)
			menu.close()

			if data.current.value == 'citizen_wear' then
				
				ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jailSkin)
				TriggerEvent('skinchanger:loadSkin', skin)
				end)

			end
			

			if data.current.value == 'drugs_wear' then 

				ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jailSkin)
					if skin.sex == 0 then				
						SetPedComponentVariation(GetPlayerPed(-1), 3, 96, 0, 0)--Gants
						SetPedComponentVariation(GetPlayerPed(-1), 4, 31, 0, 0)--Jean
						SetPedComponentVariation(GetPlayerPed(-1), 6, 27, 0, 0)--Chaussure
						SetPedComponentVariation(GetPlayerPed(-1), 11, 253, 1, 0)--Veste
						SetPedComponentVariation(GetPlayerPed(-1), 8, 15, 0, 0)--GiletJaune
						SetPedComponentVariation(GetPlayerPed(-1), 5, 44, 0, 0)--GiletJaune			
						SetPedComponentVariation(GetPlayerPed(-1), 1, 36, 0, 0)--Masques								
					elseif skin.sex == 1 then
                        SetPedComponentVariation(GetPlayerPed(-1), 3, 111, 0, 0)--Gants
                        SetPedComponentVariation(GetPlayerPed(-1), 4, 32, 0, 0)--Jean
                        SetPedComponentVariation(GetPlayerPed(-1), 6, 26, 0, 0)--Chaussure
                        SetPedComponentVariation(GetPlayerPed(-1), 11, 261, 1, 0)--Veste
                        SetPedComponentVariation(GetPlayerPed(-1), 8, 14, 0, 0)--GiletJaune
                        SetPedComponentVariation(GetPlayerPed(-1), 5, 44, 0, 0)--GiletJaune
                        SetPedComponentVariation(GetPlayerPed(-1), 1, 36, 0, 0)--Masques
					else
						TriggerEvent('skinchanger:loadClothes', skin, jailSkin.skin_female)
					end
					
				end)
			end


		end,
			function(data, menu)
				menu.close()
			end
		)

	
end

AddEventHandler('polo_drugs:hasExitedMarker', function(zone)
	ESX.UI.Menu.CloseAll()
end)

AddEventHandler('polo_drugs:hasExitedMarker', function(zone)
	ESX.UI.Menu.CloseAll()
end)

-- Display markers
Citizen.CreateThread(function()
	while true do
		Wait(0)
		local coords = GetEntityCoords(GetPlayerPed(-1))
		for i=1, #Config.Zoness, 1 do
			if(GetDistanceBetweenCoords(coords, Config.Zoness[i].x, Config.Zoness[i].y, Config.Zoness[i].z, true) < Config.DrawDistance) then
				DrawMarker(Config.MarkerType, Config.Zoness[i].x, Config.Zoness[i].y, Config.Zoness[i].z, 0, 0.0, 0.0, 1.0, 1.5, 1.0, Config.ZoneSize.x, Config.ZoneSize.y, Config.ZoneSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, false, 2, false, false, false, false)
			end
		end
	end
end)

-- Activate menu when player is inside marker
Citizen.CreateThread(function()
	while true do
		Wait(0)
		local coords      = GetEntityCoords(GetPlayerPed(-1))
		isInJaillistingMarker  = false
		local currentZone = nil
		for i=1, #Config.Zoness, 1 do
			if(GetDistanceBetweenCoords(coords, Config.Zoness[i].x, Config.Zoness[i].y, Config.Zoness[i].z, true) < Config.ZoneSize.x) then
				isInJaillistingMarker  = true
				SetTextComponentFormat('STRING')
            	AddTextComponentString('Press ~INPUT_PICKUP~ to take your ~b~outfit~s~.')
            	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
			end
		end
		if isInJaillistingMarker and not hasAlreadyEnteredMarker then
			hasAlreadyEnteredMarker = true
		end
		if not isInJaillistingMarker and hasAlreadyEnteredMarker then
			hasAlreadyEnteredMarker = false
			TriggerEvent('polo_drugs:hasExitedMarker')
		end
	end
end)


-- Menu Controls
Citizen.CreateThread(function()
	while true do
		Wait(0)
		if IsControlJustReleased(0, Keys['E']) and isInJaillistingMarker and not menuIsShowed then
			OpenPoloDrugsMenu()
		end
	end
end)