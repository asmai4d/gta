Config = {}

Config.Locale = 'en'

-- esx / mythic
Config.NotificationType = 'esx'

Config.Blip = {
    Color = 1, -- https://docs.fivem.net/docs/game-references/blips/ (Scroll to the bottom)
    Scale = 1.0, -- This needs to be a float (eg. 1.0, 1.2, 2.0)
    Sprite = 567, -- https://docs.fivem.net/docs/game-references/blips/
    Time = 60, -- How long the blip will stay in map (in seconds)
    PlaySound = true -- Should there be a sound for the police when the blip shows up (true / false)
}

-- The distance at which you will see the "Press E to rob" text
Config.SeeDistance = 4.5 
-- The distance at which you can interact with NPCs
Config.InteractDistance = 4.5
-- Should the "Press E to rob" text only show when you are aiming at the NPC
Config.TextOnlyWhenAiming = false

-- Weapons that you can't rob a NPC with
Config.DisabledWeapons = {
    [`WEAPON_PETROLCAN`] = true,
    [`WEAPON_FLASHLIGHT`] = true,
}

-- Number of police required to rob NPCs
Config.PoliceRequired = 0 
-- Can the player rob NPCs with melee weapons (true / false)
Config.CanRobWithMelee = true
-- Should NPC give black money when robbing them (true / false)
Config.RewardBlackMoney = true
-- How long you need to intimidate the npc for
Config.IntimidateTime = 25000
-- The chance that police will get alert when you start robbing the NPC
Config.AlertRobChanceStart = 25
-- The chance that police will get alert after you have robbed the NPC
Config.AlertRobChanceEnd = 50
-- How many times you can fail intimidating before you fail robbing
Config.MaxFailedTimes = 20
-- If you want to have items as rewards too
Config.RobRewardItems = {
    { name = 'money', chance = 50, min = 20, max = 300 }, --  Name (money, black_money, bank), minimum amount, maximum amount
    { name = 'phone', chance = 50, min = 1, max = 1 }, -- You can also add items and weapons
    { name = 'watch_a', chance = 40, min = 1, max = 1 },
    { name = 'a_trinket', chance = 40, min = 1, max = 1 },
    { name = 'a_wallet', chance = 40, min = 1, max = 1 },
    { name = 'a_shoal', chance = 20, min = 1, max = 1 },
    { name = 'a_silver_ring', chance = 20, min = 1, max = 1 },
    { name = 'a_golden_ring', chance = 25, min = 1, max = 1 },
    { name = 'a_chain', chance = 10, min = 1, max = 1 },
    { name = 'a_silver_earring', chance = 25, min = 1, max = 1 },
    { name = 'a_silver_chainlet', chance = 20, min = 1, max = 1 },
    { name = 'a_golden_bracelet', chance = 5, min = 1, max = 1 },
    { name = 'a_earring_transparent', chance = 3, min = 1, max = 1 },
    { name = 'a_silver_bracelet', chance = 15, min = 1, max = 1 },
}
-- Cooldown of robbing NPCs
 Config.CooldownTime = 60 * 2 -- 2 minutes


-- Enable animation when NPC alert cops (true / false)
Config.EnableCallPoliceAnim = true
-- NPC police alert animation time in milliseconds
Config.AnimationTime = 5000
-- Put your police job names here
Config.PoliceJobs = {
    ['police'] = true,
    --['sheriff'] = true
}

-- The chance that the NPC will rob you in percents, 0 = NPC won't rob players, NPC can only rob you if you have a melee weapon
Config.RobChance = 15
-- THe weapon that NPCs will have when they rob a player (https://wiki.rage.mp/index.php?title=Weapons)
Config.NpcWeapon = 'WEAPON_PISTOL'
-- The min amount of cash the NPC will rob
Config.MinRobNPCAmount = 20
-- The max amount of cash the NPC will rob
Config.MaxRobNPCAmount = 100


