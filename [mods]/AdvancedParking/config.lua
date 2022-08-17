Config = {}

-- set this to true if you want to see debug messages on client and server side
Config.isDebug = true

-- this controls the distance at which vehicles will spawn to the closest player 
-- (in meters)
Config.spawnDistance = 200.0

-- this controls when a vehicle will be removed from the database table when 
-- calling the cleanup function (in hours; so 24 * 7 = one week)
Config.cleanUpThresholdTime = 24 * 7

-- set this to true if you also want the cleanup running at a certain time of day
Config.useCleanUpTask = false
-- only used when useCleanUpTask is set to true
Config.cleanUpTaskTime = {
	hours	= 3,
	minutes	= 0,
	seconds	= 0
}

-- set this to false if you do not want entities render as scorched when they 
-- are completely broken
Config.renderScorched = true

-- vehicle classes that you do not want to save go here (remove the -- in front 
-- of the number if you want it blacklisted)
Config.classesBlacklist = {
	-- 0, -- Compacts  
	-- 1, -- Sedans  
	-- 2, -- SUVs  
	-- 3, -- Coupes  
	-- 4, -- Muscle  
	-- 5, -- Sports Classics  
	-- 6, -- Sports  
	-- 7, -- Super  
	-- 8, -- Motorcycles  
	-- 9, -- Off-road  
	--10, -- Industrial  
	--11, -- Utility  
	--12, -- Vans  
	--13, -- Cycles  
	--14, -- Boats  
	--15, -- Helicopters  
	--16, -- Planes  
	--17, -- Service  
	--18, -- Emergency  
	--19, -- Military  
	--20, -- Commercial  
	21, -- Trains 
}
-- other vehicles that you do not want to save can be inserted here (use `MODELNAME` 
-- when you put them in there)
Config.vehiclesBlacklist = {
	--`blista`,
	--`firetruk`,
	--`adder`,
}
-- any plates from vehicles you do not want to save, go here (not case sensitive and 
-- can use partial strings)
Config.platesBlacklist = {
	--"XYZ 404 ",
	--"xyz 404",
	--"mech",
}

-- only save vehicles that are owned (only works with ESX)
-- if set to true: requires kimi_callbacks!
Config.saveOnlyESXOwnedVehicles = true

-- this lets you control if vehicles should be deleted (in minutes; 0 if you do not 
-- want to use it; this is useful for large servers with a lot of players)
Config.deleteTimer = 0
-- despawns all vehicles that are more than x meters away from a player
Config.deleteDistance = 25.0
-- when the notifications should be shown before the despawning
-- needs to be in descending order in minutes and lower than Config.deleteTimer
Config.deleteNotificationTimes = { 5, 3, 2, 1 }
-- notification to show players before deleting vehicles
-- (use %s as placeholder for time left in minutes)
Config.timeLeftNotification = "Vehicles will be despawned in %s minutes."
-- notification to show players when deleting vehicles
Config.deleteNotification = "Deleting vehicles..."
