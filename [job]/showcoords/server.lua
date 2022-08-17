

RegisterServerEvent('showcoords:sendcoords')
AddEventHandler('showcoords:sendcoords', function(x, y, z)

print("x = " .. tostring(x) .. ',y = ' ..tostring(y) .. ',z = ' .. tostring(z - 1.0))

end)