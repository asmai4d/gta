activePlayerPositions = {}

-- returns a loaded vehicled with a given number plate
function TryGetLoadedVehicle(plate, loadedVehicles)
    for i = 1, #loadedVehicles, 1 do
        if (DoesEntityExist(loadedVehicles[i]) and plate == GetVehicleNumberPlateText(loadedVehicles[i])) then
            return loadedVehicles[i]
        end
    end

    return nil
end

function ContainsPlate(plate, vehiclePlates)
    for i = 1, #vehiclePlates, 1 do
        if (plate == vehiclePlates[i]) then
            return true
        end
    end

    return false
end

-- prints text to the server console
function Log(text)
    if (Config.isDebug) then
        print(GetCurrentResourceName() .. ": " .. text)
    end
end

-- return the distance between two positions (Vector3)
function Vector3Dist(v1, v2)
	return math.sqrt( (v2.x - v1.x) * (v2.x - v1.x) + (v2.y - v1.y) * (v2.y - v1.y) + (v2.z - v1.z) * (v2.z - v1.z) )
end

-- return the distance between two positions without sqrt (Vector3)
function Vector3DistFast(v1, v2)
	return (v2.x - v1.x) * (v2.x - v1.x) + (v2.y - v1.y) * (v2.y - v1.y) + (v2.z - v1.z) * (v2.z - v1.z)
end

-- returns the difference in degrees from the axis with the highest difference
function GetRotationDifference(r1, r2)
    local x = math.abs(r1.x - r2.x)
    local y = math.abs(r1.y - r2.y)
    local z = math.abs(r1.z - r2.z)

    if (x > y and x > z) then
        return x
    elseif (y > z) then
        return y
    else
        return z
    end
end

-- get the amount of currently active players
function GetActivePlayerCount()
    local playerCount = 0
    for k, v in pairs(activePlayerPositions) do
        playerCount = playerCount + 1
    end
    return playerCount
end

-- return the ID of the closest player
function GetClosestPlayerId(position)
	local closestDistance = 1000000.0
	local closestPlayerID = nil
    local closestPos = nil
	
    for playerID, pos in pairs(activePlayerPositions) do
        local distance = Vector3DistFast(position, pos)
        
        if (distance < closestDistance) then
            closestDistance = distance
            closestPlayerID = playerID
            closestPos = pos
        end
	end
	
    local distance = nil
    if (closestPlayerID ~= nil) then
        distance = Vector3Dist(position, closestPos)
    end
    
	return closestPlayerID, distance
end

function IsAnyPlayerInsideVehicle(vehicle, playerPeds)
    for i = 1, #playerPeds, 1 do
        local veh = GetVehiclePedIsIn(playerPeds[i], false)

        if (DoesEntityExist(veh) and veh == vehicle) then
            return true
        end
    end

    return false
end

-- return the ped of the closest player
function GetClosestPlayerPed(position, playerPeds)
	local closestDistance = 1000000.0
	local closestPlayerPed = nil
    local closestPos = nil
	
    for k, playerPed in pairs(playerPeds) do
        local pos = GetEntityCoords(playerPed)
        local distance = Vector3DistFast(position, pos)
        
        if (distance < closestDistance) then
            closestDistance = distance
            closestPlayerPed = playerPed
            closestPos = pos
        end
	end
	
    local distance = 0.0
    if (closestPlayerPed ~= nil) then
        distance = Vector3Dist(position, closestPos)
    end
    
	return closestPlayerPed, distance
end

-- returns true if a player is active on the server with the specified license
function IsPlayerWithLicenseActive(license)
    for playerId, playerPos in pairs(activePlayerPositions) do
        if (GetPlayerIdentifiersSorted(playerId)["license"] == license) then
            return true
        end
    end

    return false
end

-- Return an array with all identifiers - e.g. ids["license"] = license:xxxxxxxxxxxxxxxx
function GetPlayerIdentifiersSorted(playerServerId)
	local ids = {}

	local identifiers = GetPlayerIdentifiers(playerServerId)

	for k, identifier in pairs (identifiers) do
		local i, j = string.find(identifier, ":")
		local idType = string.sub(identifier, 1, i-1)

		ids[idType] = identifier
	end

	return ids
end
