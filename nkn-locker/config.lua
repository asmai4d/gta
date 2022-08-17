Config = {}
Config.Locale = "en"

nkn = {}

nkn.esx = 'esx'
nkn.getSharedObject = 'getSharedObject'

nkn.clientNotify = function(msg)
    TriggerEvent("notify", "System", msg, 8000)  
end

nkn.serverNotify = function(source, msg)
    TriggerClientEvent("notify", source, "System", msg, 8000)
end

nkn.settings = {
    rentDays = 10,  -- how many days the locker are rentable
    debug = true,   -- Debug prints.
    realTimeSync = true,    -- true = Your created Locker is instanstly in Game, false = it requires a server restart to use new created Lockers. (true = performance lastig!)
    canCreateLocker = {
        "superadmin",
        "admin"
    },
    -- TO CREATE LOCKER YOU NEED TO BE INGAME AT A SPOT U WANT TO PLACE A LOCKER AND USE THE COMMAND "/createlocker [UNIQUENAME] [KG (INT)] [PRICE (INT)]"
}
zzzzzzzzz