Allowlist = {}

if not Config.ESX and not Config.Ace then
    print('^1[bzn_allowlist] Error you need to set either Config.ESX og Config.Ace to true else you wont be able to use commands - script not loaded^7')
    return
end

if Config.Identifier ~= 'steam' and Config.Identifier ~= 'license' then
    print('^1[bzn_allowlist] Error you can only use steam or license as identifier - script not loaded^7')
    return
end

AddEventHandler('playerConnecting', function(name, setCallback, deferrals)
    local source = source
    
    deferrals.defer()
    
    deferrals.update(_U('allowlist_check'))
    
    Wait(500)
    
    local Identifiers = PlayerIdentifiers(source)

    if not Allowlist[Identifiers[Config.Identifier]] or Allowlist[Identifiers[Config.Identifier]] == 0 then
        if Allowlist[Identifiers[Config.Identifier]] == nil then SaveToMySQL(Identifiers[Config.Identifier]) end
        deferrals.done(_U('not_allowlisted'))
        CancelEvent()
        return
    end
    
    deferrals.done()
end)


LoadAllowlist = function()
    MySQL.Async.fetchAll('SELECT * FROM bzn_allowlist', {}, function(result)
        for i = 1, #result, 1 do
            print(tostring(result[i].identifier):lower())
            Allowlist[tostring(result[i].identifier):lower()] = tonumber(result[i].whitelisted)
        end
        
        print('^2[bzn_allowlist] ' .. _U('allowlist_loaded', #result) .. '^7')
    end)
end

SaveToMySQL = function(identifier)
    Allowlist[identifier] = 0
    
    MySQL.Async.execute('INSERT INTO bzn_allowlist (identifier, whitelisted) VALUES (@identifier, @whitelisted)', {
        ['@identifier'] = identifier,
        ['@whitelisted'] = 0
    })
end


MySQL.ready(function()
    LoadAllowlist()
end)
