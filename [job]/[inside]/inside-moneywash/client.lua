ESX = nil

local PlayerData = {}
local BlackMoneyAmount = 0

Type = nil
usedLaundryCard = false
startedWashing = false
WashingTime = nil
hasWashed = false
BLaundry1 = false
ULaundry1 = false
BLaundry2 = false
ULaundry2 = false
BLaundry3 = false
ULaundry3 = false
BLaundry4 = false
ULaundry4 = false
timer = icfg.Timer
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(5)
	end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    TriggerServerEvent('inside-moneywash:getBusyLaundry')
    ESX.TriggerServerCallback('inside-moneywash:lastDrivers', function(Drivers)
        actDrivers = Drivers
        print(actDrivers)
    end)
    PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	PlayerData.job = job
end)

Citizen.CreateThread(function()
    while true do

        local sleep = 1000

        Citizen.Wait(sleep)
        if WashingTime ~= nil then
            if WashingTime > 0 then
                WashingTime = WashingTime - 1
            elseif WashingTime == 0 then
                hasWashed = true
                WashingTime = nil
                exports.pNotify:SendNotification({text = "<b>SMS</b></br>Ваша прачечная готова!", timeout = 5000})
            end
        end
        if hasWashed then
            if timer > 0 then
                timer = timer - 1
                if timer == 0 then
                    exports.pNotify:SendNotification({text = "<b>SMS</b></br>Вы не вынули белье из стиральной машины, вы теряете карточку на стирку и деньги за стирку!", timeout = 5000})
                    startedWashing = false
                    usedLaundryCard = false
                    hasWashed = false
                    timer = icfg.Timer
                    if ULaundry1 then
                        TriggerServerEvent('inside-moneywash:unlockLaundry1')
                        ULaundry1 = false
                    elseif ULaundry2 then
                        TriggerServerEvent('inside-moneywash:unlockLaundry2')
                        ULaundry2 = false
                    elseif ULaundry3 then
                        TriggerServerEvent('inside-moneywash:unlockLaundry3')
                        ULaundry3 = false
                    elseif ULaundry4 then
                        TriggerServerEvent('inside-moneywash:unlockLaundry4')
                        ULaundry4 = false
                    end
                end
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do

        local sleep = 500
        local ped = PlayerPedId()
        local coords = GetEntityCoords(ped)


            if hasWashed then
                sleep = 5
                DrawText2Ds(0.5, 0.95, "У тебя '~b~ ..timer..' '~s~ секунды, чтобы вынуть белье из стиральной машины', 0.35)
            end
            if not ULaundry2 and not ULaundry3 and not ULaundry4 then
                if not BLaundry1 then
                    if (#(coords - vector3(icfg.LaundryPlaces.Laundry1.Pos.x, icfg.LaundryPlaces.Laundry1.Pos.y, icfg.LaundryPlaces.Laundry1.Pos.z)) < 0.6) then
                        sleep = 5
                        DrawText3Ds(icfg.LaundryPlaces.Laundry1.Pos.x, icfg.LaundryPlaces.Laundry1.Pos.y, icfg.LaundryPlaces.Laundry1.Pos.z + 0.5, "Нажмите [~g~E~s~] взаимодействовать со стиралкой")
                        DrawMarker(25, icfg.LaundryPlaces.Laundry1.Pos.x, icfg.LaundryPlaces.Laundry1.Pos.y, icfg.LaundryPlaces.Laundry1.Pos.z - 0.95, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.8, 0.8, 0.8, 30, 224, 20, 100, false, true, 2, false, false, false, false)
                        if IsControlJustReleased(0, Keys["E"]) then
                            Type = 'Laundry1'
                            OpenLaundryMenu()
                        end
                    elseif (#(coords - vector3(icfg.LaundryPlaces.Laundry1.Pos.x, icfg.LaundryPlaces.Laundry1.Pos.y, icfg.LaundryPlaces.Laundry1.Pos.z)) < 8.0) then
                        sleep = 5
                        DrawMarker(25, icfg.LaundryPlaces.Laundry1.Pos.x, icfg.LaundryPlaces.Laundry1.Pos.y, icfg.LaundryPlaces.Laundry1.Pos.z - 0.95, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.8, 0.8, 0.8, 30, 224, 20, 100, false, true, 2, false, false, false, false)
                        DrawMarker(29, icfg.LaundryPlaces.Laundry1.Pos.x, icfg.LaundryPlaces.Laundry1.Pos.y, icfg.LaundryPlaces.Laundry1.Pos.z + 0.2, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.8, 0.8, 0.8, 30, 224, 20, 75, false, true, 2, false, false, false, false)
                    end
                elseif BLaundry1 then
                    if (#(coords - vector3(icfg.LaundryPlaces.Laundry1.Pos.x, icfg.LaundryPlaces.Laundry1.Pos.y, icfg.LaundryPlaces.Laundry1.Pos.z)) < 0.6) then
                        sleep = 5
                        DrawMarker(25, icfg.LaundryPlaces.Laundry1.Pos.x, icfg.LaundryPlaces.Laundry1.Pos.y, icfg.LaundryPlaces.Laundry1.Pos.z - 0.95, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.8, 0.8, 0.8, 150, 10, 0, 100, false, true, 2, false, false, false, false)
                        if ULaundry1 then
                            if not startedWashing then
                                DrawText3Ds(icfg.LaundryPlaces.Laundry1.Pos.x, icfg.LaundryPlaces.Laundry1.Pos.y, icfg.LaundryPlaces.Laundry1.Pos.z + 0.5, "Нажмите [~g~E~s~] взаимодействовать со стиралкой")
                                if IsControlJustReleased(0, Keys["E"]) then
                                    Type = 'Laundry1'
                                    OpenLaundryMenu()
                                end
                            elseif startedWashing then
                                if hasWashed then
                                    DrawText3Ds(icfg.LaundryPlaces.Laundry1.Pos.x, icfg.LaundryPlaces.Laundry1.Pos.y, icfg.LaundryPlaces.Laundry1.Pos.z + 0.5, "Нажмите [~g~E~s~] взаимодействовать со стиралкой")
                                    DrawText3Ds(icfg.LaundryPlaces.Laundry1.Pos.x, icfg.LaundryPlaces.Laundry1.Pos.y, icfg.LaundryPlaces.Laundry1.Pos.z + 0.35, "~g~Деньги~s~ готов к вытаскиванию")
                                    if IsControlJustReleased(0, Keys["E"]) then
                                        Type = 'Laundry1'
                                        OpenLaundryMenu()
                                    end
                                elseif WashingTime > 0 then
                                    DrawText3Ds(icfg.LaundryPlaces.Laundry1.Pos.x, icfg.LaundryPlaces.Laundry1.Pos.y, icfg.LaundryPlaces.Laundry1.Pos.z + 0.5, "Отмывание черных денег: ~r~" ..BlackMoneyAmount.. "$~s~")
                                    DrawText3Ds(icfg.LaundryPlaces.Laundry1.Pos.x, icfg.LaundryPlaces.Laundry1.Pos.y, icfg.LaundryPlaces.Laundry1.Pos.z + 0.35, "Оставшееся время: ~g~" ..WashingTime.. " sec~s~")
                                end
                            end
                        else
                            DrawText3Ds(icfg.LaundryPlaces.Laundry1.Pos.x, icfg.LaundryPlaces.Laundry1.Pos.y, icfg.LaundryPlaces.Laundry1.Pos.z + 0.5, "Чья-то стиральная карта уже подключена")
                        end
                    elseif (#(coords - vector3(icfg.LaundryPlaces.Laundry1.Pos.x, icfg.LaundryPlaces.Laundry1.Pos.y, icfg.LaundryPlaces.Laundry1.Pos.z)) < 8.0) then
                        sleep = 5
                        DrawMarker(25, icfg.LaundryPlaces.Laundry1.Pos.x, icfg.LaundryPlaces.Laundry1.Pos.y, icfg.LaundryPlaces.Laundry1.Pos.z - 0.95, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.8, 0.8, 0.8, 150, 10, 0, 100, false, true, 2, false, false, false, false)
                        DrawMarker(29, icfg.LaundryPlaces.Laundry1.Pos.x, icfg.LaundryPlaces.Laundry1.Pos.y, icfg.LaundryPlaces.Laundry1.Pos.z + 0.2, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.8, 0.8, 0.8, 150, 10, 0, 75, false, true, 2, false, false, false, false)
                    end
                end
            end

            if not ULaundry1 and not ULaundry3 and not ULaundry4 then
                if not BLaundry2 then
                    if (#(coords - vector3(icfg.LaundryPlaces.Laundry2.Pos.x, icfg.LaundryPlaces.Laundry2.Pos.y, icfg.LaundryPlaces.Laundry2.Pos.z)) < 0.6) then
                        sleep = 5
                        DrawText3Ds(icfg.LaundryPlaces.Laundry2.Pos.x, icfg.LaundryPlaces.Laundry2.Pos.y, icfg.LaundryPlaces.Laundry2.Pos.z + 0.5, "Нажмите [~g~E~s~] взаимодействовать со стиралкой")
                        DrawMarker(25, icfg.LaundryPlaces.Laundry2.Pos.x, icfg.LaundryPlaces.Laundry2.Pos.y, icfg.LaundryPlaces.Laundry2.Pos.z - 0.95, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.8, 0.8, 0.8, 30, 224, 20, 100, false, true, 2, false, false, false, false)
                        if IsControlJustReleased(0, Keys["E"]) then
                            Type = 'Laundry2'
                            OpenLaundryMenu()
                        end
                    elseif (#(coords - vector3(icfg.LaundryPlaces.Laundry2.Pos.x, icfg.LaundryPlaces.Laundry2.Pos.y, icfg.LaundryPlaces.Laundry2.Pos.z)) < 8.0) then
                        sleep = 5
                        DrawMarker(25, icfg.LaundryPlaces.Laundry2.Pos.x, icfg.LaundryPlaces.Laundry2.Pos.y, icfg.LaundryPlaces.Laundry2.Pos.z - 0.95, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.8, 0.8, 0.8, 30, 224, 20, 100, false, true, 2, false, false, false, false)
                        DrawMarker(29, icfg.LaundryPlaces.Laundry2.Pos.x, icfg.LaundryPlaces.Laundry2.Pos.y, icfg.LaundryPlaces.Laundry2.Pos.z + 0.2, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.8, 0.8, 0.8, 30, 224, 20, 75, false, true, 2, false, false, false, false)
                    end
                elseif BLaundry2 then
                    if (#(coords - vector3(icfg.LaundryPlaces.Laundry2.Pos.x, icfg.LaundryPlaces.Laundry2.Pos.y, icfg.LaundryPlaces.Laundry2.Pos.z)) < 0.6) then
                        sleep = 5
                        DrawMarker(25, icfg.LaundryPlaces.Laundry2.Pos.x, icfg.LaundryPlaces.Laundry2.Pos.y, icfg.LaundryPlaces.Laundry2.Pos.z - 0.95, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.8, 0.8, 0.8, 150, 10, 0, 100, false, true, 2, false, false, false, false)
                        if ULaundry2 then
                            if not startedWashing then
                                DrawText3Ds(icfg.LaundryPlaces.Laundry2.Pos.x, icfg.LaundryPlaces.Laundry2.Pos.y, icfg.LaundryPlaces.Laundry2.Pos.z + 0.5, "Нажмите [~g~E~s~] взаимодействовать со стиралкой")
                                if IsControlJustReleased(0, Keys["E"]) then
                                    Type = 'Laundry2'
                                    OpenLaundryMenu()
                                end
                            elseif startedWashing then
                                if hasWashed then
                                    DrawText3Ds(icfg.LaundryPlaces.Laundry2.Pos.x, icfg.LaundryPlaces.Laundry2.Pos.y, icfg.LaundryPlaces.Laundry2.Pos.z + 0.5, "Нажмите [~g~E~s~] взаимодействовать со стиралкой")
                                    DrawText3Ds(icfg.LaundryPlaces.Laundry2.Pos.x, icfg.LaundryPlaces.Laundry2.Pos.y, icfg.LaundryPlaces.Laundry2.Pos.z + 0.35, "~g~Деньги~s~ взаимодействовать со стиралкой")
                                    if IsControlJustReleased(0, Keys["E"]) then
                                        Type = 'Laundry2'
                                        OpenLaundryMenu()
                                    end
                                elseif WashingTime > 0 then
                                    DrawText3Ds(icfg.LaundryPlaces.Laundry2.Pos.x, icfg.LaundryPlaces.Laundry2.Pos.y, icfg.LaundryPlaces.Laundry2.Pos.z + 0.5, "Отмывание черных денег: ~r~" ..BlackMoneyAmount.. "$~s~")
                                    DrawText3Ds(icfg.LaundryPlaces.Laundry2.Pos.x, icfg.LaundryPlaces.Laundry2.Pos.y, icfg.LaundryPlaces.Laundry2.Pos.z + 0.35, "Оставшееся время: ~g~" ..WashingTime.. " sec~s~")
                                end
                            end
                        else
                            DrawText3Ds(icfg.LaundryPlaces.Laundry2.Pos.x, icfg.LaundryPlaces.Laundry2.Pos.y, icfg.LaundryPlaces.Laundry2.Pos.z + 0.5, "Чья-то стиральная карта уже подключена")
                        end
                    elseif (#(coords - vector3(icfg.LaundryPlaces.Laundry2.Pos.x, icfg.LaundryPlaces.Laundry2.Pos.y, icfg.LaundryPlaces.Laundry2.Pos.z)) < 8.0) then
                        sleep = 5
                        DrawMarker(25, icfg.LaundryPlaces.Laundry2.Pos.x, icfg.LaundryPlaces.Laundry2.Pos.y, icfg.LaundryPlaces.Laundry2.Pos.z - 0.95, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.8, 0.8, 0.8, 150, 10, 0, 100, false, true, 2, false, false, false, false)
                        DrawMarker(29, icfg.LaundryPlaces.Laundry2.Pos.x, icfg.LaundryPlaces.Laundry2.Pos.y, icfg.LaundryPlaces.Laundry2.Pos.z + 0.2, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.8, 0.8, 0.8, 150, 10, 0, 75, false, true, 2, false, false, false, false)
                    end
                end
            end

            if not ULaundry1 and not ULaundry2 and not ULaundry4 then
                if not BLaundry3 then
                    if (#(coords - vector3(icfg.LaundryPlaces.Laundry3.Pos.x, icfg.LaundryPlaces.Laundry3.Pos.y, icfg.LaundryPlaces.Laundry3.Pos.z)) < 0.6) then
                        sleep = 5
                        DrawText3Ds(icfg.LaundryPlaces.Laundry3.Pos.x, icfg.LaundryPlaces.Laundry3.Pos.y, icfg.LaundryPlaces.Laundry3.Pos.z + 0.5, "Нажмите [~g~E~s~] взаимодействовать со стиралкой")
                        DrawMarker(25, icfg.LaundryPlaces.Laundry3.Pos.x, icfg.LaundryPlaces.Laundry3.Pos.y, icfg.LaundryPlaces.Laundry3.Pos.z - 0.95, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.8, 0.8, 0.8, 30, 224, 20, 100, false, true, 2, false, false, false, false)
                        if IsControlJustReleased(0, Keys["E"]) then
                            Type = 'Laundry3'
                            OpenLaundryMenu()
                        end
                    elseif (#(coords - vector3(icfg.LaundryPlaces.Laundry3.Pos.x, icfg.LaundryPlaces.Laundry3.Pos.y, icfg.LaundryPlaces.Laundry3.Pos.z)) < 8.0) then
                        sleep = 5
                        DrawMarker(25, icfg.LaundryPlaces.Laundry3.Pos.x, icfg.LaundryPlaces.Laundry3.Pos.y, icfg.LaundryPlaces.Laundry3.Pos.z - 0.95, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.8, 0.8, 0.8, 30, 224, 20, 100, false, true, 2, false, false, false, false)
                        DrawMarker(29, icfg.LaundryPlaces.Laundry3.Pos.x, icfg.LaundryPlaces.Laundry3.Pos.y, icfg.LaundryPlaces.Laundry3.Pos.z + 0.2, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.8, 0.8, 0.8, 30, 224, 20, 75, false, true, 2, false, false, false, false)
                    end
                elseif BLaundry3 then
                    if (#(coords - vector3(icfg.LaundryPlaces.Laundry3.Pos.x, icfg.LaundryPlaces.Laundry3.Pos.y, icfg.LaundryPlaces.Laundry3.Pos.z)) < 0.6) then
                        sleep = 5
                        DrawMarker(25, icfg.LaundryPlaces.Laundry3.Pos.x, icfg.LaundryPlaces.Laundry3.Pos.y, icfg.LaundryPlaces.Laundry3.Pos.z - 0.95, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.8, 0.8, 0.8, 150, 10, 0, 100, false, true, 2, false, false, false, false)
                        if ULaundry3 then
                            if not startedWashing then
                                DrawText3Ds(icfg.LaundryPlaces.Laundry3.Pos.x, icfg.LaundryPlaces.Laundry3.Pos.y, icfg.LaundryPlaces.Laundry3.Pos.z + 0.5, "Нажмите [~g~E~s~] взаимодействовать со стиралко")
                                if IsControlJustReleased(0, Keys["E"]) then
                                    Type = 'Laundry3'
                                    OpenLaundryMenu()
                                end
                            elseif startedWashing then
                                if hasWashed then
                                    DrawText3Ds(icfg.LaundryPlaces.Laundry3.Pos.x, icfg.LaundryPlaces.Laundry3.Pos.y, icfg.LaundryPlaces.Laundry3.Pos.z + 0.5, "Нажмите [~g~E~s~] взаимодействовать со стиралко")
                                    DrawText3Ds(icfg.LaundryPlaces.Laundry3.Pos.x, icfg.LaundryPlaces.Laundry3.Pos.y, icfg.LaundryPlaces.Laundry3.Pos.z + 0.35, "~g~Деньги~s~ взаимодействовать со стиралко")
                                    if IsControlJustReleased(0, Keys["E"]) then
                                        Type = 'Laundry3'
                                        OpenLaundryMenu()
                                    end
                                elseif WashingTime > 0 then
                                    DrawText3Ds(icfg.LaundryPlaces.Laundry3.Pos.x, icfg.LaundryPlaces.Laundry3.Pos.y, icfg.LaundryPlaces.Laundry3.Pos.z + 0.5, "Отмывание черных денег: ~r~" ..BlackMoneyAmount.. "$~s~")
                                    DrawText3Ds(icfg.LaundryPlaces.Laundry3.Pos.x, icfg.LaundryPlaces.Laundry3.Pos.y, icfg.LaundryPlaces.Laundry3.Pos.z + 0.35, "Оставшееся время: ~g~" ..WashingTime.. " sec~s~")
                                end
                            end
                        else
                            DrawText3Ds(icfg.LaundryPlaces.Laundry3.Pos.x, icfg.LaundryPlaces.Laundry3.Pos.y, icfg.LaundryPlaces.Laundry3.Pos.z + 0.5, "Чья-то стиральная карта уже подключена")
                        end
                    elseif (#(coords - vector3(icfg.LaundryPlaces.Laundry3.Pos.x, icfg.LaundryPlaces.Laundry3.Pos.y, icfg.LaundryPlaces.Laundry3.Pos.z)) < 8.0) then
                        sleep = 5
                        DrawMarker(25, icfg.LaundryPlaces.Laundry3.Pos.x, icfg.LaundryPlaces.Laundry3.Pos.y, icfg.LaundryPlaces.Laundry3.Pos.z - 0.95, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.8, 0.8, 0.8, 150, 10, 0, 100, false, true, 2, false, false, false, false)
                        DrawMarker(29, icfg.LaundryPlaces.Laundry3.Pos.x, icfg.LaundryPlaces.Laundry3.Pos.y, icfg.LaundryPlaces.Laundry3.Pos.z + 0.2, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.8, 0.8, 0.8, 150, 10, 0, 75, false, true, 2, false, false, false, false)
                    end
                end
            end

            if not ULaundry1 and not ULaundry2 and not ULaundry3 then
                if not BLaundry4 then
                    if (#(coords - vector3(icfg.LaundryPlaces.Laundry4.Pos.x, icfg.LaundryPlaces.Laundry4.Pos.y, icfg.LaundryPlaces.Laundry4.Pos.z)) < 0.6) then
                        sleep = 5
                        DrawText3Ds(icfg.LaundryPlaces.Laundry4.Pos.x, icfg.LaundryPlaces.Laundry4.Pos.y, icfg.LaundryPlaces.Laundry4.Pos.z + 0.5, "Нажмите [~g~E~s~] взаимодействовать со стиралко")
                        DrawMarker(25, icfg.LaundryPlaces.Laundry4.Pos.x, icfg.LaundryPlaces.Laundry4.Pos.y, icfg.LaundryPlaces.Laundry4.Pos.z - 0.95, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.8, 0.8, 0.8, 30, 224, 20, 100, false, true, 2, false, false, false, false)
                        if IsControlJustReleased(0, Keys["E"]) then
                            Type = 'Laundry4'
                            OpenLaundryMenu()
                        end
                    elseif (#(coords - vector3(icfg.LaundryPlaces.Laundry4.Pos.x, icfg.LaundryPlaces.Laundry4.Pos.y, icfg.LaundryPlaces.Laundry4.Pos.z)) < 8.0) then
                        sleep = 5
                        DrawMarker(25, icfg.LaundryPlaces.Laundry4.Pos.x, icfg.LaundryPlaces.Laundry4.Pos.y, icfg.LaundryPlaces.Laundry4.Pos.z - 0.95, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.8, 0.8, 0.8, 30, 224, 20, 100, false, true, 2, false, false, false, false)
                        DrawMarker(29, icfg.LaundryPlaces.Laundry4.Pos.x, icfg.LaundryPlaces.Laundry4.Pos.y, icfg.LaundryPlaces.Laundry4.Pos.z + 0.2, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.8, 0.8, 0.8, 30, 224, 20, 75, false, true, 2, false, false, false, false)
                    end
                elseif BLaundry4 then
                    if (#(coords - vector3(icfg.LaundryPlaces.Laundry4.Pos.x, icfg.LaundryPlaces.Laundry4.Pos.y, icfg.LaundryPlaces.Laundry4.Pos.z)) < 0.6) then
                        sleep = 5
                        DrawMarker(25, icfg.LaundryPlaces.Laundry4.Pos.x, icfg.LaundryPlaces.Laundry4.Pos.y, icfg.LaundryPlaces.Laundry4.Pos.z - 0.95, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.8, 0.8, 0.8, 150, 10, 0, 100, false, true, 2, false, false, false, false)
                        if ULaundry4 then
                            if not startedWashing then
                                DrawText3Ds(icfg.LaundryPlaces.Laundry4.Pos.x, icfg.LaundryPlaces.Laundry4.Pos.y, icfg.LaundryPlaces.Laundry4.Pos.z + 0.5, "Нажмите [~g~E~s~] взаимодействовать со стиралко")
                                if IsControlJustReleased(0, Keys["E"]) then
                                    Type = 'Laundry4'
                                    OpenLaundryMenu()
                                end
                            elseif startedWashing then
                                if hasWashed then
                                    DrawText3Ds(icfg.LaundryPlaces.Laundry4.Pos.x, icfg.LaundryPlaces.Laundry4.Pos.y, icfg.LaundryPlaces.Laundry4.Pos.z + 0.5, "Нажмите [~g~E~s~] взаимодействовать со стиралко")
                                    DrawText3Ds(icfg.LaundryPlaces.Laundry4.Pos.x, icfg.LaundryPlaces.Laundry4.Pos.y, icfg.LaundryPlaces.Laundry4.Pos.z + 0.35, "~g~Деньги~s~ готов к вытаскиванию")
                                    if IsControlJustReleased(0, Keys["E"]) then
                                        Type = 'Laundry4'
                                        OpenLaundryMenu()
                                    end
                                elseif WashingTime > 0 then
                                    DrawText3Ds(icfg.LaundryPlaces.Laundry4.Pos.x, icfg.LaundryPlaces.Laundry4.Pos.y, icfg.LaundryPlaces.Laundry4.Pos.z + 0.5, "Отмывание черных денег: ~r~" ..BlackMoneyAmount.. "$~s~")
                                    DrawText3Ds(icfg.LaundryPlaces.Laundry4.Pos.x, icfg.LaundryPlaces.Laundry4.Pos.y, icfg.LaundryPlaces.Laundry4.Pos.z + 0.35, "Оставшееся время: ~g~" ..WashingTime.. " sec~s~")
                                end
                            end
                        else
                            DrawText3Ds(icfg.LaundryPlaces.Laundry4.Pos.x, icfg.LaundryPlaces.Laundry4.Pos.y, icfg.LaundryPlaces.Laundry4.Pos.z + 0.5, "Чья-то стиральная карта уже подключена")
                        end
                    elseif (#(coords - vector3(icfg.LaundryPlaces.Laundry4.Pos.x, icfg.LaundryPlaces.Laundry4.Pos.y, icfg.LaundryPlaces.Laundry4.Pos.z)) < 8.0) then
                        sleep = 5
                        DrawMarker(25, icfg.LaundryPlaces.Laundry4.Pos.x, icfg.LaundryPlaces.Laundry4.Pos.y, icfg.LaundryPlaces.Laundry4.Pos.z - 0.95, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.8, 0.8, 0.8, 150, 10, 0, 100, false, true, 2, false, false, false, false)
                        DrawMarker(29, icfg.LaundryPlaces.Laundry4.Pos.x, icfg.LaundryPlaces.Laundry4.Pos.y, icfg.LaundryPlaces.Laundry4.Pos.z + 0.2, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.8, 0.8, 0.8, 150, 10, 0, 75, false, true, 2, false, false, false, false)
                    end
                end
            end
        Citizen.Wait(sleep)
    end
end)

function OpenLaundryMenu()

    local elements = {}

    if not usedLaundryCard then
        table.insert(elements, {label = 'Put Laundry Card', value = 'PutCard'})
    elseif usedLaundryCard then
        if not hasWashed then
            table.insert(elements, {label = 'Wash Black Money', value = 'WashBlackMoney'})
            table.insert(elements, {label = 'Pull Out Laundry Card', value = 'PullOutCard'})
        elseif hasWashed then
            table.insert(elements, {label = 'Pull Out Money', value = 'PullOutMoney'})
        end
    end
    FreezeEntityPosition(PlayerPedId(), true)
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'laundrymenu', {
			title    = 'Washing Machine',
			align    = 'center',
            elements = elements,
            }, 
            function(data, menu)
            FreezeEntityPosition(PlayerPedId(), false)
            ESX.UI.Menu.CloseAll()
			if data.current.value == 'PutCard' then
                TaskStartScenarioInPlace(PlayerPedId(), "PROP_HUMAN_ATM", 0, true)
                exports.rprogress:Custom({
                    Duration = 2000,
                    Label = "You insert Laundry Card...",
                    DisableControls = {
                        Mouse = false,
                        Player = true,
                        Vehicle = true
                    }
                })
                Citizen.Wait(2000)
                ClearPedTasksImmediately(PlayerPedId())
                ESX.TriggerServerCallback('inside-moneywash:checkLaundryCard', function(hasCard)
                    if hasCard then
                        if Type == "Laundry1" then
                            TriggerServerEvent('inside-moneywash:blockLaundry1')
                            ULaundry1 = true
                        elseif Type == "Laundry2" then
                            TriggerServerEvent('inside-moneywash:blockLaundry2')
                            ULaundry2 = true
                        elseif Type == "Laundry3" then
                            TriggerServerEvent('inside-moneywash:blockLaundry3')
                            ULaundry3 = true
                        elseif Type == "Laundry4" then
                            TriggerServerEvent('inside-moneywash:blockLaundry4')
                            ULaundry4 = true
                        end
                        usedLaundryCard = true
                        exports.pNotify:SendNotification({text = "<b>Прачечная</b></br>Карта подключена!", timeout = 1500})
                    else
                        exports.pNotify:SendNotification({text = "<b>Прачечная</b></br>У вас нет карточки для стирки", timeout = 1500})
                    end
                end)
			end
            if data.current.value == 'PullOutCard' then
                if usedLaundryCard then
                    TaskStartScenarioInPlace(PlayerPedId(), "PROP_HUMAN_ATM", 0, true)
                    exports.rprogress:Custom({
                        Duration = 2000,
                        Label = "You pulling Laundry Card...",
                        DisableControls = {
                            Mouse = false,
                            Player = true,
                            Vehicle = true
                        }
                    })
                    Citizen.Wait(2000)
                    ClearPedTasksImmediately(PlayerPedId())
                    usedLaundryCard = false
                    exports.pNotify:SendNotification({text = "<b>Прачечная</b></br>Карта отключена!", timeout = 1500})
                    TriggerServerEvent('inside-moneywash:returnLaundryCard')
                    Citizen.Wait(100)
                    if Type == "Laundry1" then
                        TriggerServerEvent('inside-moneywash:unlockLaundry1')
                        ULaundry1 = false
                    elseif Type == "Laundry2" then
                        TriggerServerEvent('inside-moneywash:unlockLaundry2')
                        ULaundry2 = false
                    elseif Type == "Laundry3" then
                        TriggerServerEvent('inside-moneywash:unlockLaundry3')
                        ULaundry3 = false
                    elseif Type == "Laundry4" then
                        TriggerServerEvent('inside-moneywash:unlockLaundry4')
                        ULaundry4 = false
                    end
                end
            end
            if data.current.value == 'WashBlackMoney' then
                exports.rprogress:Custom({
                    Duration = 2000,
                    Label = "You putting Black Money into Washing Machine...",
                    DisableControls = {
                        Mouse = false,
                        Player = true,
                        Vehicle = true
                    }
                })
                Citizen.Wait(2000)
                ClearPedTasksImmediately(PlayerPedId())
                ESX.TriggerServerCallback('inside-moneywash:LoadBlackMoney', function(AmountToWash)
                    WashingTime = math.random(icfg.MinWashingTime, icfg.MaxWashingTime)
                    BlackMoneyAmount = AmountToWash
                    startedWashing = true
                end)
            end
            if data.current.value == 'PullOutMoney' then
                exports.rprogress:Custom({
                    Duration = 2000,
                    Label = "You pulling out Black Money from Washing Machine...",
                    DisableControls = {
                        Mouse = false,
                        Player = true,
                        Vehicle = true
                    }
                })
                Citizen.Wait(2000)
                ClearPedTasksImmediately(PlayerPedId())
                TriggerServerEvent('inside-moneywash:GetWashedMoney')
                startedWashing = false
                hasWashed = false
            end
		end, function(data, menu)
			menu.close()
            FreezeEntityPosition(PlayerPedId(), false)
		end)
end
-- Washing Machine

actDrivers = 0
startedWork = false
startedDelivery = false
hasCar = false
Plate = nil
DeliveryPlace = nil
NowWorking = false

RegisterNetEvent('inside-moneywash:startLaundering')
AddEventHandler('inside-moneywash:startLaundering', function()
    actDrivers = actDrivers + 1
end)

RegisterNetEvent('inside-moneywash:stopLaundering')
AddEventHandler('inside-moneywash:stopLaundering', function()
    actDrivers = actDrivers - 1
end)

Citizen.CreateThread(function()
    while true do

        local sleep = 500
        local ped = PlayerPedId()
        local coords = GetEntityCoords(ped)
        local vehicle = GetVehiclePedIsIn(ped)

            if not startedWork then
                if (#(coords - vector3(icfg.LaundererPlaces.Base.Pos.x, icfg.LaundererPlaces.Base.Pos.y, icfg.LaundererPlaces.Base.Pos.z)) < 0.6) then
                    sleep = 5
                    DrawMarker(25, icfg.LaundererPlaces.Base.Pos.x, icfg.LaundererPlaces.Base.Pos.y, icfg.LaundererPlaces.Base.Pos.z - 0.95, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.8, 0.8, 0.8, 148, 148, 148, 100, false, true, 2, false, false, false, false)
                    if actDrivers < icfg.MaxDrivers then
                        DrawText3Ds(icfg.LaundererPlaces.Base.Pos.x, icfg.LaundererPlaces.Base.Pos.y, icfg.LaundererPlaces.Base.Pos.z + 0.8, "Нажмите [~g~E~s~] чтобы начать взаимодействовать с Авторемонтниками")
                        if IsControlJustReleased(0, Keys["E"]) then
                            OpenLaunderingMenu()
                        end
                    else
                        DrawText3Ds(icfg.LaundererPlaces.Base.Pos.x, icfg.LaundererPlaces.Base.Pos.y, icfg.LaundererPlaces.Base.Pos.z + 0.8, "Все автомобили в настоящее время арестованы [~r~" ..actDrivers.. "~s~/~r~" ..icfg.MaxDrivers.. "~s~]")
                    end
                elseif (#(coords - vector3(icfg.LaundererPlaces.Base.Pos.x, icfg.LaundererPlaces.Base.Pos.y, icfg.LaundererPlaces.Base.Pos.z)) < 8.0) then
                    sleep = 5
                    DrawMarker(25, icfg.LaundererPlaces.Base.Pos.x, icfg.LaundererPlaces.Base.Pos.y, icfg.LaundererPlaces.Base.Pos.z - 0.95, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.8, 0.8, 0.8, 148, 148, 148, 100, false, true, 2, false, false, false, false)
                    DrawMarker(36, icfg.LaundererPlaces.Base.Pos.x, icfg.LaundererPlaces.Base.Pos.y, icfg.LaundererPlaces.Base.Pos.z + 0.2, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.8, 0.8, 0.8, 148, 148, 148, 75, false, true, 2, false, false, false, false)
                end
            elseif startedWork then
                if (#(coords - vector3(icfg.LaundererPlaces.Base.Pos.x, icfg.LaundererPlaces.Base.Pos.y, icfg.LaundererPlaces.Base.Pos.z)) < 0.6) then
                    sleep = 5
                    DrawMarker(25, icfg.LaundererPlaces.Base.Pos.x, icfg.LaundererPlaces.Base.Pos.y, icfg.LaundererPlaces.Base.Pos.z - 0.95, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.8, 0.8, 0.8, 30, 224, 20, 100, false, true, 2, false, false, false, false)
                    DrawText3Ds(icfg.LaundererPlaces.Base.Pos.x, icfg.LaundererPlaces.Base.Pos.y, icfg.LaundererPlaces.Base.Pos.z + 0.8, "Нажмите [~g~E~s~] чтобы начать взаимодействовать с Авторемонтниками")
                    if IsControlJustReleased(0, Keys["E"]) then
                        OpenLaunderingMenu()
                    end
                elseif (#(coords - vector3(icfg.LaundererPlaces.Base.Pos.x, icfg.LaundererPlaces.Base.Pos.y, icfg.LaundererPlaces.Base.Pos.z)) < 8.0) then
                    sleep = 5
                    DrawMarker(25, icfg.LaundererPlaces.Base.Pos.x, icfg.LaundererPlaces.Base.Pos.y, icfg.LaundererPlaces.Base.Pos.z - 0.95, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.8, 0.8, 0.8, 30, 224, 20, 100, false, true, 2, false, false, false, false)
                    DrawMarker(36, icfg.LaundererPlaces.Base.Pos.x, icfg.LaundererPlaces.Base.Pos.y, icfg.LaundererPlaces.Base.Pos.z + 0.2, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.8, 0.8, 0.8, 30, 224, 20, 75, false, true, 2, false, false, false, false)
                end
                if startedDelivery then
                    if (#(coords - vector3(icfg.LaundererPlaces.Garage.ChoosePos.x, icfg.LaundererPlaces.Garage.ChoosePos.y, icfg.LaundererPlaces.Garage.ChoosePos.z)) < 0.6) then
                        sleep = 5
                        DrawMarker(25, icfg.LaundererPlaces.Garage.ChoosePos.x, icfg.LaundererPlaces.Garage.ChoosePos.y, icfg.LaundererPlaces.Garage.ChoosePos.z - 0.95, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.8, 0.8, 0.8, 30, 224, 20, 100, false, true, 2, false, false, false, false)
                        if not hasCar then
                            DrawText3Ds(icfg.LaundererPlaces.Garage.ChoosePos.x, icfg.LaundererPlaces.Garage.ChoosePos.y, icfg.LaundererPlaces.Garage.ChoosePos.z + 0.8, "Нажмите [~g~E~s~] чтобы начать взаимодействовать с Гаражом")
                            if IsControlJustReleased(0, Keys["E"]) then
                                OpenGarageMenu()
                            end
                        elseif hasCar then
                            DrawText3Ds(icfg.LaundererPlaces.Garage.ChoosePos.x, icfg.LaundererPlaces.Garage.ChoosePos.y, icfg.LaundererPlaces.Garage.ChoosePos.z + 0.8, "В настоящее время у вас есть ~r~pulled out~s~ Транспортное средство")
                        end
                    elseif (#(coords - vector3(icfg.LaundererPlaces.Garage.ChoosePos.x, icfg.LaundererPlaces.Garage.ChoosePos.y, icfg.LaundererPlaces.Garage.ChoosePos.z)) < 8.0) then
                        sleep = 5
                        DrawMarker(25, icfg.LaundererPlaces.Garage.ChoosePos.x, icfg.LaundererPlaces.Garage.ChoosePos.y, icfg.LaundererPlaces.Garage.ChoosePos.z - 0.95, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.8, 0.8, 0.8, 30, 224, 20, 100, false, true, 2, false, false, false, false)
                        DrawMarker(39, icfg.LaundererPlaces.Garage.ChoosePos.x, icfg.LaundererPlaces.Garage.ChoosePos.y, icfg.LaundererPlaces.Garage.ChoosePos.z + 0.2, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.8, 0.8, 0.8, 30, 224, 20, 75, false, true, 2, false, false, false, false)
                    end
                    if IsPedInAnyVehicle(ped, false) then
                        if (#(coords - vector3(icfg.LaundererPlaces.Garage.ReturnVehicle.x, icfg.LaundererPlaces.Garage.ReturnVehicle.y, icfg.LaundererPlaces.Garage.ReturnVehicle.z)) < 2.0) then
                            DrawMarker(25, icfg.LaundererPlaces.Garage.ReturnVehicle.x, icfg.LaundererPlaces.Garage.ReturnVehicle.y, icfg.LaundererPlaces.Garage.ReturnVehicle.z - 0.95, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 2.0, 2.0, 2.0, 30, 224, 20, 100, false, true, 2, false, false, false, false)
                            DrawText3Ds(icfg.LaundererPlaces.Garage.ReturnVehicle.x, icfg.LaundererPlaces.Garage.ReturnVehicle.y, icfg.LaundererPlaces.Garage.ReturnVehicle.z + 0.8, "Нажмите [~g~E~s~] вернуть автомобиль")
                            if IsControlJustReleased(0, Keys["E"]) then
                                if Plate == GetVehicleNumberPlateText(vehicle) and hasCar then
                                    ESX.Game.DeleteVehicle(vehicle)
                                    hasCar = false
                                    Plate = nil
                                else
                                    exports.pNotify:SendNotification({text = "<b>Авторемонт</b></br>Это не ваш автомобиль", timeout = 1500})
                                end
                            end
                        elseif (#(coords - vector3(icfg.LaundererPlaces.Garage.ReturnVehicle.x, icfg.LaundererPlaces.Garage.ReturnVehicle.y, icfg.LaundererPlaces.Garage.ReturnVehicle.z)) < 8.0) then
                            sleep = 5
                            DrawMarker(25, icfg.LaundererPlaces.Garage.ReturnVehicle.x, icfg.LaundererPlaces.Garage.ReturnVehicle.y, icfg.LaundererPlaces.Garage.ReturnVehicle.z - 0.95, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 2.0, 2.0, 2.0, 30, 224, 20, 100, false, true, 2, false, false, false, false)
                            DrawMarker(39, icfg.LaundererPlaces.Garage.ReturnVehicle.x, icfg.LaundererPlaces.Garage.ReturnVehicle.y, icfg.LaundererPlaces.Garage.ReturnVehicle.z + 0.2, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.3, 1.3, 1.3, 30, 224, 20, 75, false, true, 2, false, false, false, false)
                        end
                    end
                    if NowWorking then
                        if IsPedInAnyVehicle(ped, false) then
                            if (#(coords - vector3(DeliveryPlace.x, DeliveryPlace.y, DeliveryPlace.z)) < 2.0) then
                                sleep = 5
                                DrawText3Ds(DeliveryPlace.x, DeliveryPlace.y, DeliveryPlace.z + 0.8, "Нажмите [~g~E~s~] для разгрузки вашего автомобиля")
                                if IsControlJustReleased(0, Keys["E"]) then
                                    if hasCar and Plate == GetVehicleNumberPlateText(vehicle) then
                                        TriggerServerEvent('inside-moneywash:addnotifyCops', coords)
                                        DoScreenFadeOut(1000)
                                        Citizen.Wait(1000)
                                        FreezeEntityPosition(vehicle, true)
                                        FreezeEntityPosition(ped, true)
                                        SetVehicleEngineOn(vehicle, false, false, true)
                                        exports.rprogress:Custom({
                                            Duration = 7000,
                                            Label = "Someone is exchanging your Black Money for Clean Money",
                                            DisableControls = {
                                                Mouse = false,
                                                Player = true,
                                                Vehicle = true
                                            }
                                        })
                                        Citizen.Wait(7000)
                                        DoScreenFadeIn(1000)
                                        TriggerServerEvent('inside-moneywash:ExchangeMoney')
                                        FreezeEntityPosition(vehicle, false)
                                        FreezeEntityPosition(ped, false)
                                        SetVehicleEngineOn(vehicle, true, false, true)
                                        removeDeliveryBlip()
                                        ESX.TriggerServerCallback('inside-moneywash:checkBlackMoney', function(haveBlackMoney)
                                            if haveBlackMoney then
                                                NowWorking = false
                                                DeliveryPlace = nil
                                                DeliveryPlace = icfg.DeliveryPlace[math.random(1,#icfg.DeliveryPlace)]
                                                street = GetStreetNameAtCoord(DeliveryPlace.x, DeliveryPlace.y, DeliveryPlace.z)
                                                street2 = GetStreetNameFromHashKey(street)
                                                exports.pNotify:SendNotification({text = "<b>Авторемонт</b></br>Доставьте "черные деньги" в " ..street2, timeout = 5000})
                                                SetNewWaypoint(DeliveryPlace.x, DeliveryPlace.y)
                                                addDeliveryBlip()
                                                NowWorking = true
                                            elseif not haveBlackMoney then
                                                NowWorking = false
                                                DeliveryPlace = nil
                                                exports.pNotify:SendNotification({text = "<b>Авторемонт</b></br>У вас больше нет "черных денег", которые можно отмыть. Вернуться на базу, вернуть автомобиль и получить обратно разрешение", timeout = 5000})
                                                SetNewWaypoint(icfg.LaundererPlaces.Garage.ReturnVehicle.x, icfg.LaundererPlaces.Garage.ReturnVehicle.y)
                                            end
                                        end)
                                    else
                                        exports.pNotify:SendNotification({text = "<b>Авторемонт</b></br>Это не ваш автомобиль", timeout = 1500})
                                    end
                                end
                            elseif (#(coords - vector3(DeliveryPlace.x, DeliveryPlace.y, DeliveryPlace.z)) < 8.0) then
                                sleep = 5
                                DrawMarker(39, DeliveryPlace.x, DeliveryPlace.y, DeliveryPlace.z + 0.2, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.3, 1.3, 1.3, 30, 224, 20, 75, false, true, 2, false, false, false, false)
                            end
                        end
                    end
                end
            end
        Citizen.Wait(sleep)
    end
end)

function addGarageBlip()
    GarageBlip = AddBlipForCoord(icfg.LaundererPlaces.Garage.ChoosePos.x, icfg.LaundererPlaces.Garage.ChoosePos.y, icfg.LaundererPlaces.Garage.ChoosePos.z)
    SetBlipSprite(GarageBlip, icfg.LaundererPlaces.Garage.BlipType)
    SetBlipDisplay(GarageBlip, 4)
    SetBlipScale(GarageBlip, icfg.LaundererPlaces.Garage.BlipScale)
    SetBlipAsShortRange(GarageBlip, true)
    SetBlipColour(GarageBlip, icfg.LaundererPlaces.Garage.BlipColor)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName(icfg.LaundererPlaces.Garage.BlipLabel)
    EndTextCommandSetBlipName(GarageBlip)
end

function removeGarageBlip()
    RemoveBlip(GarageBlip)
end

function OpenGarageMenu()

    local elements = {}

    if not hasCar then
        table.insert(elements, {label = 'Parking Place #1', value = 'place1'})
        table.insert(elements, {label = 'Parking Place #2', value = 'place2'})
        table.insert(elements, {label = 'Parking Place #3', value = 'place3'})
    end
    FreezeEntityPosition(PlayerPedId(), true)
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'GarageMenu', {
			title    = 'Auto Repairs Garage',
			align    = 'center',
            elements = elements,
            }, 
            function(data, menu)
            FreezeEntityPosition(PlayerPedId(), false)
            ESX.UI.Menu.CloseAll()
			if data.current.value == 'place1' then
                ESX.Game.SpawnVehicle(icfg.AutoRepairsVehicle, vector3(icfg.LaundererPlaces.Garage.SpawnPoint1.x, icfg.LaundererPlaces.Garage.SpawnPoint1.y, icfg.LaundererPlaces.Garage.SpawnPoint1.z), icfg.LaundererPlaces.Garage.SpawnPoint1.h, function(vehicle)
                    SetVehicleNumberPlateText(vehicle, "ARG"..tostring(math.random(1000, 9999)))
                    SetVehicleEngineOn(vehicle, true, true)
                    hasCar = true
                    Plate = GetVehicleNumberPlateText(vehicle)
                end)
			end
            if data.current.value == 'place2' then
                ESX.Game.SpawnVehicle(icfg.AutoRepairsVehicle, vector3(icfg.LaundererPlaces.Garage.SpawnPoint2.x, icfg.LaundererPlaces.Garage.SpawnPoint2.y, icfg.LaundererPlaces.Garage.SpawnPoint2.z), icfg.LaundererPlaces.Garage.SpawnPoint2.h, function(vehicle)
                    SetVehicleNumberPlateText(vehicle, "ARG"..tostring(math.random(1000, 9999)))
                    SetVehicleEngineOn(vehicle, true, true)
                    hasCar = true
                    Plate = GetVehicleNumberPlateText(vehicle)
                end)
			end
            if data.current.value == 'place3' then
                ESX.Game.SpawnVehicle(icfg.AutoRepairsVehicle, vector3(icfg.LaundererPlaces.Garage.SpawnPoint3.x, icfg.LaundererPlaces.Garage.SpawnPoint3.y, icfg.LaundererPlaces.Garage.SpawnPoint3.z), icfg.LaundererPlaces.Garage.SpawnPoint3.h, function(vehicle)
                    SetVehicleNumberPlateText(vehicle, "ARG"..tostring(math.random(1000, 9999)))
                    SetVehicleEngineOn(vehicle, true, true)
                    hasCar = true
                    Plate = GetVehicleNumberPlateText(vehicle)
                end)
			end
            DeliveryPlace = icfg.DeliveryPlace[math.random(1,#icfg.DeliveryPlace)]
            street = GetStreetNameAtCoord(DeliveryPlace.x, DeliveryPlace.y, DeliveryPlace.z)
            street2 = GetStreetNameFromHashKey(street)
            exports.pNotify:SendNotification({text = "<b>Авторемонт</b></br>Доставьте "черные деньги" в " ..street2, timeout = 5000})
            SetNewWaypoint(DeliveryPlace.x, DeliveryPlace.y)
            addDeliveryBlip()
            NowWorking = true
		end, function(data, menu)
			menu.close()
            FreezeEntityPosition(PlayerPedId(), false)
		end)
end

function OpenLaunderingMenu()

    local elements = {}

    if not startedWork then
        table.insert(elements, {label = 'Начать работу', value = 'StartJob'})
    elseif startedWork then
        if not startedDelivery then
            table.insert(elements, {label = 'Начать доставку черных денег', value = 'StartDelivery'})
            table.insert(elements, {label = 'Отменить работу', value = 'CancelJob'})
        elseif startedDelivery then
            table.insert(elements, {label = 'Отменить работу', value = 'CancelJob'})
        end
    end
    FreezeEntityPosition(PlayerPedId(), true)
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'LaundererMenu', {
			title    = 'Авторемонтная компания',
			align    = 'center',
            elements = elements,
            }, 
            function(data, menu)
            FreezeEntityPosition(PlayerPedId(), false)
            ESX.UI.Menu.CloseAll()
			if data.current.value == 'StartJob' then
                ESX.TriggerServerCallback('inside-moneywash:checkWorkPermit', function(hasPermit)
                    if hasPermit then
                        exports.pNotify:SendNotification({text = "<b>Авторемонт</b></br>Разрешение на работу выдано правильно", timeout = 1500})
                        TriggerServerEvent('inside-moneywash:addDriver')
                        startedWork = true
                    else
                        exports.pNotify:SendNotification({text = "<b>Авторемонт</b></br>У вас нет разрешения на работу в этом месте", timeout = 1500})
                    end
                end)
			end
            if data.current.value == 'CancelJob' then
                TriggerServerEvent('inside-moneywash:removeDriver')
                TriggerServerEvent('inside-moneywash:returnWorkPermit')
                exports.pNotify:SendNotification({text = "<b>Авторемонт</b></br>Вы забрали свое разрешение на работу", timeout = 1500})
                if DeliveryPlace and NowWorking then
                    removeDeliveryBlip()
                end
                removeGarageBlip()
                hasCar = false
                Plate = nil
                startedDelivery = false
                startedWork = false
                NowWorking = false
                DeliveryPlace = nil
            end
            if data.current.value == 'StartDelivery' then
                ESX.TriggerServerCallback('inside-moneywash:payforVehicle', function(hasMoney)
                    if hasMoney then
                        addGarageBlip()
                        startedDelivery = true
                        exports.pNotify:SendNotification({text = "<b>Авторемонт</b></br>Вы заплатили <b style='color: green;'>" ..icfg.DepositPrice.. "$</b> залог за автомобиль, отправляйтесь в гараж и заберите его", timeout = 3000})
                    elseif not hasMoney then
                        exports.pNotify:SendNotification({text = "<b>Авторемонт</b></br>У вас нет денег, чтобы оплатить депозит", timeout = 1500})
                    end
                end)
            end
		end, function(data, menu)
			menu.close()
            FreezeEntityPosition(PlayerPedId(), false)
		end)
end

function addDeliveryBlip()
    DeliveryPlace.blip = AddBlipForCoord(DeliveryPlace.x, DeliveryPlace.y, DeliveryPlace.z)
    SetBlipSprite(DeliveryPlace.blip, icfg.LocationBlip.BlipType)
    SetBlipDisplay(DeliveryPlace.blip, 4)
    SetBlipScale(DeliveryPlace.blip, icfg.LocationBlip.BlipScale)
    SetBlipAsShortRange(DeliveryPlace.blip, true)
    SetBlipColour(DeliveryPlace.blip, icfg.LocationBlip.BlipColor)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName(icfg.LocationBlip.BlipLabel)
    EndTextCommandSetBlipName(DeliveryPlace.blip)
end

RegisterNetEvent('inside-moneywash:notifyCops')
AddEventHandler('inside-moneywash:notifyCops', function(coords)
	if PlayerData.job ~= nil and PlayerData.job.name == 'police' then
		street = GetStreetNameAtCoord(coords.x, coords.y, coords.z)
		street2 = GetStreetNameFromHashKey(street)
		exports.pNotify:SendNotification({text = "<b>ЦЕНТРАЛЬНАЯ ПОЛИЦИЯ</b></br>Подозреваемый фургон с регистрацией " ..Plate.. " on " ..street2.. " street", timeout = 7500})

		blipcops = AddBlipForCoord(coords.x, coords.y, coords.z)
		SetBlipSprite(blipcops, 326)
		SetBlipColour(blipcops, 1)
		SetBlipAlpha(blipcops, 250)
		SetBlipScale(blipcops, 0.8)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString('Подозреваемый фургон [' ..Plate.. ']')
		EndTextCommandSetBlipName(blipcops)
        Wait(35000)
        RemoveBlip(blipcops)
	end
end)

function removeDeliveryBlip()
    RemoveBlip(DeliveryPlace.blip)
end

function DrawText2Ds(x, y, text, scale)
    SetTextFont(4)
    SetTextProportional(7)
    SetTextScale(scale, scale)
    SetTextColour(255, 255, 255, 255)
    SetTextDropShadow(0.0, 0.0, 0.0, 0.0, 255)
    SetTextDropShadow()
    SetTextEdge(4, 0, 0, 0, 255)
    SetTextOutline()
	SetTextCentre(true)
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x, y)
end

function DrawText3Ds(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.025+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

RegisterNetEvent('inside-moneywash:stopLaundry1')
AddEventHandler('inside-moneywash:stopLaundry1', function()
    BLaundry1 = false
end)

RegisterNetEvent('inside-moneywash:startLaundry1')
AddEventHandler('inside-moneywash:startLaundry1', function()
    BLaundry1 = true
end)

RegisterNetEvent('inside-moneywash:stopLaundry2')
AddEventHandler('inside-moneywash:stopLaundry2', function()
    BLaundry2 = false
end)

RegisterNetEvent('inside-moneywash:startLaundry2')
AddEventHandler('inside-moneywash:startLaundry2', function()
    BLaundry2 = true
end)

RegisterNetEvent('inside-moneywash:stopLaundry3')
AddEventHandler('inside-moneywash:stopLaundry3', function()
    BLaundry3 = false
end)

RegisterNetEvent('inside-moneywash:startLaundry3')
AddEventHandler('inside-moneywash:startLaundry3', function()
    BLaundry3 = true
end)

RegisterNetEvent('inside-moneywash:stopLaundry4')
AddEventHandler('inside-moneywash:stopLaundry4', function()
    BLaundry4 = false
end)

RegisterNetEvent('inside-moneywash:startLaundry4')
AddEventHandler('inside-moneywash:startLaundry4', function()
    BLaundry4 = true
end)