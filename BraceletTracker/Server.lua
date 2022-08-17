-- Leaked By: Leaking Hub | J. Snow | leakinghub.com
Citizen.CreateThread(function()
    ESX = nil
    local PlayersWithBracelet = {}
    local PlayersBracelet = {}
    TriggerEvent(Config.ESXEvent, function(obj) ESX = obj end)
    ESX.RegisterUsableItem(Config.ItemNames.TrackerName, function(source)
        local xPlayer = ESX.GetPlayerFromId(source)
        local jobname = xPlayer.getJob().name
        if Config.RestrictUsage and jobname and not IsJobAuthorized(jobname) then

            TriggerClientEvent('Cyber:JobNotAuthorized', source)
            return
        end
        TriggerClientEvent('Cyber:OnTrackerUsage', source)
    end)

    ESX.RegisterUsableItem(Config.ItemNames.BoltCutter, function(source)
        local xPlayer = ESX.GetPlayerFromId(source)
        TriggerClientEvent('Cyber:OnBoltCutterUsage', source)
    end)

    IsJobAuthorized = function(job)
        if not job or job == '' then return false end
        for _, v in pairs(Config.AuthorizedJobsToUseTracker) do
            if job == v then return true end
        end
        return false
    end

    AddEventHandler('playerDropped', function()
        local src = source
        if PlayersWithBracelet[src] then
            for i, v in pairs(PlayersBracelet) do
                for ii, vv in pairs(v) do
                    if vv == src then
                        TriggerClientEvent('Cyber:BoltCutterUsedForPlayer', i,
                                           vv)
                        PlayersBracelet[i][ii] = nil
                    end
                end
            end
        end
        PlayersWithBracelet[src] = nil
        PlayersBracelet[src] = nil
    end)
    AddEventHandler('playerConnecting', function()
        local src = source
        PlayersWithBracelet[src] = nil
        PlayersBracelet[src] = {}
    end)

    ESX.RegisterServerCallback('CyberCheckForBraceletStatus',
                               function(source, cb, serverid)
        local src = source
        if PlayersWithBracelet[serverid] then
            cb(true)
        else
            cb(false)
        end
    end)

    RegisterNetEvent('Cyber:TrackedUsedOnPlayer')
    AddEventHandler('Cyber:TrackedUsedOnPlayer',
                    function(target, boundary, label, sharejob)
        local src = source
        if PlayersWithBracelet[target] then return end
        if not PlayersBracelet[src] then PlayersBracelet[src] = {} end
        if sharejob then

            if not PlayersBracelet[src][label] then
                TriggerClientEvent('Cyber:AddBraceletTrackerForPlayer', src,
                                   target, boundary, label)

                TriggerClientEvent('Cyber:BraceletAdded', target)
                PlayersBracelet[src][label] = target
                PlayersWithBracelet[target] = true
                zPlayer = ESX.GetPlayerFromId(src)
                if Config.RemoveItemsUponUsage.Tracker then

                    zPlayer.removeInventoryItem(Config.ItemNames.TrackerName,
                                                math.floor(1))
                end

                for _, v in pairs(ESX.GetPlayers()) do
                    if v then

                        xPlayer = ESX.GetPlayerFromId(v)
                        if not PlayersBracelet[v] then
                            PlayersBracelet[v] = {}
                        end
                        if xPlayer and xPlayer.getJob().name == sharejob and v ~=
                            src then

                            if not PlayersBracelet[v][label] then
                                PlayersBracelet[v][label] = target
                                TriggerClientEvent(
                                    'Cyber:AddBraceletTrackerForPlayer', v,
                                    target, boundary, label, sharejob)

                            else
                                TriggerClientEvent(
                                    'Cyber:LabelIsAlreadyBeingUsed', v, true,
                                    zPlayer.getName())
                            end
                        end
                    end
                end
            else
                TriggerClientEvent('Cyber:LabelIsAlreadyBeingUsed', src)
                -- add item

                return
            end

        else
            if not PlayersBracelet[src][label] then
                TriggerClientEvent('Cyber:AddBraceletTrackerForPlayer', src,
                                   target, boundary, label)
                PlayersBracelet[src][label] = target
                PlayersWithBracelet[target] = true
                if Config.RemoveItemsUponUsage.Tracker then
                    local zPlayer = ESX.GetPlayerFromId(src)
                    zPlayer.removeInventoryItem(Config.ItemNames.TrackerName,
                                                math.floor(1))
                end
                TriggerClientEvent('Cyber:BraceletAdded', target)
            else
                TriggerClientEvent('Cyber:LabelIsAlreadyBeingUsed', src)
                -- add item
            end
        end

    end)

    RegisterNetEvent('Cyber:BoltCutterUsedOnPlayer')
    AddEventHandler('Cyber:BoltCutterUsedOnPlayer', function(target)
        local src = source
        if not PlayersWithBracelet[target] then return end
        if PlayersWithBracelet[target] then
            for i, v in pairs(PlayersBracelet) do
                for ii, vv in pairs(v) do
                    if vv == target then
                        TriggerClientEvent('Cyber:BoltCutterUsedForPlayer', i,
                                           vv)
                        PlayersBracelet[i][ii] = nil
                    end
                end
            end
        end
        if Config.RemoveItemsUponUsage.BoltCutter then
            local zPlayer = ESX.GetPlayerFromId(src)
            zPlayer.removeInventoryItem(Config.ItemNames.BoltCutter,
                                        math.floor(1))
        end
        PlayersWithBracelet[target] = nil
        TriggerClientEvent('Cyber:BraceletRemoved', target)

    end)
end)

