local blips = {
    --Пример: {"название", цвет=, id=, x=, y=, z=},
	--Все ID и цвета вы найдеты по ссылке ниже.
	--https://docs.fivem.net/docs/game-references/blips/
	--Важно! Не забывайте после каждой строки ставить "," кроме последней.
	

     {title="Русская мафия", colour=0, id=685, x = -1517.9, y = 125.61, z = 72.49},	
     {title="Итальянская мафия", colour=76, id=685, x = 1398.9625244140625, y = 1147.51318359375, z = 114.33355712890625} 
  }
      
Citizen.CreateThread(function()

    for _, info in pairs(blips) do
      info.blip = AddBlipForCoord(info.x, info.y, info.z)
      SetBlipSprite(info.blip, info.id)
      SetBlipDisplay(info.blip, 4)
      SetBlipScale(info.blip, 1.0)
      SetBlipColour(info.blip, info.colour)
      SetBlipAsShortRange(info.blip, true)
	  BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(info.title)
      EndTextCommandSetBlipName(info.blip)
    end
end)