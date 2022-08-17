QBCore = nil

TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)


QBCore.Commands.Add("blipsbuilder", "blipsbuilder", {}, false, function(source, args)
    TriggerClientEvent('bc:OpenMenu', source)
end, "admin") 