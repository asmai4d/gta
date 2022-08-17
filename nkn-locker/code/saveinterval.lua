local SaveTimer = 30 * 60000

Citizen.CreateThread(function()
    while true do 
        Citizen.Wait(SaveTimer)
        saveLockers()
    end
end)

--[[
    U can change the Timer between the Save interval.
    Be carefull with this, if the SaveTimer is to low the Server can Crash and you´ll have Performance problems
]]