
## Support

If you require any form of support after buying this resource, the right place to ask is our 
Discord Server: https://discord.gg/UyAu2jABzE

Make sure to react to the initial message with the tick and your language to get access to all 
the different channels. After that you have to request your scripts role in the appropriate channel 
by using your cfx.re username and the script you just purchased. Soon after that you will receive 
your role and get access to the channels that are specifically for this script.

Please do not contact anyone directly unless you have a really specific request that does not have 
a place in the server.

Updates for the script can be downloaded from the same link that was provided to you when you first 
purchased this script.


## What does it do exactly?

As soon as you get out of a vehicle, it gets registered in the database as a saved vehicle. After 
that, the vehicle will stay at that location and even get updated when it gets moved (e.g. when 
ramming it)!

If a vehicle gets deleted while a player is inside (e.g. in most garage scripts or jobs), the 
vehicle automatically gets unregistered from the script and database and will not spawn anymore 
until you enter that vehicle again!


### Requirements

- OneSync
- [MySQL Async Library](https://forum.cfx.re/t/release-mysql-async-library-3-3-2/21881)
- [kimi_callbacks](https://forum.cfx.re/t/release-callbacks-using-exports-and-with-added-timeouts-free/3035585) (optional / for the two exports)


## Features

- All vehicles a player entered or left will be saved.
- Non-networked (or clientside only) vehicles will be ignored.
- Saved vehicles will be respawned when they disappeared and upon server restart.
- Saved vehicles that do not have a player in them can still be moved (e.g. rammed or towed) and 
  update their position and health values.
- Prevents duplicate spawns and vehicle spawning happens on serverside.
- Clean up function for vehicles that have not been updated for a configurable amount of time.
- Global vehicle delete function that can delete all vehicles on the server every configurable 
  amount of time that does not have a player near it (useful for servers with a large amount of 
  players)
- Admin command for deleting all vehicles from the table.
- Classes, vehicles and plates blacklist.
- Config option to save only owned vehicles (only ESX, "kimi_callbacks" required).
- Exports for receiving the position of vehicles from server side.
- Exports for receiving the position of vehicles from client side ("kimi_callbacks" required).
- Can be restarted any time.

### All saved values

- Position and rotation
- Door lock status
- All visual modifications (bumper, spoiler, wheels etc.)
- All performance modifications (engine, transmission etc.)
- All colors (primary, secondary, perl effect, interior, wheels, tire smoke, lights and custom RGB 
  colors)
- All liveries (e.g. Windsor livery)
- All extras (like Banshee or Buccaneer roof)
- All health values (body, engine, petrol tank)
- Fuel and dirt level
- Missing doors
- Flat and burst tires
- Broken windows (disabled as of the v2.4.1 release as it can cause errors)


### Performance

- Client Side: 0.02ms when idle and up to 0.04ms while spawning a vehicle
- Server Side: 0.02-0.03ms


### Installation instructions

1. Extract the downloaded folder into your resources.
2. Execute the included .sql file into your database.
3. Download and install mysql-async (can be skipped if already being used).
4. Download kimi_callbacks resource and extract it into your resources (can be skipped if already 
   being used or not using the exports from AdvancedParking).
5. Start resources in the following order in your server.cfg:
```
ensure mysql-async
ensure kimi_callbacks
ensure AdvancedParking
```


### What to do to ensure compatibility with other scripts?

If you have any license plate changer script, you need to replace the following line in that script
```
SetVehicleNumberPlateText(vehicle, plate)
```
into
```
exports["AdvancedParking"]:UpdatePlate(vehicle, plate)
```

If you delete a vehicle from the OUTSIDE, this vehicle also needs to be deleted from the scripts 
table. For this I provide another event:
TriggerServerEvent("AdvancedParking:deleteVehicle", vehiclePlate, deleteEntity)
Replace vehiclePlate with the vehicles plate and deleteEntity should be true, if you also want to 
delete the vehicle from the world! If you set deleteEntity to false, it will simply delete it from 
the scripts table, but not from the world.

For ESX users I provide this little snippet that can override the ESX.Game.DeleteVehicle function.
Go to es_extended/client/functions.lua and find the function and replace it with the following 
code:
```
ESX.Game.DeleteVehicle = function(vehicle)
    if (NetworkGetEntityIsNetworked(vehicle)) then
        TriggerServerEvent("AdvancedParking:deleteVehicle", GetVehicleNumberPlateText(vehicle), true)
        Citizen.Wait(300)
    end

    if (DoesEntityExist(vehicle)) then
        SetEntityAsMissionEntity(vehicle,  false,  true)
        DeleteVehicle(vehicle)
    end
end
```

### Exports usage

- Get a single vehicles position:
```lua
local pos = exports["AdvancedParking"]:GetVehiclePosition(plate)
print(plate .. ": " .. tostring(pos))
```

- Get position of several vehicles (you can basically use an infinite amount of plates)
```lua
local positions = exports["AdvancedParking"]:GetVehiclePositions(plate1, plate2, plate3)
for plate, pos in pairs(positions) do
    print(plate .. ": " .. tostring(pos))
end
```

- Updating a vehicles plate:
```
exports["AdvancedParking"]:UpdatePlate(vehicle, plate)
```


### Patchnotes

Release (v1.0):

- Park any vehicle (cars, planes, boats, bikes, etc.) anytime anywhere!
- Vehicles are saved with
  - status (engine health, dirt level, fuel level etc.)
  - mods (spoiler, bumper, performance tuning, etc.)
  - colours (primary, secondary, etc.)
  - extras (all vehicles extras (e.g. the banshee roof)
- Configurable spawn distance (when a vehicle despawned or after e.g. server restart)
- Configurable debug mode (debug messages to figure out what's wrong)
- Configurable "cleanup" time for the cleanup functionality
- includes full source code

Update (v1.1):

- Bugfix: Compatibility with Garage from Codesign (vehicle did respawn after storing in garage)
- Bugfix: liveries not saving properly
- custom wheels saving
- new Client Event to trigger a manual update of a vehicle: 
  TriggerEvent("AdvancedParking:updateVehicle", vehicle)
  This needs to be done when working with the vehicles from outside! E.g. when locking a vehicle 
  this event needs to be added to your lockscript
- Admin Command for deleting all vehicles from the database table: "deleteSavedVehicles" (needs to 
  be executed twice to take effect)

Update (v1.2):

- Fixed saving and re-applying of all vehicle health values
- Fixed compatibility with several scripts that used "Previews" of vehicles (mainly vehicle shops 
  and some garages) by adding a client event that has to be triggered when the script should stop 
  (and start) working again.
  Stopping: TriggerEvent("AdvancedParking:enable", false)
  Starting: TriggerEvent("AdvancedParking:enable", true)

Update (v1.3):

- (probably) fixed duplicating vehicles in a certain case

Update (v1.4):

- Fixed an error on serverside that could happen, when a vehicle was updated that was not already 
  registered in the database.

Update (v2.0):

- IF YOU UPDATE FROM AN OLDER VERSION: YOU NEED TO EMPTY THE vehicle_parking TABLE FROM YOUR 
  DATABASE! (this should be the only time you need to do this!)
- Complete rewrite of the code base
- Server now spawns the vehicle
- Server automatically checks for position, rotation, lockStatus, bodyHealth, engineHealth and 
  petrolTankHealth and updates accordingly
- Manual update of vehicles only necessary when other values are being changed
- Vehicles that are purely client-side (meaning they can only be seen by one player) are now not 
  saved anymore
- Expanded the server event "AdvancedParking:deleteVehicle" with a boolean value indicating if the 
  vehicle should be deleted from the world and not only the table.
- Vehicle Extras now working properly
- Exploded vehicles now also spawn with a scorched look
- Broken windows now saved
- Flat tires / On rims now saved
- Missing doors now saved
- bulletproof tires now saved

Update (v2.1):

- fixed a bug that could result in the respawning of a deleted vehicle
- changed a few things when spawning a vehicle (hopefully resolves all instances of not properly 
  saving vehicle health)
- if there is an update to a vehicle when the same vehicle is already spawned in the world 
  somewhere, it will first try to despawn that one in order to not create a duplicate vehicle
- added nil-error handling for events that need to be triggered from other scripts

Update (v2.2):

- fixed an error regarding vehicle plate changing
- finally re-added the command to completely wipe the database

Update (v2.3):

- added xenon light colour to saved values
- added a blacklist for vehicles or whole classes as a config option
- added a configurable feature that allows to set an interval at which every vehicle that is 
  currently in the world will be deleted if it is too far away from a player. This is mainly useful 
  for large servers with a lot of players. Players will receive a notification prior to the 
  deletion, so e.g. they can get to their vehicles before it happens.
- (hopefully) fixed the CleanUp() function not working as expected
- fixed an error in the server console when deleting certain entities
- fixed another issue related to ESX.Game.DeleteVehicle that could prevent the vehicle from being 
  deleted if it happened just at the right moment.

Hotfix (v2.3.1):

- fixed a nil value resulting in an SQL error

Update (v2.5):

- added a license
- support for custom vehicle colors (using RGB)
- added config option for vehicles rendering as scorched when broken
- added an event that can be triggered when repairing a vehicle to not make it render as scorched 
  anymore (replace vehicle with your variable):
  TriggerServerEvent("AdvancedParking:renderScorched", NetworkGetNetworkIdFromEntity(vehicle), false)
- fixed rare occasions of vehicles respawning without any of their proper mods
- massively reduced network traffic by fixing a bug when spawning a vehicle
- fixed another error regarding the CleanUp() function
- fixed a weird deletion error regarding client side vehicles
- added interior color to the saved values

Update (v2.6):

- Added export for retrieving the location of a single vehicle by its plate.
- Added export for retrieving the locations of several vehicles by their plates.
- Added [kimi_callbacks](https://forum.cfx.re/t/release-callbacks-using-exports-and-with-added-timeouts-free/3035585) 
  script for those callbacks.
- Fixed vehicle duplication glitch when restarting the script while some vehicle weren't properly 
  spawned.
- Fixed vehicle duplication glitch due to it being saved with the wrong plate (plate still needs to 
  be set before the player sits inside).
- Fixed "Setting mods failed" spam in the console (this message can still appear but it should not 
  get spammed anymore!).
- Added more information to "Setting mods failed" message to narrow problems down if it should 
  appear.
- Removed bodyHealth from the values which the server automatically saves (still gets saved from 
  client side update) (this fixes the "rattling" noises of the vehicle).

Update (v2.6.1):

- Added the ability to not use "kimi_callbacks". But then the two exports will not be available.
- Removed the 8 character limit when looking for vehicle positions with the new exports.
- Fixed an error when looking for vehicle positions using the new exports.

Update (v2.7):

- Added configurable plates blacklist. You can now blacklist certain plates or parts of plates.

Update (v2.7.1):

- Added serverside exports for getting a vehicles position.
- Fixed a really rare occurring error on server side when trying to spawn vehicles that could crash 
  the script.

Update (v2.8):

- Added config option for saving only player owned vehicles (ESX only, requires "kimi_callbacks").
- Added config option to run the cleanup function at any time of day.
- Updating plates is now easier. When triggering the event, only the "newPlate" needs to have 
  exactly 8 characters. Also added error handling for this event.
- Added a new file for functions that can be run at any time of day (this file can be used by 
  everyone for free in any project! (refer to the contents of that file for more)).

Update (v2.8.1):

- Fixed an error that could happen when saving only owned vehicles.

Update (v2.8.2):

- Minor fix for the exports.

Update (v2.9):

- Changed the event for changing a vehicle plate into a much easier to use export.

Update (v2.9.1):

- Removed an unnecessary leftover print on server side.
