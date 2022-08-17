



local ESX = nil
local PlayerData                = {}
Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(555)
  end
end)

local playergroup = nil
local Entity = nil



RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    PlayerData = xPlayer
end)



RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
  PlayerData.job = job
end)


function tablelength(T)
	local count = 0
	for _ in pairs(T) do count = count + 1 end
	return count
  end



function GetEntInFrontOfPlayer(Distance, Ped)
  local Ent = nil
  local CoA = GetEntityCoords(Ped, 1)
  local CoB = GetOffsetFromEntityInWorldCoords(Ped, 0.0, Distance, 0.0)
  local RayHandle = StartShapeTestRay(CoA.x, CoA.y, CoA.z, CoB.x, CoB.y, CoB.z, -1, Ped, 0)
  local A,B,C,D,Ent = GetRaycastResult(RayHandle)
  return Ent
end

-- Camera's coords
function GetCoordsFromCam(distance)
  local rot = GetGameplayCamRot(2)
  local coord = GetGameplayCamCoord()

  local tZ = rot.z * 0.0174532924
  local tX = rot.x * 0.0174532924
  local num = math.abs(math.cos(tX))

  newCoordX = coord.x + (-math.sin(tZ)) * (num + distance)
  newCoordY = coord.y + (math.cos(tZ)) * (num + distance)
  newCoordZ = coord.z + (math.sin(tX) * 8.0)
  return newCoordX, newCoordY, newCoordZ
end

-- Get entity's ID and coords from where player sis targeting
function taarget(Distance, Ped)
  local Entity = nil
  local camCoords = GetGameplayCamCoord()
  local farCoordsX, farCoordsY, farCoordsZ = GetCoordsFromCam(Distance)
  local RayHandle = StartShapeTestRay(camCoords.x, camCoords.y, camCoords.z, farCoordsX, farCoordsY, farCoordsZ, -1, Ped, 0)
  local A,B,C,D,Entity = GetRaycastResult(RayHandle)
  return Entity, farCoordsX, farCoordsY, farCoordsZ
end



RegisterCommand("nui", function(source, args, rawCommand)
  -- If the source is > 0, then that means it must be a player.
  SetNuiFocus(false, false)
end)





RegisterNUICallback('disablenuifocus', function(data)
  SetNuiFocus(data.nuifocus, data.nuifocus)
end)

-- Toggle car trunk (Example of Vehcile's menu)
RegisterNUICallback('togglecoffre', function(data)
  TriggerEvent("oa_inv_pixel:openintrunk",Entity)
  SetNuiFocus(false, false)
end)


-- Переключение капота автомобиля (Пример меню Vehcile)


-- Переключение блокировки автомобиля (Пример меню Vehcile)
RegisterNUICallback('togglelock', function(data)
  TriggerEvent("esx_carlock:tougle")
end)

-- Example of animation (Ped's menu)
RegisterNUICallback('cheer', function(data)

  
end)

------------------------------------------------------------------
--                          Citizen
------------------------------------------------------------------
function Crosshair(enable)
  SendNUIMessage({
    crosshair = enable
  })
end




local cachedBins = {}
local randomitem = {
  "paint",
  "rubber",
  "glue",
  "treads",
  "butel"
}

RegisterKeyMapping('intaractions', 'Intract', 'keyboard', 'g')








local once = false



Citizen.CreateThread(function()
	while true do
    local Ped = GetPlayerPed(-1)
    Entity, farCoordsX, farCoordsY, farCoordsZ = taarget(6.0, Ped)--exports["target:taarget"](6.0, Ped); --exports['target']:taarget(6.0, Ped) -- exports['target']:Target(6.0, Ped)
    local EntityType = GetEntityType(Entity) 
    if EntityType ~= 0 then
     if  GetEntityModel(Entity) == 1245865676 or
         GetEntityModel(Entity) ==  1777271576 or  
         GetEntityModel(Entity) == -1065766299 or 
         GetEntityModel(Entity)  == 1437508529 or 
         GetEntityModel(Entity)  == -58485588 or 
         GetEntityModel(Entity)  == -1426008804 or  
         GetEntityModel(Entity)  == -1096777189  or 
         GetEntityModel(Entity)  ==  218085040 or 
         GetEntityModel(Entity)  ==  -228596739  or 
         GetEntityModel(Entity)  == 666561306 or 
         GetEntityModel(Entity)  == 682791951 or 
         GetEntityModel(Entity)  == 1885233650 or 
         GetEntityModel(Entity)  == -1667301416 or 
         GetEntityModel(Entity)  == 237565330  or 
         GetEntityModel(Entity)  == -874338148  or 
         GetEntityModel(Entity)  == 765541575  or 
         GetEntityModel(Entity)  == -1674314660  or 

        --  GetEntityModel(Entity)  == 1352295901   or 
        --  GetEntityModel(Entity)  == 1506471111   or 
        --  GetEntityModel(Entity)  == 2075346744   or 
        --  GetEntityModel(Entity)  == 1605097644   or 
        --  GetEntityModel(Entity)  == 977294842    or 
        --  GetEntityModel(Entity)  == 1380551480   or 
        --  GetEntityModel(Entity)  == 2070834250   or 
        --  GetEntityModel(Entity)  == 1563936387   or 
        --  GetEntityModel(Entity)  == 1978097596   or 
        --  GetEntityModel(Entity)  == 567386505    or 
        --  GetEntityModel(Entity)  == 376901224    or 
        --  GetEntityModel(Entity)  == 55870793     or 
        --  GetEntityModel(Entity)  == 648056198    or 
        --  GetEntityModel(Entity)  == 1600467771   or 
        --  GetEntityModel(Entity)  == 1903714332   or 
        --  GetEntityModel(Entity)  == 1827343468   or 
        --  GetEntityModel(Entity)  == 680549965    or 
        --  GetEntityModel(Entity)  == 2114297789   or 
        --  GetEntityModel(Entity)  == 721117987    or 
        --  GetEntityModel(Entity)  == 1286228176   or 
        --  GetEntityModel(Entity)  == 1958725070   or 
        --  GetEntityModel(Entity)  == 1768206104   or 
        --  GetEntityModel(Entity)  == 381625293    or 
        --  GetEntityModel(Entity)  == 1279773008   or 
        --  GetEntityModel(Entity)  == 73584559     or 
        EntityType == 2 then
          -- if GetEntityPopulationType(Entity) ~= 7 then
          --   return
          -- end
        Crosshair(true)
        local cd = GetEntityCoords(Entity,false)
        local mycd = GetEntityCoords(GetPlayerPed(-1),false)
        local dist = GetDistanceBetweenCoords(mycd.x,mycd.y,mycd.z,cd.x,cd.y,cd.z,1)
        if dist < 3 and once == false then
          SetTextComponentFormat("STRING")
          AddTextComponentString("~INPUT_DETONATE~ взаимодействовать")
          DisplayHelpTextFromStringLabel(0, 0, 1, -1)
          once = true
        end 
      end
    else  
      Crosshair(false)
      once = false
    end
    RegisterCommand('intaractions', function()
     
      if(EntityType == 2) then 
        local cd = GetEntityCoords(Entity,false)
        local mycd = GetEntityCoords(GetPlayerPed(-1),false)
        local dist = GetDistanceBetweenCoords(mycd.x,mycd.y,mycd.z,cd.x,cd.y,cd.z,1)
        -- NetworkRequestControlOfEntity(Entity)
        -- print(GetPedInVehicleSeat(Entity,1))
        -- if GetPedInVehicleSeat(Entity,1) == 1 then
        --   return
        -- end
        if  dist < 3 then -- E is pressed
          SetNuiFocus(true, true)
          SendNUIMessage({menu = 'vehicle',idEntity = Entity})
        end    
      elseif(EntityType == 1) then 
        if  GetEntityModel(Entity)  == 1885233650 or GetEntityModel(Entity)  == -1667301416 then
            local cd = GetEntityCoords(Entity,false)
            local mycd = GetEntityCoords(GetPlayerPed(-1),false)
            local dist = GetDistanceBetweenCoords(mycd.x,mycd.y,mycd.z,cd.x,cd.y,cd.z,1)
            if dist < 3 then -- E is pressed
              for _, player in ipairs(GetActivePlayers()) do
                local ped = GetPlayerPed(player)
                if ped ~= GetPlayerPed(-1) and ped == Entity then
                  SetNuiFocus(true, true)
                  SendNUIMessage({menu = 'user',idEntity = GetPlayerServerId(player)})
                end
              end

          end
        end
      elseif(EntityType == 3) then 
        if GetEntityModel(Entity)  == 1437508529 or GetEntityModel(Entity)  == -58485588 or GetEntityModel(Entity)  == -1426008804 or  GetEntityModel(Entity)  == -1096777189  or GetEntityModel(Entity)  ==  218085040 or GetEntityModel(Entity)  ==  -228596739  or GetEntityModel(Entity)  == 666561306 or GetEntityModel(Entity)  == 682791951 then
          if not cachedBins[Entity] then
            local cd = GetEntityCoords(Entity,false)
            local mycd = GetEntityCoords(GetPlayerPed(-1),false)
            local dist = GetDistanceBetweenCoords(mycd.x,mycd.y,mycd.z,cd.x,cd.y,cd.z,1)
            if  dist < 3 then -- E is pressed
                cachedBins[Entity] = true
                TaskStartScenarioInPlace(PlayerPedId(), "PROP_HUMAN_BUM_BIN", 0, true)
                Citizen.Wait(10000)
                ClearPedTasks(PlayerPedId())
                local random = math.random(1,5)
                if random < 5 then
                  ESX.ShowNotification("~g~Успешно")
                  local item = randomitem[math.random(1,5)]
                  TriggerServerEvent("menu:govnoadd",item)
                elseif random == 5 then
                  local ammount = math.random(5,50) 
                  TriggerServerEvent("menu:govnoadd2",ammount)
                else
                  ESX.ShowNotification("~r~Ничего не найдено")   
                end    
            end  
          end  
        end
        if GetEntityModel(Entity)  == -1065766299  then
          entitymenu(-1065766299,Entity,"fire")
        end
        if GetEntityModel(Entity)  == 1777271576  then
          entitymenu(1777271576,Entity,"tent")
        end
        if GetEntityModel(Entity)  == 1245865676  then
          entitymenu(1245865676,Entity,"cone")
        end
        if GetEntityModel(Entity)  == -874338148  then
          entitymenu(-874338148 ,Entity,"thorns")
        end    
        if GetEntityModel(Entity)  == 765541575  then
          entitymenu(765541575 ,Entity,"fencing")
        end    
        if GetEntityModel(Entity)  == 	-1674314660  then
          entitymenu(-1674314660 ,Entity,"toolbox")
        end    
       if  GetEntityModel(Entity)  == 1352295901   or 
          GetEntityModel(Entity)  == 1506471111   or 
          GetEntityModel(Entity)  == 2075346744   or 
          GetEntityModel(Entity)  == 1605097644   or 
          GetEntityModel(Entity)  == 977294842    or 
          GetEntityModel(Entity)  == 1380551480   or 
          GetEntityModel(Entity)  == 2070834250   or 
          GetEntityModel(Entity)  == 1563936387   or 
          GetEntityModel(Entity)  == 1978097596   or 
          GetEntityModel(Entity)  == 567386505    or 
          GetEntityModel(Entity)  == 376901224    or 
          GetEntityModel(Entity)  == 55870793     or 
          GetEntityModel(Entity)  == 648056198    or 
          GetEntityModel(Entity)  == 1600467771   or 
          GetEntityModel(Entity)  == 1903714332   or 
          GetEntityModel(Entity)  == 1827343468   or 
          GetEntityModel(Entity)  == 680549965    or 
          GetEntityModel(Entity)  == 2114297789   or 
          GetEntityModel(Entity)  == 721117987    or 
          GetEntityModel(Entity)  == 1286228176   or 
          GetEntityModel(Entity)  == 1958725070   or 
          GetEntityModel(Entity)  == 1768206104   or 
          GetEntityModel(Entity)  == 381625293    or 
          GetEntityModel(Entity)  == 1279773008   or 
          GetEntityModel(Entity)  == 73584559
      then
        local wep = GetCurrentPedWeapon(GetPlayerPed(-1),true)
        print(wep)
      end

      else
      
      end
    end, false)
    Citizen.Wait(1000)
	end
end)



function entitymenu(entity,obj,name)
  if GetEntityPopulationType(obj) ~= 7 then
    return
  end
    local elements = {}
    table.insert(elements, {label = "Подобрать",value = 'bacspace',entity = name})

	ESX.UI.Menu.CloseAll()
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'sklad', {
		title    = "",
		align    = 'top-left',
		elements = elements
	}, function(data, menu)
		if data.current.value == 'bacspace' then
      ESX.UI.Menu.CloseAll()
      ESX.TriggerServerCallback("debug:additemray", function(item)
        if item == true then
          NetworkRequestControlOfEntity(obj)
          Citizen.Wait(1000)
          DeleteEntity(obj)
          -- TriggerServerEvent("debug:additemray",data.current.entity)
        end
      end, data.current.entity)
		end
		
	end, function(data, menu)
		ESX.UI.Menu.CloseAll()
	end)
    local cv = true
    local cd = GetEntityCoords(obj,false)
    while cv == true do
      Citizen.Wait(4000)
      local mycd = GetEntityCoords(GetPlayerPed(-1),false)
      local dist = GetDistanceBetweenCoords(mycd.x,mycd.y,mycd.z,cd.x,cd.y,cd.z,1)
      if  dist > 3 then
        cv = false
        ESX.UI.Menu.CloseAll()
      end
    end

end













 engine = false
 ld = false
 rd = false
 lbd = false
 rbd = false
 capot = false
 trunk = false
 alld = false



 


RegisterNUICallback('opend', function(data)
  if GetVehicleDoorLockStatus(data.id) == 1 then
          if data.type == "engine" then
            if engine == false then
              engine = true
              doorscar("menuperso_vehicule_MoteurOn",data.id)
            else
              doorscar("menuperso_vehicule_MoteurOff",data.id)
              engine = false
            end
        elseif  data.type == "ld" then  
          if ld == false then
            ld = true
            doorscar("menuperso_vehicule_ouvrirportes_ouvrirportegauche",data.id)
          else
            ld = false
            doorscar("menuperso_vehicule_fermerportes_fermerportegauche2",data.id)
          end

        elseif  data.type == "rd" then  
          if rd == false then
            rd = true
          doorscar("menuperso_vehicule_ouvrirportes_ouvrirportedroite",data.id)
        else
          rd = false
          doorscar("menuperso_vehicule_fermerportes_fermerportedroite",data.id)
        end
        elseif  data.type == "lbd" then  
          if lbd == false then
            lbd = true
          doorscar("menuperso_vehicule_ouvrirportes_ouvrirportearrieregauche",data.id)
        else
          lbd = false
          doorscar("menuperso_vehicule_fermerportes_fermerportearrieregauche",data.id)
        end
        elseif  data.type == "rbd" then  
          if rbd == false then
            rbd = true
          doorscar("menuperso_vehicule_ouvrirportes_ouvrirportearrieredroite",data.id)
        else
          rbd = false
          doorscar("menuperso_vehicule_fermerportes_fermerportearrieredroite",data.id)
        end
        elseif  data.type == "capot" then  
          if capot == false then
            capot = true
          doorscar("menuperso_vehicule_ouvrirportes_ouvrircapot",data.id)
        else
          capot = false
          doorscar("menuperso_vehicule_fermerportes_fermercapot",data.id)
        end
        elseif  data.type == "trunk" then      
          if trunk == false then
            trunk = true
          doorscar("menuperso_vehicule_ouvrirportes_ouvrircoffre",data.id)
        else
          trunk = false
          doorscar("menuperso_vehicule_fermerportes_fermercoffre",data.id)
        end
        elseif  data.type == "alld" then     
          if alld == false then
            alld = true
          doorscar("menuperso_vehicule_ouvrirportes_ouvrirTout",data.id)
        else
          alld = false
          doorscar("menuperso_vehicule_fermerportes_fermerTout",data.id)
        end
          
          
        end
  else
    --notify
  end


end)









function doorscar(value,veh)
  NetworkRequestControlOfEntity(veh)
        if value == "menuperso_vehicule_MoteurOn" then
            SetVehicleEngineOn(veh, true, true, true)
            SetVehicleUndriveable(veh, false)

            --Noti
        end

        if value == "menuperso_vehicule_MoteurOff" then
            SetVehicleEngineOn(veh, false, true, true)
            SetVehicleUndriveable(veh, true)

            --Noti
        end
        --------------------- OUVRIR LES PORTES
        if value == "menuperso_vehicule_ouvrirportes_ouvrirportegauche" then

            SetVehicleDoorOpen(veh, 0, false, false)
            --Noti
        end

        if value == "menuperso_vehicule_ouvrirportes_ouvrirportedroite" then

            SetVehicleDoorOpen(veh, 1, false, false)
            --Noti
        end

        if value == "menuperso_vehicule_ouvrirportes_ouvrirportearrieregauche" then

            SetVehicleDoorOpen(veh, 2, false, false)
            --Noti
        end

        if value == "menuperso_vehicule_ouvrirportes_ouvrirportearrieredroite" then

            SetVehicleDoorOpen(veh, 3, false, false)
            --Noti
        end

        if value == "menuperso_vehicule_ouvrirportes_ouvrircapot" then

            SetVehicleDoorOpen(veh, 4, false, false)
            --Noti
        end

        if value == "menuperso_vehicule_ouvrirportes_ouvrircoffre" then

            SetVehicleDoorOpen(veh, 5, false, false)
            --Noti
        end

        if value == "menuperso_vehicule_ouvrirportes_ouvrirAutre1" then

            SetVehicleDoorOpen(veh, 6, false, false)
            --Noti
        end

        if value == "menuperso_vehicule_ouvrirportes_ouvrirAutre2" then

            SetVehicleDoorOpen(veh, 7, false, false)
            --Noti
        end

        if value == "menuperso_vehicule_ouvrirportes_ouvrirTout" then

            SetVehicleDoorOpen(veh, 0, false, false)
            SetVehicleDoorOpen(veh, 1, false, false)
            SetVehicleDoorOpen(veh, 2, false, false)
            SetVehicleDoorOpen(veh, 3, false, false)
            SetVehicleDoorOpen(veh, 4, false, false)
            SetVehicleDoorOpen(veh, 5, false, false)
            SetVehicleDoorOpen(veh, 6, false, false)
            SetVehicleDoorOpen(veh, 7, false, false)
            engine = true
            ld = true
            rd = true
            lbd = true
            rbd = true
            capot = true
            trunk = true
            alld = true
            --Noti
        end
        --------------------- FERMER LES PORTES
        if value == "menuperso_vehicule_fermerportes_fermerportegauche2" then

            SetVehicleDoorShut(veh, 0, false, false)
            --Noti
        end

        if value == "menuperso_vehicule_fermerportes_fermerportedroite" then

            SetVehicleDoorShut(veh, 1, false, false)
            --Noti
        end

        if value == "menuperso_vehicule_fermerportes_fermerportearrieregauche" then

            SetVehicleDoorShut(veh, 2, false, false)
            --Noti
        end

        if value == "menuperso_vehicule_fermerportes_fermerportearrieredroite" then

            SetVehicleDoorShut(veh, 3, false, false)
            --Noti
        end

        if value == "menuperso_vehicule_fermerportes_fermercapot" then

            SetVehicleDoorShut(veh, 4, false, false)
            --Noti
        end

        if value == "menuperso_vehicule_fermerportes_fermercoffre" then

            SetVehicleDoorShut(veh, 5, false, false)
            --Noti
        end

        if value == "menuperso_vehicule_fermerportes_fermerAutre1" then

            SetVehicleDoorShut(veh, 6, false, false)
            --Noti
        end

        if value == "menuperso_vehicule_fermerportes_fermerAutre2" then

            SetVehicleDoorShut(veh, 7, false, false)
            --Noti
        end

        if value == "menuperso_vehicule_fermerportes_fermerTout" then
            SetVehicleDoorShut(veh, 0, false, false)
            SetVehicleDoorShut(veh, 1, false, false)
            SetVehicleDoorShut(veh, 2, false, false)
            SetVehicleDoorShut(veh, 3, false, false)
            SetVehicleDoorShut(veh, 4, false, false)
            SetVehicleDoorShut(veh, 5, false, false)
            SetVehicleDoorShut(veh, 6, false, false)
            SetVehicleDoorShut(veh, 7, false, false)
            engine = false
            ld = false
            rd = false
            lbd = false
            rbd = false
            capot = false
            trunk = false
            alld = false
            --Noti
        end
end








-- Toggle car trunk (Example of Vehcile's menu)
RegisterNUICallback('givemoney', function(data)
  SetNuiFocus(false, false)
  ESX.UI.Menu.Open(
				'dialog', GetCurrentResourceName(), 'jail_menu',
				{
					css = 'accesoires',
					title = 'Деморган',
				},
			function (data2, menu)
				print(data.id,data2.value)
        if tonumber(data2.value) <= 10000 then
          TriggerServerEvent("menu:givemoney",tonumber(data.id),tonumber(data2.value))
        else
          --notify
        end
					ESX.UI.Menu.CloseAll()
				end,
			function (data2, menu)
			ESX.UI.Menu.CloseAll()
			end )
end)

RegisterNUICallback('arms', function(data)
  SetNuiFocus(false, false)
  TriggerServerEvent("menu:debuganim", data.id, "give", "give2","~y~Пожать руки")
end)


RegisterNUICallback('mash', function(data)
  SetNuiFocus(false, false)
  TriggerServerEvent("menu:debuganim", data.id, "hug", "hug2","~y~Обняться")
end)

RegisterNUICallback('tanec1', function(data)
  SetNuiFocus(false, false)
  TriggerServerEvent("menu:debuganim", data.id, "dancef", "dancef","~y~Танец 1")
end)

RegisterNUICallback('tanec2', function(data)
  SetNuiFocus(false, false)
  TriggerServerEvent("menu:debuganim", data.id, "dancef2", "dancef2","~y~Танец 2")
end)
RegisterNUICallback('tanec3', function(data)
  SetNuiFocus(false, false)
  TriggerServerEvent("menu:debuganim", data.id, "dancef3", "dancef3","~y~Танец 3")
end)
RegisterNUICallback('tanec4', function(data)
  SetNuiFocus(false, false)
  TriggerServerEvent("menu:debuganim", data.id, "dancef4", "dancef4","~y~Танец 4")
end)
local scenario = {}

RegisterNetEvent('menu:debuganim')
AddEventHandler('menu:debuganim', function (id,name,name2,text)
  ESX.ShowNotification("~g~Зажать [H] принять запрос "..text)
  ESX.ShowNotification("~r~Зажать [Y] отменить запроc "..text)
  Citizen.CreateThread(function()
    scenario = true 
    while scenario ~= nil do
      Citizen.Wait(500)
      if IsControlPressed(1, 304) then -- 
        TriggerServerEvent("ServerValidEmote", id, name,name2)
        scenario = nil
        ESX.ShowNotification("~g~Х отменить действие")   
        break

      elseif IsControlPressed(1, 246) then
        scenario = nil
        break
      end
    end
  end)
  Citizen.Wait(10000)
  scenario = nil
  print(111)
end)




RegisterNUICallback('revive', function(data)
  SetNuiFocus(false, false)
  
  ESX.TriggerServerCallback('esx_ambulancejob:getMedicsCount', function(has)
    if has then
      TriggerServerEvent("menu:ammonia",data.id)
    end
  end)

end)
