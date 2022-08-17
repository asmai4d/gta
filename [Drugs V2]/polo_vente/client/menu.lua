ESX = nil
local HeroineTraiter = 0
local OpiumTraiter = 0
local WeedTraiter = 0
local EcstasyTraiter = 0
local AmphetaminesTraiter = 0
local LSDTraiter = 0
local LeanTraiter = 0
local CokeTraiter = 0
local MarijuanaTraiter = 0
local npcCooords = {coords = vector3(491.05, -1523.47, 29.29)}
local npcCooords2 = {coords = vector3(-2194.74, 249.39, 174.61)}
-- polo © License | Discord : https://discord.gg/czW6Jqj
function RandomSpawnNPC()
    local index = GetRandomIntInRange(1, #NpcHeroineSpawn)
    return NpcHeroineSpawn[index]
end

function RandomSpawnNPC()
    local index = GetRandomIntInRange(1, #NpcOpiumSpawn)
    return NpcOpiumSpawn[index]
end

function RandomSpawnNPC()
    local index = GetRandomIntInRange(1, #NpcWeedSpawn)
    return NpcWeedSpawn[index]
end

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
	PlayerData = ESX.GetPlayerData()
end)

_menuPool3 = NativeUI.CreatePool()
NatveVehMenu = NativeUI.CreateMenu("Illegal menu", "~b~Illegal activity.")
_menuPool3:Add(NatveVehMenu)



function GetNPC(_npc)
    npc_ = _npc
end

function menuIllegal(menu)
    local RecupTraiter = NativeUI.CreateItem("Sell ​​his Héroïne", "")
    RecupTraiter:RightLabel("💉")
    menu:AddItem(RecupTraiter)

    local Opium = NativeUI.CreateItem("Sell ​​his Opium", "")
    Opium:RightLabel("💉")
    menu:AddItem(Opium)

    local Weed = NativeUI.CreateItem("Vendre sa Weed", "")
    Weed:RightLabel("💉")
    menu:AddItem(Weed)

    local Ecstasy = NativeUI.CreateItem("Sell ​​his Ecstasy", "")
    Ecstasy:RightLabel("💉")
    menu:AddItem(Ecstasy)

    local Amphetamines = NativeUI.CreateItem("Sell ​​his Amphetamines", "")
    Amphetamines:RightLabel("💉")
    menu:AddItem(Amphetamines)

    local LSD = NativeUI.CreateItem("Sell ​​his LSD", "")
    LSD:RightLabel("💉")
    menu:AddItem(LSD)

    local Lean = NativeUI.CreateItem("Vendre sa Lean", "")
    Lean:RightLabel("💉")
    menu:AddItem(Lean)

    menu.OnItemSelect = function(sender, item, index)
        if item == RecupTraiter then
                PlaySoundFrontend(-1, "CHALLENGE_UNLOCKED", "HUD_AWARDS", 1)
                TriggerServerEvent("Illegal:RecupTraiter", HeroineTraiter)
                _menuPool3:CloseAllMenus()
                vente()
        end
    menu.OnItemSelect = function(sender, item, index)
        if item == Opium then
                PlaySoundFrontend(-1, "CHALLENGE_UNLOCKED", "HUD_AWARDS", 1)
                TriggerServerEvent("Illegal:Opium", OpiumTraiter)
                _menuPool3:CloseAllMenus()
                venteOpium()
        end
    menu.OnItemSelect = function(sender, item, index)
        if item == Weed then
                PlaySoundFrontend(-1, "CHALLENGE_UNLOCKED", "HUD_AWARDS", 1)
                TriggerServerEvent("Illegal:Weed", WeedTraiter)
                _menuPool3:CloseAllMenus()
                venteWeed()
        end
    menu.OnItemSelect = function(sender, item, index)
        if item == Ecstasy then
                PlaySoundFrontend(-1, "CHALLENGE_UNLOCKED", "HUD_AWARDS", 1)
                TriggerServerEvent("Illegal:Ecstasy", EcstasyTraiter)
                _menuPool3:CloseAllMenus()
                venteEcstasy()
        end
    menu.OnItemSelect = function(sender, item, index)
        if item == Amphetamines then
                PlaySoundFrontend(-1, "CHALLENGE_UNLOCKED", "HUD_AWARDS", 1)
                TriggerServerEvent("Illegal:Amphetamines", AmphetaminesTraiter)
                _menuPool3:CloseAllMenus()
                venteAmphetamines()
        end
    menu.OnItemSelect = function(sender, item, index)
        if item == LSD then
                PlaySoundFrontend(-1, "CHALLENGE_UNLOCKED", "HUD_AWARDS", 1)
                TriggerServerEvent("Illegal:LSD", LSDTraiter)
                _menuPool3:CloseAllMenus()
                venteLSD()
        end
    menu.OnItemSelect = function(sender, item, index)
        if item == Lean then
                PlaySoundFrontend(-1, "CHALLENGE_UNLOCKED", "HUD_AWARDS", 1)
                TriggerServerEvent("Illegal:Lean")
                _menuPool3:CloseAllMenus()
                venteLean()
        end
    end
    end
    end
    end
end
    end
    end
end

local count = 0
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        while ESX == nil do
            Citizen.Wait(10)
        end
        _menuPool3:ProcessMenus()
        
        if count == 0 then
            menuIllegal(NatveVehMenu)
            count = 1
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        if not _menuPool3:IsAnyMenuOpen() then
            NatveVehMenu:Clear()
            menuIllegal(NatveVehMenu)
        end
        Wait(1000)
    end
end)


_menuPool3:RefreshIndex()
_menuPool3:MouseControlsEnabled (false);
_menuPool3:MouseEdgeEnabled (false);
_menuPool3:ControlDisablingEnabled(false);

function OuvrirMenuMission(station)
    NatveVehMenu:Visible(not NatveVehMenu:Visible())
end

---------------- Menu Illegal 2 ---------------------

_menuPool2 = NativeUI.CreatePool()
NatveVehMenu2 = NativeUI.CreateMenu("Illegal menu", "~b~Illegal activity.")
_menuPool2:Add(NatveVehMenu2)

function menuIllegal2(menu)
    local Coke = NativeUI.CreateItem("Sell ​​his Coke", "")
    Coke:RightLabel("💉")
    menu:AddItem(Coke)

    local Marijuana = NativeUI.CreateItem("Sell ​​his Marijuana", "")
    Marijuana:RightLabel("💉")
    menu:AddItem(Marijuana)

    local Meth = NativeUI.CreateItem("Sell ​​his Meth", "")
    Meth:RightLabel("💉")
    menu:AddItem(Meth)

    local Crack = NativeUI.CreateItem("Sell Crack", "")
    Crack:RightLabel("💉")
    menu:AddItem(Crack)

    local Morphine = NativeUI.CreateItem("Sell ​​his Morphine", "")
    Morphine:RightLabel("💉")
    menu:AddItem(Morphine)

    local Ketamine = NativeUI.CreateItem("Sell ​​his Ketamine", "")
    Ketamine:RightLabel("💉")
    menu:AddItem(Ketamine)

    menu.OnItemSelect = function(sender, item, index)
        if item == Coke then
                TriggerServerEvent("Illegal:VenteCoke", CokeTraiter)
                _menuPool2:CloseAllMenus()
        end
    menu.OnItemSelect = function(sender, item, index)
        if item == Marijuana then
                TriggerServerEvent("Illegal:VenteMarijuana", MarijuanaTraiter)
                _menuPool2:CloseAllMenus()
        end
    menu.OnItemSelect = function(sender, item, index)
        if item == Meth then
                TriggerServerEvent("Illegal:VenteMeth", MethTraiter)
                _menuPool2:CloseAllMenus()
        end
    menu.OnItemSelect = function(sender, item, index)
        if item == Crack then
                TriggerServerEvent("Illegal:VenteCrack", CrackTraiter)
                _menuPool2:CloseAllMenus()
        end
    menu.OnItemSelect = function(sender, item, index)
        if item == Morphine then
                TriggerServerEvent("Illegal:VenteMorphine", MorphineTraiter)
                _menuPool2:CloseAllMenus()
        end
    menu.OnItemSelect = function(sender, item, index)
        if item == Ketamine then
                TriggerServerEvent("Illegal:VenteKetamine", KetamineTraiter)
                _menuPool2:CloseAllMenus()
        end
    end
    end
    end
    end
    end
    end
end

local count = 0
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        while ESX == nil do
            Citizen.Wait(10)
        end
        _menuPool2:ProcessMenus()
        
        if count == 0 then
            menuIllegal2(NatveVehMenu2)
            count = 1
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        if not _menuPool2:IsAnyMenuOpen() then
            NatveVehMenu2:Clear()
            menuIllegal2(NatveVehMenu2)
        end
        Wait(1000)
    end
end)


_menuPool2:RefreshIndex()
_menuPool2:MouseControlsEnabled (false);
_menuPool2:MouseEdgeEnabled (false);
_menuPool2:ControlDisablingEnabled(false);

function OuvrirMenuMission2(station)
    NatveVehMenu2:Visible(not NatveVehMenu2:Visible())
end