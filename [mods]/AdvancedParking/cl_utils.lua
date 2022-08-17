-- logs text to the console
function Log(text)
    if (Config.isDebug) then
        print(text)
    end
end

-- Return all vehicle modifications in an array
function GetVehicleModifications(vehicle)
    local color1, color2               = GetVehicleColours(vehicle)
    local pearlescentColor, wheelColor = GetVehicleExtraColours(vehicle)

    local extras = {}
    for i = 0, 20, 1 do
        if (DoesExtraExist(vehicle, i)) then
            if (IsVehicleExtraTurnedOn(vehicle, i)) then
                table.insert(extras, { i, 0 })
            else
                table.insert(extras, { i, 1 })
            end
        end
    end

    local tiresBurst = {}
    for i = 0, 5, 1 do
        if (IsVehicleTyreBurst(vehicle, i, true)) then
            table.insert(tiresBurst, { i, true })
        elseif (IsVehicleTyreBurst(vehicle, i, false)) then
            table.insert(tiresBurst, { i, false })
        end
    end
    
    local doorsMissing = {}
    for i = 0, 7, 1 do
        if (IsVehicleDoorDamaged(vehicle, i)) then
            table.insert(doorsMissing, i)
        end
    end

    local windowsBroken = {}
    --for i = 0, 13, 1 do
    --    if (not IsVehicleWindowIntact(vehicle, i)) then
    --        table.insert(windowsBroken, i)
    --    end
    --end

    -- custom colors
    local hasCustomPrimaryColor = GetIsVehiclePrimaryColourCustom(vehicle)
    local customPrimaryColor = nil
    if (hasCustomPrimaryColor) then
        local r, g, b = GetVehicleCustomPrimaryColour(vehicle)
        customPrimaryColor = { r, g, b }
    end
    
    local hasCustomSecondaryColor = GetIsVehicleSecondaryColourCustom(vehicle)
    local customSecondaryColor = nil
    if (hasCustomSecondaryColor) then
        local r, g, b = GetVehicleCustomSecondaryColour(vehicle)
        customSecondaryColor = { r, g, b }
    end
    
    return {
        -- 1 model
        GetEntityModel(vehicle),
        
        -- 2 lockStatus
        GetVehicleDoorLockStatus(vehicle),
        
        -- 3 health
        math.floor(GetEntityHealth(vehicle) * 10.0) / 10.0,
        -- 4 bodyHealth
        math.floor(GetVehicleBodyHealth(vehicle) * 10.0) / 10.0,
        -- 5 engineHealth
        math.floor(GetVehicleEngineHealth(vehicle) * 10.0) / 10.0,
        -- 6 petrolTankHealth
        math.floor(GetVehiclePetrolTankHealth(vehicle) * 10.0) / 10.0,

        -- 7 dirtLevel
        math.floor(GetVehicleDirtLevel(vehicle) * 10.0) / 10.0,
        -- 8 fuelLevel
        math.floor(GetVehicleFuelLevel(vehicle) * 10.0) / 10.0,

        -- 9 plateIndex
        GetVehicleNumberPlateTextIndex(vehicle),
        
        -- 10 primaryColor
        color1,
        -- 11 secondaryColor
        color2,
        -- 12 pearlescentColor
        pearlescentColor,
        -- 13 wheelColor
        wheelColor,
        
        -- 14 wheelType
        GetVehicleWheelType(vehicle),
        -- 15 customWheelsFront
        GetVehicleModVariation(vehicle, 23);
        -- 16 customWheelsBack
        GetVehicleModVariation(vehicle, 24);
        -- 17 windowTint
        GetVehicleWindowTint(vehicle),
        -- 18 enabledNeon
        {
            IsVehicleNeonLightEnabled(vehicle, 0),
            IsVehicleNeonLightEnabled(vehicle, 1),
            IsVehicleNeonLightEnabled(vehicle, 2),
            IsVehicleNeonLightEnabled(vehicle, 3),
        },
        -- 19 neonColor
        table.pack(GetVehicleNeonLightsColour(vehicle)),
        -- 20 tireSmokeColor
        table.pack(GetVehicleTyreSmokeColor(vehicle)),
		
        -- 21 extras
        extras,

        -- 22-32 mods
        GetVehicleMod(vehicle, 0),
        GetVehicleMod(vehicle, 1),
        GetVehicleMod(vehicle, 2),
        GetVehicleMod(vehicle, 3),
        GetVehicleMod(vehicle, 4),
        GetVehicleMod(vehicle, 5),
        GetVehicleMod(vehicle, 6),
        GetVehicleMod(vehicle, 7),
        GetVehicleMod(vehicle, 8),
        GetVehicleMod(vehicle, 9),
        GetVehicleMod(vehicle, 10),
        
        -- 33-38 mods
        GetVehicleMod(vehicle, 11),
        GetVehicleMod(vehicle, 12),
        GetVehicleMod(vehicle, 13),
        GetVehicleMod(vehicle, 14),
        GetVehicleMod(vehicle, 15),
        GetVehicleMod(vehicle, 16),
        
        -- 39-41 mods
        IsToggleModOn(vehicle,  18),
        IsToggleModOn(vehicle,  20),
        IsToggleModOn(vehicle,  22),
        
        -- 42-43 mods
        GetVehicleMod(vehicle, 23),
        GetVehicleMod(vehicle, 24),
        
        -- 44-66 mods
        GetVehicleMod(vehicle, 25),
        GetVehicleMod(vehicle, 26),
        GetVehicleMod(vehicle, 27),
        GetVehicleMod(vehicle, 28),
        GetVehicleMod(vehicle, 29),
        GetVehicleMod(vehicle, 30),
        GetVehicleMod(vehicle, 31),
        GetVehicleMod(vehicle, 32),
        GetVehicleMod(vehicle, 33),
        GetVehicleMod(vehicle, 34),
        GetVehicleMod(vehicle, 35),
        GetVehicleMod(vehicle, 36),
        GetVehicleMod(vehicle, 37),
        GetVehicleMod(vehicle, 38),
        GetVehicleMod(vehicle, 39),
        GetVehicleMod(vehicle, 40),
        GetVehicleMod(vehicle, 41),
        GetVehicleMod(vehicle, 42),
        GetVehicleMod(vehicle, 43),
        GetVehicleMod(vehicle, 44),
        GetVehicleMod(vehicle, 45),
        GetVehicleMod(vehicle, 46),
        GetVehicleMod(vehicle, 48),

        -- 67 livery
        GetVehicleLivery(vehicle),

        -- 68 missingDoors
        doorsMissing,

        -- 69 bulletproofTires
        not GetVehicleTyresCanBurst(vehicle),
        -- 70 tiresBurst
        tiresBurst,

        -- 71 brokenWindows
        windowsBroken,

        -- 72 xenon lights
        GetVehicleXenonLightsColour(vehicle),

        -- 73 custom primary color
        customPrimaryColor,
        -- 74 custom secondary color
        customSecondaryColor,

        -- 75 interior color
        GetVehicleInteriorColor(vehicle)
    }
end

-- Apply all modifications to a vehicle entity
function SetVehicleModifications(vehicle, plate, modifications)
    SetVehicleModKit(vehicle, 0)

    -- plate
    SetVehicleNumberPlateText(vehicle, plate)
    SetVehicleNumberPlateTextIndex(vehicle, modifications[9])
    
    -- lockStatus
    SetVehicleDoorsLocked(vehicle, modifications[2])
    
    -- colours
    SetVehicleColours(vehicle, modifications[10], modifications[11])
    if (modifications[73]) then
        SetVehicleCustomPrimaryColour(vehicle, modifications[73][1], modifications[73][2], modifications[73][3])
    end
    if (modifications[74]) then
        SetVehicleCustomSecondaryColour(vehicle, modifications[74][1], modifications[74][2], modifications[74][3])
    end
    if (modifications[75]) then
        SetVehicleInteriorColor(vehicle, modifications[75])
    end
    
    SetVehicleExtraColours(vehicle, modifications[12], modifications[13])
    
    SetVehicleTyreSmokeColor(vehicle, modifications[20][1], modifications[20][2], modifications[20][3])

    -- wheels
    SetVehicleWheelType(vehicle, modifications[14])

    -- windows
    SetVehicleWindowTint(vehicle, modifications[17])
    
    -- neonlight
    SetVehicleNeonLightEnabled(vehicle, 0, modifications[18][1])
    SetVehicleNeonLightEnabled(vehicle, 1, modifications[18][2])
    SetVehicleNeonLightEnabled(vehicle, 2, modifications[18][3])
    SetVehicleNeonLightEnabled(vehicle, 3, modifications[18][4])
    
    SetVehicleNeonLightsColour(vehicle, modifications[19][1], modifications[19][2], modifications[19][3])
    
    -- mods
    SetVehicleMod(vehicle,  0, modifications[22], modifications[15])
    SetVehicleMod(vehicle,  1, modifications[23], modifications[15])
    SetVehicleMod(vehicle,  2, modifications[24], modifications[15])
    SetVehicleMod(vehicle,  3, modifications[25], modifications[15])
    SetVehicleMod(vehicle,  4, modifications[26], modifications[15])
    SetVehicleMod(vehicle,  5, modifications[27], modifications[15])
    SetVehicleMod(vehicle,  6, modifications[28], modifications[15])
    SetVehicleMod(vehicle,  7, modifications[29], modifications[15])
    SetVehicleMod(vehicle,  8, modifications[30], modifications[15])
    SetVehicleMod(vehicle,  9, modifications[31], modifications[15])
    SetVehicleMod(vehicle, 10, modifications[32], modifications[15])
    
    SetVehicleMod(vehicle, 11, modifications[33], modifications[15])
    SetVehicleMod(vehicle, 12, modifications[34], modifications[15])
    SetVehicleMod(vehicle, 13, modifications[35], modifications[15])
    
    SetVehicleMod(vehicle, 14, modifications[36], modifications[15])
    
    SetVehicleMod(vehicle, 15, modifications[37], modifications[15])
    SetVehicleMod(vehicle, 16, modifications[38], modifications[15])
    
    ToggleVehicleMod(vehicle, 18, modifications[39])
    ToggleVehicleMod(vehicle, 20, modifications[40])
    ToggleVehicleMod(vehicle, 22, modifications[41])
    
    SetVehicleMod(vehicle, 23, modifications[42], modifications[15])
    SetVehicleMod(vehicle, 24, modifications[43], modifications[16])
    
    SetVehicleMod(vehicle, 25, modifications[44], modifications[15])
    SetVehicleMod(vehicle, 26, modifications[45], modifications[15])
    SetVehicleMod(vehicle, 27, modifications[46], modifications[15])
    SetVehicleMod(vehicle, 28, modifications[47], modifications[15])
    SetVehicleMod(vehicle, 29, modifications[48], modifications[15])
    SetVehicleMod(vehicle, 30, modifications[49], modifications[15])
    SetVehicleMod(vehicle, 31, modifications[50], modifications[15])
    SetVehicleMod(vehicle, 32, modifications[51], modifications[15])
    SetVehicleMod(vehicle, 33, modifications[52], modifications[15])
    SetVehicleMod(vehicle, 34, modifications[53], modifications[15])
    SetVehicleMod(vehicle, 35, modifications[54], modifications[15])
    SetVehicleMod(vehicle, 36, modifications[55], modifications[15])
    SetVehicleMod(vehicle, 37, modifications[56], modifications[15])
    SetVehicleMod(vehicle, 38, modifications[57], modifications[15])
    SetVehicleMod(vehicle, 39, modifications[58], modifications[15])
    SetVehicleMod(vehicle, 40, modifications[59], modifications[15])
    SetVehicleMod(vehicle, 41, modifications[60], modifications[15])
    SetVehicleMod(vehicle, 42, modifications[61], modifications[15])
    SetVehicleMod(vehicle, 43, modifications[62], modifications[15])
    SetVehicleMod(vehicle, 44, modifications[63], modifications[15])
    SetVehicleMod(vehicle, 45, modifications[64], modifications[15])
    SetVehicleMod(vehicle, 46, modifications[65], modifications[15])
    SetVehicleMod(vehicle, 48, modifications[66], modifications[15])

    SetVehicleLivery(vehicle, modifications[67])

    -- extras
    for i = 1, #modifications[21], 1 do
        SetVehicleExtra(vehicle, modifications[21][i][1], modifications[21][i][2])
    end
    
    -- stats
    SetEntityHealth(vehicle, modifications[3])
    SetVehicleBodyHealth(vehicle, modifications[4])
    SetVehicleEngineHealth(vehicle, modifications[5])
    SetVehiclePetrolTankHealth(vehicle, modifications[6])
    if (Config.renderScorched and (modifications[5] < -3999.0 or modifications[6] < -999.0)) then
        TriggerServerEvent("AdvancedParking:renderScorched", NetworkGetNetworkIdFromEntity(vehicle), true)
    end
    
    SetVehicleDirtLevel(vehicle, modifications[7])
    SetVehicleFuelLevel(vehicle, modifications[8])

    -- doors
    for i = 1, #modifications[68], 1 do
        SetVehicleDoorBroken(vehicle, modifications[68][i], true)
    end
    
    -- tires
    SetVehicleTyresCanBurst(vehicle, not modifications[69])
    if (not modifications[69]) then
        for i = 1, #modifications[70], 1 do
            SetVehicleTyreBurst(vehicle, modifications[70][i][1], modifications[70][i][2], 1000.0)
        end
    end

    -- windows
    for i = 1, #modifications[71], 1 do
        SmashVehicleWindow(vehicle, modifications[71][i])
    end
    
    -- xenon lights
	if (modifications[72]) then
		SetVehicleXenonLightsColour(vehicle, modifications[72])
	end
end

-- Return closest loaded vehicle entity or nil if no vehicle is found
function GetClosestVehicle(position, maxRadius)
    local vehicles       = GetAllVehicles()
    local dist           = maxRadius
    local closestVehicle = nil
    
    for i=1, #vehicles, 1 do
        local vehicleCoords = GetEntityCoords(vehicles[i])
        local tempDist = Vdist(vehicleCoords.x, vehicleCoords.y, vehicleCoords.z, position.x, position.y, position.z)
        if (tempDist < dist) then
            dist = tempDist
            closestVehicle = vehicles[i]
        end
    end
    
    if (closestVehicle ~= nil and DoesEntityExist(closestVehicle)) then
        return closestVehicle
    else
        return nil
    end
end

-- Returns all loaded vehicles on client side
function GetAllVehicles()
    local vehicles = {}
    
    for vehicle in EnumerateVehicles() do
        table.insert(vehicles, vehicle)
    end
    
    return vehicles
end

function IsVehicleBlacklisted(vehicle)
    -- check class
    local class = GetVehicleClass(vehicle)
    for i = 1, #Config.classesBlacklist, 1 do
        if (class == Config.classesBlacklist[i]) then
            return true
        end
    end

    -- check model
    local modelHash = GetEntityModel(vehicle)
    for i = 1, #Config.vehiclesBlacklist, 1 do
        if (modelHash == Config.vehiclesBlacklist[i]) then
            return true
        end
    end

    -- check plate
    local plate = GetVehicleNumberPlateText(vehicle)
    for i = 1, #Config.platesBlacklist, 1 do
        if (plate:upper():find(Config.platesBlacklist[i]:upper())) then
            return true
        end
    end

    -- check ownership with ESX
    if (Config.saveOnlyESXOwnedVehicles and GetResourceState("kimi_callbacks") == "started") then
        local hasOwner = exports["kimi_callbacks"]:Trigger("AP:getVehicleOwnership", plate, GetEntityModel(vehicle))

        if (not hasOwner) then
            return true
        end
    end

    return false
end

function GetVehiclePosition(plate)
    if (GetResourceState("kimi_callbacks") ~= "started") then
        print("^1[ERROR] \"kimi_callbacks\" is either not installed properly or hasn't been started!")
        print("^1[ERROR] The export \"GetVehiclePosition\" can only be used when having this resource installed.")
        return nil
    end

    if (plate == nil) then
        print("^1[ERROR] \"plate\" was nil while trying to call export \"GetVehiclePosition\"!")
        return nil
    end
    
    if (type(plate) ~= "string") then
        print("^1[ERROR] \"plate\" (\"" .. plate .. "\") needs to be of type string when calling export \"GetVehiclePosition\"!")
        return nil
    end

    local position = exports["kimi_callbacks"]:Trigger("AP:getVehiclePosition", plate:upper())

    return position
end

function GetVehiclePositions(...)
    if (GetResourceState("kimi_callbacks") ~= "started") then
        print("^1[ERROR] \"kimi_callbacks\" is either not installed properly or hasn't been started!")
        print("^1[ERROR] The export \"GetVehiclePositions\" can only be used when having this resource installed.")
        return nil
    end

    local plates = { ... }

    for i, plate in ipairs(plates) do
        if (plate == nil) then
            print("^1[ERROR] \"plate\" (Index: \"" .. i .. "\") was nil while trying to call export \"GetVehiclePositions\"!")
            return nil
        end
        
        if (type(plate) ~= "string") then
            print("^1[ERROR] \"plate\" (\"" .. plate .. "\") (Index: " .. i .. ") needs to be of type string when calling export \"GetVehiclePositions\"!")
            return nil
        end
        
        plates[i] = plates[i]:upper()
    end

    local data = exports["kimi_callbacks"]:Trigger("AP:getVehiclePositions", plates)

    return data
end

function UpdatePlate(vehicle, newPlate)
    local netId = NetworkGetNetworkIdFromEntity(vehicle)

    TriggerServerEvent("AdvancedParking:updatePlate", netId, newPlate)
end

-- getting all vehicles
function EnumerateVehicles()
    return EnumerateEntities(FindFirstVehicle, FindNextVehicle, EndFindVehicle)
end
function EnumerateEntities(initFunc, moveFunc, disposeFunc)
    return coroutine.wrap(function()
        local iter, id = initFunc()
        if not id or id == 0 then
            disposeFunc(iter)
            return
        end

        local enum = {handle = iter, destructor = disposeFunc}
        setmetatable(enum, entityEnumerator)

        local next = true
        repeat
            coroutine.yield(id)
            next, id = moveFunc(iter)
        until not next

        enum.destructor, enum.handle = nil, nil
        disposeFunc(iter)
    end)
end
local entityEnumerator = {
    __gc = function(enum)
        if enum.destructor and enum.handle then
            enum.destructor(enum.handle)
        end
        enum.destructor = nil
        enum.handle = nil
    end
}
