CreateThread(function()
    if Config.Framework ~= "qb" then
        return
    end

    while not QBCore do
        Wait(500)
        QBCore = exports["qb-core"]:GetCoreObject()
    end
    while not QBCore.Functions.GetPlayerData() or not QBCore.Functions.GetPlayerData().job do
        Wait(500)
    end

    function Notify(msg)
        QBCore.Functions.Notify(msg)
    end

    function GetJob()
        return QBCore.Functions.GetPlayerData().job.name
    end

    loaded = true
end)