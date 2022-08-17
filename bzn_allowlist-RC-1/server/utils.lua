PlayerIdentifiers = function(playerId)
    local Identifiers = {}

    for k,v in pairs(GetPlayerIdentifiers(playerId)) do
        if string.match(v, "steam:") then
            Identifiers['steam'] = v
        elseif string.match(v, "license:") then
            Identifiers['license'] = v
        elseif string.match(v, "xbl:") then
            Identifiers['xbl'] = v
        elseif string.match(v, "ip:") then
            Identifiers['ip'] = v
        elseif string.match(v, "discord:") then
            Identifiers['discord'] = v
        elseif string.match(v, "live:") then
            Identifiers['live'] = v
        end
    end

    return Identifiers
end