local policeCop = false
ESX = nil
local PlayerData = {}

Citizen.CreateThread(function()
    while ESX == nil do TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end) Wait(0) end
    while ESX.GetPlayerData().job == nil do Wait(0) end
    PlayerData = ESX.GetPlayerData()
    if Config.Command then
        RegisterCommand(Config.Command, function()
            TriggerEvent('esx_policecop:openMenu')
        end)
    end
    while true do
        local sleep = 250
        if DoesEntityExist(policecop) then
            sleep = 0
            if GetDistanceBetweenCoords(GetEntityCoords(policecop), GetEntityCoords(PlayerPedId()), true) >= Config.TpDistance and not IsEntityPlayingAnim(policecop, Config.Sit.dict, Config.Sit.anim, 3) then
                SetEntityCoords(policecop, GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, -1.0, -0.98))
            end
            if GetDistanceBetweenCoords(GetEntityCoords(policecop), GetEntityCoords(PlayerPedId()), true) >= 3.0 and not IsEntityPlayingAnim(policecop, Config.Sit.dict, Config.Sit.anim, 3) and IsPedStill(policecop) then
                TaskGoToCoordAnyMeans(policecop, GetEntityCoords(PlayerPedId()), 5.0, 0, 0, 786603, 0xbf800000)
                sleep = 500
            end
        end
        Wait(sleep)
    end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    PlayerData = xPlayer   
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    PlayerData.job = job
end)

RegisterNetEvent('esx_policecop:openMenu')
AddEventHandler('esx_policecop:openMenu', function()
    mainMenu()
end)

RegisterNetEvent('esx_policecop:hasDrugs')
AddEventHandler('esx_policecop:hasDrugs', function(hadIt)
    if hadIt then
        ESX.ShowNotification(Strings['drugs_found'])
        loadDict('missfra0_chop_find')
        TaskPlayAnim(policecop, 'missfra0_chop_find', 'chop_bark_at_ballas', 8.0, -8, -1, 0, 0, false, false, false)
    else
        ESX.ShowNotification(Strings['no_drugs'])
    end
end)

mainMenu = function()
    if PlayerData.job.name == Config.Job[1] or PlayerData.job.name == Config.Job[2] then
        ESX.UI.Menu.CloseAll()
        ESX.UI.Menu.Open(
                'default', GetCurrentResourceName(), 'buy_storage',
            {
                title = Strings['menu_title'],
				css      = 'police',				
                align = 'top-left',
                elements = {{label = Strings['take_out_remove'], value = 'take_out_remove'}, {label = Strings['take_out_remove1'], value = 'take_out_remove1'}, {label = Strings['search_drugs'], value = 'search_drugs'}, {label = Strings['attack_closest'], value = 'attack_closest'}}
            },
            function(data, menu)
                if data.current.value == 'take_out_remove' then
                    if not DoesEntityExist(policecop) then
                        RequestModel(Config.Model)
                        while not HasModelLoaded(Config.Model) do Wait(0) end
                        policecop = CreatePed(4, Config.Model, GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 1.0, -0.98), 0.0, true, false)
                        SetEntityAsMissionEntity(policecop, true, true)
                        ESX.ShowNotification(Strings['spawned_cop'])
                    else
                        ESX.ShowNotification(Strings['deleted_cop'])
                        DeleteEntity(policecop)
                    end
                elseif data.current.value == 'take_out_remove1' then
                    if not DoesEntityExist(policecop) then
                        RequestModel(Config.Model2)
                        while not HasModelLoaded(Config.Model2) do Wait(0) end
                        policecop = CreatePed(4, Config.Model2, GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 1.0, -0.98), 0.0, true, false)
                        SetEntityAsMissionEntity(policecop, true, true)
                        ESX.ShowNotification(Strings['spawned_cop'])
                    else
                        ESX.ShowNotification(Strings['deleted_cop'])
                        DeleteEntity(policecop)
                    end					
                elseif data.current.value == 'attack_closest' then
                    if DoesEntityExist(policecop) then
                        if not IsPedDeadOrDying(policecop) then
                            if GetDistanceBetweenCoords(GetEntityCoords(policecop), GetEntityCoords(PlayerPedId()), true) <= 3.0 then
                                local player, distance = ESX.Game.GetClosestPlayer()
                                if distance ~= -1 then
                                    if distance <= 3.0 then
                                        local playerPed = GetPlayerPed(player)
                                        if not IsPedInCombat(policecop, playerPed) then
                                            if not IsPedInAnyVehicle(playerPed, true) then
                                                TaskCombatPed(policecop, playerPed, 0, 16)
                                            end
                                        else
                                            ClearPedTasksImmediately(policecop)
                                        end
                                    end
                                end
                            end
                        else
                            ESX.ShowNotification(Strings['cop_dead'])
                        end
                    else
                        ESX.ShowNotification(Strings['no_cop'])
                    end
                elseif data.current.value == 'sit_stand' then
                    if DoesEntityExist(policecop) then
                        if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), GetEntityCoords(policecop), true) <= 5.0 then
                            if IsEntityPlayingAnim(policecop, Config.Sit.dict, Config.Sit.anim, 3) then
                                ClearPedTasks(policecop)
                            else
                                loadDict('rcmnigel1c')
                                TaskPlayAnim(PlayerPedId(), 'rcmnigel1c', 'hailing_whistle_waive_a', 8.0, -8, -1, 120, 0, false, false, false)
                                Wait(2000)
                                loadDict(Config.Sit.dict)
                                TaskPlayAnim(policecop, Config.Sit.dict, Config.Sit.anim, 8.0, -8, -1, 1, 0, false, false, false)
                            end
                        else
                            ESX.ShowNotification(Strings['cop_too_far'])
                        end
                    else
                        ESX.ShowNotification(Strings['no_cop'])
                    end
                elseif data.current.value == 'search_drugs' then
                    if DoesEntityExist(policecop) then
                        if not IsPedDeadOrDying(policecop) then
                            if GetDistanceBetweenCoords(GetEntityCoords(policecop), GetEntityCoords(PlayerPedId()), true) <= 3.0 then
                                local player, distance = ESX.Game.GetClosestPlayer()
                                if distance ~= -1 then
                                    if distance <= 3.0 then
                                        local playerPed = GetPlayerPed(player)
                                        if not IsPedInAnyVehicle(playerPed, true) then
                                            TriggerServerEvent('esx_policecop:hasClosestDrugs', GetPlayerServerId(player))
                                        end
                                    end
                                end
                            end
                        else
                            ESX.ShowNotification(Strings['cop_dead'])
                        end
                    else
                        ESX.ShowNotification(Strings['no_cop'])
                    end
                end
            end,
        function(data, menu)
            menu.close()
        end)
    else
        ESX.ShowNotification(Strings['not_police'])
    end
end

loadDict = function(dict)
    while not HasAnimDictLoaded(dict) do Wait(0) RequestAnimDict(dict) end
end