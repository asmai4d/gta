Config                            = {}
Config.DrawDistance               = 100.0
Config.MarkerType                 = 3
Config.MarkerSize                 = { x = 1.0, y = 2.0, z = 1.0 }
Config.MarkerColor                = { r = 27, g = 170, b = 8 }
Config.EnablePlayerManagement     = true
Config.EnableArmoryManagement     = true
Config.EnableESXIdentity          = false
Config.EnableSocietyOwnedVehicles = false
Config.EnableLicenses             = false
Config.MaxInService               = -1
Config.Locale                     = 'en'
config  = {}
config.vehicle1 = 'manchez'
config.vehicle2 = 'bf400'
config.vehicle3 = 'sultan'
config.vehicle4 = 'sultan'
-- polo © License | Discord : https://discord.gg/czW6Jqj
-- Ped model list: https://forums.gta5-mods.com/topic/7789/npc-or-peds-data-list-base-gtav
config.ped1 = 'g_m_y_famdnf_01' -- model of security personel
config.ped3 = 'g_m_y_famdnf_01' -- model of security personel
-- polo © License | Discord : https://discord.gg/czW6Jqj
-- Set weapons: https://forum.fivem.net/t/list-of-weapon-spawn-names-after-hours/90750
config.weapon1 = 'WEAPON_PISTOL'
config.weapon3 = 'WEAPON_PISTOL50'
-- polo © License | Discord : https://discord.gg/czW6Jqj
-- Set config.usejob = true if you want to use a job
config.usejob = false  -- restrict to a job?
config.jobname = 'famillies' -- which job to use the menu?

Config.CircleZones = {
    DrugDealer = {coords = vector3(-123.36, -1617.21, 31.98), name = _U('map_blip'), color = 2, sprite = 84, radius = 100.0},
}

Config.familliesStations = {
  famillies = {

    AuthorizedWeapons = {
      { name = 'WEAPON_COMBATPISTOL',     price = 85000 },
      { name = 'WEAPON_FLASHLIGHT',       price = 50 }
	  
    },

	  AuthorizedVehicles = {
		  { name = 'tornado',    label = 'Tornado' },
		  { name = 'buccaneer',  label = 'Buccaneer' },
		  { name = 'peyote',     label = 'Peyote' },
		  { name = 'speedo',     label = 'Cammionette' },
	  },

    Cloakrooms = {
      { x = -152.17999267578125, y = -1590.6800537109375, z = 35.02999877929687 }, -- fait -152.17999267578125, -1590.6800537109375, 35.02999877929687
    },

    Armories = {
      { x = -137.67, y = -1609.80, z = 35.030 }, -- fait
    },

    Vehicles = {
      {
        Spawner    = { x = -109.51000213623048, y = -1591.4599609375, z = 31.90999984741211 }, -- fait -109.51000213623048, -1591.4599609375, 31.90999984741211
        SpawnPoint = { x = -101.202, y = -1590.29, z = 31.43 }, -- fait
        Heading    = 313.9, -- fait
      }
    },

    VehicleDeleters = {
      { x = -101.202, y = -1590.29, z = 31.43 }, -- fait
    },

    BossActions = {
      { x = -159.94000244140625, y = -1602.1300048828125, z = 35.04000091552734 } -- fait -159.94000244140625, -1602.1300048828125, 35.04000091552734
    },

  },

}