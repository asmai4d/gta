EXTERNAL_EVENTS_NAMES = {
    ["esx:getSharedObject"] = nil, -- This is nil because it will be found automatically, change it to your one ONLY in the case it can't be found
}

-- Ped models that WON'T be used for NPC selling
BLACKLISTED_PEDS_MODELS = {
    --[[
        Some examples:
        
        [ GetHashKey("a_m_o_tramp_01") ] = true,
        [ GetHashKey("csb_rashcosvki") ] = true,
        [ GetHashKey("csb_stripper_02") ] = true,
    ]]
}

--[[
    You can edit this function if you want to add second jobs or anything like that (editing this function is up to you)
    If you edit this, you WILL have also to edit the function in sv_integrations.lua file
]]
function isAllowedForLaboratory(allowedJobs)
    local playerJob = Framework.getPlayerJob()

    return allowedJobs[playerJob]
end

-- Set to true if you want players to be able to sell to gangster ped models
CAN_SELL_TO_GANGSTERS = false