RegisterServerEvent("Ruby_IllShop:GetConfig")
AddEventHandler("Ruby_IllShop:GetConfig", function()
     TriggerClientEvent("Ruby_IllShop:RecieveConfig", source, object)
end)

object = {
	prisonShop = {
		MenuId = "cafeteria", -- Identifiant unique pour chaque shop
		illegal = false,
		TitreMenu = "Cafeteria",
		DescriptionMenu = "~b~Cafeteria Shop~w~",

		MessageZone = "Press [~b~E~w~] to open the shop.",

		--ped = "mp_m_shopkeep_01",
		TailleZone = 1.0,
		zone = vector3(1712.04, 2576.59, 45.58),
		heading = 126.0,

		items = {
			bread = {
			    nom = "Bread",
			    NomItem = "bread",
			  	prix = 1,
			},
			water = {
			    nom = "Water",
			    NomItem = "water",
			  	prix = 1,
			},			
        },		
	},	
	dronesShop = {
		MenuId = "droneshop", -- Identifiant unique pour chaque shop
		illegal = false,
		TitreMenu = "Drones Shop",
		DescriptionMenu = "~b~Drones Shop~w~",

		MessageZone = "Press [~b~E~w~] to open the shop.",

		--ped = "mp_m_shopkeep_01",
		TailleZone = 1.0,
		zone = vector3(461.869, -981.07, 30.68),
		heading = 126.0,

		items = {
			drone_flyer_7 = {
			    nom = "Drone Police",
			    NomItem = "drone_flyer_7",
			  	prix = 1,
			},
			drone_flyer_6 = {
			    nom = "Drone Mini",
			    NomItem = "drone_flyer_6",
			  	prix = 1,
			},
        },		
	},
	
}
