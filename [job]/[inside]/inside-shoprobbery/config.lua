-- Leaked By: Leaking Hub | J. Snow | leakinghub.com
Keys = {
    ['ESC'] = 322, ['F1'] = 288, ['F2'] = 289, ['F3'] = 170, ['F5'] = 166, ['F6'] = 167, ['F7'] = 168, ['F8'] = 169, ['F9'] = 56, ['F10'] = 57,
    ['~'] = 243, ['1'] = 157, ['2'] = 158, ['3'] = 160, ['4'] = 164, ['5'] = 165, ['6'] = 159, ['7'] = 161, ['8'] = 162, ['9'] = 163, ['-'] = 84, ['='] = 83, ['BACKSPACE'] = 177,
    ['TAB'] = 37, ['Q'] = 44, ['W'] = 32, ['E'] = 38, ['R'] = 45, ['T'] = 245, ['Y'] = 246, ['U'] = 303, ['P'] = 199, ['['] = 39, [']'] = 40, ['ENTER'] = 18,
    ['CAPS'] = 137, ['A'] = 34, ['S'] = 8, ['D'] = 9, ['F'] = 23, ['G'] = 47, ['H'] = 74, ['K'] = 311, ['L'] = 182,
    ['LEFTSHIFT'] = 21, ['Z'] = 20, ['X'] = 73, ['C'] = 26, ['V'] = 0, ['B'] = 29, ['N'] = 249, ['M'] = 244, [','] = 82, ['.'] = 81,
    ['LEFTCTRL'] = 36, ['LEFTALT'] = 19, ['SPACE'] = 22, ['RIGHTCTRL'] = 70,
    ['HOME'] = 213, ['PAGEUP'] = 10, ['PAGEDOWN'] = 11, ['DEL'] = 178,
    ['LEFT'] = 174, ['RIGHT'] = 175, ['TOP'] = 27, ['DOWN'] = 173,
}

Config = {}

Config.Police = 0 -- City police required to start a robbery

--CassetteMin must always be less than the max
Config.CassetteMin = 1 -- The minimum amount of money from the box
Config.CassetteMax = 300 -- The maximal amount of money from the box

Config.Lastrobbed = 0 -- do not touch
Config.SecBetwNextRob = 120 -- Seconds between the possibility of another seizure

Config.TimeToEnd = 20 * 60000 --(20minutes) Time after which the bounty will end if the heist in the shop does not start 

Config.shoprobbery = {
	['BossSpawn'] = { 
		Pos = {x = 705.38, y = -964.12, z = 30.4, h = 244.71}, -- Place where you start the job
		Type  = 'csb_reporter', -- Ped model
	},
    ['CodeNPC'] = { 
		Pos = {x = -63.01, y = -915.01, z = 29.4, h = 202.08}, -- The place where the manager with the information appears
		Type  = 'csb_reporter', -- Ped model
	},
}

Config.Randomize = { -- Stores that can be drawn
    {name='District Murrieta Heights'}, 
    {name='District Mount Chiliad'},
    {name='District Grapeseed'},
    {name='District Sandy Shores'},
    {name='District Grand Senora Desert'},
    {name='District Grand Senora'},
    {name='District Senora'},
    {name='District Chumash'},
    {name='District Banham Canyon'},
    {name='District Canyon'},
    {name='District Richman Glen'},
    {name='District Morningwood'},
    {name='District Downtown Vinewood'},
    {name='District Mirror Park'},
    {name='District Tataviam Mountains'},
    {name='District Little Seoul'},
    {name='District Vespucci Canals'},
    {name='District Strawberry'},
    {name='District Davis'},
}

Config.Shops = {
    ['District Murrieta Heights'] = {
        ShopPos = {x = 1136.67, y = -981.67, z = 46.42}, -- Store location
        PedPos = {x = 1133.98, y = -981.43, z = 46.42, h = 278.34}, -- Ped location
        Type = 'mp_m_shopkeep_01', -- Ped model
        PedWalks = {x = 1126.75, y = -980.42, z = 45.42, h = 10.19}, -- The place where you want to go ped
        CashRegister1 = {x = 1134.03, y = -982.4, z = 46.42, h = 281.71, robbed = false}, -- Cassette place (You can disable one of the cartridges by typing false)
        CashRegister2 = false, -- Cassette place (You can disable one of the cartridges by typing false)
        Time = 360, -- The time that ped opens the safe
        Money = 10000, -- The money you get from the safe
    },
    ['District Mount Chiliad'] = {
        ShopPos = {x = 1733.3, y = 6414.76, z = 35.04}, -- Store location
        PedPos = {x = 1728.44, y = 6416.66, z = 35.04, h = 239.89}, -- Ped location
        Type = 'mp_m_shopkeep_01', -- Ped model
        PedWalks = {x = 1734.72, y = 6420.56, z = 35.04, h = 332.21}, -- The place where you want to go ped
        CashRegister1 = {x = 1728.69, y = 6417.4, z = 35.04, h = 244.85, robbed = false}, -- Cassette place (You can disable one of the cartridges by typing false)
        CashRegister2 = {x = 1727.64, y = 6415.28, z = 35.04, h = 240.79, robbed = false}, -- Cassette place (You can disable one of the cartridges by typing false)
        Time = 360, -- The time that ped opens the safe
        Money = 13231, -- The money you get from the safe
    },
    ['District Grapeseed'] = {
        ShopPos = {x = 1702.29, y = 4926.72, z = 42.06}, -- Store location
        PedPos = {x = 1697.28, y = 4923.04, z = 42.06, h = 325.41}, -- Ped location
        Type = 'mp_m_shopkeep_01', -- Ped model
        PedWalks = {x = 1707.72, y = 4920.24, z = 42.06, h = 321.58}, -- The place where you want to go ped
        CashRegister1 = {x = 1697.93, y = 4922.63, z = 42.06, h = 322.23, robbed = false}, -- Cassette place (You can disable one of the cartridges by typing false)
        CashRegister2 = {x = 1696.48, y = 4923.74, z = 42.06, h = 330.48, robbed = false}, -- Cassette place (You can disable one of the cartridges by typing false)
        Time = 360, -- The time that ped opens the safe
        Money = 8544, -- The money you get from the safe
    },
    ['District Sandy Shores'] = {
        ShopPos = {x = 1963.66, y = 3744.04, z = 32.34}, -- Store location
        PedPos = {x = 1958.97, y = 3741.27, z = 32.34, h = 301.55}, -- Ped location
        Type = 'mp_m_shopkeep_01', -- Ped model
        PedWalks = {x = 1959.51, y = 3748.7, z = 32.34, h = 29.01}, -- The place where you want to go ped
        CashRegister1 = {x = 1958.73, y = 3741.88, z = 32.36, h = 299.96, robbed = false}, -- Cassette place (You can disable one of the cartridges by typing false)
        CashRegister2 = {x = 1959.8, y = 3739.83, z = 32.36, h = 297.44, robbed = false}, -- Cassette place (You can disable one of the cartridges by typing false)
        Time = 360, -- The time that ped opens the safe
        Money = 12312, -- The money you get from the safe
    },
    ['District Grand Senora Desert'] = {
        ShopPos = {x = 2678.36, y = 3284.84, z = 55.24}, -- Store location
        PedPos = {x = 2676.32, y = 3279.87, z = 55.24, h = 328.52}, -- Ped location
        Type = 'mp_m_shopkeep_01', -- Ped model
        PedWalks = {x = 2673.17, y = 3286.46, z = 55.24, h = 55.94}, -- The place where you want to go ped
        CashRegister1 = {x = 2675.85, y = 3280.35, z = 55.24, h = 331.24, robbed = false}, -- Cassette place (You can disable one of the cartridges by typing false)
        CashRegister2 = {x = 2677.84, y = 3279.11, z = 55.24, h = 327.47, robbed = false}, -- Cassette place (You can disable one of the cartridges by typing false)
        Time = 360, -- The time that ped opens the safe
        Money = 11231, -- The money you get from the safe
    },
    ['District Grand Senora'] = {
        ShopPos = {x = 1166.44, y = 2708.02, z = 38.16}, -- Store location
        PedPos = {x = 1166.67, y = 2711.22, z = 38.16, h = 178.45}, -- Ped location
        Type = 'mp_m_shopkeep_01', -- Ped model
        PedWalks = {x = 1168.85, y = 2717.87, z = 37.16, h = 266.74}, -- The place where you want to go ped
        CashRegister1 = {x = 1165.98, y = 2711.01, z = 38.16, h = 177.88, robbed = false}, -- Cassette place (You can disable one of the cartridges by typing false)
        CashRegister2 = false, -- Cassette place (You can disable one of the cartridges by typing false)
        Time = 360, -- The time that ped opens the safe
        Money = 10412, -- The money you get from the safe
    },
    ['District Senora'] = {
        ShopPos = {x = 544.32, y = 2669.0, z = 42.16}, -- Store location
        PedPos = {x = 549.65, y = 2669.67, z = 42.16, h = 94.35}, -- Ped location
        Type = 'mp_m_shopkeep_01', -- Ped model
        PedWalks = {x = 546.36, y = 2663.21, z = 42.16, h = 185.34}, -- The place where you want to go ped
        CashRegister1 = {x = 549.59, y = 2669.13, z = 42.16, h = 98.47, robbed = false}, -- Cassette place (You can disable one of the cartridges by typing false)
        CashRegister2 = {x = 549.5, y = 2671.39, z = 42.16, h = 93.95, robbed = false}, -- Cassette place (You can disable one of the cartridges by typing false)
        Time = 360, -- The time that ped opens the safe
        Money = 13421, -- The money you get from the safe
    },
    ['District Chumash'] = {
        ShopPos = {x = -3244.01, y = 1005.04, z = 12.83}, -- Store location
        PedPos = {x = -3243.87, y = 999.76, z = 12.83, h = 356.72}, -- Ped location
        Type = 'mp_m_shopkeep_01', -- Ped model
        PedWalks = {x = -3249.72, y = 1004.35, z = 12.83, h = 80.62}, -- The place where you want to go ped
        CashRegister1 = {x = -3244.65, y = 999.97, z = 12.83, h = 354.78, robbed = false}, -- Cassette place (You can disable one of the cartridges by typing false)
        CashRegister2 = {x = -3242.23, y = 999.61, z = 12.83, h = 352.68, robbed = false}, -- Cassette place (You can disable one of the cartridges by typing false)
        Time = 360, -- The time that ped opens the safe
        Money = 11233, -- The money you get from the safe
    },
    ['District Banham Canyon'] = {
        ShopPos = {x = -3042.6, y = 588.44, z = 7.91}, -- Store location
        PedPos = {x = -3040.49, y = 583.67, z = 7.91, h = 19.19}, -- Ped location
        Type = 'mp_m_shopkeep_01', -- Ped model
        PedWalks = {x = -3047.55, y = 585.72, z = 7.91, h = 103.78}, -- The place where you want to go ped
        CashRegister1 = {x = -3041.11, y = 583.67, z = 7.91, h = 18.79, robbed = false}, -- Cassette place (You can disable one of the cartridges by typing false)
        CashRegister2 = {x = -3038.86, y = 584.18, z = 7.91, h = 13.82, robbed = false}, -- Cassette place (You can disable one of the cartridges by typing false)
        Time = 360, -- The time that ped opens the safe
        Money = 11241, -- The money you get from the safe
    },
    ['District Canyon'] = {
        ShopPos = {x = -2969.24, y = 390.55, z = 15.04}, -- Store location
        PedPos = {x = -2966.26, y = 389.91, z = 15.04, h = 88.96}, -- Ped location
        Type = 'mp_m_shopkeep_01', -- Ped model
        PedWalks = {x = -2959.63, y = 387.49, z = 14.04, h = 174.11}, -- The place where you want to go ped
        CashRegister1 = {x = -2966.2, y = 390.91, z = 15.04, h = 83.19, robbed = false}, -- Cassette place (You can disable one of the cartridges by typing false)
        CashRegister2 = false, -- Cassette place (You can disable one of the cartridges by typing false)
        Time = 360, -- The time that ped opens the safe
        Money = 6032, -- The money you get from the safe
    },
    ['District Richman Glen'] = {
        ShopPos = {x = -1825.46, y = 791.38, z = 138.21}, -- Store location
        PedPos = {x = -1819.33, y = 793.7, z = 138.08, h = 132.97}, -- Ped location
        Type = 'mp_m_shopkeep_01', -- Ped model
        PedWalks = {x = -1828.91, y = 798.98, z = 138.18, h = 127.29}, -- The place where you want to go ped
        CashRegister1 = {x = -1818.73, y = 793.05, z = 138.08, h = 140.19, robbed = false}, -- Cassette place (You can disable one of the cartridges by typing false)
        CashRegister2 = {x = -1820.04, y = 794.49, z = 138.09, h = 133.66, robbed = false}, -- Cassette place (You can disable one of the cartridges by typing false)
        Time = 360, -- The time that ped opens the safe
        Money = 15232, -- The money you get from the safe
    },
    ['District Morningwood'] = {
        ShopPos = {x = -1487.94, y = -380.29, z = 40.16}, -- Store location
        PedPos = {x = -1485.4, y = -378.26, z = 40.16, h = 134.7}, -- Ped location
        Type = 'mp_m_shopkeep_01', -- Ped model
        PedWalks = {x = -1479.22, y = -375.18, z = 39.16, h = 224.55}, -- The place where you want to go ped
        CashRegister1 = {x = -1486.15, y = -377.87, z = 40.16, h = 133.06, robbed = false}, -- Cassette place (You can disable one of the cartridges by typing false)
        CashRegister2 = false, -- Cassette place (You can disable one of the cartridges by typing false)
        Time = 360, -- The time that ped opens the safe
        Money = 12321, -- The money you get from the safe
    },
    ['District Downtown Vinewood'] = {
        ShopPos = {x = 377.99, y = 326.78, z = 103.57}, -- Store location
        PedPos = {x = 372.63, y = 327.97, z = 103.57, h = 259.59}, -- Ped location
        Type = 'mp_m_shopkeep_01', -- Ped model
        PedWalks = {x = 378.14, y = 333.04, z = 103.57, h = 348.12}, -- The place where you want to go ped
        CashRegister1 = {x = 372.93, y = 328.76, z = 103.57, h = 257.78, robbed = false}, -- Cassette place (You can disable one of the cartridges by typing false)
        CashRegister2 = {x = 372.28, y = 326.5, z = 103.57, h = 251.85, robbed = false}, -- Cassette place (You can disable one of the cartridges by typing false)
        Time = 360, -- The time that ped opens the safe
        Money = 11000, -- The money you get from the safe
    },
    ['District Mirror Park'] = {
        ShopPos = {x = 1158.55, y = -322.58, z = 69.21}, -- Store location
        PedPos = {x = 1165.01, y = -323.79, z = 69.21, h = 98.37}, -- Ped location
        Type = 'mp_m_shopkeep_01', -- Ped model
        PedWalks = {x = 1159.87, y = -313.97, z = 69.21, h = 97.67}, -- The place where you want to go ped
        CashRegister1 = {x = 1164.92, y = -322.52, z = 69.21, h = 102.06, robbed = false}, -- Cassette place (You can disable one of the cartridges by typing false)
        CashRegister2 = {x = 1165.33, y = -324.48, z = 69.21, h = 110.37, robbed = false}, -- Cassette place (You can disable one of the cartridges by typing false)
        Time = 360, -- The time that ped opens the safe
        Money = 10043, -- The money you get from the safe
    },
    ['District Tataviam Mountains'] = {
        ShopPos = {x = 2554.69, y = 385.82, z = 108.62}, -- Store location
        PedPos = {x = 2555.59, y = 380.77, z = 108.62, h = 1.56}, -- Ped location
        Type = 'mp_m_shopkeep_01', -- Ped model
        PedWalks = {x = 2549.51, y = 384.92, z = 108.62, h = 85.99}, -- The place where you want to go ped
        CashRegister1 = {x = 2554.79, y = 380.69, z = 108.62, h = 359.23, robbed = false}, -- Cassette place (You can disable one of the cartridges by typing false)
        CashRegister2 = {x = 2557.19, y = 380.58, z = 108.62, h = 352.32, robbed = false}, -- Cassette place (You can disable one of the cartridges by typing false)
        Time = 360, -- The time that ped opens the safe
        Money = 11030, -- The money you get from the safe
    },
    ['District Little Seoul'] = {
        ShopPos = {x = -712.16, y = -912.68, z = 19.22}, -- Store location
        PedPos = {x = -705.78, y = -914.62, z = 19.22, h = 91.53}, -- Ped location
        Type = 'mp_m_shopkeep_01', -- Ped model
        PedWalks = {x = -709.37, y = -904.19, z = 19.22, h = 86.65}, -- The place where you want to go ped
        CashRegister1 = {x = -705.86, y = -915.43, z = 19.22, h = 100.83, robbed = false}, -- Cassette place (You can disable one of the cartridges by typing false)
        CashRegister2 = {x = -705.83, y = -913.45, z = 19.22, h = 91.17, robbed = false}, -- Cassette place (You can disable one of the cartridges by typing false)
        Time = 360, -- The time that ped opens the safe
        Money = 13123, -- The money you get from the safe
    },
    ['District Vespucci Canals'] = {
        ShopPos = {x = -1223.87, y = -906.34, z = 12.33}, -- Store location
        PedPos = {x = -1222.55, y = -909.11, z = 12.33, h = 30.34}, -- Ped location
        Type = 'mp_m_shopkeep_01', -- Ped model
        PedWalks = {x = -1220.37, y = -915.79, z = 11.33, h = 123.88}, -- The place where you want to go ped
        CashRegister1 = {x = -1221.89, y = -908.49, z = 12.33, h = 30.52, robbed = false}, -- Cassette place (You can disable one of the cartridges by typing false)
        CashRegister2 = false, -- Cassette place (You can disable one of the cartridges by typing false)
        Time = 360, -- The time that ped opens the safe
        Money = 11020, -- The money you get from the safe
    },
    ['District Strawberry'] = {
        ShopPos = {x = 29.23, y = -1345.12, z = 29.5}, -- Store location
        PedPos = {x = 24.18, y = -1345.71, z = 29.5, h = 263.62}, -- Ped location
        Type = 'mp_m_shopkeep_01', -- Ped model
        PedWalks = {x = 28.12, y = -1339.56, z = 29.5, h = 354.05}, -- The place where you want to go ped
        CashRegister1 = {x = 24.32, y = -1344.91, z = 29.5, h = 272.17, robbed = false}, -- Cassette place (You can disable one of the cartridges by typing false)
        CashRegister2 = {x = 24.14, y = -1347.4, z = 29.5, h = 267.59, robbed = false}, -- Cassette place (You can disable one of the cartridges by typing false)
        Time = 360, -- The time that ped opens the safe
        Money = 13020, -- The money you get from the safe
    },
    ['District Davis'] = {
        ShopPos = {x = -50.69, y = -1753.37, z = 29.42}, -- Store location
        PedPos = {x = -47.25, y = -1758.72, z = 29.42, h = 51.45}, -- Ped location
        Type = 'mp_m_shopkeep_01', -- Ped model
        PedWalks = {x = -43.08, y = -1748.69, z = 29.42, h = 50.82}, -- The place where you want to go ped
        CashRegister1 = {x = -47.72, y = -1759.56, z = 29.42, h = 49.02, robbed = false}, -- Cassette place (You can disable one of the cartridges by typing false)
        CashRegister2 = {x = -46.54, y = -1758.14, z = 29.42, h = 48.65, robbed = false}, -- Cassette place (You can disable one of the cartridges by typing false)
        Time = 360, -- The time that ped opens the safe
        Money = 11030, -- The money you get from the safe
    },
}

