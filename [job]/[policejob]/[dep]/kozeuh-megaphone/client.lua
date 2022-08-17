print("^2[Author - ^1koz-megaphone ] : ^3KoZeuh")
print("^2[Download] :^3 https://github.com/KoZeuh/") 
ESX = nil

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
    ESX.PlayerData = xPlayer
end)
 
RegisterNetEvent('esx:setJob') 
AddEventHandler('esx:setJob', function(job)  
  ESX.PlayerData.job = job 
end)


function KozVehicule(using)
  local veh = Config.Vehicules

  for i=1, #veh, 1 do
    if IsVehicleModel(using, GetHashKey(veh[i])) then
      return true
    end
  end
end 

RMenu.Add('megaphone', 'principal', RageUI.CreateMenu("LSPD", "~b~LSPD Vehicle Megaphone", nil, nil, "commonmenu", "gradient_bgd")) 

-- Liste des bannières : https://github.com/DurtyFree/alt-V-NativeUI/wiki/Sprites

Citizen.CreateThread(function()
    while true do
      Citizen.Wait(0)
        RageUI.IsVisible(RMenu:Get('megaphone', 'principal'), true, true, true, function()
            RageUI.Button("Stop!", "~b~The sound is widespread ~g~ at a distance of 200m", {RightLabel = "🔊"}, true, function(Hovered, Active, Selected)
                if (Selected) then
                  TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 200.0, "stop_vehicle-2", 0.6) -- 200 = distance / 0.6 = volume
                end
            end)
            RageUI.Button("Driver, STOP!", "~b~The sound is widespread ~g~ at a distance of 200m", {RightLabel = "🔊"}, true, function(Hovered, Active, Selected)
                    if (Selected) then
                      TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 200.0, "stop_the_f_car", 0.6)
                    end
                end)
            RageUI.Button("Don't move!", "~b~The sound is widespread ~g~ at a distance of 200m", {RightLabel = "🔊"}, true, function(Hovered, Active, Selected)
                    if (Selected) then
                      TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 200.0, "stop_dont_move", 0.6)
                    end
                end)
            RageUI.Button("Go away!", "~b~The sound is widespread ~g~ at a distance of 200m", {RightLabel = "🔊"}, true, function(Hovered, Active, Selected)
                    if (Selected) then
                      TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 200.0, "this_is_the_lspd", 0.6)
                    end
                end)
            RageUI.Button("Get out of here!", "~b~The sound is widespread ~g~ at a distance of 200m", {RightLabel = "🔊"}, true, function(Hovered, Active, Selected)
                    if (Selected) then
                      TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 200.0, "get_out_of_here_now", 0.6)
                    end
                end)
            RageUI.Button("Circulate!", "~b~The sound is widespread ~g~ at a distance of 200m", {RightLabel = "🔊"}, true, function(Hovered, Active, Selected)
                    if (Selected) then
                      TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 200.0, "disperse_now", 0.6)
                    end
                end)
            RageUI.Button("I will shoot..", "~b~The sound is widespread ~g~ at a distance of 200m", {RightLabel = "🔊"}, true, function(Hovered, Active, Selected)
                    if (Selected) then
                      TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 200.0, "shoot_to_kill", 0.6)
                    end
                end)
            RageUI.Button("You are finished!", "~b~The sound is widespread ~g~ at a distance of 200m", {RightLabel = "🔊"}, true, function(Hovered, Active, Selected)
                    if (Selected) then
                      TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 200.0, "you_are_finished_dhead", 0.6)
                    end
                end)
        end, function()
        end, 1)
        end
    end)

RegisterNetEvent('Koz:openmegaphone')
AddEventHandler('Koz:openmegaphone', function()
  RageUI.Visible(RMenu:Get('megaphone', 'principal'), not RageUI.Visible(RMenu:Get('megaphone', 'principal'))) 
end)
