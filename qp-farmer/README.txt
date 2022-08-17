Installations steps for QBus:
1-Open the file in qb-core/server/player.lua

2-Search for the function CheckPlayerData and insert the following line, you can define a diferent rep name in your config file. If you change it replace here too:
   PlayerData.metadata["farmerrep"] = PlayerData.metadata["farmerrep"] ~= nil and PlayerData.metadata["farmerrep"] or 0

3-Open you QB-core in the file qb-core/server/player.lua and paste the following function code inside the function QBCore.Player.CreatePlayer

   self.Functions.GetItemsAmountByName = function(item)
		local item = tostring(item):lower()
		local amount = 0
		local slots = QBCore.Player.GetSlotsByItem(self.PlayerData.items, item)
		for _, slot in pairs(slots) do
			if slot ~= nil then
				amount += self.PlayerData.items[slot].amount
			end
		end
		return amount
	end

4- You need to create the sql table if you want the market. Exec the sql qp_jobs_market.sql

5-Check the items in the config and create them in your core or join or discord and ask us for the default items




Installations steps for ESX:
1-You need to create the sql table if you want the market. Exec the sql qp_jobs_market.sql

2-Check the items in the config and create them in your core or join or discord and ask us for the default items