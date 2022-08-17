-- Vente Heroïne + Policier

ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterServerEvent("Illegal:RecupTraiter")
AddEventHandler("Illegal:RecupTraiter", function(nombre)
    local xPlayer = ESX.GetPlayerFromId(source)
    TriggerClientEvent("Illegal:SetItemTraiter", -1)
end)

RegisterServerEvent("Illegal:Vente")
AddEventHandler("Illegal:Vente", function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local nombre = xPlayer.getInventoryItem("heroine_pooch")
    local count = 1
    local price = nombre.count * 175
    xPlayer.addAccountMoney('black_money', price)
    xPlayer.removeInventoryItem("heroine_pooch", nombre.count)
    TriggerClientEvent("Illegal:VenteNotifOpium", source, nombre.count, price)
end)

RegisterServerEvent("Illegal:Opium")
AddEventHandler("Illegal:Opium", function(nombre)
    local xPlayer = ESX.GetPlayerFromId(source)
    TriggerClientEvent("Illegal:SetItemTraiter", -1)
end)

RegisterServerEvent("Illegal:VenteOpium")
AddEventHandler("Illegal:VenteOpium", function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local nombre = xPlayer.getInventoryItem("opium_pooch")
    local count = 1
    local price = nombre.count * 175
    xPlayer.addAccountMoney('black_money', price)
    xPlayer.removeInventoryItem("opium_pooch", nombre.count)
    TriggerClientEvent("Illegal:VenteNotifOpium", source, nombre.count, price)
end)

RegisterServerEvent("Illegal:Weed")
AddEventHandler("Illegal:Weed", function(nombre)
    local xPlayer = ESX.GetPlayerFromId(source)
    TriggerClientEvent("Illegal:SetItemTraiter", -1)
end)

RegisterServerEvent("Illegal:VenteWeed")
AddEventHandler("Illegal:VenteWeed", function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local nombre = xPlayer.getInventoryItem("weed_pooch")
    local count = 1
    local price = nombre.count * 175
    xPlayer.addAccountMoney('black_money', price)
    xPlayer.removeInventoryItem("weed_pooch", nombre.count)
    TriggerClientEvent("Illegal:VenteNotifWeed", source, nombre.count, price)
end)

RegisterServerEvent("Illegal:Ecstasy")
AddEventHandler("Illegal:Ecstasy", function(nombre)
    local xPlayer = ESX.GetPlayerFromId(source)
    TriggerClientEvent("Illegal:SetItemTraiter", -1)
end)

RegisterServerEvent("Illegal:VenteEcstasy")
AddEventHandler("Illegal:VenteEcstasy", function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local nombre = xPlayer.getInventoryItem("ecstasy_pooch")
    local count = 1
    local price = nombre.count * 175
    xPlayer.addAccountMoney('black_money', price)
    xPlayer.removeInventoryItem("ecstasy_pooch", nombre.count)
    TriggerClientEvent("Illegal:VenteNotifEcstasy", source, nombre.count, price)
end)

RegisterServerEvent("Illegal:Amphetamines")
AddEventHandler("Illegal:Amphetamines", function(nombre)
    local xPlayer = ESX.GetPlayerFromId(source)
    TriggerClientEvent("Illegal:SetItemTraiter", -1)
end)

RegisterServerEvent("Illegal:VenteAmphetamines")
AddEventHandler("Illegal:VenteAmphetamines", function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local nombre = xPlayer.getInventoryItem("amphetamines_pooch")
    local count = 1
    local price = nombre.count * 175
    xPlayer.addAccountMoney('black_money', price)
    xPlayer.removeInventoryItem("amphetamines_pooch", nombre.count)
    TriggerClientEvent("Illegal:VenteNotifAmphetamines", source, nombre.count, price)
end)

RegisterServerEvent("Illegal:LSD")
AddEventHandler("Illegal:LSD", function(nombre)
    local xPlayer = ESX.GetPlayerFromId(source)
    TriggerClientEvent("Illegal:SetItemTraiter", -1)
end)

RegisterServerEvent("Illegal:VenteLSD")
AddEventHandler("Illegal:VenteLSD", function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local nombre = xPlayer.getInventoryItem("lsd_pooch")
    local count = 1
    local price = nombre.count * 175
    xPlayer.addAccountMoney('black_money', price)
    xPlayer.removeInventoryItem("lsd_pooch", nombre.count)
    TriggerClientEvent("Illegal:VenteNotifLSD", source, nombre.count, price)
end)

RegisterServerEvent("Illegal:Lean")
AddEventHandler("Illegal:Lean", function(nombre)
    local xPlayer = ESX.GetPlayerFromId(source)
    TriggerClientEvent("Illegal:SetItemTraiter", -1)
end)

RegisterServerEvent("Illegal:VenteLean")
AddEventHandler("Illegal:VenteLean", function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local nombre = xPlayer.getInventoryItem("lean_pooch")
    local count = 1
    local price = nombre.count * 175
    xPlayer.addAccountMoney('black_money', price)
    xPlayer.removeInventoryItem("lean_pooch", nombre.count)
    TriggerClientEvent("Illegal:VenteNotifLean", source, nombre.count, price)
end)

-------------------- Menu Illegal 2 ---------------------

RegisterServerEvent("Illegal:Coke")
AddEventHandler("Illegal:Coke", function(nombre)
    local xPlayer = ESX.GetPlayerFromId(source)
    TriggerClientEvent("Illegal:SetItemTraiter", -1)
end)

RegisterServerEvent("Illegal:VenteCoke")
AddEventHandler("Illegal:VenteCoke", function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local nombre = xPlayer.getInventoryItem("coke_pooch")
    local count = 1
    local price = nombre.count * 175
    xPlayer.addAccountMoney('black_money', price)
    xPlayer.removeInventoryItem("coke_pooch", nombre.count)
end)

RegisterServerEvent("Illegal:Marijuana")
AddEventHandler("Illegal:Marijuana", function(nombre)
    local xPlayer = ESX.GetPlayerFromId(source)
    TriggerClientEvent("Illegal:SetItemTraiter", -1)
end)

RegisterServerEvent("Illegal:VenteMarijuana")
AddEventHandler("Illegal:VenteMarijuana", function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local nombre = xPlayer.getInventoryItem("marijuana_pooch")
    local count = 1
    local price = nombre.count * 175
    xPlayer.addAccountMoney('black_money', price)
    xPlayer.removeInventoryItem("marijuana_pooch", nombre.count)
end)

RegisterServerEvent("Illegal:Meth")
AddEventHandler("Illegal:Meth", function(nombre)
    local xPlayer = ESX.GetPlayerFromId(source)
    TriggerClientEvent("Illegal:SetItemTraiter", -1)
end)

RegisterServerEvent("Illegal:VenteMeth")
AddEventHandler("Illegal:VenteMeth", function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local nombre = xPlayer.getInventoryItem("meth_pooch")
    local count = 1
    local price = nombre.count * 175
    xPlayer.addAccountMoney('black_money', price)
    xPlayer.removeInventoryItem("meth_pooch", nombre.count)
end)

RegisterServerEvent("Illegal:Crack")
AddEventHandler("Illegal:Crack", function(nombre)
    local xPlayer = ESX.GetPlayerFromId(source)
    TriggerClientEvent("Illegal:SetItemTraiter", -1)
end)

RegisterServerEvent("Illegal:VenteCrack")
AddEventHandler("Illegal:VenteCrack", function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local nombre = xPlayer.getInventoryItem("crack_pooch")
    local count = 1
    local price = nombre.count * 175
    xPlayer.addAccountMoney('black_money', price)
    xPlayer.removeInventoryItem("crack_pooch", nombre.count)
end)

RegisterServerEvent("Illegal:Morphine")
AddEventHandler("Illegal:Morphine", function(nombre)
    local xPlayer = ESX.GetPlayerFromId(source)
    TriggerClientEvent("Illegal:SetItemTraiter", -1)
end)

RegisterServerEvent("Illegal:VenteMorphine")
AddEventHandler("Illegal:VenteMorphine", function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local nombre = xPlayer.getInventoryItem("morphine_pooch")
    local count = 1
    local price = nombre.count * 175
    xPlayer.addAccountMoney('black_money', price)
    xPlayer.removeInventoryItem("morphine_pooch", nombre.count)
end)

RegisterServerEvent("Illegal:Ketamine")
AddEventHandler("Illegal:Ketamine", function(nombre)
    local xPlayer = ESX.GetPlayerFromId(source)
    TriggerClientEvent("Illegal:SetItemTraiter", -1)
end)

RegisterServerEvent("Illegal:VenteKetamine")
AddEventHandler("Illegal:VenteKetamine", function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local nombre = xPlayer.getInventoryItem("ketamine_pooch")
    local count = 1
    local price = nombre.count * 175
    xPlayer.addAccountMoney('black_money', price)
    xPlayer.removeInventoryItem("ketamine_pooch", nombre.count)
end)