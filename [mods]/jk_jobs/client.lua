local PlayerData = {}
ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function ()
	while true do
		Citizen.Wait(0)



		if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)),  -266.93,-959.97,31.22, true) < 5 then
			DrawMarker(Config.Marker.type, Config.Marker.x, Config.Marker.y, Config.Marker.z, 0, 0, 0, 0, 0, 0, 2.0001,2.0001,2.0001, 0, Config.Color.r, Config.Color.g, Config.Color.b, 0, 0, 0, 0, 0, 0, 0)
				DisplayHelpText("Naciśnij ~y~E~s~ aby przejrzeć listę dostępnych miejsc pracy w naszym urzędzie.")
			if (IsControlJustReleased(1, 51)) then
				SetNuiFocus( true, true )
				SendNUIMessage({
					ativa = true
				})
		 	end
		end


	end
end)

RegisterNUICallback('1', function(data, cb)
	if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)),  -266.93,-959.97,31.22, true) < 2 then
		TriggerServerEvent('jk_jobs:setJobt')
		TriggerEvent("pNotify:SendNotification", {text = "Zarejestrowałeś się jako bezrobotny", type = "success", timeout = 4000, layout = "centerRight"})
		cb('ok')
	else
		print("NUI DEV TOOLS")
	end
end)

RegisterNUICallback('2', function(data, cb)
	if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)),  -266.93,-959.97,31.22, true) < 2 then
		TriggerServerEvent('jk_jobs:setJobm')
	TriggerEvent("pNotify:SendNotification", {text = "Zarejestrowałeś się jako pracownik w burgerowni", type = "success", timeout = 4000, layout = "centerRight"})
		cb('ok')
	else
	print("NUI DEV TOOLS")
end
end)

RegisterNUICallback('3', function(data, cb)
	if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)),  -266.93,-959.97,31.22, true) < 2 then
		TriggerServerEvent('jk_jobs:setJobp')
		TriggerEvent("pNotify:SendNotification", {text = "Zarejestrowałeś się jako piekarz", type = "success", timeout = 4000, layout = "centerRight"})
		cb('ok')
	else
		print("NUI DEV TOOLS")
	end
end)

RegisterNUICallback('4', function(data, cb)
	if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)),  -266.93,-959.97,31.22, true) < 2 then
		TriggerServerEvent('jk_jobs:setJobn')
		TriggerEvent("pNotify:SendNotification", {text = "Zarejestrowałeś się jako sadownik", type = "success", timeout = 4000, layout = "centerRight"})
		cb('ok')
	else
		print("NUI DEV TOOLS")
	end
end)

RegisterNUICallback('5', function(data, cb)
	if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)),  -266.93,-959.97,31.22, true) < 2 then
		TriggerServerEvent('jk_jobs:setJobb')
	TriggerEvent("pNotify:SendNotification", {text = "Zarejestrowałeś się jako stolarz", type = "success", timeout = 4000, layout = "centerRight"})
	cb('ok')
	else
	print("NUI DEV TOOLS")
end
end)

RegisterNUICallback('6', function(data, cb)
	if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)),  -266.93,-959.97,31.22, true) < 2 then
		TriggerServerEvent('jk_jobs:setJobtk')
		TriggerEvent("pNotify:SendNotification", {text = "Zarejestrowałeś się jako złomiarz", type = "success", timeout = 4000, layout = "centerRight"})
		cb('ok')
	else
		print("NUI DEV TOOLS")
	end
end)

RegisterNUICallback('fechar', function(data, cb)
	SetNuiFocus( false )
	SendNUIMessage({
	ativa = false
	})
  	cb('ok')
end)

function DrawSpecialText(m_text, showtime)
	SetTextEntry_2("STRING")
	AddTextComponentString(m_text)
	DrawSubtitleTimed(showtime, 1)
end

function DisplayHelpText(str)
	SetTextComponentFormat("STRING")
	AddTextComponentString(str)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end
