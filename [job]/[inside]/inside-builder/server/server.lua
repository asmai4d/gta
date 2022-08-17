ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('inside-builder:getexperience', function(playerId, cb, xPlayer)
    MySQL.Async.fetchAll('SELECT * FROM inside_jobs WHERE identifier = @identifier AND job = @job',
    {
        ['@identifier'] = xPlayer.identifier,
        ['@job'] = 'builder',
    },
    function(result)
        if not result[1] then
            MySQL.Async.insert('INSERT INTO inside_jobs (identifier,experience,job) VALUES (@identifier,@experience,@job)',
            {
                ['@identifier'] = xPlayer.identifier,
                ['@experience'] = 0,
                ['@job'] = 'builder',
            })
        elseif result[1] then
            cb(tonumber(result[1].experience))   
        end                 
    end)
end)


ESX.RegisterServerCallback('inside-builder:payout', function(source, cb, xPlayer, level)
	local xPlayer = ESX.GetPlayerFromId(source)
    local money = Config.ExperienceRequirement[level].Payout
    local exp = math.random(Config.ExperienceRequirement[level].MinExpDrop,Config.ExperienceRequirement[level].MaxExpDrop)
    MySQL.Async.fetchAll('SELECT * FROM inside_jobs WHERE identifier = @identifier AND job = @job',
    {
        ['@identifier'] = xPlayer.identifier,
        ['@job'] = 'builder',
    },
    function(result)
        if result[1] then
            playerexp = result[1].experience + exp
            MySQL.Async.execute('UPDATE inside_jobs SET experience = @playerexp WHERE identifier = @identifier AND job = @job', {
                ['@identifier'] = xPlayer.identifier,
                ['@playerexp']   = playerexp,
                ['@job'] = 'builder',
            })    
        end
    end)
	xPlayer.addMoney(money)
    cb(money, exp)  
end)


