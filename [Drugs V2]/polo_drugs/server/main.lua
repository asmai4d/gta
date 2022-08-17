-- polo © License | Discord : https://discord.gg/czW6Jqj
ESX = nil
local PlayersHarvesting = {}
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
-- polo © License | Discord : https://discord.gg/czW6Jqj
local function Harvest(source, zone)
    local xPlayer = ESX.GetPlayerFromId(source)
    local xItem1 = xPlayer.getInventoryItem('shovel')
    
    if xItem1.count > 0 then
            TriggerClientEvent('drug1:animation' , source)
            Citizen.Wait(10000)
            xPlayer.addInventoryItem('weed', 5)
		end
	end

RegisterServerEvent('polo_drugs:startHarvest')
AddEventHandler('polo_drugs:startHarvest', function(zone)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(source)
  	
		PlayersHarvesting[_source]=true
		TriggerClientEvent('esx:showNotification', _source, '~g~You Harvest Weed')
		TriggerClientEvent('drugs1:animation' , source)
		Harvest(_source,zone)
end)

local function Harvest2(source, zone)
    local xPlayer = ESX.GetPlayerFromId(source)
    local xItem1 = xPlayer.getInventoryItem('weed')
    
    if xItem1.count > 0 then
            TriggerClientEvent('drugs2:animation2' , source)
            Citizen.Wait(10000)
            xPlayer.addInventoryItem('weed_pooch', 5)
            xPlayer.removeInventoryItem('weed', 5)
		end
	end

RegisterServerEvent('polo_drugs:startHarvest2')
AddEventHandler('polo_drugs:startHarvest2', function(zone)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(source)
  	
		PlayersHarvesting[_source]=true
		TriggerClientEvent('esx:showNotification', _source, '~b~You Process Weed')
		Harvest2(_source,zone)
end)

local function Harvest3(source, zone)
    local xPlayer = ESX.GetPlayerFromId(source)
    
            TriggerClientEvent('drugs2:animation2' , source)
            Citizen.Wait(10000)
            xPlayer.addInventoryItem('coke', 5)
end

RegisterServerEvent('polo_drugs:startHarvest3')
AddEventHandler('polo_drugs:startHarvest3', function(zone)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(source)
  	
		PlayersHarvesting[_source]=true
		TriggerClientEvent('esx:showNotification', _source, '~g~You Harvest Coke')
		TriggerClientEvent('drugs2:animation2' , source)
		Harvest3(_source,zone)
end)

local function Harvest4(source, zone)
    local xPlayer = ESX.GetPlayerFromId(source)
    local xItem1 = xPlayer.getInventoryItem('coke')
	          
    if xItem1.count > 0 then
            TriggerClientEvent('drugs2:animation2' , source)
            Citizen.Wait(10000)
            xPlayer.addInventoryItem('coke_pooch', 5)
            xPlayer.removeInventoryItem('coke', 5)
        else 
            TriggerClientEvent('esx:showNotification', source, 'You do not have x5 Coke.')
        end
    end

RegisterServerEvent('polo_drugs:startHarvest4')
AddEventHandler('polo_drugs:startHarvest4', function(zone)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(source)
  	
		PlayersHarvesting[_source]=true
		TriggerClientEvent('esx:showNotification', _source, '~b~You Process Coke')
		Harvest4(_source,zone)
end)

local function Harvest7(source, zone)
    local xPlayer = ESX.GetPlayerFromId(source)
    
            TriggerClientEvent('opium3:animation3' , source)
            Citizen.Wait(10000)
            xPlayer.addInventoryItem('opium', 5)
        end

RegisterServerEvent('polo_drugs:startHarvest7')
AddEventHandler('polo_drugs:startHarvest7', function(zone)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(source)
  	
		PlayersHarvesting[_source]=true
		TriggerClientEvent('esx:showNotification', _source, '~b~You Pick Up opium')
		TriggerClientEvent('drugs2:animation2' , source)
		Harvest7(_source,zone)
end)

local function Harvest8(source, zone)
    local xPlayer = ESX.GetPlayerFromId(source)
    local xItem1 = xPlayer.getInventoryItem('opium')
    
    if xItem1.count > 0 then 
            TriggerClientEvent('drugs2:animation2' , source)
            Citizen.Wait(10000)
            xPlayer.addInventoryItem('opium_pooch', 5)
            xPlayer.removeInventoryItem('opium', 5)     
        else 
            TriggerClientEvent('esx:showNotification', source, 'You do not have x5 Opium.')
        end
    end

RegisterServerEvent('polo_drugs:startHarvest8')
AddEventHandler('polo_drugs:startHarvest8', function(zone)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(source)
  	
		PlayersHarvesting[_source]=true
		TriggerClientEvent('esx:showNotification', _source, '~g~Treat you to opium ')
		Harvest8(_source,zone)
end)

local function Harvest9(source, zone)
    local xPlayer = ESX.GetPlayerFromId(source)
    
            TriggerClientEvent('drugs2:animation2' , source)
            Citizen.Wait(10000)
            xPlayer.addInventoryItem('ketamine', 5) 
    end

RegisterServerEvent('polo_drugs:startHarvest9')
AddEventHandler('polo_drugs:startHarvest9', function(zone)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(source)
  	
		PlayersHarvesting[_source]=true
		TriggerClientEvent('esx:showNotification', _source, '~b~You Pick Up la Ketamine')
		TriggerClientEvent('rien:rien' , source)
		Harvest9(_source,zone)
end)

local function Harvest10(source, zone)
    local xPlayer = ESX.GetPlayerFromId(source)
    local xItem1 = xPlayer.getInventoryItem('ketamine')
    
    if xItem1.count > 0 then
            TriggerClientEvent('rien:rien' , source)
            Citizen.Wait(10000)
            xPlayer.addInventoryItem('ketamine_pooch', 5)
            xPlayer.removeInventoryItem('ketamine', 5)     
        else 
            TriggerClientEvent('esx:showNotification', source, 'You do not have x5 Ketamine.')
        end
    end

RegisterServerEvent('polo_drugs:startHarvest10')
AddEventHandler('polo_drugs:startHarvest10', function(zone)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(source)
  	
		PlayersHarvesting[_source]=true
		TriggerClientEvent('esx:showNotification', _source, '~g~Treat you to Ketamine ')
		Harvest10(_source,zone)
end)

local function Harvest11(source, zone)
    local xPlayer = ESX.GetPlayerFromId(source)
    local xItem1 = xPlayer.getInventoryItem('shovel')
    
    if xItem1.count > 0 then
            TriggerClientEvent('drugs2:animation2' , source)
            Citizen.Wait(10000)
            xPlayer.addInventoryItem('lsd', 5) 
        else 
            TriggerClientEvent('esx:showNotification', source, 'You do not have x1 Shovel.')
        end
    end

RegisterServerEvent('polo_drugs:startHarvest11')
AddEventHandler('polo_drugs:startHarvest11', function(zone)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(source)
  	
		PlayersHarvesting[_source]=true
		TriggerClientEvent('esx:showNotification', _source, '~b~You Pick Up la LSD')
		TriggerClientEvent('none:none' , source)
		Harvest11(_source,zone)
end)

local function Harvest12(source, zone)
    local xPlayer = ESX.GetPlayerFromId(source)
    local xItem1 = xPlayer.getInventoryItem('lsd') 
    
    if xItem1.count > 0 then
            TriggerClientEvent('none:none' , source) 
            Citizen.Wait(10000)
            xPlayer.addInventoryItem('lsd_pooch', 5)
            xPlayer.removeInventoryItem('lsd', 5)     
        else 
            TriggerClientEvent('esx:showNotification', source, 'You do not have x5 lsd.')
        end
    end

RegisterServerEvent('polo_drugs:startHarvest12')
AddEventHandler('polo_drugs:startHarvest12', function(zone)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(source)
  	
		PlayersHarvesting[_source]=true
		TriggerClientEvent('esx:showNotification', _source, '~g~Treat you to LSD ')
		Harvest12(_source,zone)
end)

local function Harvest13(source, zone)
    local xPlayer = ESX.GetPlayerFromId(source)
    
            TriggerClientEvent('drugs2:animation2' , source)
            Citizen.Wait(10000)
            xPlayer.addInventoryItem('morphine', 5)
    end

RegisterServerEvent('polo_drugs:startHarvest13')
AddEventHandler('polo_drugs:startHarvest13', function(zone)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(source)
  	
		PlayersHarvesting[_source]=true
		TriggerClientEvent('esx:showNotification', _source, '~b~You Pick Up la Morphine')
		TriggerClientEvent('none:none' , source)
		Harvest13(_source,zone)
end)

local function Harvest14(source, zone)
    local xPlayer = ESX.GetPlayerFromId(source)
    local xItem1 = xPlayer.getInventoryItem('morphine')
    
    if xItem1.count > 0 then
            TriggerClientEvent('none:none' , source)
            Citizen.Wait(10000)
            xPlayer.addInventoryItem('morphine_pooch', 5)
            xPlayer.removeInventoryItem('morphine', 5)     
        else 
            TriggerClientEvent('esx:showNotification', source, 'You do not have x5 Morphine.')
        end
    end

RegisterServerEvent('polo_drugs:startHarvest14')
AddEventHandler('polo_drugs:startHarvest14', function(zone)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(source)
  	
		PlayersHarvesting[_source]=true
		TriggerClientEvent('esx:showNotification', _source, '~g~Treat you to Morphine ')
		Harvest14(_source,zone)
end)

local function Harvest15(source, zone)
    local xPlayer = ESX.GetPlayerFromId(source)
    
            TriggerClientEvent('drugs2:animation2' , source)
            Citizen.Wait(10000)
            xPlayer.addInventoryItem('lean', 5)
    end

RegisterServerEvent('polo_drugs:startHarvest15')
AddEventHandler('polo_drugs:startHarvest15', function(zone)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(source)
  	
		PlayersHarvesting[_source]=true
		TriggerClientEvent('esx:showNotification', _source, '~b~You Pick Up la Lean')
		TriggerClientEvent('none:none' , source)
		Harvest15(_source,zone)
end)

local function Harvest16(source, zone)
    local xPlayer = ESX.GetPlayerFromId(source)
    local xItem1 = xPlayer.getInventoryItem('lean')
    
    if xItem1.count > 0 then
            TriggerClientEvent('none:none' , source)
            Citizen.Wait(10000) 
            xPlayer.addInventoryItem('lean_pooch', 5)
            xPlayer.removeInventoryItem('lean', 5)     
        else 
            TriggerClientEvent('esx:showNotification', source, 'You do not have x5 Lean.')
        end
    end

RegisterServerEvent('polo_drugs:startHarvest16')
AddEventHandler('polo_drugs:startHarvest16', function(zone)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(source)
  	
		PlayersHarvesting[_source]=true
		TriggerClientEvent('esx:showNotification', _source, '~g~Treat you to Lean ')
		Harvest16(_source,zone)
end)

local function Harvest17(source, zone)
    local xPlayer = ESX.GetPlayerFromId(source)
    
            TriggerClientEvent('drugs2:animation2' , source)
            Citizen.Wait(10000)
            xPlayer.addInventoryItem('heroine', 5)
    end

RegisterServerEvent('polo_drugs:startHarvest17')
AddEventHandler('polo_drugs:startHarvest17', function(zone)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(source)
  	
		PlayersHarvesting[_source]=true
		TriggerClientEvent('esx:showNotification', _source, '~b~You Pick Up Heroine ')
		TriggerClientEvent('none:none' , source)
		Harvest17(_source,zone)
end)

local function Harvest18(source, zone)
    local xPlayer = ESX.GetPlayerFromId(source)
    local xItem1 = xPlayer.getInventoryItem('heroine')
    
    if xItem1.count > 0 then
            TriggerClientEvent('none:none' , source)
            Citizen.Wait(10000)
            xPlayer.addInventoryItem('heroine_pooch', 5)
            xPlayer.removeInventoryItem('heroine', 5)     
        else 
            TriggerClientEvent('esx:showNotification', source, 'You do not have x5 Heroine.')
        end
    end

RegisterServerEvent('polo_drugs:startHarvest18')
AddEventHandler('polo_drugs:startHarvest18', function(zone)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(source)
  	
		PlayersHarvesting[_source]=true
		TriggerClientEvent('esx:showNotification', _source, '~g~Treat you to Heroine ')
		Harvest18(_source,zone)
end)

local function Harvest19(source, zone)
    local xPlayer = ESX.GetPlayerFromId(source)
    
            TriggerClientEvent('none:none' , source)
            Citizen.Wait(10000)
            xPlayer.addInventoryItem('ecstasy', 5)  
    end

RegisterServerEvent('polo_drugs:startHarvest19')
AddEventHandler('polo_drugs:startHarvest19', function(zone)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(source)
  	
		PlayersHarvesting[_source]=true
		TriggerClientEvent('esx:showNotification', _source, '~b~You Pick Up Ecstasy ')
		TriggerClientEvent('none:none' , source)
		Harvest19(_source,zone)
end)

local function Harvest20(source, zone)
    local xPlayer = ESX.GetPlayerFromId(source)
    local xItem1 = xPlayer.getInventoryItem('ecstasy')
    
    if xItem1.count > 0 then
            TriggerClientEvent('none:none' , source)
            Citizen.Wait(10000)
            xPlayer.addInventoryItem('ecstasy_pooch', 5)
            xPlayer.removeInventoryItem('ecstasy', 5)     
        else 
            TriggerClientEvent('esx:showNotification', source, 'You do not have x5 Ecstasy.')
        end
    end

RegisterServerEvent('polo_drugs:startHarvest20')
AddEventHandler('polo_drugs:startHarvest20', function(zone)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(source)
  	
		PlayersHarvesting[_source]=true
		TriggerClientEvent('esx:showNotification', _source, '~g~Treat you to Ecstasy ')
		Harvest20(_source,zone)
end)

local function Harvest21(source, zone)
    local xPlayer = ESX.GetPlayerFromId(source)
    
            TriggerClientEvent('drugs2:animation2' , source)
            Citizen.Wait(10000)
            xPlayer.addInventoryItem('amphetamines', 5)
    end

RegisterServerEvent('polo_drugs:startHarvest21')
AddEventHandler('polo_drugs:startHarvest21', function(zone)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(source)
  	
		PlayersHarvesting[_source]=true
		TriggerClientEvent('esx:showNotification', _source, '~b~You Pick Up Amphetamine ')
		TriggerClientEvent('none:none' , source)
		Harvest21(_source,zone)
end)

local function Harvest22(source, zone)
    local xPlayer = ESX.GetPlayerFromId(source)
    local xItem1 = xPlayer.getInventoryItem('amphetamines')
    
    if xItem1.count > 0 then
            TriggerClientEvent('drugs2:animation2' , source)
            Citizen.Wait(10000)
            xPlayer.addInventoryItem('amphetamines_pooch', 5)
            xPlayer.removeInventoryItem('amphetamines', 5)     
        else 
            TriggerClientEvent('esx:showNotification', source, 'You do not have x5 Amphetamines.')
        end
    end

RegisterServerEvent('polo_drugs:startHarvest22')
AddEventHandler('polo_drugs:startHarvest22', function(zone)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(source)
  	
		PlayersHarvesting[_source]=true
		TriggerClientEvent('esx:showNotification', _source, '~g~Treat you to Amphetamine ')
		Harvest22(_source,zone)
end)

local function Harvest23(source, zone)
    local xPlayer = ESX.GetPlayerFromId(source)
    local xItem1 = xPlayer.getInventoryItem('shovel')
    
    if xItem1.count > 0 then
            TriggerClientEvent('drugs2:animation2' , source)
            Citizen.Wait(10000)
            xPlayer.addInventoryItem('crack', 5) 
        else 
            TriggerClientEvent('esx:showNotification', source, 'You do not have x1 Shovel.')
        end
    end

RegisterServerEvent('polo_drugs:startHarvest23')
AddEventHandler('polo_drugs:startHarvest23', function(zone)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(source)
  	
		PlayersHarvesting[_source]=true
		TriggerClientEvent('esx:showNotification', _source, '~b~You collect Crack ')
		TriggerClientEvent('none:none' , source)
		Harvest23(_source,zone)
end)

local function Harvest24(source, zone)
    local xPlayer = ESX.GetPlayerFromId(source)
    local xItem1 = xPlayer.getInventoryItem('crack')
    
    if xItem1.count > 0 then
            TriggerClientEvent('none:none' , source)
            Citizen.Wait(10000)
            xPlayer.addInventoryItem('crack_pooch', 5)
            xPlayer.removeInventoryItem('crack', 5)     
        else 
            TriggerClientEvent('esx:showNotification', source, 'You do not have x5 Crack.')
        end
    end

RegisterServerEvent('polo_drugs:startHarvest24')
AddEventHandler('polo_drugs:startHarvest24', function(zone)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(source)
  	
		PlayersHarvesting[_source]=true
		TriggerClientEvent('esx:showNotification', _source, '~g~Treat you to Crack ')
		Harvest24(_source,zone)
end)

local function Harvest25(source, zone)
    local xPlayer = ESX.GetPlayerFromId(source)
    local xItem1 = xPlayer.getInventoryItem('shovel')
    
    if xItem1.count > 0 then
            TriggerClientEvent('drug1:animation' , source)
            Citizen.Wait(10000)
            xPlayer.addInventoryItem('marijuana', 5)   
        else 
            TriggerClientEvent('esx:showNotification', source, 'You do not have x1 Shovel.')
        end
    end

RegisterServerEvent('polo_drugs:startHarvest25')
AddEventHandler('polo_drugs:startHarvest25', function(zone)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(source)
  	
		PlayersHarvesting[_source]=true
		TriggerClientEvent('esx:showNotification', _source, '~b~You Pick Up la Marijuana ')
		TriggerClientEvent('none:none' , source) 
		Harvest25(_source,zone)
end)

local function Harvest26(source, zone)
    local xPlayer = ESX.GetPlayerFromId(source)
    local xItem1 = xPlayer.getInventoryItem('marijuana')
    
    if xItem1.count > 0 then
            TriggerClientEvent('drugs2:animation2' , source)
            Citizen.Wait(10000)
            xPlayer.addInventoryItem('marijuana_pooch', 5)
            xPlayer.removeInventoryItem('marijuana', 5)     
        else 
            TriggerClientEvent('esx:showNotification', source, 'You do not have x5 Marijuana.')
        end
    end

RegisterServerEvent('polo_drugs:startHarvest26')
AddEventHandler('polo_drugs:startHarvest26', function(zone)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(source)
  	
		PlayersHarvesting[_source]=true
		TriggerClientEvent('esx:showNotification', _source, '~g~Treat you to Marijuana ')
		Harvest26(_source,zone)
end)