ESX = nil

if Config.UseESX then
	Citizen.CreateThread(function()
		while not ESX do
			TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

			Citizen.Wait(500)
		end
	end)
end

AddEventHandler('pwasher:onPumpBreak', function()
    if Config.UseESX then
        ShowNotification("~r~You Broke The Pressure Pump, A Fee Of ~g~$" .. Config.PumpBreakFee .. "~r~ Have Been Deducted!")
        TriggerServerEvent('pwasher:pay', Config.PumpBreakFee)
	else 
        --Do nothing (No Fee)
        ShowNotification("~r~You broke the pressure pump!")
    end
end)

AddEventHandler('pwasher:requestEquipPump', function()
    if Config.UseESX then
		local currentCash = ESX.GetPlayerData().money
        if currentCash >= Config.PumpUsePrice then
            TriggerEvent("pwasher:equipPump")
            TriggerServerEvent('pwasher:pay', Config.PumpUsePrice)
        else
            ShowNotification("~r~You don't have enough money to use the pressure pump!")
        end
	else 
        TriggerEvent("pwasher:equipPump")
    end
end)

AddEventHandler('pwasher:playSplashParticle', function(pname, posx, posy, posz, heading)
	Citizen.CreateThread(function()
        UseParticleFxAssetNextCall("core")
        local pfx = StartParticleFxLoopedAtCoord(pname, posx, posy, posz, 0.0, 0.0, heading, 1.0, false, false, false, false)
        Citizen.Wait(100)
        StopParticleFxLooped(pfx, 0)
    end)
end)

AddEventHandler('pwasher:playWaterParticle', function(pname, entity, density)
    print("Play Particle")
	Citizen.CreateThread(function()
        for i = 0, density, 1 do
            UseParticleFxAssetNextCall("core")
            StartParticleFxNonLoopedOnEntity(pname, objID, 0.5, 0.0, 0.0, 90.0, 0.0, -90.0, 1.0, true, true, true)
        end
    end)
end)

Citizen.CreateThread(function()
    RequestNamedPtfxAsset("core")
    while not HasNamedPtfxAssetLoaded("core") do
         Citizen.Wait(1)
    end
end)

function ShowNotification(msg)
	SetNotificationTextEntry('STRING')
	AddTextComponentString(msg)
	DrawNotification(0,1)
end