ESX = nil
Citizen.CreateThread(function()
	Citizen.Wait(5000)
-- polo © License | Discord : https://discord.gg/czW6Jqj
	-- Joueur
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	-- Job
	while ESX.GetPlayerData().job == nil do
        	Citizen.Wait(1000)
   	end

	-- Faction
	while ESX.GetPlayerData().faction == nil do
		Citizen.Wait(100)
	end
	
	PlayerData = ESX.GetPlayerData()
end)

-- Vente Héroïne

VenteHeroine = {
    vector3(-456.93, -61.89, 44.51),
    vector3(-475.66, 71.69, 59.24),
    vector3(-324.31, 74.193, 66.14),
	vector3(-67.711, 79.66, 72.61),
    vector3(1661.00, -1848.86, 109.01)
}

function RandomVente()
    local index = GetRandomIntInRange(1, #VenteHeroine)
    return VenteHeroine[index]
end

-- Vente Opium

VenteOpium = {
    vector3(1962.71, -87.91, 207.21),
    vector3(-428.16, -1680.67, 19.03)
}

function RandomVenteOpium()
    local index = GetRandomIntInRange(1, #VenteOpium)
    return VenteOpium[index]
end

-- Vente Weed

VenteWeed = {
    vector3(870.88, -2331.42, 30.35),
    vector3(926.43, -1479.28, 30.05)
}

function RandomVenteWeed()
    local index = GetRandomIntInRange(1, #VenteWeed)
    return VenteWeed[index]
end

-- Vente Ecstasy

VenteEcstasy = {
    vector3(-81.32, -2704.2, 6.99),
    vector3(-1340.48, -1679.07, 2.12)
}

function RandomVenteEcstasy()
    local index = GetRandomIntInRange(1, #VenteEcstasy)
    return VenteEcstasy[index]
end

-- Vente Lean

VenteLean = {
    vector3(-717.9, -895.36, 20.57),
    vector3(-796.31, -188.4, 37.28)
}

function RandomVenteLean()
    local index = GetRandomIntInRange(1, #VenteLean)
    return VenteLean[index]
end

-- Vente Amphetamines

VenteAmphetamines = {
    vector3(-2054.43, -490.37, 10.93),
    vector3(-1346.0, -1626.8, 2.66)
}

function RandomVenteAmphetamines()
    local index = GetRandomIntInRange(1, #VenteAmphetamines)
    return VenteAmphetamines[index]
end

-- Vente LSD

VenteLSD = {
    vector3(-1095.44, -1033.81, 2.15),
    vector3(-1375.33, -723.52, 67.19)
}

function RandomVenteLSD()
    local index = GetRandomIntInRange(1, #VenteLSD)
    return VenteLSD[index]
end

function vente()
    local ped = GetPlayerPed(-1)
    RequestModel(GetHashKey("a_m_o_tramp_01"))
    while not HasModelLoaded(GetHashKey("a_m_o_tramp_01")) do
        Wait(1)
    end
    NpcSpawnCoords = RandomVente()
    npc = CreatePed(4, GetHashKey("a_m_o_tramp_01"), NpcSpawnCoords.x, NpcSpawnCoords.y, NpcSpawnCoords.z-1, 143.21, false, false)	
    TaskWanderStandard(npc, 10.0, 10)
    SetEntityInvincible(npc, true)
    local blip = AddBlipForEntity(npc)
    SetBlipSprite(blip, 66)
    SetBlipColour(blip, 1)
    SetBlipScale(blip, 0.85)
    SetBlipRoute(blip, true)
    ESX.ShowNotification("It's good I have a contact to whom you can sell your Heroine, I put it on the GPS!")
    close = false
    while close == false do
        PedCoord = GetEntityCoords(npc)
        PlayerCoord = GetEntityCoords(ped)

        local distanceNPC = GetDistanceBetweenCoords(PedCoord, PlayerCoord, true)
        if distanceNPC <= 2.5 then
            ESX.ShowHelpNotification("Seriously your my dope? Damn you manage brother!")
            TaskWanderStandard(npc, 10.0, 10)
            RemoveBlip(blip)
            TriggerServerEvent("Illegal:Vente")
            SetPedAsNoLongerNeeded(npc)
            SetEntityAsNoLongerNeeded(npc)
            close = true
        end
        Wait(100)
    end
    _menuPool3:CloseAllMenus()
end

function venteOpium()
    local ped = GetPlayerPed(-1)
    RequestModel(GetHashKey("a_m_y_business_03"))
    while not HasModelLoaded(GetHashKey("a_m_y_business_03")) do
        Wait(1)
    end
    NpcSpawnCoords = RandomVenteOpium()
    npc = CreatePed(4, GetHashKey("a_m_y_business_03"), NpcSpawnCoords.x, NpcSpawnCoords.y, NpcSpawnCoords.z-1, 143.21, false, false)	
    TaskWanderStandard(npc, 10.0, 10)
    SetEntityInvincible(npc, true)
    local blip = AddBlipForEntity(npc)
    SetBlipSprite(blip, 66)
    SetBlipColour(blip, 1)
    SetBlipScale(blip, 0.85)
    SetBlipRoute(blip, true)
    ESX.ShowNotification("Here is a businessman to whom you can sell your Opium, I put that on the GPS!")
    close = false
    while close == false do
        PedCoord = GetEntityCoords(npc)
        PlayerCoord = GetEntityCoords(ped)

        local distanceNPC = GetDistanceBetweenCoords(PedCoord, PlayerCoord, true)
        if distanceNPC <= 2.5 then
            ESX.ShowHelpNotification("As agreed, here is your money!")
            TaskWanderStandard(npc, 10.0, 10)
            RemoveBlip(blip)
            TriggerServerEvent("Illegal:VenteOpium")
            SetPedAsNoLongerNeeded(npc)
            SetEntityAsNoLongerNeeded(npc)
            close = true
        end
        Wait(100)
    end
    _menuPool3:CloseAllMenus()
end

function venteWeed()
    local ped = GetPlayerPed(-1)
    RequestModel(GetHashKey("a_m_o_soucent_03"))
    while not HasModelLoaded(GetHashKey("a_m_o_soucent_03")) do
        Wait(1)
    end
    NpcSpawnCoords = RandomVenteWeed()
    npc = CreatePed(4, GetHashKey("a_m_o_soucent_03"), NpcSpawnCoords.x, NpcSpawnCoords.y, NpcSpawnCoords.z-1, 143.21, false, false)	
    TaskWanderStandard(npc, 10.0, 10)
    SetEntityInvincible(npc, true)
    local blip = AddBlipForEntity(npc)
    SetBlipSprite(blip, 66)
    SetBlipColour(blip, 1)
    SetBlipScale(blip, 0.85)
    SetBlipRoute(blip, true)
    ESX.ShowNotification("It's good I have a contact to whom you can sell your Weed, I put that on the GPS!")
    close = false
    while close == false do
        PedCoord = GetEntityCoords(npc)
        PlayerCoord = GetEntityCoords(ped)

        local distanceNPC = GetDistanceBetweenCoords(PedCoord, PlayerCoord, true)
        if distanceNPC <= 2.5 then
            ESX.ShowHelpNotification("I hope it's good zebi!")
            TaskWanderStandard(npc, 10.0, 10)
            RemoveBlip(blip)
            TriggerServerEvent("Illegal:VenteWeed")
            SetPedAsNoLongerNeeded(npc)
            SetEntityAsNoLongerNeeded(npc)
            close = true
        end
        Wait(100)
    end
    _menuPool3:CloseAllMenus()
end

function venteEcstasy()
    local ped = GetPlayerPed(-1)
    RequestModel(GetHashKey("a_m_y_acult_02"))
    while not HasModelLoaded(GetHashKey("a_m_y_acult_02")) do
        Wait(1)
    end
    NpcSpawnCoords = RandomVenteEcstasy()
    npc = CreatePed(4, GetHashKey("a_m_y_acult_02"), NpcSpawnCoords.x, NpcSpawnCoords.y, NpcSpawnCoords.z-1, 143.21, false, false)	
    TaskWanderStandard(npc, 10.0, 10)
    SetEntityInvincible(npc, true)
    local blip = AddBlipForEntity(npc)
    SetBlipSprite(blip, 66)
    SetBlipColour(blip, 1)
    SetBlipScale(blip, 0.85)
    SetBlipRoute(blip, true)
    ESX.ShowNotification("It's good I have a contact to whom you can sell your Ecstasy, I put that on the GPS!")
    close = false
    while close == false do
        PedCoord = GetEntityCoords(npc)
        PlayerCoord = GetEntityCoords(ped)

        local distanceNPC = GetDistanceBetweenCoords(PedCoord, PlayerCoord, true)
        if distanceNPC <= 2.5 then
            ESX.ShowHelpNotification("WOOOWW she is a super good man 😉")
            TaskWanderStandard(npc, 10.0, 10)
            RemoveBlip(blip)
            TriggerServerEvent("Illegal:VenteEcstasy")
            SetPedAsNoLongerNeeded(npc)
            SetEntityAsNoLongerNeeded(npc)
            close = true
        end
        Wait(100)
    end
    _menuPool3:CloseAllMenus()
end

function venteAmphetamines()
    local ped = GetPlayerPed(-1)
    RequestModel(GetHashKey("a_m_y_acult_02"))
    while not HasModelLoaded(GetHashKey("a_m_y_acult_02")) do
        Wait(1)
    end
    NpcSpawnCoords = RandomVenteAmphetamines()
    npc = CreatePed(4, GetHashKey("a_m_y_acult_02"), NpcSpawnCoords.x, NpcSpawnCoords.y, NpcSpawnCoords.z-1, 143.21, false, false)	
    TaskWanderStandard(npc, 10.0, 10)
    SetEntityInvincible(npc, true)
    local blip = AddBlipForEntity(npc)
    SetBlipSprite(blip, 66)
    SetBlipColour(blip, 1)
    SetBlipScale(blip, 0.85)
    SetBlipRoute(blip, true)
    ESX.ShowNotification("It's good I have a contact to whom you can sell your Amphetamines, I put that on the GPS!")
    close = false
    while close == false do
        PedCoord = GetEntityCoords(npc)
        PlayerCoord = GetEntityCoords(ped)

        local distanceNPC = GetDistanceBetweenCoords(PedCoord, PlayerCoord, true)
        if distanceNPC <= 2.5 then
            ESX.ShowHelpNotification("You are a good one, you manage!")
            TaskWanderStandard(npc, 10.0, 10)
            RemoveBlip(blip)
            TriggerServerEvent("Illegal:VenteAmphetamines")
            SetPedAsNoLongerNeeded(npc)
            SetEntityAsNoLongerNeeded(npc)
            close = true
        end
        Wait(100)
    end
    _menuPool3:CloseAllMenus()
end

function venteLSD()
    local ped = GetPlayerPed(-1)
    RequestModel(GetHashKey("a_m_y_acult_02"))
    while not HasModelLoaded(GetHashKey("a_m_y_acult_02")) do
        Wait(1)
    end
    NpcSpawnCoords = RandomVenteLSD()
    npc = CreatePed(4, GetHashKey("a_m_y_acult_02"), NpcSpawnCoords.x, NpcSpawnCoords.y, NpcSpawnCoords.z-1, 259.21, false, false)	
    TaskWanderStandard(npc, 10.0, 10)
    SetEntityInvincible(npc, true)
    local blip = AddBlipForEntity(npc)
    SetBlipSprite(blip, 66)
    SetBlipColour(blip, 1)
    SetBlipScale(blip, 0.85)
    SetBlipRoute(blip, true)
    ESX.ShowNotification("It's good I have a contact to whom you can sell your LSD, I put that on the GPS!")
    close = false
    while close == false do
        PedCoord = GetEntityCoords(npc)
        PlayerCoord = GetEntityCoords(ped)

        local distanceNPC = GetDistanceBetweenCoords(PedCoord, PlayerCoord, true)
        if distanceNPC <= 2.5 then
            ESX.ShowHelpNotification("You are a good one, you manage!")
            TaskWanderStandard(npc, 10.0, 10)
            RemoveBlip(blip)
            TriggerServerEvent("Illegal:VenteLSD")
            SetPedAsNoLongerNeeded(npc)
            SetEntityAsNoLongerNeeded(npc)
            close = true
        end
        Wait(100)
    end
    _menuPool3:CloseAllMenus()
end

function venteLean()
    local ped = GetPlayerPed(-1)
    RequestModel(GetHashKey("a_m_y_acult_02"))
    while not HasModelLoaded(GetHashKey("a_m_y_acult_02")) do
        Wait(1)
    end
    NpcSpawnCoords = RandomVenteLean()
    npc = CreatePed(4, GetHashKey("a_m_y_acult_02"), NpcSpawnCoords.x, NpcSpawnCoords.y, NpcSpawnCoords.z-1, 143.21, false, false)	
    TaskWanderStandard(npc, 10.0, 10)
    SetEntityInvincible(npc, true)
    local blip = AddBlipForEntity(npc)
    SetBlipSprite(blip, 66)
    SetBlipColour(blip, 1)
    SetBlipScale(blip, 0.85)
    SetBlipRoute(blip, true)
    ESX.ShowNotification("It's good I have a contact to whom you can sell your Lean, I put this on the GPS!")
    close = false
    while close == false do
        PedCoord = GetEntityCoords(npc)
        PlayerCoord = GetEntityCoords(ped)

        local distanceNPC = GetDistanceBetweenCoords(PedCoord, PlayerCoord, true)
        if distanceNPC <= 2.5 then
            ESX.ShowHelpNotification("Ha yeah, this drug is superb, Cimer!")
            TaskWanderStandard(npc, 10.0, 10)
            RemoveBlip(blip)
            TriggerServerEvent("Illegal:VenteLean")
            SetPedAsNoLongerNeeded(npc)
            SetEntityAsNoLongerNeeded(npc)
            close = true
        end
        Wait(100)
    end
    _menuPool3:CloseAllMenus()
end

RegisterNetEvent("Illegal:VenteNotif")
AddEventHandler("Illegal:VenteNotif", function(nombre, prix)
    PlayMissionCompleteAudio("TREVOR_SMALL_01")
    ESX.Scaleform.ShowFreemodeMessage("~o~Sale of Heroine", "~y~You sold "..nombre.." for "..prix.."$", 5)
end)

RegisterNetEvent("Illegal:VenteNotifOpium")
AddEventHandler("Illegal:VenteNotifOpium", function(nombre, prix)
    PlayMissionCompleteAudio("TREVOR_SMALL_01")
    ESX.Scaleform.ShowFreemodeMessage("~o~Sale of Opium", "~y~You sold "..nombre.." for "..prix.."$", 5)
end)

RegisterNetEvent("Illegal:VenteNotifWeed")
AddEventHandler("Illegal:VenteNotifWeed", function(nombre, prix)
    PlayMissionCompleteAudio("TREVOR_SMALL_01")
    ESX.Scaleform.ShowFreemodeMessage("~o~Sale of Weed", "~y~You sold "..nombre.." for "..prix.."$", 5)
end)

RegisterNetEvent("Illegal:VenteNotifEcstasy")
AddEventHandler("Illegal:VenteNotifEcstasy", function(nombre, prix)
    PlayMissionCompleteAudio("TREVOR_SMALL_01")
    ESX.Scaleform.ShowFreemodeMessage("~o~Sale of Ecstasy", "~y~You sold "..nombre.." for "..prix.."$", 5)
end)

RegisterNetEvent("Illegal:VenteNotifAmphetamines")
AddEventHandler("Illegal:VenteNotifAmphetamines", function(nombre, prix)
    PlayMissionCompleteAudio("TREVOR_SMALL_01")
    ESX.Scaleform.ShowFreemodeMessage("~o~Sale of Amphetamines", "~y~You sold "..nombre.." for "..prix.."$", 5)
end)

RegisterNetEvent("Illegal:VenteNotifLSD")
AddEventHandler("Illegal:VenteNotifLSD", function(nombre, prix)
    PlayMissionCompleteAudio("TREVOR_SMALL_01")
    ESX.Scaleform.ShowFreemodeMessage("~o~Sale of LSD", "~y~You sold "..nombre.." for "..prix.."$", 5)
end)

RegisterNetEvent("Illegal:VenteNotifLean")
AddEventHandler("Illegal:VenteNotifLean", function(nombre, prix)
    PlayMissionCompleteAudio("TREVOR_SMALL_01")
    ESX.Scaleform.ShowFreemodeMessage("~o~Sale of Lean", "~y~You sold "..nombre.." for "..prix.."$", 5)
end)

-- Fin