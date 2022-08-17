Config                            = {}
Config.DrawDistance               = 100.0
Config.MarkerType                 = 3
Config.MarkerSize                 = { x = 1.0, y = 2.0, z = 1.0 }
Config.MarkerColor                = { r = 239, g = 224, b = 0 }
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
config.ped1 = 'g_m_y_pologoon_02' -- model of security personel
config.ped3 = 'g_m_y_pologoon_02' -- model of security personel
-- polo © License | Discord : https://discord.gg/czW6Jqj
-- Set weapons: https://forum.fivem.net/t/list-of-weapon-spawn-names-after-hours/90750
config.weapon1 = 'WEAPON_PISTOL'
config.weapon3 = 'WEAPON_PISTOL50'
-- polo © License | Discord : https://discord.gg/czW6Jqj
-- Set config.usejob = true if you want to use a job
config.usejob = false  -- restrict to a job?
config.jobname = 'vagos' -- which job to use the menu?

Config.CircleZones = {
    DrugDealer = {coords = vector3(329.95, -2036.40, 20.96), name = _U('map_blip'), color = 46, sprite = 84, radius = 110.0},
}

Config.VagosStations = {
  Vagos = {

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
      { x = 343.79998779296875, y = -2021.5400390625, z = 22.38999938964843 }, -- fait 343.79998779296875, -2021.5400390625, 22.38999938964843
    },

    Armories = {
      { x = 332.05999755859375, y = -2013.81005859375, z = 22.65999984741211 }, -- fait 332.05999755859375, -2013.81005859375, 22.65999984741211
    },

    Vehicles = {
      {
        Spawner    = { x = 313.437, y = -2028.472, z = 20.545 }, -- fait
        SpawnPoint = { x = 329.465, y = -2042.366, z = 20.811 }, -- fait
        Heading    = 142.937, -- fait
      }
    },

    VehicleDeleters = {
      { x = 325.487, y = -2025.938, z = 21.012 }, -- fait
    },

    BossActions = {
      { x = 360.1600036621094, y = -2038.1700439453127, z = 25.59000015258789 } -- fait 360.1600036621094, -2038.1700439453127, 25.59000015258789
    },

  },

}