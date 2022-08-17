createOwnedBlip = function(coords)
    local BLIP_CREATED = AddBlipForCoord(coords.x, coords.y, coords.z)
    SetBlipSprite(BLIP_CREATED, 134)
    SetBlipAsShortRange(BLIP_CREATED, true)
    SetBlipScale(BLIP_CREATED, 1.1)
    SetBlipColour(BLIP_CREATED, 3)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Mein Schliessfach")
    EndTextCommandSetBlipName(BLIP_CREATED)
    return BLIP_CREATED
end

createUnownedBlip = function(coords) 
    local BLIP_CREATED = AddBlipForCoord(coords.x, coords.y, coords.z)
    SetBlipSprite(BLIP_CREATED, 134)
    SetBlipAsShortRange(BLIP_CREATED, true)
    SetBlipScale(BLIP_CREATED, 0.6)
    SetBlipColour(BLIP_CREATED, 5)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Schliessfach")
    EndTextCommandSetBlipName(BLIP_CREATED)
    return BLIP_CREATED
end