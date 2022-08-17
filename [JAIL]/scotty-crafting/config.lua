Config = {}
Config["debug"] = true 
Config["craft_duration"] = 5 
Config["craft_duration_multiply"] = true 
Config["craft_duration_max"] = 30 
Config["craft_enable_fail"] = true 
Config["craft_cost"] = 100 
Config["craft_table"] = {
	{
		position = {x = 1669.72, y = 2582.40, z = 44.58, h = 180.50},
		max_distance = 2.0, 
		map_blip = false,
		blip_name = "Pachatipad Carft Table"
	},
}

--[[
	ทุกครั้งที่มีการต่อเพิ่มในตารางอย่าลืมใส่ , ที่ปีกกาปิดของอันเก่า
	
	ตัวอย่างการเพิ่ม หมวด
	[1] = { -- ต้องใช้เป็นเลขใหม่ต่อท้ายหมวดเก่า
		name = "หมวดทั่วไป", -- ชื่อหมวด
		animation = { -- เพิ่มอนิเมชั้นเองโดยเปลี่ยนทั้งหมวด ลบหากต้องการใช้แบบธรรมดา
			dict = "world_human_welding",
			anim = "world_human_welding",
			flag = 30
		},
		list = { -- สำหรับเพิ่มไอเทม ต้องใส่ภายในปีกกาเท่านั้น
		}
	}
		
	ตัวอย่างการเพิ่ม ไอเทมลงในหมวด
	{
		item = "cloth", 
		fail_chance = 15, 
		amount = 3, 
		cost = 500, 
		
		craft_duration = 10, 
		
		animation = { 
			dict = "mp_player_inteat@burger",
			anim = "mp_player_int_eat_burger",
			flag = 30
		},
		
		equipment = { 
			["scissors"] = true, 
			["pro_wood"] = false 
		},
		
		blueprint = { 
			["leather"] = 1, 
			["wood"] = 2 
		},
	},
]]

Config["category"] = {
	[1] = {
		name = "General raw materials",
		list = {
			{
				item = "magickey",
				fail_chance = 50,
				amount = 1,
				cost = 300,
				craft_duration = 10,
				blueprint = {
					["iron"] = 10,
					["acier"] = 5,
				},
				equipment = {
					-- ["SteelScrap"] = true,
					-- ["wood"] = true,
				},
				
			},
		{
				item = "phone",
				fail_chance = 20,
				amount = 1,
				cost = 300,
				craft_duration = 10,
				blueprint = {
					["iron"] = 50,
					["coque"] = 3,
				},
				equipment = {
					--["SteelScrap"] = true,
					--["wood"] = true,
				},
				
			},
		{
				item = "bread",
				fail_chance = 20,
				amount = 1,
				cost = 300,
				craft_duration = 10,
				blueprint = {
					["emballage"] = 9,
				},
				equipment = {
					--["SteelScrap"] = true,
				},
				
			},
		{
				item = "water",
				fail_chance = 50,
				amount = 1,
				cost = 300,
				craft_duration = 10,
				blueprint = {
					--["rubber_pack"] = 5,
					["Goblet"] = 3,
				},
				equipment = {
					--["rubber_pack"] = true,
					--["wood"] = true,
				},
				
			},
		},
	}
}
	--[[[2] = {
		name = "หมวดยา",
		list = {
		{
				item = "coke_pooch",
				fail_chance = 30,
				amount = 1,
				cost = 300,
				craft_duration = 10,
				blueprint = {
					["coke_pooch"] = 1,
					["meth_pooch"] = 1,
					["honey_a"] = 1,
				},
				equipment = {
					["coke_pooch"] = true,
					["meth_pooch"] = true,
					["honey_a"] = true,
				},
				
			},
		{
				item = "weed_pooch",
				fail_chance = 30,
				amount = 1,
				cost = 300,
				craft_duration = 10,
				blueprint = {
					["cigarett"] = 2,
					["weed_pooch"] = 1,
				},
				equipment = {
					["cigarett"] = true,
					["weed_pooch"] = true,
				},
				
			},
		},
	}
}
	[3] = {
		name = "ส่วนประกอบ",
		list = {
		{
				item = "iron",
				fail_chance = 85,
				amount = 1,
				cost = 500,
				craft_duration = 10,
				blueprint = {
					["steel"] = 10,
					["diamond"] = 4,
					["gold"] = 10,
					["leather"] = 5,
					["fixkit"] = 1,
					["pro_wood"] = 10,
				},
				equipment = {
					["steel"] = true,
					["diamond"] = true,
					["gold"] = true,
					["leather"] = true,
					["fixkit"] = true,
					["pro_wood"] = true,
				},
				
			},
		{
				item = "Meat",
				fail_chance = 98,
				amount = 1,
				cost = 500,
				craft_duration = 10,
				blueprint = {
					["steel"] = 7,
					["diamond"] = 2,
					["leather"] = 4,
					["iron"] = 15,
					["fixkit"] = 1,
					["pro_wood"] = 7,
				},
				equipment = {
					["steel"] = true,
					["diamond"] = true,
					["leather"] = true,
					["iron"] = true,
					["fixkit"] = true,
					["pro_wood"] = true,
				},
				
			},
		
		{
				item = "gunpowder",
				fail_chance = 98,
				amount = 1,
				cost = 500,
				craft_duration = 10,
				blueprint = {
					["steel"] = 13,
					["diamond"] = 2,
					["pro_wood"] = 10,
					["leather"] = 2,
					["fixkit"] = 2,
				},
				equipment = {
				    ["steel"] = true,
					["diamond"] = true,
					["pro_wood"] = true,
					["leather"] = true,
					["fixkit"] = true,
				},
				
				
			},
		{
				item = "parts4",
				fail_chance = 82,
				amount = 1,
				cost = 500,
				craft_duration = 10,
				blueprint = {
					["steel"] = 25,
					["diamond"] = 6,
					["iron"] = 15,
					["gold"] = 15,
					["fixkit"] = 3,
				},
				equipment = {
				    ["steel"] = true,
					["diamond"] = true,
					["iron"] = true,
					["gold"] = true,
					["fixkit"] = true,
				},
				
			},
		
		{
				item = "parts5",
				fail_chance = 75,
				amount = 1,
				cost = 500,
				craft_duration = 10,
				blueprint = {
					["steel"] = 7,
					["diamond"] = 1,
					["pro_wood"] = 10,
					["gold"] = 15,
					["fixkit"] = 1,
				},
				equipment = {
				    ["steel"] = true,
					["diamond"] = true,
					["pro_wood"] = true,
					["gold"] = true,
					["fixkit"] = true,
				},
				
			},
		},
	}
}
	[4] = {
		name = "หมวดอาวุธปกติ",
		list = {
			{
				item = "weapon_SWITCHBLADE",
				fail_chance = 93,
				amount = 1,
				cost = 1000,
				craft_duration = 10,
				blueprint = {
					["steel"] = 10,
					["diamond"] = 3,
					["fixkit"] = 1,
				},
				equipment = {
					["steel"] = true,
					["diamond"] = true,
					["fixkit"] = true,
				},

				
			},
		{
				item = "weapon_KNIFE",
				fail_chance = 85,
				amount = 1,
				cost = 1000,
				craft_duration = 10,
				blueprint = {
					["steel"] = 10,
					["diamond"] = 1,
					["wood"] = 10,
				},
				equipment = {
					["steel"] = true,
					["diamond"] = true,
					["wood"] = true,
				},
				
			},
		},
	}
}
	[5] = {
		name = "หมวดอาวุธพรีเมี่ยม",
		list = {
		{
				item = "weapon_SMG",
				fail_chance = 60,
				amount = 1,
				cost = 10000,
				craft_duration = 10,
				blueprint = {
					["parts1"] = 1,
					["parts2"] = 1,
					["parts3"] = 1,
					["parts4"] = 1,
					["parts5"] = 1,
				},
				equipment = {
					["parts1"] = true,
					["parts2"] = true,
					["parts3"] = true,
					["parts4"] = true,
					["parts5"] = true,
				},
				
			},
		},
	}
}]]
Config["translate"] = {
	you_crafted = "You have created% d songs from% d!",
	not_enough = "Insufficient components",
	not_enough2 = "Please have the components ready.",
	you_blow = "You failed to create %s",
	no_equipment = "You have no equipment",
	no_equipment2 = "Must use equipment to make this item",
	no_money = "Not enough money",
	no_money2 = "You need $% s in crafts."
}