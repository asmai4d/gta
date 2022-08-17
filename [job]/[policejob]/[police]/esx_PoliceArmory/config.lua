--------------------------------
------- Created by Hamza -------
-------------------------------- 

Config = {}

-- Police Armory Positions:
Config.ArmoryZones = {
	PoliceArmory = {
		Pos = {
			{x = 485.41,  y = -995.51, z = 30.69},
			{x = 0.0,  y = 0.0, z = 0.0}
		}
	}
}

--Police Kevlar Positions:
Config.KevlarZones = {
	PoliceKevlar = {
		Pos = {
			{x = 482.37,  y = -995.56, z = 30.69},
			{x = 0,  y = 0, z = 0}
		}
	}
}

--Police Attachments Positions:
Config.AttachmentZones = {
	PoliceAttachments = {
		Pos = {
			{x = 487.1,  y = -997.07, z = 30.69},
			{x = 0,  y = 0, z = 0}
		}
	}
}

-- Police Armory Marker Settings:
Config.KeyToOpenArmory = 38															-- default 38 is E
Config.ArmoryMarker = 27 															-- marker type
Config.ArmoryMarkerColor = { r = 50, g = 50, b = 204, a = 100 } 					-- rgba color of the marker
Config.ArmoryMarkerScale = { x = 1.0, y = 1.0, z = 1.0 }  							-- the scale for the marker on the x, y and z axis
Config.ArmoryDraw3DText = "Press ~g~[E]~s~ for ~y~ Open Armory~s~"					-- set your desired text here

-- Police Kevlar Marker Settings:
Config.KeyToOpenKevlar = 38															-- default 38 is E
Config.KevlarMarker = 27 															-- marker type
Config.KevlarMarkerColor = { r = 50, g = 50, b = 204, a = 100 } 					-- rgba color of the marker
Config.KevlarMarkerScale = { x = 1.0, y = 1.0, z = 1.0 }  							-- the scale for the marker on the x, y and z axis
Config.KevlarDraw3DText = "Press [E] to open the menu bulletproof vest"					-- set your desired text here

-- Police Attachments Marker Settings:
Config.KeyToOpenAttachments = 38													-- default 38 is E
Config.AttachmentsMarker = 27 														-- marker type
Config.AttachmentsMarkerColor = { r = 50, g = 50, b = 204, a = 100 } 				-- rgba color of the marker
Config.AttachmentsMarkerScale = { x = 1.0, y = 1.0, z = 1.0 }   					-- the scale for the marker on the x, y and z axis
Config.AttachmentsDraw3DText = "Press ~g~ [E] ~s~ for ~y~ Open the Accessory Menu ~s~"		-- set your desired text here

-- Menu Element Labels:
Config.WeaponStorage = "Weapons"
Config.RestockWeapon = "Deposit"
--Config.Vest1 = "Kevlar 1"					-- 25% armor
--Config.Vest2 = "Kevlar 2"					-- 50% armor
--Config.Vest3 = "Kevlar 3"					-- 75% armor
Config.Vest4 = "bullet proof vest"					-- 100% armor
Config.RemoveVest = "remove"			-- 0% armor

-- Menu Title Labels_
Config.PoliceArmoryTitle = "Weapons"
Config.WeaponStorageTitle = "Weapons"
Config.RestockWeaponTitle = "Deposit"
Config.PoliceKevlarTitle = "Vest"
Config.ChooseWeaponTitle = "Choose the weapons"
Config.AttachmentTitle = "Accessories"

-- ESX Show Notifications_
Config.ContactSuperVisor = "You have already released this weapon, contact a supervisor"
Config.NoPoliceOnline = "No police officer is online"
Config.WeaponMustBeInHand = "You must hold the weapon in your hand"
Config.FlashlightEquipped = "You have equipped a flashlight ~r~%s ~s~"
Config.FlashlightRemove = "You removed a flashlight for ~r~%s ~s~"
Config.ScopeEquipped = "You have equipped a scope for ~r~%s ~s~"
Config.ScopeRemove = "You deleted a scope for ~r~%s ~s~"
Config.SuppressorEquipped = "You have fitted a telescope ~s~ for ~r~%s ~s~"
Config.SuppressorRemove = "You deleted a range ~s~ for ~r~%s ~s~"

-- ProgressBar Text_
Config.Progress1 = "Put away the weapons"
Config.Progress2 = "Take off the vest"
Config.Progress3 = "Put on the vest"

-- ProgressBar Timer, in seconds:
Config.RestockTimer = 2
Config.RemoveVestTimer = 2
Config.WearVestTimer = 2

-- Ped Component Variation (Body Armor that player will wear)
--Config.VestVariation1 = { componentId = 9, drawableId = 12, textureId = 0, paletteId = 12 } -- 25%
--Config.VestVariation2 = { componentId = 9, drawableId = 1, textureId = 0, paletteId = 0 } -- 50%
--Config.VestVariation3 = { componentId = 9, drawableId = 1, textureId = 2, paletteId = 0 } -- 75%
Config.VestVariation4 = { componentId = 9, drawableId = 12, textureId = 0, paletteId = 12 } -- 100%

-- Set the exact name from your jobs database for police
Config.PoliceDatabaseName = 'police'

-- Set required police job grade to restock weapon
Config.RestockGrade = 4

-- Set amount of ammo you want when taking a weapon out
Config.AmmountOfAmmo = 250

-- Here u add weapons and its components (set nil at a component to disable it).
Config.WeaponsInArmory = {
	{ weaponHash = 'WEAPON_FLASHLIGHT', label = 'Flashlight', type = 'other', attachment = false, flashlight = nil, scope = nil, suppressor = nil},
	{ weaponHash = 'WEAPON_NIGHTSTICK', label = 'Baton', type = 'other', attachment = false, flashlight = nil, scope = nil, suppressor = nil  },
	{ weaponHash = 'WEAPON_STUNGUN', label = 'Tasers', type = 'other', attachment = false, flashlight = nil, scope = nil, suppressor = nil  },
	{ weaponHash = 'WEAPON_PISTOL', label = 'Gun', type = 'pistol', attachment = true, flashlight = 0x43FD595B, scope = nil, suppressor = 0x65EA7EBB},
	{ weaponHash = 'WEAPON_SMG', label = 'MP5 9MM', type = 'smg', attachment = true, flashlight = 0x7BC4CDDC, scope = 0x3CC6BA57, suppressor = 0xC304849A  },
	{ weaponHash = 'WEAPON_CARBINERIFLE', label = 'Carbine Rifle Mk II', type = 'rifle', attachment = true, flashlight = 0x7BC4CDDC, scope = 0x49B2945, suppressor = 0x837445AA  },
	{ weaponHash = 'WEAPON_BZGAS', label = 'Gaz', type = 'shotgun', attachment = true, flashlight = 0x7BC4CDDC, scope = nil, suppressor = nil  },
}

Config.DiscordWebook = "https://discordapp.com/api/webhooks/657230016408453120/7EB1FbeMJc6AmVrVOVURlyh2OGzTCUBvhhhbyeiXN1fTe1K1uDVouJMfUadh3p0HZx-U"
