function RemoveWeaponDrops()
	RemoveAllPickupsOfType(14)
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)      
        RemoveWeaponDrops();
    end
end)