ESX = nil
TriggerEvent(
    Config.ESXLibrary,
    function(a)
        ESX = a
    end
)
neaW = function()
    local b = source
    local c = GetPlayerPed(b)
    local d = GetEntityCoords(c)
    for e, f in pairs(Config.Weed) do
        for g = 1, #f.WeedGatheringIndica, 1 do
            local h = #(d - f.WeedGatheringIndica[g])
            if h < 50 then
                return true
            else
                return false
            end
        end
    end
end
neaC = function()
    local b = source
    local c = GetPlayerPed(b)
    local d = GetEntityCoords(c)
    for e, f in pairs(Config.Coke) do
        for g = 1, #f.PackingCoke, 1 do
            local h = #(d - f.PackingCoke[g])
            if h < 15 then
                return true
            else
                return false
            end
        end
    end
end
neaA = function()
    local b = source
    local c = GetPlayerPed(b)
    local d = GetEntityCoords(c)
    for e, f in pairs(Config.Amfetamin) do
        for g = 1, #f.Meth4th, 1 do
            local h = #(d - f.Meth4th[g])
            if h < 15 then
                return true
            else
                return false
            end
        end
    end
end
RegisterServerEvent("esegovic:dodajIndicu")
AddEventHandler(
    "esegovic:dodajIndicu",
    function()
        local i = source
        local j = ESX.GetPlayerFromId(i)
        if neaW() then
            if Config.UseNewESX then
                if j.canCarryItem("weed_indica", 1) then
                    j.addInventoryItem("weed_indica", 1)
                    j.showNotification(Config.Translate[35])
                else
                    j.showNotification(Config.Translate[34])
                end
            else
                j.addInventoryItem("weed_indica", 1)
                j.showNotification(Config.Translate[35])
            end
        else
            print("Cheater Triggering Event!")
        end
    end
)
RegisterServerEvent("esegovic:dodajSativa")
AddEventHandler(
    "esegovic:dodajSativa",
    function()
        local i = source
        local j = ESX.GetPlayerFromId(i)
        if neaW() then
            if Config.UseNewESX then
                if j.canCarryItem("weed_sativa", 1) then
                    j.addInventoryItem("weed_sativa", 1)
                    j.showNotification(Config.Translate[35])
                else
                    j.showNotification(Config.Translate[34])
                end
            else
                j.addInventoryItem("weed_sativa", 1)
                j.showNotification(Config.Translate[35])
            end
        else
            print("Cheater Triggering Event!")
        end
    end
)
RegisterServerEvent("esegovic:dodajPurple")
AddEventHandler(
    "esegovic:dodajPurple",
    function()
        local i = source
        local j = ESX.GetPlayerFromId(i)
        if neaW() then
            if Config.UseNewESX then
                if j.canCarryItem("weed_purple", 1) then
                    j.addInventoryItem("weed_purple", 1)
                    j.showNotification(Config.Translate[35])
                else
                    j.showNotification(Config.Translate[34])
                end
            else
                j.addInventoryItem("weed_purple", 1)
                j.showNotification(Config.Translate[35])
            end
        else
            print("Cheater Triggering Event!")
        end
    end
)
ESX.RegisterServerCallback(
    "esegovic:checkPlant",
    function(source, k)
        local j = ESX.GetPlayerFromId(source)
        local l = j.getInventoryItem("weed_indica")
        if l.count >= 1 then
            k(true)
            j.removeInventoryItem("weed_indica", 1)
        else
            k(false)
        end
    end
)
ESX.RegisterServerCallback(
    "esegovic:checkPlant2",
    function(source, k)
        local j = ESX.GetPlayerFromId(source)
        local l = j.getInventoryItem("weed_sativa")
        if l.count >= 1 then
            k(true)
            j.removeInventoryItem("weed_sativa", 1)
        else
            k(false)
        end
    end
)
ESX.RegisterServerCallback(
    "esegovic:checkPlant3",
    function(source, k)
        local j = ESX.GetPlayerFromId(source)
        local l = j.getInventoryItem("weed_purple")
        if l.count >= 1 then
            k(true)
            j.removeInventoryItem("weed_purple", 1)
        else
            k(false)
        end
    end
)
ESX.RegisterServerCallback(
    "esegovic:checkMixItem",
    function(source, k)
        local j = ESX.GetPlayerFromId(source)
        local l = j.getInventoryItem("flour")
        if l.count >= 1 then
            k(true)
            j.removeInventoryItem("flour", 1)
        else
            k(false)
        end
    end
)
RegisterServerEvent("esegovic:packIndica")
AddEventHandler(
    "esegovic:packIndica",
    function()
        local i = source
        local j = ESX.GetPlayerFromId(i)
        local m = math.random(5, 10)
        if neaW() then
            if Config.UseNewESX then
                if j.canCarryItem("indica_weed", m) then
                    j.addInventoryItem("indica_weed", m)
                    j.showNotification(Config.Translate[356] .. m .. "g")
                else
                    j.showNotification(Config.Translate[34])
                end
            else
                j.addInventoryItem("indica_weed", m)
                j.showNotification(Config.Translate[356] .. m .. "g")
            end
        else
            print("Cheater Triggering Event!")
        end
    end
)
RegisterServerEvent("esegovic:packSativa")
AddEventHandler(
    "esegovic:packSativa",
    function()
        local i = source
        local j = ESX.GetPlayerFromId(i)
        local m = math.random(5, 10)
        if neaW() then
            if Config.UseNewESX then
                if j.canCarryItem("sativa_weed", m) then
                    j.addInventoryItem("sativa_weed", m)
                    j.showNotification(Config.Translate[356] .. m .. "g")
                else
                    j.showNotification(Config.Translate[34])
                end
            else
                j.addInventoryItem("sativa_weed", m)
                j.showNotification(Config.Translate[356] .. m .. "g")
            end
        else
            print("Cheater Triggering Event!")
        end
    end
)
RegisterServerEvent("esegovic:packPurple")
AddEventHandler(
    "esegovic:packPurple",
    function()
        local i = source
        local j = ESX.GetPlayerFromId(i)
        local m = math.random(5, 10)
        if neaW() then
            if Config.UseNewESX then
                if j.canCarryItem("purple_weed", m) then
                    j.addInventoryItem("purple_weed", m)
                    j.showNotification(Config.Translate[356] .. m .. "g")
                else
                    j.showNotification(Config.Translate[34])
                end
            else
                j.addInventoryItem("purple_weed", m)
                j.showNotification(Config.Translate[356] .. m .. "g")
            end
        else
            print("Cheater Triggering Event!")
        end
    end
)
RegisterServerEvent("esegovic:dodajCocaine")
AddEventHandler(
    "esegovic:dodajCocaine",
    function()
        local i = source
        local j = ESX.GetPlayerFromId(i)
        if neaC() then
            if Config.UseNewESX then
                if j.canCarryItem("bag_cocaine", 1) then
                    j.addInventoryItem("bag_cocaine", 1)
                    j.showNotification(Config.Translate[609])
                else
                    j.showNotification(Config.Translate[34])
                end
            else
                j.addInventoryItem("bag_cocaine", 1)
                j.showNotification(Config.Translate[609])
            end
        else
            print("Cheater Triggering Event!")
        end
    end
)
RegisterServerEvent("esegovic:notifiPolice")
AddEventHandler(
    "esegovic:notifiPolice",
    function(n)
        TriggerClientEvent("esegovic:policenotify", -1, n)
    end
)
RegisterServerEvent("esegovic:dodajGotovProizvod")
AddEventHandler(
    "esegovic:dodajGotovProizvod",
    function()
        local j = ESX.GetPlayerFromId(source)
        if neaA() then
            j.addInventoryItem("amfetamin", 1)
            j.showNotification(Config.Translate[140])
        else
            print("Cheater Triggering Event!")
        end
    end
)
RegisterServerEvent("esegovic:canWashMoney")
AddEventHandler(
    "esegovic:canWashMoney",
    function(o)
        local j = ESX.GetPlayerFromId(source)
        local p = j.getAccount("black_money").money
        if p >= o then
            j.removeAccountMoney("black_money", o)
            TriggerClientEvent("esegovic:MoneyWashFunc", source, o)
        else
            j.showNotification(Config.Translate[158])
        end
    end
)
RegisterServerEvent("esegovic:washMoney")
AddEventHandler(
    "esegovic:washMoney",
    function(o)
        local j = ESX.GetPlayerFromId(source)
        if Config.EnableTax then
            local q = Config.TaxRate
            local r = o / 100 * q
            local s = o - r
            j.addMoney(s)
            j.showNotification(Config.Translate[154] .. s .. "$")
        else
            j.addMoney(o)
            j.showNotification(Config.Translate[154] .. o .. "$")
        end
    end
)
ESX.RegisterServerCallback(
    "esegovic:checkIDCard",
    function(source, k)
        local j = ESX.GetPlayerFromId(source)
        local l = j.getInventoryItem("moneywash_card")
        if l.count >= 1 then
            k(true)
        else
            k(false)
        end
    end
)
RegisterServerEvent("esegovic:ProdajPredmet")
AddEventHandler(
    "esegovic:ProdajPredmet",
    function(t, u, v)
        local j = ESX.GetPlayerFromId(source)
        local w = ESX.GetItemLabel(v)
        if j.getInventoryItem(v).count >= t then
            j.removeInventoryItem(v, t)
            if Config.GetBlackMoney then
                j.addAccountMoney("black_money", u)
                j.showNotification(Config.Translate[164] .. t .. "x " .. w .. Config.Translate[165] .. u .. "$")
            else
                j.addMoney(u)
                j.showNotification(Config.Translate[164] .. t .. "x " .. w .. Config.Translate[165] .. u .. "$")
            end
        else
            j.showNotification(Config.Translate[166])
        end
    end
)
