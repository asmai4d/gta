-- polo © License | Discord : https://discord.gg/czW6Jqj

function OpenLaptop() -- Laptop Menu
    local ped = PlayerPedId()

    ESX.UI.Menu.CloseAll()
    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'warehouse_laptop', {
        title = _U("main_title"),
        align = "top-left",
        elements = {
            {label = _U("buy_menu"), value = "buy_menu"}
    }}, function(data, menu)
        if data.current.value == "buy_menu" then
            local elements = {
                {label = _U("b_s1_1")..tostring(ESX.Math.GroupDigits(Config.Price.weed_1)).."$", value = "weed_1"},
                {label = _U("b_s1_2")..tostring(ESX.Math.GroupDigits(Config.Price.weed_2)).."$", value = "weed_2"},
                {label = _U("b_s2_1")..tostring(ESX.Math.GroupDigits(Config.Price.weed_3)).."$", value = "weed_3"},
                {label = _U("b_s2_2")..tostring(ESX.Math.GroupDigits(Config.Price.weed_4)).."$", value = "weed_4"},
                {label = _U("b_s3_1")..tostring(ESX.Math.GroupDigits(Config.Price.weed_5)).."$", value = "weed_5"},
                {label = _U("b_s3_2")..tostring(ESX.Math.GroupDigits(Config.Price.weed_6)).."$", value = "weed_6"},
                {label = _U("b_s4_1")..tostring(ESX.Math.GroupDigits(Config.Price.weed_7)).."$", value = "weed_7"},
                {label = _U("b_s4_2")..tostring(ESX.Math.GroupDigits(Config.Price.weed_8)).."$", value = "weed_8"},
                {label = _U("b_s5_1")..tostring(ESX.Math.GroupDigits(Config.Price.weed_9)).."$", value = "weed_9"},
                {label = _U("b_s5_2")..tostring(ESX.Math.GroupDigits(Config.Price.weed_10)).."$", value = "weed_10"},
                {label = _U("b_s6_1")..tostring(ESX.Math.GroupDigits(Config.Price.weed_11)).."$", value = "weed_11"},
            }

            ESX.UI.Menu.Open("default", GetCurrentResourceName(), "buy_menu", {
                title = _U("buy_menu"),
                align = "top-left",
                elements = elements
            }, function(data2, menu2)
                local action = data2.current.value
                if action == "weed_1" then
                    ExecuteCommand("weed_drugs")
                    ExecuteCommand("weed_basic")
                        TriggerServerEvent("utku_wh:checkMoney", Config.Price.weed_1, action)
                elseif action == "weed_2" then
                    ExecuteCommand("weed_update")
                        TriggerServerEvent("utku_wh:checkMoney", Config.Price.weed_2, action)
                elseif action == "weed_3" then
                    ExecuteCommand("weed_v1")
                        TriggerServerEvent("utku_wh:checkMoney", Config.Price.weed_3, action)
                elseif action == "weed_4" then
                    ExecuteCommand("weed_v2")
                        TriggerServerEvent("utku_wh:checkMoney", Config.Price.weed_4, action)
                elseif action == "weed_5" then
                    ExecuteCommand("weed_v3")
                        TriggerServerEvent("utku_wh:checkMoney", Config.Price.weed_5, action)
                elseif action == "weed_6" then
                    ExecuteCommand("weed_v4")
                        TriggerServerEvent("utku_wh:checkMoney", Config.Price.weed_6, action)
                elseif action == "weed_7" then
                    ExecuteCommand("weed_v5")
                        TriggerServerEvent("utku_wh:checkMoney", Config.Price.weed_7, action)
                elseif action == "weed_8" then
                    ExecuteCommand("weed_v6")
                        TriggerServerEvent("utku_wh:checkMoney", Config.Price.weed_8, action)
                elseif action == "weed_9" then
                    ExecuteCommand("weed_v7")
                        TriggerServerEvent("utku_wh:checkMoney", Config.Price.weed_9, action)
                elseif action == "weed_10" then
                    ExecuteCommand("weed_v8")
                        TriggerServerEvent("utku_wh:checkMoney", Config.Price.weed_10, action)
                elseif action == "weed_11" then
                    ExecuteCommand("weed_v9")
                        TriggerServerEvent("utku_wh:checkMoney", Config.Price.weed_11, action)
                end
            end, function(data2, menu2)
                menu2.close()
            end)
        end
    end, function(data, menu)
        menu.close()
        TaskPlayAnim(ped, "anim@amb@warehouse@laptop@", "exit", 8.0, 8.0, 0.1, 0, 1, false, false, false)
    end)
end

function OpenLaptopCoke() -- Laptop Coke Menu
    local ped = PlayerPedId()

    ESX.UI.Menu.CloseAll()
    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'warehouse_laptop_coke', {
        title = _U("main_title"),
        align = "top-left",
        elements = {
            {label = "Improve the warehouse", value = "buy_menu3"}
    }}, function(data, menu)
        if data.current.value == "buy_menu3" then
            local elements = {
                {label = "Buy Coke " ..tostring(ESX.Math.GroupDigits(Config.Price.coke)).."$", value = "coke"},
            }

            ESX.UI.Menu.Open("default", GetCurrentResourceName(), "buy_menu3", {
                title = _U("buy_menu"),
                align = "top-left",
                elements = elements
            }, function(data2, menu2)
                local action = data2.current.value
                if action == "coke" then
                    ExecuteCommand("coke_drugs")
                    ExecuteCommand("coke")
                        TriggerServerEvent("utku_wh:checkMoney", Config.Price.coke, action)
                end
            end, function(data2, menu2)
                menu2.close()
            end)
        end
    end, function(data, menu)
        menu.close()
        TaskPlayAnim(ped, "anim@amb@warehouse@laptop@", "exit", 8.0, 8.0, 0.1, 0, 1, false, false, false)
    end)
end

function DrawText3D(x, y, z, text, scale)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local pX, pY, pZ = table.unpack(GetGameplayCamCoords())

    SetTextScale(scale, scale)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextEntry("STRING")
    SetTextCentre(true)
    SetTextColour(255, 255, 255, 215)

    AddTextComponentString(text)
    DrawText(_x, _y)

    local factor = (string.len(text)) / 5000
    --DrawRect(_x, _y + 0.0150, 0.095 + factor, 0.03, 41, 11, 41, 100)
end