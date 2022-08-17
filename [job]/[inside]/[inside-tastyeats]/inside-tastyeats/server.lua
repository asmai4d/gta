ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('inside-tastyeats:getexperience', function(playerId, cb, xPlayer)
    MySQL.Async.fetchAll('SELECT * FROM inside_jobs WHERE identifier = @identifier AND job = @job',
    {
        ['@identifier'] = xPlayer.identifier,
        ['@job'] = 'tastyeats',
    },
    function(result)
        if not result[1] then
            MySQL.Async.insert('INSERT INTO inside_jobs (identifier,experience,job) VALUES (@identifier,@experience,@job)',
            {
                ['@identifier'] = xPlayer.identifier,
                ['@experience'] = 0,
                ['@job'] = 'tastyeats',
            })
        elseif result[1] then
            cb(tonumber(result[1].experience))   
        end                 
    end)
end)

ESX.RegisterServerCallback('inside-tastyeats:checkMoney', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.getMoney() >= icfg.DepositForVehiclePrice then
        xPlayer.removeMoney(icfg.DepositForVehiclePrice)
		cb(true)
    elseif xPlayer.getAccount('bank').money >= icfg.DepositForVehiclePrice then
        xPlayer.removeAccountMoney('bank', icfg.DepositForVehiclePrice)
        cb(true)
	else
		cb(false)
	end
end)

RegisterServerEvent('inside-tastyeats:returnVehicle')
AddEventHandler('inside-tastyeats:returnVehicle', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	
	xPlayer.addAccountMoney('bank', icfg.DepositForVehiclePrice)
end)

ESX.RegisterServerCallback('inside-tastyeats:Payout', function(source, cb, xPlayer, level)
	local xPlayer = ESX.GetPlayerFromId(source)
    local money = nil

    MySQL.Async.fetchAll('SELECT * FROM inside_jobs WHERE identifier = @identifier AND job = @job',
    {
        ['@identifier'] = xPlayer.identifier,
        ['@job'] = 'tastyeats',
    },
    function(result)
        if result[1] then
            if result[1].experience >= icfg.Levels.Level5.MinPoints then
                money = math.random(icfg.Levels.Level5.PayoutMin, icfg.Levels.Level5.PayoutMax)
            elseif result[1].experience >= icfg.Levels.Level4.MinPoints and result[1].experience <= icfg.Levels.Level4.MaxPoints then
                money = math.random(icfg.Levels.Level4.PayoutMin, icfg.Levels.Level4.PayoutMax)
            elseif result[1].experience >= icfg.Levels.Level3.MinPoints and result[1].experience <= icfg.Levels.Level3.MaxPoints then
                money = math.random(icfg.Levels.Level3.PayoutMin, icfg.Levels.Level3.PayoutMax)
            elseif result[1].experience >= icfg.Levels.Level2.MinPoints and result[1].experience <= icfg.Levels.Level2.MaxPoints then
                money = math.random(icfg.Levels.Level2.PayoutMin, icfg.Levels.Level2.PayoutMax)
            elseif result[1].experience >= icfg.Levels.Level1.MinPoints and result[1].experience <= icfg.Levels.Level1.MaxPoints then
                money = math.random(icfg.Levels.Level1.PayoutMin, icfg.Levels.Level1.PayoutMax)
            end
            xPlayer.addMoney(money)
            cb(money) 
            playerexp = result[1].experience + 1
            MySQL.Async.execute('UPDATE inside_jobs SET experience = @playerexp WHERE identifier = @identifier AND job = @job', {
                ['@identifier'] = xPlayer.identifier,
                ['@playerexp']   = playerexp,
                ['@job'] = 'tastyeats',
            })    
        end
    end)
end)

RegisterServerEvent('inside-tastyeats:SynchroHookiesFood')
AddEventHandler('inside-tastyeats:SynchroHookiesFood', function()
    TriggerClientEvent('inside-tastyeats:GetHookiesFood', -1)
end)

RegisterServerEvent('inside-tastyeats:SynchroTacoBombFood')
AddEventHandler('inside-tastyeats:SynchroTacoBombFood', function()
    TriggerClientEvent('inside-tastyeats:GetTacoBombFood', -1)
end)

RegisterServerEvent('inside-tastyeats:SynchroCluckinBellFood')
AddEventHandler('inside-tastyeats:SynchroCluckinBellFood', function()
    TriggerClientEvent('inside-tastyeats:GetCluckinBellFood', -1)
end)

RegisterServerEvent('inside-tastyeats:SynchroPizzaThisFood')
AddEventHandler('inside-tastyeats:SynchroPizzaThisFood', function()
    TriggerClientEvent('inside-tastyeats:GetPizzaThisFood', -1)
end)

RegisterServerEvent('inside-tastyeats:SynchroBurgerShotFood')
AddEventHandler('inside-tastyeats:SynchroBurgerShotFood', function()
    TriggerClientEvent('inside-tastyeats:GetBurgerShotFood', -1)
end)