ESX = nil
local cache = {}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('id_mainmenu:getPlayerName', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    local nameofplayer

    playername = MySQL.query.await("SELECT firstname,lastname FROM users WHERE identifier = ?",{xPlayer.identifier})[1]
    if playername~=nil then playername = playername~=nil and playername or {firstname="N/A",lastname="N/A"} end
    nameofplayer = playername.firstname.." "..playername.lastname or "Your full name is not loaded"

    cb(nameofplayer)
end)


ESX.RegisterServerCallback('id_mainmenu:getCash', function(source, cb)
  local xPlayer = ESX.GetPlayerFromId(source)
  local cash

  cash = xPlayer.getMoney()

  cb(cash)
end)

ESX.RegisterServerCallback('id_mainmenu:getBank', function(source, cb)
  local xPlayer = ESX.GetPlayerFromId(source)
  local bank

  bank = xPlayer.getAccount('bank').money

  cb(bank)
end)
