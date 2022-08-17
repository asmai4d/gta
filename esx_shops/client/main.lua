ESX                           = nil
local HasAlreadyEnteredMarker = false
local LastZone                = nil
local CurrentAction           = nil
local CurrentActionMsg        = ''
local CurrentActionData       = {}

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	Citizen.Wait(5000)

	ESX.TriggerServerCallback('esx_shops:shopItems', function(ShopItems)
		for k,v in pairs(ShopItems) do
			if (Config.Zones[k] == nil) then
				Config.Zones[k] = {
					Items = {},
					Pos = {}
				}		
			end
			
			Config.Zones[k].Items = v
		end
	end)
end)

AddEventHandler('onResourceStop', function(resource)
	  if resource == GetCurrentResourceName() then
		  SetNuiFocus(false, false)
	  end
end)
  
RegisterNUICallback('escape', function(data, cb)
	 
	  SetNuiFocus(false, false)
  
	  SendNUIMessage({
		  type = "close",
	  })
	  SetTimecycleModifier('default')
end)

local Cart = {}

RegisterNUICallback('putcart', function(data, cb)
	table.insert(Cart, {item = data.item, label = data.label, id = data.id, price = data.price})
	cb(Cart)
end)

RegisterNUICallback('removecart', function(data, cb)
	for i, item in ipairs(Cart) do
		if item.item == data.item then 
			table.remove(Cart, i)
		end
	end
end)

RegisterNUICallback('notify', function(data, cb)
	ESX.ShowNotification(data.msg)
end)


RegisterNUICallback('emptycart', function(data, cb)
	Cart = {}
	
end)

RegisterNUICallback('buy', function(data, cb)	
	TriggerServerEvent('esx_shops:buyItem', data.Item, data.Count, data.Zone)
	Cart = {}
end)


function OpenShopMenu(zone)
	if not Config.Zones[zone].Items then
		ESX.TriggerServerCallback('esx_shops:shopItems', function(ShopItems)
			for k,v in pairs(ShopItems) do
				Config.Zones[k].Items = v
			end
		end)
	end

	local result = {}
	for i=1, #Config.Zones[zone].Items, 1 do
		local item = Config.Zones[zone].Items[i]

		table.insert(result, {
			label = item.label,
			item       = item.item,
			price      = item.price,
		})
	end
	SetNuiFocus(true, true)

	SendNUIMessage({
		type = "shop",
		result = result,
		owner = false,
		name = zone
	})

end

AddEventHandler('esx_shops:hasEnteredMarker', function(zone)
	CurrentAction     = 'shop_menu'
	CurrentActionMsg  = _U('press_menu')
	CurrentActionData = {zone = zone}
end)

AddEventHandler('esx_shops:hasExitedMarker', function(zone)
	CurrentAction = nil
	ESX.UI.Menu.CloseAll()
end)

-- Create Blips
Citizen.CreateThread(function()
	for k,v in pairs(Config.Zones) do
		for i = 1, #v.Pos, 1 do
			local blip = AddBlipForCoord(v.Pos[i].x, v.Pos[i].y, v.Pos[i].z)
			SetBlipSprite (blip, 52)
			SetBlipDisplay(blip, 4)
			SetBlipScale  (blip, 1.0)
			SetBlipColour (blip, 2)
			SetBlipAsShortRange(blip, true)
			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString(_U('shops'))
			EndTextCommandSetBlipName(blip)
		end
	end
end)

-- Display markers
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local coords = GetEntityCoords(PlayerPedId())

		for k,v in pairs(Config.Zones) do
			for i = 1, #v.Pos, 1 do
				if(Config.Type ~= -1 and GetDistanceBetweenCoords(coords, v.Pos[i].x, v.Pos[i].y, v.Pos[i].z, true) < Config.DrawDistance) then
					DrawMarker(Config.Type, v.Pos[i].x, v.Pos[i].y, v.Pos[i].z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.Size.x, Config.Size.y, Config.Size.z, Config.Color.r, Config.Color.g, Config.Color.b, 100, false, true, 2, false, false, false, false)
				end
			end
		end
	end
end)

-- Enter / Exit marker events
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local coords      = GetEntityCoords(PlayerPedId())
		local isInMarker  = false
		local currentZone = nil

		for k,v in pairs(Config.Zones) do
			for i = 1, #v.Pos, 1 do
				if(GetDistanceBetweenCoords(coords, v.Pos[i].x, v.Pos[i].y, v.Pos[i].z, true) < Config.Size.x) then
					isInMarker  = true
					ShopItems   = v.Items
					currentZone = k
					LastZone    = k
				end
			end
		end
		if isInMarker and not HasAlreadyEnteredMarker then
			HasAlreadyEnteredMarker = true
			TriggerEvent('esx_shops:hasEnteredMarker', currentZone)
		end
		if not isInMarker and HasAlreadyEnteredMarker then
			HasAlreadyEnteredMarker = false
			TriggerEvent('esx_shops:hasExitedMarker', LastZone)
		end
	end
end)

-- Key Controls
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		if CurrentAction ~= nil then
			ESX.ShowHelpNotification(CurrentActionMsg)

			if IsControlJustReleased(0, 38) then
				if CurrentAction == 'shop_menu' then
					OpenShopMenu(CurrentActionData.zone)
				end

				CurrentAction = nil
			end
		else
			Citizen.Wait(500)
		end
	end
end)
