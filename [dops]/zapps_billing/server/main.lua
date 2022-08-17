ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('zapps_billing:getUnpaidBills', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)

	MySQL.Async.fetchAll('SELECT * FROM zapps_billing WHERE receiver = @identifier AND (status = 1 OR status = 3)', {
		['@identifier'] = xPlayer.identifier
	}, function(result)
		local bills = {}

		if result ~= nil then
			for i=1, #result, 1 do
				table.insert(bills, result[i])
			end
		end

		cb(bills)
	end)
end)

ESX.RegisterServerCallback('zapps_billing:getAllBills', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)

	MySQL.Async.fetchAll('SELECT * FROM zapps_billing WHERE receiver = @identifier ORDER BY CASE WHEN status = 3 THEN 1 WHEN status = 1 THEN 2 WHEN STATUS = 4 THEN 3 ELSE 4 END ASC, id DESC', {
		['@identifier'] = xPlayer.identifier
	}, function(result)
		local bills = {}

		if result ~= nil then
			for i=1, #result, 1 do
				table.insert(bills, result[i])
			end
		end

		cb(bills)
	end)
end)

ESX.RegisterServerCallback('zapps_billing:getSocietyBills', function(source, cb, society)
	local xPlayer = ESX.GetPlayerFromId(source)

	-- Get bills this society has created
	MySQL.Async.fetchAll('SELECT * FROM zapps_billing WHERE society = @soc ORDER BY CASE WHEN status = 3 THEN 1 WHEN status = 1 THEN 2 WHEN STATUS = 4 THEN 3 ELSE 4 END ASC, id DESC', {
		['@soc'] = society.account
	}, function(created)
		-- Now get bills this society has received

		MySQL.Async.fetchAll('SELECT * FROM zapps_billing WHERE receiver = @soc ORDER BY CASE WHEN status = 3 THEN 1 WHEN status = 1 THEN 2 WHEN STATUS = 4 THEN 3 ELSE 4 END ASC, id DESC', {
			['@soc'] = society.account
		}, function(received)
			cb(created, received)
		end)
	end)
end)

ESX.RegisterServerCallback('zapps_billing:getSocietyAccount', function(source, cb, society)
	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerEvent('esx_addonaccount:getSharedAccount', society.account, function(account)
		cb(account)
	end)
end)

ESX.RegisterServerCallback('zapps_billing:getClientAccountMoney', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source);

	local money = xPlayer.getAccount('bank').money

	if money == nil then
		money = 0
	end

	if Config.AllowPayFromCash then
		money = money + xPlayer.getAccount('money').money
	end

	cb(money)
end)

ESX.RegisterServerCallback('zapps_billing:getPlayerName', function(source, cb, id)
	local xPlayer = ESX.GetPlayerFromId(id)

	cb(getUserName(xPlayer))
end)

function getUserName(xPlayer)
	result = MySQL.Sync.fetchAll('SELECT firstname, lastname FROM users WHERE identifier = @identifier LIMIT 1', {
		['@identifier'] = xPlayer.identifier
	})

	if result[1]["firstname"] ~= nil and result[1]["lastname"] ~= nil then
		return result[1]["firstname"] .. " " .. result[1]["lastname"]
	else
		return "Nick: " .. xPlayer.getName()
	end
end

RegisterServerEvent("zapps_billing:sendNewInvoice")
AddEventHandler('zapps_billing:sendNewInvoice', function(data)
	local xAuthor = ESX.GetPlayerFromId(source)
	xTarget = ESX.GetPlayerFromId(data.target)

	amount = ESX.Math.Round(data.amount)
	-- This should all already be checked, but for redundance - lets check it again. We don't like NUI exploiters @ zawapps :)
	if amount < 0 then
		-- The bill is negative - send warning to webhook
		sendToDiscord(string.format("**ERROR** \n\n **ID: %s**\n %s (%s) tried sending a negative (%s) invoice!!", bill.id, getUserName(xAuthor), xAuthor.identifier, amount), 16711680)
	else
		local target = -1
		local targetType = -1 -- 1 - user, 2 - society

		-- Check if the target is a user or a society
		if tonumber(data.target) then
			-- Is a user
			targetType = 1
			data.target = tonumber(data.target)
			if xTarget then
				target = xTarget.identifier
			else
				print("[ZAPPS BILLING] The selected invoice target was not a user, even though script thought it was! Target: " .. data.target)
			end
		else
			-- Is a society
			target = data.target
			targetType = 2
		end

		-- Get author name
		local name = getUserName(xAuthor)

		if targetType == 1 then
			-- Target is a user
			local xTarget = ESX.GetPlayerFromIdentifier(target)
			MySQL.Async.insert('INSERT INTO zapps_billing (author_identifier, author_name, receiver, receiver_name, society, society_name, description, amount, interest, interestcount, status, date_added, lastPayDate) VALUES (@author_id, @author_name, @receiver, @receiver_name, @sender_society, @sender_society_name, @description, @amount, 0, 0, 1, NOW(), DATE_ADD(NOW(), INTERVAL @payInterval DAY))', {
				['@author_id'] = xAuthor.identifier,
				['@author_name'] = name,
				['@receiver'] = target,
				['@receiver_name'] = getUserName(xTarget),
				['@sender_society'] = data.sendingSociety,
				['@sender_society_name'] = data.sendingSocietyName,
				['@description'] = data.reason,
				['@amount'] = data.amount,
				['@payInterval'] = data.paytime
			}, function(result)
				TriggerClientEvent('esx:showNotification', xTarget.source, _U('received_invoice', data.amount))
				sendToDiscord(string.format("**NEW INVOICE** \n\n **ID: %s**\n **Author: ** %s (%s)\n **Receiver: ** %s (%s)\n **Sending society: ** %s (%s)\n **Amount: ** $%s\n **Reason: ** %s", result, name, xAuthor.identifier, getUserName(xTarget), target, data.sendingSociety, data.sendingSocietyName, data.amount, data.reason), 65280)
			end)
		elseif targetType == 2 then
			-- Target is a society
			MySQL.Async.insert('INSERT INTO zapps_billing (author_identifier, author_name, receiver, receiver_name, society, society_name, description, amount, interest, interestcount, status, date_added, lastPayDate) VALUES (@author_id, @author_name, @receiver, @receiver_name, @sender_society, @sender_society_name, @description, @amount, 0, 0, 1, NOW(), DATE_ADD(NOW(), INTERVAL @payInterval DAY))', {
				['@author_id'] = xAuthor.identifier,
				['@author_name'] = name,
				['@receiver'] = target,
				['@receiver_name'] = data.targetName,
				['@sender_society'] = data.sendingSociety,
				['@sender_society_name'] = data.sendingSocietyName,
				['@description'] = data.reason,
				['@amount'] = data.amount,
				['@payInterval'] = data.paytime
			}, function(result)
				sendToDiscord(string.format("**NEW INVOICE** \n\n **ID: %s**\n **Author: ** %s (%s)\n **Receiver: ** %s (%s)\n **Sending society: ** %s (%s)\n **Amount: ** $%s\n **Reason: ** %s", result, name, xAuthor.identifier, data.targetName, target, data.sendingSociety, data.sendingSocietyName, data.amount, data.reason), 65280)
			end)
		end
	end
end)

RegisterServerEvent("zapps_billing:payInvoice")
AddEventHandler('zapps_billing:payInvoice', function(billId)
	local xPlayer = ESX.GetPlayerFromId(source)

	-- Lets get the invoice first, see if it exists and confirm that this user should be able to pay it indeed
	MySQL.Async.fetchAll('SELECT * FROM zapps_billing WHERE id = @billid LIMIT 1', {
		['@billid'] = billId
	}, function(result)
		local bill = result[1]
		local cost = bill.amount + bill.interest

		-- Get player money
		local money = xPlayer.getAccount('bank').money

		if money == nil then
			money = 0
		end

		if Config.AllowPayFromCash then
			money = money + xPlayer.getAccount('money').money
		end

		-- Check if the player has enough money
		if money < cost then
			-- Notify the player that they don't have enough money
			TriggerClientEvent('esx:showNotification', xPlayer.source, _U("not_enough_money"))
		else
			-- The player does have enough money
			if Config.AllowPayFromCash and xPlayer.getAccount('money').money >= cost then
				xPlayer.removeMoney(cost)
			else
				xPlayer.removeAccountMoney('bank', cost)
			end

			TriggerEvent('esx_addonaccount:getSharedAccount', bill.society, function(account)
				if account ~= nil then
					account.addMoney(cost)
				else
					-- Send warning to webhook that no such account was found!
					TriggerClientEvent('esx:showNotification', xPlayer.source, _U('pay_error'))
					sendToDiscord(string.format("**ERROR** \n\n **ID: %s**\n No society with name %s found!", bill.id, bill.society), 16711680)
				end
			end)

			MySQL.Async.execute('UPDATE zapps_billing SET status = 2, date_paid = NOW() WHERE id = @id', {
				['@id'] = billId
			})

			sendToDiscord(string.format("**INVOICE PAID** \n\n **ID: %s**\n **Paid By: **%s (%s)\n **Amount: **%s", billId, getUserName(xPlayer), xplayer.identifier, cost), 60927)

			TriggerClientEvent('esx:showNotification', xPlayer.source, _U("pay_success"))
		end
	end)
end)

RegisterServerEvent("zapps_billing:paySocietyInvoice")
AddEventHandler('zapps_billing:paySocietyInvoice', function(billId)
	local xPlayer = ESX.GetPlayerFromId(source)

	-- Lets get the invoice first, see if it exists and confirm that this user should be able to pay it indeed
	MySQL.Async.fetchAll('SELECT * FROM zapps_billing WHERE id = @billid LIMIT 1', {
		['@billid'] = billId
	}, function(result)
		local bill = result[1]
		local cost = bill.amount + bill.interest


		-- Check if the society has enough money to pay
		TriggerEvent('esx_addonaccount:getSharedAccount', bill.receiver, function(account)
			if account == nil then
				-- Send warning to webhook that no such account was found!
				TriggerClientEvent('esx:showNotification', xPlayer.source, _U('pay_error'))
			else
				-- Check if the player has enough money
				if account.money < cost then
					-- Notify the player that they don't have enough money
					TriggerClientEvent('esx:showNotification', xPlayer.source, _U('society_not_enough_money'))
				else
					-- The society does have enough money
					account.removeMoney(cost)

					TriggerEvent('esx_addonaccount:getSharedAccount', bill.society, function(account2)
						if account2 ~= nil then
							account2.addMoney(cost)

							MySQL.Sync.execute('UPDATE zapps_billing SET status = 2, date_paid = NOW() WHERE id = @id', {
								['@id'] = billId
							})

							TriggerClientEvent('esx:showNotification', xPlayer.source, _U("pay_success"))
							sendToDiscord(string.format("**SOCIETY INVOICE PAID** \n\n **ID: %s**\n **Society: **%s\n **Paid By: **%s (%s)\n **Amount: **$%s", billId, bill.receiver_name, getUserName(xPlayer), xPlayer.identifier, cost), 60927)
						else
							-- Send warning to webhook that no such account was found!
							TriggerClientEvent('esx:showNotification', xPlayer.source, _U('pay_error'))
							sendToDiscord(string.format("**ERROR** \n\n **ID: %s**\n No society with name %s found!", bill.id, bill.society), 16711680)
						end
					end)
				end
			end
		end)
	end)
end)

RegisterServerEvent("zapps_billing:cancelInvoice")
AddEventHandler('zapps_billing:cancelInvoice', function(billId)
	local xPlayer = ESX.GetPlayerFromId(source)

	-- Lets get the invoice first, see if it exists and confirm that this user should be able to pay it indeed
	MySQL.Async.fetchAll('SELECT * FROM zapps_billing WHERE id = @billid LIMIT 1', {
		['@billid'] = billId
	}, function(result)
		local bill = result[1]

		MySQL.Async.execute('UPDATE zapps_billing SET status = 5, date_paid = NOW() WHERE id = @id', {
			['@id'] = billId
		})

		TriggerClientEvent('esx:showNotification', xPlayer.source, _U('cancelled_invoice'))
		sendToDiscord(string.format("**INVOICE CANCELLED** \n\n **ID: %s**\n **Invoice reason: **%s\n **Cancelled by: ** %s (%s)\n **Amount: **$%s + $%s", bill.id, bill.description, getUserName(xPlayer), xPlayer.identifier, bill.amount, bill.interest), 15990528)
	end)
end)

function RunCheck()
	print("Running invoice check")
	MySQL.Async.fetchAll("SELECT *, TIMESTAMPDIFF(DAY, lastPayDate, NOW()) as 'diff' FROM zapps_billing WHERE lastPayDate <= DATE_SUB(NOW(), INTERVAL 1 DAY) AND (status = 1 OR status = 3)", {}, function(result)
		for k, v in ipairs(result) do
			local cost = v.amount + v.interest
			print("[ZAPPS_BILLING] (Bill: " .. v.id .. ") Running auto invoice check!")
			-- Calculate interest if enabled in config
			if Config.EnableInterest then
				print("[ZAPPS_BILLING] (Bill: " .. v.id .. ") Bill is delayed by " .. v.diff .. " days")
				MySQL.Async.execute('UPDATE zapps_billing SET status = 3 WHERE id = @id', {
					['@id'] = v.id
				})

				if v.diff > Config.MaxPayDelay then
					if v.diff - Config.MaxPayDelay > v.interestcount then
						local interest = v.interest + (v.amount * Config.DayInterest / 100)
						MySQL.Sync.execute("UPDATE zapps_billing SET interest = @interest, interestcount = interestcount + 1 WHERE id = @id", {['@interest'] = interest, ['@id'] = v.id})
						cost = v.amount + interest

						print("[ZAPPS_BILLING] (Bill: " .. v.id .. ") Upped interest to: " .. interest)
						sendToDiscord(string.format("**INTEREST BUMPED** \n\n **ID: %s**\n **New Cost: ** $%s + $%s\n **Last pay date: ** %s", v.id, v.amount, interest, v.lastPayDate), 1507583)
					end
				else
					print("[ZAPPS_BILLING] (Bill: " .. v.id .. ") Bill is delayed, but not delayed enough to add interest")
				end
			end

			-- See if this invoice should be autopaid by now
			if (v.diff >= Config.MaxInterestPayDelay and Config.EnableInterest) or (v.diff > Config.MaxPayDelay and not Config.EnableInterest) then
				-- Auto pay invoice
				print("[ZAPPS_BILLING] (Bill: " .. v.id .. ") Auto-paying invoice!")

				-- Check if is user or society
				if string.sub(v.receiver, 1, 7) == 'society' then
					-- Is society

					print("[ZAPPS_BILLING] (Bill: " .. v.id .. ") Receiver is a society: " .. v.receiver)
					TriggerEvent('esx_addonaccount:getSharedAccount', v.receiver, function(account)
						if account == nil then
							-- Send warning to webhook that no such account was found!
							print("[ZAPPS_BILLING] (Bill: " .. v.id .. ") An error occured while auto-paying invoice. No account named " .. v.receiver .. " was found!")
							sendToDiscord(string.format("**ERROR** \n\n **ID: %s**\n No society with name %s found!", v.id, v.receiver), 16711680)
						else
							print("[ZAPPS_BILLING] (Bill: " .. v.id .. ") Account found!")
							account.removeMoney(cost)

							TriggerEvent('esx_addonaccount:getSharedAccount', v.society, function(account2)
								if account2 ~= nil then
									account2.addMoney(cost)

									print("[ZAPPS_BILLING] (Bill: " .. v.id .. ") Auto-paid invoice!")
									sendToDiscord(string.format("**Invoice Auto-Pay** \n\n **ID: %s**\n **Amount: ** %s + %s\n **Reason: **%s\n**Last pay date: **%s (+ %s days)", v.id, v.amount, v.interest, v.description, v.lastPayDate, v.diff), 1507583)
									MySQL.Async.execute('UPDATE zapps_billing SET status = 4, date_paid = NOW() WHERE id = @id', {
										['@id'] = v.id
									})
								else
									-- Send warning to webhook that no such account was found!
									print("[ZAPPS_BILLING] (Bill: " .. v.id .. ") An error occured while auto-paying invoice. No account named " .. v.society .. " was found!")
									sendToDiscord(string.format("**ERROR** \n\n **ID: %s**\n No society with name %s found!", v.id, v.society), 16711680)
								end
							end)
						end
					end)
				else
					-- Is user, probably
					local xPlayer = ESX.GetPlayerFromIdentifier(v.receiver)

					print("[ZAPPS_BILLING] (Bill: " .. v.id .. ") Receiver is a user: " .. v.receiver)

					-- Check if the player is online
					if xPlayer == nil then
						-- Player is offline
						print("[ZAPPS_BILLING] (Bill: " .. v.id .. ") Receiver is offline!")

						MySQL.Async.fetchAll("SELECT accounts FROM users WHERE identifier = @id", {['@id'] = v.receiver}, function(resAcc)
							local acc = json.decode(resAcc[1].accounts)
							acc.bank = acc.bank - cost
							acc = json.encode(acc)

							MySQL.Async.execute("UPDATE users SET accounts = @acc WHERE identifier = @target", {
								["@acc"] = acc,
								["@target"] = v.receiver
							}, function(changed)
								TriggerEvent('esx_addonaccount:getSharedAccount', v.society, function(account2)
									if account2 ~= nil then
										account2.addMoney(cost)
										MySQL.Async.execute('UPDATE zapps_billing SET status = 4, date_paid = NOW() WHERE id = @id', {
											['@id'] = v.id
										})

										print("[ZAPPS_BILLING] (Bill: " .. v.id .. ") Auto-paid invoice!")
										sendToDiscord(string.format("**Invoice Auto-Pay** \n\n **ID: %s**\n **Amount: ** $%s + %s\n **Reason: **%s\n**Last pay date: **%s (+ %s days)", v.id, v.amount, v.interest, v.description, v.lastPayDate, v.diff), 1507583)
									else
										-- Send warning to webhook that no such account was found!
										print("[ZAPPS_BILLING] (Bill: " .. v.id .. ") An error occured while auto-paying invoice. No account named " .. v.receiver .. " was found!")
										sendToDiscord(string.format("**ERROR** \n\n **ID: %s**\n No society with name %s found!", v.id, v.receiver), 16711680)
									end
								end)
							end)
						end)
					else
						-- Player is online
						print("[ZAPPS_BILLING] (Bill: " .. v.id .. ") There is such a player online!")

						xPlayer.removeAccountMoney('bank', cost)
						TriggerEvent('esx_addonaccount:getSharedAccount', v.society, function(account2)
							if account2 ~= nil then
								account2.addMoney(cost)
							else
								-- Send warning to webhook that no such account was found!
								print("[ZAPPS_BILLING] (Bill: " .. v.id .. ") An error occured while auto-paying invoice. No account named " .. v.receiver .. " was found!")
								sendToDiscord(string.format("**ERROR** \n\n **ID: %s**\n No society with name %s found!", v.id, v.society), 16711680)
							end
						end)

						MySQL.Async.execute('UPDATE zapps_billing SET status = 4, date_paid = NOW() WHERE id = @id', {
							['@id'] = billId
						})

						print("[ZAPPS_BILLING] (Bill: " .. v.id .. ") Auto-paid invoice!")
						sendToDiscord(string.format("**Invoice Auto-Pay** \n\n **ID: %s**\n Invoice auto-paid! \n**Amount: ** $%s + %s\n **Reason: **%s\n**Last pay date: **%s (+ %s days)", v.id, v.amount, v.interest, v.description, v.lastPayDate, v.diff), 1507583)
					end
				end
			end
		end
	end)

	SetTimeout(900000, RunCheck) -- Run check every 15 minutes
end

AddEventHandler('onResourceStart', function(resourceName)
	if (GetCurrentResourceName() ~= resourceName) then
		return
	end

	RunCheck()
end)

function sendToDiscord(msg, color)
    if Config.Webhook ~= "" then
        PerformHttpRequest(Config.Webhook, function(a,b,c)end, "POST", json.encode({embeds={{title="ZAPPS_BILLING",description=msg:gsub("%^%d",""), color=color,}}}), {["Content-Type"]="application/json"})
    end
end