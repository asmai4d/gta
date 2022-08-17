Config                            = {}
Config.DrawDistance               = 100.0
Config.MarkerType                 = 3
Config.MarkerSize                 = { x = 1.0, y = 2.0, z = 1.0 }
Config.MarkerColor                = { r = 254, g = 51, b = 255 }
Config.EnablePlayerManagement     = true
Config.EnableArmoryManagement     = true
Config.EnableESXIdentity          = false
Config.EnableSocietyOwnedVehicles = false
Config.EnableLicenses             = false
Config.MaxInService               = -1
Config.Locale                     = 'en'
config  = {}

-- Доступные машины для группировки
-- не нужны, нужно убрать (С) Ярик 
config.vehicle1 = 'manchez'
config.vehicle2 = 'bf400'
config.vehicle3 = 'sultan'
config.vehicle4 = 'sultan'

config.ped1 = 'g_m_y_ballaeast_01' -- model of security personel
config.ped3 = 'g_m_y_ballaeast_01' -- model of security personel

-- Оружие, которое банда может купить
config.weapon1 = 'WEAPON_PISTOL'
config.weapon3 = 'WEAPON_PISTOL50'

config.usejob = false  -- restrict to a job?
config.jobname = 'lost' -- which job to use the menu?

Config.CircleZones = {
    DrugDealer = {coords = vector3(83.041, -1921.87, 20.87), name = _U('map_blip'), color = 7, sprite = 84, radius = 100.0},
}

Config.lostStations = {
  lost = {

    AuthorizedWeapons = {
      { name = 'WEAPON_COMBATPISTOL',     price = 85000 },
      { name = 'WEAPON_FLASHLIGHT',       price = 50 }
	  
    },

	 -- AuthorizedVehicles = {
	--	  { name = 'BF400',    label = 'MotoCross' },
	--	  { name = 'tornado',    label = 'Tornado' },
	--	  { name = 'buccaneer',  label = 'Buccaneer' },
	--	  { name = 'peyote',     label = 'Peyote' },
	--	  { name = 'speedo',     label = 'Cammionette' },
	 -- },

  --  Cloakrooms = {
   --   { x = 118.0199966430664, y = -1963.4300537109375, z = 21.32999992370605 }, -- fait 
   -- },

--    Armories = {
--      { x = 170.2299957275391, y = 2786.570068359375, z = 45.95999908447265 }, -- fait
--    },

  --  Vehicles = {
  --    {
  --      Spawner    = { x = 83.69, y = -1974.02, z = 20.92 }, -- fait
  --      SpawnPoint = { x = 89.43, y = -1966.90, z = 20.74 }, -- fait
  --      Heading    = 320.93, -- fait
  --    }
  -- },

  --  VehicleDeleters = {
  --    { x = 89.43, y = -1966.90, z = 20.74 }, -- fait
  --    -- { x = -1152.642, y = -1564.809, z = 4.182 }, -- fait
  --  },

--    BossActions = {
--		{ x = 173.17000244140625, y = 2799.950009765625, z = 45.96000122070312 } -- fait
--    },

  },

}