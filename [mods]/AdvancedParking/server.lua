local vehicles = {}

-- Command to delete ALL vehicles from the database table. Needs to be executed twice for security reason.
local deleteSavedVehicles = false
RegisterCommand("deleteSavedVehicles", function(source, args, raw)
    if (deleteSavedVehicles) then
        MySQL.Async.execute("DELETE FROM vehicle_parking", { })

        vehicles = {}

        Log("Deleted all vehicles from the vehicle_parking table.")
    else
        Log("Are you sure that you want to delete all vehicles from the parking list?\nIf yes, type the command a second time!")
    end

    deleteSavedVehicles = not deleteSavedVehicles
end, true)

-- read all vehicles from the database on startup and do a cleanup check
MySQL.ready(function()
    -- fetch all database results
    MySQL.Async.fetchAll("SELECT plate, posX, posY, posZ, rotX, rotY, rotZ, modifications, lastUpdate FROM vehicle_parking", {}, function(results)
        Log("Found " .. #results .. " saved vehicles in vehicle_parking.")

        for i = 1, #results do
            vehicles[results[i].plate] = {
                handle          = nil,
                position        = vector3(results[i].posX, results[i].posY, results[i].posZ),
                rotation        = vector3(results[i].rotX, results[i].rotY, results[i].rotZ),
                modifications   = json.decode(results[i].modifications),
                lastUpdate      = results[i].lastUpdate,
                spawning        = false,
	            spawningPlayer  = nil,
                faultyModel     = false
            }
        end

        CleanUp()
    end)
end)

-- Default CleanUp function. Deletes vehicles from the database after a specific amount of time has passed (configurable in config)
function CleanUp()
    local currentTime = os.time()
    local threshold = 60 * 60 * Config.cleanUpThresholdTime

    local toDelete = {}

    for plate, vehicle in pairs(vehicles) do
        if (vehicle.lastUpdate < os.difftime(currentTime, threshold)) then
            
            MySQL.Async.execute("DELETE FROM vehicle_parking WHERE plate = @plate",
            {
                ["@plate"] = plate
            })

            table.insert(toDelete, plate)
        end
    end
    
    for i = 1, #toDelete, 1 do
        local plate = toDelete[i]

        if (vehicles[plate].handle and DoesEntityExist(vehicles[plate].handle)) then
            DeleteEntity(vehicles[plate].handle)
        end

        vehicles[plate] = nil
    end

    Log("CleanUp complete. Deleted " .. #toDelete .. " entries.")
end

if (Config.useCleanUpTask) then
    AddTask(Config.cleanUpTaskTime.hours, Config.cleanUpTaskTime.minutes, Config.cleanUpTaskTime.seconds, CleanUp)
end



-- loop to spawn vehicles near players
Citizen.CreateThread(function()
    while (true) do
        Citizen.Wait(5000)

        if (GetActivePlayerCount() > 0) then
            TrySpawnVehicles()
        end
    end
end)

-- loop to delete vehicles
Citizen.CreateThread(function()
    if (Config.deleteTimer <= 0) then
        return
    end

    while (true) do
        Citizen.Wait(60000 * (Config.deleteTimer - Config.deleteNotificationTimes[1]))

        TriggerClientEvent("AdvancedParking:notification", -1, string.format(Config.timeLeftNotification, Config.deleteNotificationTimes[1]))
        for i = 2, #Config.deleteNotificationTimes, 1 do
            Citizen.Wait(60000 * (Config.deleteNotificationTimes[i - 1] - Config.deleteNotificationTimes[i]))
            TriggerClientEvent("AdvancedParking:notification", -1, string.format(Config.timeLeftNotification, Config.deleteNotificationTimes[i]))
        end
        Citizen.Wait(60000 * Config.deleteNotificationTimes[#Config.deleteNotificationTimes])

        DeleteAllVehicles()
    end
end)



-- sync player position
RegisterServerEvent("AdvancedParking:syncPlayerPosition")
AddEventHandler("AdvancedParking:syncPlayerPosition", function(position)
    activePlayerPositions[source] = position
end)

-- player disconnected
AddEventHandler("playerDropped", function(disconnectReason)
    activePlayerPositions[source] = nil
end)

-- player entered a vehicle
RegisterServerEvent("AdvancedParking:enteredVehicle")
AddEventHandler("AdvancedParking:enteredVehicle", function(networkId, plate, modifications)
    local vehicle = NetworkGetEntityFromNetworkId(networkId)

    if (DoesEntityExist(vehicle)) then
        local currentTime = os.time()
        
        local position = GetEntityCoords(vehicle)
        position = vector3(math.floor(position.x * 100.0) / 100.0, math.floor(position.y * 100.0) / 100.0, math.floor(position.z * 100.0) / 100.0)
        local rotation = GetEntityRotation(vehicle)
        rotation = vector3(math.floor(rotation.x * 100.0) / 100.0, math.floor(rotation.y * 100.0) / 100.0, math.floor(rotation.z * 100.0) / 100.0)
        
        if (vehicles[plate]) then
            -- already on server list

            Log("Entered vehicle " .. plate .. ". Updating...")
            
            if (vehicles[plate].handle ~= vehicle) then
                if (DoesEntityExist(vehicles[plate].handle)) then
                    DeleteEntity(vehicles[plate].handle)
                end
                
                vehicles[plate].handle = vehicle
            end

            vehicles[plate].position = position
            vehicles[plate].rotation = rotation
            vehicles[plate].modifications = modifications
            vehicles[plate].lastUpdate = currentTime
            
            MySQL.Async.execute("UPDATE vehicle_parking SET posX = @posX, posY = @posY, posZ = @posZ, rotX = @rotX, rotY = @rotY, rotZ = @rotZ, modifications = @modifications, lastUpdate = @lastUpdate WHERE plate = @plate", {
                ["@plate"]          = plate,
                ["@posX"]           = vehicles[plate].position.x,
                ["@posY"]           = vehicles[plate].position.y,
                ["@posZ"]           = vehicles[plate].position.z,
                ["@rotX"]           = vehicles[plate].rotation.x,
                ["@rotY"]           = vehicles[plate].rotation.y,
                ["@rotZ"]           = vehicles[plate].rotation.z,
                ["@modifications"]  = json.encode(vehicles[plate].modifications),
                ["@lastUpdate"]     = vehicles[plate].lastUpdate
            })
        else
            -- insert in db
            
            Log("Entered vehicle " .. plate .. ". Inserting new...")

            vehicles[plate] = {
                handle          = vehicle,
                position        = position,
                rotation        = rotation,
                modifications   = modifications,
                lastUpdate      = currentTime,
                spawning        = false,
	            spawningPlayer  = nil
            }

            MySQL.Async.execute("INSERT INTO vehicle_parking (plate, posX, posY, posZ, rotX, rotY, rotZ, modifications, lastUpdate) VALUES (@plate, @posX, @posY, @posZ, @rotX, @rotY, @rotZ, @modifications, @lastUpdate)", {
                ["@plate"]          = plate,
                ["@posX"]           = vehicles[plate].position.x,
                ["@posY"]           = vehicles[plate].position.y,
                ["@posZ"]           = vehicles[plate].position.z,
                ["@rotX"]           = vehicles[plate].rotation.x,
                ["@rotY"]           = vehicles[plate].rotation.y,
                ["@rotZ"]           = vehicles[plate].rotation.z,
                ["@modifications"]  = json.encode(vehicles[plate].modifications),
                ["@lastUpdate"]     = vehicles[plate].lastUpdate
            })
        end
    else
        print("Vehicle does not exist. Might be a Onesync error.")
    end
end)

-- player left a vehicle
RegisterServerEvent("AdvancedParking:leftVehicle")
AddEventHandler("AdvancedParking:leftVehicle", function(networkId, modifications)
    local vehicle = NetworkGetEntityFromNetworkId(networkId)

    if (DoesEntityExist(vehicle)) then
        local currentTime = os.time()
        
        local plate = GetVehicleNumberPlateText(vehicle)
        
        local position = GetEntityCoords(vehicle)
        position = vector3(math.floor(position.x * 100.0) / 100.0, math.floor(position.y * 100.0) / 100.0, math.floor(position.z * 100.0) / 100.0)
        local rotation = GetEntityRotation(vehicle)
        rotation = vector3(math.floor(rotation.x * 100.0) / 100.0, math.floor(rotation.y * 100.0) / 100.0, math.floor(rotation.z * 100.0) / 100.0)
        
        if (vehicles[plate]) then
            -- already on server list
            
            Log("Left vehicle " .. plate .. ". Updating...")
            
            if (vehicles[plate].handle ~= vehicle) then
                if (DoesEntityExist(vehicles[plate].handle)) then
                    DeleteEntity(vehicles[plate].handle)
                end
                
                vehicles[plate].handle = vehicle
            end

            vehicles[plate].position = position
            vehicles[plate].rotation = rotation
            vehicles[plate].modifications = modifications
            vehicles[plate].lastUpdate = currentTime

            MySQL.Async.execute("UPDATE vehicle_parking SET posX = @posX, posY = @posY, posZ = @posZ, rotX = @rotX, rotY = @rotY, rotZ = @rotZ, modifications = @modifications, lastUpdate = @lastUpdate WHERE plate = @plate",{
                ["@plate"]          = plate,
                ["@posX"]           = vehicles[plate].position.x,
                ["@posY"]           = vehicles[plate].position.y,
                ["@posZ"]           = vehicles[plate].position.z,
                ["@rotX"]           = vehicles[plate].rotation.x,
                ["@rotY"]           = vehicles[plate].rotation.y,
                ["@rotZ"]           = vehicles[plate].rotation.z,
                ["@modifications"]  = json.encode(vehicles[plate].modifications),
                ["@lastUpdate"]     = currentTime
            })
        else
            -- insert in db
            
            Log("Left vehicle " .. plate .. ". Inserting new...")
            
            vehicles[plate] = {
                handle          = vehicle,
                position        = position,
                rotation        = rotation,
                modifications   = modifications,
                lastUpdate      = currentTime,
                spawning        = false,
	            spawningPlayer  = nil
            }

            MySQL.Async.execute("INSERT INTO vehicle_parking (plate, posX, posY, posZ, rotX, rotY, rotZ, modifications, lastUpdate) VALUES (@plate, @posX, @posY, @posZ, @rotX, @rotY, @rotZ, @modifications, @lastUpdate)",{
                ["@plate"]          = plate,
                ["@posX"]           = vehicles[plate].position.x,
                ["@posY"]           = vehicles[plate].position.y,
                ["@posZ"]           = vehicles[plate].position.z,
                ["@rotX"]           = vehicles[plate].rotation.x,
                ["@rotY"]           = vehicles[plate].rotation.y,
                ["@rotZ"]           = vehicles[plate].rotation.z,
                ["@modifications"]  = json.encode(vehicles[plate].modifications),
                ["@lastUpdate"]     = vehicles[plate].lastUpdate
            })
        end
    end
end)

-- update a vehicle with its modifications
RegisterServerEvent("AdvancedParking:updateVehicle")
AddEventHandler("AdvancedParking:updateVehicle", function(networkId, modifications)
    local vehicle = NetworkGetEntityFromNetworkId(networkId)
    
    if (DoesEntityExist(vehicle)) then
        local currentTime = os.time()

        local plate = GetVehicleNumberPlateText(vehicle)
        
        local position = GetEntityCoords(vehicle)
        position = vector3(math.floor(position.x * 100.0) / 100.0, math.floor(position.y * 100.0) / 100.0, math.floor(position.z * 100.0) / 100.0)
        local rotation = GetEntityRotation(vehicle)
        rotation = vector3(math.floor(rotation.x * 100.0) / 100.0, math.floor(rotation.y * 100.0) / 100.0, math.floor(rotation.z * 100.0) / 100.0)
        
        if (vehicles[plate] ~= nil) then
            -- already on server list
            
            Log("Updating vehicle " .. plate)
            
            if (vehicles[plate].handle ~= vehicle) then
                if (DoesEntityExist(vehicles[plate].handle)) then
                    DeleteEntity(vehicles[plate].handle)
                end

                vehicles[plate].handle = vehicle
            end

            vehicles[plate].position = position
            vehicles[plate].rotation = rotation
            vehicles[plate].modifications = modifications
            vehicles[plate].lastUpdate = currentTime

            MySQL.Async.execute("UPDATE vehicle_parking SET posX = @posX, posY = @posY, posZ = @posZ, rotX = @rotX, rotY = @rotY, rotZ = @rotZ, modifications = @modifications, lastUpdate = @lastUpdate WHERE plate = @plate",{
                ["@plate"]          = plate,
                ["@posX"]           = vehicles[plate].position.x,
                ["@posY"]           = vehicles[plate].position.y,
                ["@posZ"]           = vehicles[plate].position.z,
                ["@rotX"]           = vehicles[plate].rotation.x,
                ["@rotY"]           = vehicles[plate].rotation.y,
                ["@rotZ"]           = vehicles[plate].rotation.z,
                ["@modifications"]  = json.encode(vehicles[plate].modifications),
                ["@lastUpdate"]     = vehicles[plate].lastUpdate
            })
        else
            -- insert in db
            
            Log("Updating vehicle " .. plate .. ". Inserting new...")
            
            vehicles[plate] = {
                handle          = vehicle,
                position        = position,
                rotation        = rotation,
                modifications   = modifications,
                lastUpdate      = currentTime,
                spawning        = false,
	            spawningPlayer  = nil
            }

            MySQL.Async.execute("INSERT INTO vehicle_parking (plate, posX, posY, posZ, rotX, rotY, rotZ, modifications, lastUpdate) VALUES (@plate, @posX, @posY, @posZ, @rotX, @rotY, @rotZ, @modifications, @lastUpdate)",{
                ["@plate"]          = plate,
                ["@posX"]           = vehicles[plate].position.x,
                ["@posY"]           = vehicles[plate].position.y,
                ["@posZ"]           = vehicles[plate].position.z,
                ["@rotX"]           = vehicles[plate].rotation.x,
                ["@rotY"]           = vehicles[plate].rotation.y,
                ["@rotZ"]           = vehicles[plate].rotation.z,
                ["@modifications"]  = json.encode(vehicles[plate].modifications),
                ["@lastUpdate"]     = vehicles[plate].lastUpdate
            })
        end
    end
end)

-- delete a vehicle from the table (and world) with its plate
RegisterServerEvent("AdvancedParking:deleteVehicle")
AddEventHandler("AdvancedParking:deleteVehicle", function(plate, deleteEntity)
    if (plate == nil) then
        print("^1AdvancedParking: \"plate\" was nil while trying to delete vehicle!")
        return
    end

    Log("Trying to delete " .. tostring(plate))

    if (vehicles[plate] ~= nil) then
        if (deleteEntity and DoesEntityExist(vehicles[plate].handle)) then
            DeleteEntity(vehicles[plate].handle)
        end

        vehicles[plate] = nil
        
        MySQL.Async.execute("DELETE FROM vehicle_parking WHERE plate = @plate",
        {
            ["@plate"] = plate
        })
    else
        local loadedVehicles = GetAllVehicles()
        local loadedVehicle = TryGetLoadedVehicle(plate, loadedVehicles)

        if (loadedVehicle ~= nil) then
            if (deleteEntity and DoesEntityExist(loadedVehicle)) then
                DeleteEntity(loadedVehicle)
            end
            
            MySQL.Async.execute("DELETE FROM vehicle_parking WHERE plate = @plate",
            {
                ["@plate"] = plate
            })
        end
    end
end)

-- checks if vehicles have to be spawned and spawns them if necessary
function TrySpawnVehicles()
    local loadedVehicles = GetAllVehicles()

    local playerVehiclePlates = {}
    for id, position in pairs(activePlayerPositions) do
        local ped = GetPlayerPed(id)
        local veh = GetVehiclePedIsIn(ped, false)

        if (DoesEntityExist(veh)) then
            table.insert(playerVehiclePlates, GetVehicleNumberPlateText(veh))
        end
    end

    -- check, if vehicles need to be spawned
    for plate, vehicleData in pairs(vehicles) do
        if (not vehicleData.faultyModel) then
            if (not vehicleData.spawning) then
                local closestPlayer, dist = GetClosestPlayerId(vehicleData.position)

                if (closestPlayer ~= nil and dist < Config.spawnDistance and not ContainsPlate(plate, playerVehiclePlates)) then
                    if (vehicleData.handle ~= nil and DoesEntityExist(vehicleData.handle)) then
                        -- vehicle found on server side
                    
                        UpdateVehicle(plate)
                    else
                        -- vehicle not found on server side
                        -- check, if it is loaded differently

                        local loadedVehicle = TryGetLoadedVehicle(plate, loadedVehicles)
                        if (loadedVehicle ~= nil) then
                            -- vehicle found

                            vehicleData.handle = loadedVehicle
                    
                            UpdateVehicle(plate)
                        else
                            -- vehicle not found
                            -- try and spawn it
                    
                            local playerId, distance = GetClosestPlayerId(vehicleData.position)
                            if (playerId and distance < Config.spawnDistance) then
                                vehicleData.spawning = true

                                Citizen.CreateThread(function()
                                    local vec4 = vector4(vehicleData.position.x, vehicleData.position.y, vehicleData.position.z, vehicleData.rotation.z)
                                    local vehicle = Citizen.InvokeNative(GetHashKey("CREATE_AUTOMOBILE"), vehicleData.modifications[1], vec4.xyzw)

                                    while (not DoesEntityExist(vehicle)) do
                                        Citizen.Wait(0)
                                    end

                                    SetEntityCoords(vehicle, vehicleData.position.x, vehicleData.position.y, vehicleData.position.z)
                                    SetEntityRotation(vehicle, vehicleData.rotation.x, vehicleData.rotation.y, vehicleData.rotation.z)

                                    vehicleData.handle = vehicle
                                
                                    local networkOwner = -1
                                    while (networkOwner == -1) do
                                        Citizen.Wait(0)
                                        networkOwner = NetworkGetEntityOwner(vehicleData.handle)
                                    end

                                    vehicleData.spawningPlayer = GetPlayerIdentifiersSorted(networkOwner)["license"]
                                
                                    Log("Creating vehicle " .. plate .. " at " .. tostring(vehicleData.position) .. " at entity owner " .. tostring(networkOwner))

                                    TriggerClientEvent("AdvancedParking:setVehicleMods", networkOwner, NetworkGetNetworkIdFromEntity(vehicleData.handle), plate, vehicleData.modifications)
                                end)
                            end
                        end
                    end
                end
            elseif (vehicleData.spawningPlayer) then
                -- if vehicle is currently spawning check if responsible player is still connected
                if (not IsPlayerWithLicenseActive(vehicleData.spawningPlayer)) then
                    TriggerEvent("AdvancedParking:setVehicleModsFailed", plate)
                end
            end
        end
    end
end

RegisterServerEvent("AdvancedParking:setVehicleModsSuccess")
AddEventHandler("AdvancedParking:setVehicleModsSuccess", function(plate)
    Log("Setting mods successful...")

    if (vehicles[plate]) then
        vehicles[plate].spawning = false
        vehicles[plate].spawningPlayer = nil
    end
end)

RegisterServerEvent("AdvancedParking:setVehicleModsFailed")
AddEventHandler("AdvancedParking:setVehicleModsFailed", function(plate)
    Log("Setting mods for " .. plate .. " failed... retrying...")

    if (vehicles[plate] and vehicles[plate].handle and DoesEntityExist(vehicles[plate].handle)) then
        local networkOwner = -1
        while (networkOwner == -1) do
            Citizen.Wait(0)
            networkOwner = NetworkGetEntityOwner(vehicles[plate].handle)
        end

        local netOwnerLicense = GetPlayerIdentifiersSorted(networkOwner)["license"]
        if (netOwnerLicense ~= nil) then
            vehicles[plate].spawningPlayer = GetPlayerIdentifiersSorted(networkOwner)["license"]

            TriggerClientEvent("AdvancedParking:setVehicleMods", networkOwner, NetworkGetNetworkIdFromEntity(vehicles[plate].handle), plate, vehicles[plate].modifications)
        else
            Log("Something went wrong while trying to get player license for spawning vehicle " .. tostring(plate) .. ". Despawning vehicle")

            DeleteEntity(vehicles[plate].handle)

            vehicles[plate].handle = nil
            vehicles[plate].spawningPlayer = nil
            vehicles[plate].spawning = false
        end
    end
end)

RegisterServerEvent("AdvancedParking:modelDoesNotExist")
AddEventHandler("AdvancedParking:modelDoesNotExist", function(plate)
    if (vehicles[plate] == nil) then
        return
    end

    if (DoesEntityExist(vehicles[plate].handle)) then
        DeleteEntity(vehicles[plate].handle)
    end
    vehicles[plate].handle = nil
    vehicles[plate].spawningPlayer = nil
    vehicles[plate].spawning = false

    Log("The model for vehicle " .. tostring(plate) .. " does not exist. Removing from spawn pool...")

    vehicles[plate].faultyModel = true
end)



function UpdatePlate(netId, newPlate, oldPlate)
    if (netId == nil) then
        print("^1AdvancedParking: \"netId\" was nil while trying to update a plate!")
        return
    end
    if (newPlate == nil or newPlate:len() > 8) then
        print("^1AdvancedParking: \"newPlate\" was nil or too long while trying to update a plate!")
        return
    end

    newPlate = newPlate:gsub("^%s*(.-)%s*$", "%1"):upper()
    if (oldPlate) then
        oldPlate = oldPlate:gsub("^%s*(.-)%s*$", "%1"):upper()
    end
    
    Log("Changing plate from " .. tostring(netId) .. " to " .. tostring(newPlate))

    local vehicle = NetworkGetEntityFromNetworkId(netId)
    if (DoesEntityExist(vehicle)) then
        SetVehicleNumberPlateText(vehicle, newPlate)

        local found = false
        while (not found) do
            Citizen.Wait(0)

            found = GetVehicleNumberPlateText(vehicle):gsub("^%s*(.-)%s*$", "%1") == newPlate
        end

        newPlate = GetVehicleNumberPlateText(vehicle)
    end

    -- search for plate
    for plate, vehicleData in pairs(vehicles) do
        if (vehicle == vehicleData.handle) then
            vehicles[newPlate] = vehicles[plate]
            vehicles[plate] = nil
            
            Log("Updating plate successful!")
    
            MySQL.Async.execute("UPDATE vehicle_parking SET plate = @newPlate WHERE plate = @oldPlate",
            {
                ["@newPlate"] = newPlate,
                ["@oldPlate"] = plate
            })
    
            return
        end
    end
    
    -- search for plate by using oldPlate
    if (oldPlate) then
        newPlate = FillPlateWithSpaces(newPlate)
        for plate, vehicleData in pairs(vehicles) do
            if (plate:gsub("^%s*(.-)%s*$", "%1") == oldPlate) then
                vehicles[newPlate] = vehicles[plate]
                vehicles[plate] = nil
            
                Log("Updating plate successful!")
    
                MySQL.Async.execute("UPDATE vehicle_parking SET plate = @newPlate WHERE plate = @oldPlate",
                {
                    ["@newPlate"] = newPlate,
                    ["@oldPlate"] = plate
                })
    
                return
            end
        end
    end
end

function FillPlateWithSpaces(plate)
    local length = plate:len()
    
    if (length == 0) then
        plate = "        "
    elseif (length == 1) then
        plate = "   " .. plate .. "    "
    elseif (length == 2) then
        plate = "   " .. plate .. "   "
    elseif (length == 3) then
        plate = "  " .. plate .. "   "
    elseif (length == 4) then
        plate = "  " .. plate .. "  "
    elseif (length == 5) then
        plate = " " .. plate .. "  "
    elseif (length == 6) then
        plate = " " .. plate .. " "
    elseif (length == 7) then
        plate = plate .. " "
    end

    return plate
end

RegisterServerEvent("AdvancedParking:updatePlate")
AddEventHandler("AdvancedParking:updatePlate", function(netId, newPlate)
    UpdatePlate(netId, newPlate)
end)

function UpdateVehicle(plate)
    local newPos = GetEntityCoords(vehicles[plate].handle)
    local newRot = GetEntityRotation(vehicles[plate].handle)
    newPos = vector3(math.floor(newPos.x * 100.0) * 0.01, math.floor(newPos.y * 100.0) * 0.01, math.floor(newPos.z * 100.0) * 0.01)
    newRot = vector3(math.floor(newRot.x * 100.0) * 0.01, math.floor(newRot.y * 100.0) * 0.01, math.floor(newRot.z * 100.0) * 0.01)
            
    local newLockStatus     = GetVehicleDoorLockStatus(vehicles[plate].handle)
    local newEngineHealth   = math.floor(GetVehicleEngineHealth(vehicles[plate].handle) * 10.0) * 0.1
    local newTankHealth     = math.floor(GetVehiclePetrolTankHealth(vehicles[plate].handle) * 10.0) * 0.1
    if (Vector3DistFast(vehicles[plate].position, newPos) > 1.0 
        or GetRotationDifference(vehicles[plate].rotation, newRot) > 15.0
        or newLockStatus ~= vehicles[plate].modifications[2]
        or math.abs(newEngineHealth - vehicles[plate].modifications[5]) > 5.0
        or math.abs(newTankHealth - vehicles[plate].modifications[6]) > 5.0
    ) then
        vehicles[plate].modifications[2] = newLockStatus
        vehicles[plate].modifications[5] = newEngineHealth
        vehicles[plate].modifications[6] = newTankHealth
                
        Log("Updating vehicle " .. plate)
        
        vehicles[plate].position = newPos
        vehicles[plate].rotation = newRot

        MySQL.Async.execute("UPDATE vehicle_parking SET posX = @posX, posY = @posY, posZ = @posZ, rotX = @rotX, rotY = @rotY, rotZ = @rotZ, modifications = @modifications WHERE plate = @plate",
        {
            ["@posX"]           = vehicles[plate].position.x,
            ["@posY"]           = vehicles[plate].position.y,
            ["@posZ"]           = vehicles[plate].position.z,
            ["@rotX"]           = vehicles[plate].rotation.x,
            ["@rotY"]           = vehicles[plate].rotation.y,
            ["@rotZ"]           = vehicles[plate].rotation.z,
            ["@modifications"]  = json.encode(vehicles[plate].modifications),
            ["@plate"]          = plate
        })
    end
end

function DeleteAllVehicles()
    TriggerClientEvent("AdvancedParking:notification", -1, Config.deleteNotification)

    local peds = GetAllPeds()
    local playerPeds = {}
    for i = 1, #peds, 1 do
        if (IsPedAPlayer(peds[i])) then
            table.insert(playerPeds, peds[i])
        end
    end

    if (#playerPeds == 0) then
        return
    end
    
    local time = GetGameTimer()

    local vehs = GetAllVehicles()
    local deleted = 0
    for i = 1, #vehs, 1 do
        if (not IsAnyPlayerInsideVehicle(vehs[i], playerPeds)) then
            local closestPlayer, distance = GetClosestPlayerPed(GetEntityCoords(vehs[i]), playerPeds)
            if (closestPlayer ~= nil and distance > Config.deleteDistance) then
                local plate = GetVehicleNumberPlateText(vehs[i])
                if (vehicles[plate] ~= nil) then
                    vehicles[plate] = nil
                    
                    MySQL.Async.execute("DELETE FROM vehicle_parking WHERE plate = @plate",
                    {
                        ["@plate"] = plate
                    })
                end

                DeleteEntity(vehs[i])

                deleted = deleted + 1
            end
        end
    end
    
    Log("Deleted " .. tostring(deleted) .. "/" .. tostring(#vehs) .. " vehicles. Took " .. tostring((GetGameTimer() - time) / 1000.0) .. "sec")
end

AddEventHandler("onResourceStop", function(name)
    if (name ~= GetCurrentResourceName()) then
        return
    end

    -- delete vehicles that are still being spawned before actually stopping the resource
    for plate, vehicleData in pairs(vehicles) do
        if (vehicleData.spawning and DoesEntityExist(vehicleData.handle)) then
            DeleteEntity(vehicleData.handle)
        end
    end
end)

-- render entity scorched (trigger with netid of the vehicle and false when repairing)
RegisterServerEvent("AdvancedParking:renderScorched")
AddEventHandler("AdvancedParking:renderScorched", function(vehicleNetId, scorched)
    local vehicleHandle = NetworkGetEntityFromNetworkId(vehicleNetId)
    if (DoesEntityExist(vehicleHandle)) then
        TriggerClientEvent("AdvancedParking:renderScorched", -1, vehicleNetId, scorched)
    end
end)

function GetVehiclePosition(plate)
    local vehs = GetAllVehicles()

    plate = plate:upper()
    
    for i, veh in ipairs(vehs) do
        local vehPlate = GetVehicleNumberPlateText(veh)
        if (plate == vehPlate or plate == string.gsub(vehPlate, "^%s*(.-)%s*$", "%1")) then
            return GetEntityCoords(veh)
        end
    end

    for vehPlate, vehData in pairs(vehicles) do
        if (plate == vehPlate or plate == string.gsub(vehPlate, "^%s*(.-)%s*$", "%1")) then
            return vehData.position
        end
    end
    
    return nil
end

function GetVehiclePositions(plates)
    local platePositions = {}
    
    for i, plate in ipairs(plates) do
        plate = plate:upper()
    end

    local vehs = GetAllVehicles()
    for i, veh in ipairs(vehs) do
        local vehPlate = GetVehicleNumberPlateText(veh)
        local trimmedVehPlate = string.gsub(vehPlate, "^%s*(.-)%s*$", "%1")

        for j, plate in ipairs(plates) do
            if (plate == vehPlate or plate == trimmedVehPlate) then
                platePositions[plate] = GetEntityCoords(veh)

                break
            end
        end
    end
    
    for i, plate in ipairs(plates) do
        if (platePositions[plate] == nil) then
            for vehPlate, vehData in pairs(vehicles) do
                local trimmedVehPlate = string.gsub(vehPlate, "^%s*(.-)%s*$", "%1")

                if (plate == vehPlate or plate == trimmedVehPlate) then
                    platePositions[plate] = vehData.position

                    break
                end
            end
        end
    end

    return platePositions
end

if (GetResourceState("kimi_callbacks") == "started") then
    exports["kimi_callbacks"]:Register("AP:getVehiclePosition", function(source, plate)
        return GetVehiclePosition(plate)
    end)

    exports["kimi_callbacks"]:Register("AP:getVehiclePositions", function(source, plates)
        GetVehiclePositions(plates)
    end)

    if (Config.saveOnlyESXOwnedVehicles) then
        exports["kimi_callbacks"]:Register("AP:getVehicleOwnership", function(source, plate, model)
            local trimmedPlate = string.gsub(plate, "^%s*(.-)%s*$", "%1")
            local results = MySQL.Sync.fetchAll('SELECT plate FROM owned_vehicles WHERE plate = @plate OR plate = @trimmedPlate', {
			    ['@plate'] = plate,
			    ['@trimmedPlate'] = trimmedPlate
		    })

            return #results > 0
        end)
    end
end

--https://docs.fivem.net/natives/?_0x48C80210
--https://docs.fivem.net/natives/?_0x6E35C49C
