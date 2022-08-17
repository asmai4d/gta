Config                            = {}
Config.DrawDistance               = 100.0
Config.MarkerType                 = 1
Config.MarkerSize                 = { x = 1.5, y = 1.5, z = 1.0 }
Config.MarkerColor                = { r = 50, g = 50, b = 204 }
Config.EnablePlayerManagement     = true
Config.EnableArmoryManagement     = false
Config.EnableESXIdentity          = true -- only turn this on if you are using esx_identity
Config.EnableNonFreemodePeds      = true -- turn this on if you want custom peds
Config.EnableSocietyOwnedVehicles = false
Config.EnableLicenses             = true
Config.MaxInService               = -1
Config.Locale                     = 'ru'

Config.FireStations = {

  LSFD = {
    Blip = {
      Pos = { x = -1675.94, y = 51.07, z = 63.33 },
      Sprite  = 436,
      Display = 4,
      Scale   = 0.8,
      Colour  = 1,
    },

    AuthorizedWeapons = {
      {name = 'WEAPON_FLASHLIGHT',       price = 80},
      {name = 'WEAPON_FIREEXTINGUISHER', price = 120},
	  {name = 'WEAPON_FLARE',            price = 60 },
      {name = 'WEAPON_FLAREGUN',         price = 60},
    },

    AuthorizedVehicles = {
	  { name = 'firetruk', label = 'Fire Truck' }
    },

    Cloakrooms = {
      { x = -1678.77, y = 52.73, z = 62.34 }
    },

    Armories = {
      { x = -1675.94, y = 51.07, z = 62.33 },
    },

    Vehicles = {
      {
        Spawner    = { x = -1664.45, y = 42.08, z = 62.36 },
        SpawnPoint = { x = -1670.73, y = 46.15, z = 63.34 },
        Heading    = 315.46
      }
    },

    Helicopters = {
      {
        Spawner    = {x = 466.477, y = -982.819, z = 42.691},
        SpawnPoint = {x = 450.04, y = -981.14, z = 42.691},
        Heading    = 0.0
      }
    },

    VehicleDeleters = {
      { x = -1670.73, y = 46.15, z = 62.34 },
    },

    BossActions = {
      { x = -1672.90, y = 59.09, z = 66.57 },
    }
  }
}