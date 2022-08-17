Config                            = {}
-- polo © License | Discord : https://discord.gg/htfpJZN
Config.DrawDistance               = 100.0
Config.MarkerType                 = 1
Config.MarkerSize                 = { x = 1.5, y = 1.5, z = 0.5 }
Config.MarkerColor                = { r = 50, g = 50, b = 204 }
-- polo © License | Discord : https://discord.gg/htfpJZN
Config.EnablePlayerManagement     = true
Config.EnableArmoryManagement     = true
Config.EnableESXIdentity          = true -- enable if you're using esx_identity
Config.EnableNonFreemodePeds      = true -- turn this on if you want custom peds
Config.EnableLicenses             = true 	-- enable if you're using esx_license

Config.EnableHandcuffTimer        = false -- enable handcuff timer? will unrestrain player after the time ends
Config.HandcuffTimer              = 10 * 60000 -- 10 mins

Config.EnableJobBlip              = true -- enable blips for colleagues, requires esx_society

Config.MaxInService               = -1
Config.Locale                     = 'fr'

config  = {}
config.vehicle1 = 'baller6'
config.vehicle2 = 'carbonrs'
config.vehicle3 = 'granger'
config.vehicle5 = 'buzzard'
-- polo © License | Discord : https://discord.gg/htfpJZN
-- Ped model list: https://forums.gta5-mods.com/topic/7789/npc-or-peds-data-list-base-gtav
config.ped1 = 'mp_m_securoguard_01' -- model of security personel
config.ped2 = 'mp_m_securoguard_01' -- model of security personel
config.ped3 = 'mp_m_securoguard_01' -- model of security personel
config.ped5 = 'mp_m_securoguard_01' -- model of security personel
config.ped6 = 'mp_m_securoguard_01' -- model of security personel
config.ped7 = 'mp_m_securoguard_01' -- model of security personel
config.ped8 = 'mp_m_securoguard_01' -- model of security personel
config.ped9 = 'mp_m_securoguard_01' -- model of security personel
config.ped10 = 'mp_m_securoguard_01' -- model of security personel
config.ped11 = 'mp_m_securoguard_01' -- model of security personel
config.ped12 = 'mp_m_securoguard_01' -- model of security personel
config.ped13 = 'mp_m_securoguard_01' -- model of security personel
config.ped14 = 'mp_m_securoguard_01' -- model of security personel
config.ped15 = 'mp_m_securoguard_01' -- model of security personel
-- polo © License | Discord : https://discord.gg/htfpJZN
-- Set weapons: https://forum.fivem.net/t/list-of-weapon-spawn-names-after-hours/90750
config.weapon1 = 'WEAPON_CARBINERIFLE'
config.weapon2 = 'WEAPON_PISTOL'
config.weapon3 = 'WEAPON_SMG'
config.weapon6 = 'WEAPON_CARBINERIFLE'
config.weapon7 = 'WEAPON_CARBINERIFLE'
config.weapon8 = 'WEAPON_CARBINERIFLE'
config.weapon9 = 'WEAPON_SMG'
config.weapon10 = 'WEAPON_SMG'
config.weapon11 = 'WEAPON_SMG'
config.weapon12 = 'WEAPON_SMG'
config.weapon13 = 'WEAPON_SMG'
config.weapon14 = 'WEAPON_SMG'
config.weapon15 = 'WEAPON_SMG'
-- polo © License | Discord : https://discord.gg/htfpJZN
-- Set config.usejob = true if you want to use a job
config.usejob = true  -- restrict to a job?
config.jobname = 'gouvernement' -- which job to use the menu?

Config.GouvernementStations = {

	Gouvernement = {

		Blip = {
			Coords  = vector3(-545.26, -203.75, 38.21),
			Sprite  = 419,
			Display = 4,
			Scale   = 0.8,
			Colour  = 0
		},

		CloakroomsGarde = {
			vector3(-555.83, -200.39, 42.7) -- Bodyguard
		},

		CloakroomsPresident = {
			vector3(-547.49, -195.48, 47.55) -- President
		},

		CloakroomsPremierMinistre = {
			vector3(-559.08, -209.41, 47.55) -- Prime Minister
		},

		CloakroomsMinistre = {
			vector3(-535.36, -173.89, 47.55) -- Minister
		},

        CloakroomsJuge = {
            vector3(-572.28, -203.84, 47.55) -- Judge
        },

		CloakroomsAssistant = {
			vector3(-535.28, -191.46, 47.55) -- Assistant (man)
		},

		CloakroomsAssistante = {
			vector3(-535.93, -196.27, 47.55) -- Assistant (women)
		},

		Armories = {
			vector3(-552.69, -206.42, 42.7),
	             vector3(-539.72, -198.44, 47.55)
		},

		BossActions = {
			vector3(-551.2, -203.49, 47.55)
		}

	}

}
-- polo © License | Discord : https://discord.gg/htfpJZN
Config.AuthorizedWeapons = {
	assistant = {
	},

	assistante = {
	},

	garde = {
		{ weapon = 'WEAPON_PISTOL50', components = { 0, 0, 0, 0, nil }, price = 0 },
		{ weapon = 'WEAPON_ADVANCEDRIFLE', components = { 0, 0, 0, 0, 0, nil }, price = 0 },
		{ weapon = 'WEAPON_CARBINERIFLE', components = { 0, 0, 0, 0, 0, nil }, price = 0 },
		{ weapon = 'WEAPON_PUMPSHOTGUN', components = { 0, 0, nil }, price = 0 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'WEAPON_STUNGUN', price = 0 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 }
	},
	
	juge = {
	},

	ministre = {
		{ weapon = 'WEAPON_PISTOL50', components = { 0, 0, 0, 0, nil }, price = 0 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 }
	},

	premierministre = {
		{ weapon = 'WEAPON_PISTOL50', components = { 0, 0, 0, 0, nil }, price = 0 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 }
	},

	boss = {
		{ weapon = 'WEAPON_PISTOL50', components = { 0, 0, 0, 0, nil }, price = 0 },
		{ weapon = 'WEAPON_ADVANCEDRIFLE', components = { 0, 0, 0, 0, 0, nil }, price = 0 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 }
	}
}

-- CHECK SKINCHANGER CLIENT MAIN.LUA for matching elements

Config.Uniforms = {
	assistant_wear = {
		male = {
                    ['tshirt_1'] = 15, ['tshirt_2'] = 0,
                    ['torso_1'] = 13, ['torso_2'] = 0,
                    ['decals_1'] = 0, ['decals_2'] = 0,
                    ['arms'] = 26,
                    ['pants_1'] = 24, ['pants_2'] = 0,
                    ['shoes_1'] = 10, ['shoes_2'] = 0,
                    ['helmet_1'] = -1, ['helmet_2'] = 0,
                    ['chain_1'] = 10, ['chain_2'] = 2,
                    ['ears_1'] = -1, ['ears_2'] = 0
		},
		female = {
                    ['tshirt_1'] = 14, ['tshirt_2'] = 0,
                    ['torso_1'] = 9, ['torso_2'] = 1,
                    ['decals_1'] = 0, ['decals_2'] = 0,
                    ['arms'] = 0,
                    ['pants_1'] = 37, ['pants_2'] = 0,
                    ['shoes_1'] = 6, ['shoes_2'] = 0,
                    ['helmet_1'] = -1, ['helmet_2'] = 0,
                    ['chain_1'] = 0, ['chain_2'] = 0,
                    ['ears_1'] = -1, ['ears_2'] = 0
		}
	},
	assistante_wear = {
		male = {
                    ['tshirt_1'] = 15, ['tshirt_2'] = 0,
                    ['torso_1'] = 13, ['torso_2'] = 0,
                    ['decals_1'] = 0, ['decals_2'] = 0,
                    ['arms'] = 26,
                    ['pants_1'] = 24, ['pants_2'] = 0,
                    ['shoes_1'] = 10, ['shoes_2'] = 0,
                    ['helmet_1'] = -1, ['helmet_2'] = 0,
                    ['chain_1'] = 10, ['chain_2'] = 2,
                    ['ears_1'] = -1, ['ears_2'] = 0
		},
		female = {
                    ['tshirt_1'] = 14, ['tshirt_2'] = 0,
                    ['torso_1'] = 9, ['torso_2'] = 1,
                    ['decals_1'] = 0, ['decals_2'] = 0,
                    ['arms'] = 0,
                    ['pants_1'] = 37, ['pants_2'] = 0,
                    ['shoes_1'] = 6, ['shoes_2'] = 0,
                    ['helmet_1'] = -1, ['helmet_2'] = 0,
                    ['chain_1'] = 0, ['chain_2'] = 0,
                    ['ears_1'] = -1, ['ears_2'] = 0
		}
	},
	garde_wear = {
		male = {
                    ['tshirt_1'] = 31, ['tshirt_2'] = 0,
                    ['torso_1'] = 31, ['torso_2'] = 0,
                    ['decals_1'] = 0, ['decals_2'] = 0,
                    ['arms'] = 27,
                    ['pants_1'] = 24, ['pants_2'] = 0,
                    ['shoes_1'] = 10, ['shoes_2'] = 0,
                    ['helmet_1'] = -1, ['helmet_2'] = 0,
                    ['chain_1'] = 21, ['chain_2'] = 1,
                    ['glasses_1'] = 15, ['glasses_2'] = 1,
                    ['ears_1'] = 2, ['ears_2'] = 0
		},
		female = {
                    ['tshirt_1'] = 35, ['tshirt_2'] = 0,
                    ['torso_1'] = 48, ['torso_2'] = 0,
                    ['decals_1'] = 7, ['decals_2'] = 1,
                    ['arms'] = 44,
                    ['pants_1'] = 34, ['pants_2'] = 0,
                    ['shoes_1'] = 25, ['shoes_2'] = 0,
                    ['helmet_1'] = -1, ['helmet_2'] = 0,
                    ['chain_1'] = 95, ['chain_2'] = 0,
                    ['ears_1'] = 2, ['ears_2'] = 0
		}
	},
	ministre_wear = {
		male = {
                    ['tshirt_1'] = 31, ['tshirt_2'] = 2,
                    ['torso_1'] = 32, ['torso_2'] = 1,
                    ['decals_1'] = 0, ['decals_2'] = 0,
                    ['arms'] = 4,
                    ['pants_1'] = 24, ['pants_2'] = 1,
                    ['shoes_1'] = 10, ['shoes_2'] = 0,
                    ['helmet_1'] = -1, ['helmet_2'] = 0,
                    ['chain_1'] = 29, ['chain_2'] = 0,
                    ['ears_1'] = -1, ['ears_2'] = 0
		},
		female = {
                    ['tshirt_1'] = 35, ['tshirt_2'] = 0,
                    ['torso_1'] = 48, ['torso_2'] = 0,
                    ['decals_1'] = 7, ['decals_2'] = 1,
                    ['arms'] = 44,
                    ['pants_1'] = 34, ['pants_2'] = 0,
                    ['shoes_1'] = 25, ['shoes_2'] = 0,
                    ['helmet_1'] = -1, ['helmet_2'] = 0,
                    ['chain_1'] = 95, ['chain_2'] = 0,
                    ['ears_1'] = 2, ['ears_2'] = 0
		}
	},
	juge_wear = {
		male = {
            ['tshirt_1'] = 31, ['tshirt_2'] = 0,
            ['torso_1'] = 115, ['torso_2'] = 0,
            ['decals_1'] = 0, ['decals_2'] = 0,
            ['arms'] = 4,
            ['pants_1'] = 24, ['pants_2'] = 0,
            ['shoes_1'] = 10, ['shoes_2'] = 0,
            ['helmet_1'] = -1, ['helmet_2'] = 0,
            ['chain_1'] = 0, ['chain_2'] = 0,
            ['ears_1'] = -1, ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 7,   ['decals_2'] = 2,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},
	president_wear = { -- currently the same as intendent_wear
		male = {
                    ['tshirt_1'] = 31, ['tshirt_2'] = 0,
                    ['torso_1'] = 32, ['torso_2'] = 2,
                    ['decals_1'] = 0, ['decals_2'] = 0,
                    ['arms'] = 4,
                    ['pants_1'] = 24, ['pants_2'] = 2,
                    ['shoes_1'] = 10, ['shoes_2'] = 0,
                    ['helmet_1'] = -1, ['helmet_2'] = 0,
                    ['chain_1'] = 25, ['chain_2'] = 4,
                    ['ears_1'] = -1, ['ears_2'] = 0
		},
		female = {
                    ['tshirt_1'] = 35, ['tshirt_2'] = 0,
                    ['torso_1'] = 48, ['torso_2'] = 0,
                    ['decals_1'] = 7, ['decals_2'] = 2,
                    ['arms'] = 44,
                    ['pants_1'] = 34, ['pants_2'] = 0,
                    ['shoes_1'] = 25, ['shoes_2'] = 0,
                    ['helmet_1'] = 105, ['helmet_2'] = 20,
                    ['chain_1'] = 95, ['chain_2'] = 0,
                    ['ears_1'] = 2, ['ears_2'] = 0
		}
	},
	premierministre_wear = {
		male = {
			['tshirt_1'] = 31,  ['tshirt_2'] = 0,
			['torso_1'] = 32,   ['torso_2'] = 5,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 4,
			['pants_1'] = 24,   ['pants_2'] = 5,
			['shoes_1'] = 10,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 11,    ['chain_2'] = 2,
			['ears_1'] = -1,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 7,   ['decals_2'] = 3,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 995,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},
	boss_wear = { -- currently the same as chef_wear
		male = {
                    ['tshirt_1'] = 58, ['tshirt_2'] = 0,
                    ['torso_1'] = 26, ['torso_2'] = 2,
                    ['decals_1'] = 0, ['decals_2'] = 0,
                    ['arms'] = 26,
                    ['pants_1'] = 31, ['pants_2'] = 2,
                    ['shoes_1'] = 27, ['shoes_2'] = 0,
                    ['helmet_1'] = 13, ['helmet_2'] = 2,
                    ['chain_1'] = 125, ['chain_2'] = 0,
                    ['ears_1'] = -1, ['ears_2'] = 0
		},
		female = {
                    ['tshirt_1'] = 35, ['tshirt_2'] = 0,
                    ['torso_1'] = 48, ['torso_2'] = 0,
                    ['decals_1'] = 7, ['decals_2'] = 3,
                    ['arms'] = 44,
                    ['pants_1'] = 34, ['pants_2'] = 0,
                    ['shoes_1'] = 25, ['shoes_2'] = 0,
                    ['helmet_1'] = 105, ['helmet_2'] = 20,
                    ['chain_1'] = 95, ['chain_2'] = 0,
                    ['ears_1'] = 2, ['ears_2'] = 0
		}
	},
	bullet_wear = {
		male = {
			['bproof_1'] = 16,  ['bproof_2'] = 2
		},
		female = {
			['bproof_1'] = 13,  ['bproof_2'] = 1
		}
	},
}

---TELEPORT SHERIFF


Config.TeleportZones = {
  EnterLocaux = {
    Pos       = { x = -0.0, y = 0.0, z = 0.0 },
    Size      = { x = 1.2, y = 1.2, z = 0.1 },
    Color     = { r = 128, g = 0, b = 128 },
    Marker    = 1,
    Blip      = false,
    Name      = "police : entrée",
    Type      = "teleport",
    Hint      = "Appuyez sur ~INPUT_PICKUP~ pour entrer dans les locaux.",
    Teleport  = { x = 0.0, y = 0.0, z = 0.0 }
  },

    ExitLocaux = {
    Pos       = { x = 0.0, y = 0.0, z = 0.0 },
    Size      = { x = 1.2, y = 1.2, z = 0.1 },
    Color     = { r = 128, g = 0, b = 128 },
    Marker    = 1,
    Blip      = false,
    Name      = "sheriff : Sortie",
    Type      = "teleport",
    Hint      = "Appuyez sur ~INPUT_PICKUP~ pour sortir des locaux.",
    Teleport  = { x = -0.0, y = 0.0, z = 0.0 },
  },
  
  ExitBuilding = {
    Pos       = { x = -0.0, y = 0.0, z = 0.0 },
    Size      = { x = 1.2, y = 1.2, z = 0.1 },
    Color     = { r = 0, g = 128, b = 0 },
    Marker    = 1,
    Blip      = false,
    Name      = "sheriff : Sortie",
    Type      = "teleport",
    Hint      = "Appuyez sur ~INPUT_PICKUP~ pour sortir à l'arrière du batiment.",
    Teleport  = { x = -0.0, y = 0.0, z = 0.0 }
  },

    EnterBuilding = {
    Pos       = { x = -0.0, y = 0.0, z = 0.0 },
    Size      = { x = 1.2, y = 1.2, z = 0.1 },
    Color     = { r = 0, g = 128, b = 0 },
    Marker    = 1,
    Blip      = false,
    Name      = "sheriff : entrée",
    Type      = "teleport",
    Hint      = "Appuyez sur ~INPUT_PICKUP~ pour entrer",
    Teleport  = { x = -0.0, y = 0.0, z = 0.0 },
  },
}