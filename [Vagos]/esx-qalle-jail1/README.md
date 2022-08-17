# esx-qalle-jail

[INFO]

* Anti Combat Log
* Prison Work
* Working Teleporters
* Cool Interior
* Photo Taken (Mugshot)

*This is a script made for you that wan't something out of the ordinary, this is a jail script that will add some cool side effects of getting jailed, one of em is that when you get jailed you will be teleported to the charactermugshot creation, and an sheriff ped will take a photo of you. The other thing is that you can work for a small amount of cash while in jail.*

[EXTRAS]

* Add To Vagos Menu Example ->

```lua
        elements = {
            {label = _U('citizen_interaction'),	value = 'citizen_interaction'},
            {label = _U('vehicle_interaction'),	value = 'vehicle_interaction'},
            {label = _U('object_spawner'),		value = 'object_spawner'},
            {label = "Jail Menu",               value = 'jail_menu'} -- You add this line
        }
    }, function(data, menu)

        --You add this

        if data.current.value == 'jail_menu' then
            TriggerEvent("esx-qalle-jail1:openJailMenu")
        end

        --Above This
        if data.current.value == 'citizen_interaction' then
```

[REQUIREMENTS]
  
* ESX Support
  * esx_policejob => https://github.com/ESX-Org/esx_policejob
  
[INSTALLATION]

1) CD in your resources/[esx] folder

2) Import ``jail.sql`` into your database

3) Download ``prison-map-addon`` from https://github.com/qalle-fivem/prison-map-addon

4) Add this in your server.cfg :
``start esx-qalle-jail1``

----------------------------------------------------------------------
                Discord : https://discord.gg/czW6Jqj
                            polo#7774
----------------------------------------------------------------------