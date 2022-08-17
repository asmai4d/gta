ESX = nil
PlayerData = {}
local whstart, pickup, drawmarker, shouldlock, draw, NPCstart, Delstart, Sellstart = false, false, false, false, false, false, false, false
local currentslot, currentblip, vehblip, C_heading, header, text, markerloc, Missioncar, Busy
local locked = true
-- polo © License | Discord : https://discord.gg/czW6Jqj
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)