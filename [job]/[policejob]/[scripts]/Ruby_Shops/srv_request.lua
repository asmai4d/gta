ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


RegisterServerEvent("Ruby_IllShop:Buy")
AddEventHandler("Ruby_IllShop:Buy", function(prix, item, quantite)
     local xPlayer = ESX.GetPlayerFromId(source) 
     local xMoney = xPlayer.getMoney()
     if xMoney >= prix then
          xPlayer.addInventoryItem(item, quantite)
          xPlayer.removeMoney(prix)
          TriggerClientEvent('esx:showNotification', source, "~g~Purchases ~w~ made !")
     else
          TriggerClientEvent('esx:showNotification', source, "You don't have enough money, you are missing: ~r~"..prix-xMoney.."$")
     end
end)