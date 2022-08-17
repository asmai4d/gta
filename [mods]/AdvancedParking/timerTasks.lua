--[[
	Custom license

	Copyright (c) 2021 Philipp Decker

    timerTasks.lua by Kiminaze#9097

    You are free to use this code snippet for any of your projects. But please either 
    keep this text with the function in your project or mention me in the credits if 
    you release something using this!

    The AddTask[...] functions can be used to add a timed task on server side.

	AddTask(_hours, _minutes, _seconds, _task)
		Takes a time of day and a function that should be run at that time.

	AddTaskForEveryHour(_task)
		Takes a function that should be run once every single hour.

	AddTaskForEveryMinute(_task)
		Takes a function that should be run once every single minute.

	AddTaskForEverySecond(_task)
		Takes a function that should be run once every single second.
--]]

local function GetTimeFormatted()
	local dateTime = os.time()

	return {
		hours	= tonumber(os.date("%H", dateTime)),
		minutes	= tonumber(os.date("%M", dateTime)),
		seconds	= tonumber(os.date("%S", dateTime))
	}
end

local lastTime = GetTimeFormatted()

local dayTasks		= {}
local hourTasks		= {}
local minuteTasks	= {}
local secondTasks	= {}

local function OnTimeChanged(time)
	for i, taskData in ipairs(dayTasks) do
		if (taskData.hours == time.hours and taskData.minutes == time.minutes and taskData.seconds == time.seconds) then
			taskData.task()
		end
	end
end
local function OnHourChanged()
	for i, taskData in ipairs(hourTasks) do
		taskData.task()
	end
end
local function OnMinuteChanged()
	for i, taskData in ipairs(minuteTasks) do
		taskData.task()
	end
end
local function OnSecondChanged()
	for i, taskData in ipairs(secondTasks) do
		taskData.task()
	end
end

Citizen.CreateThread(function()
	local currentTime = nil

	while (true) do
		Citizen.Wait(500)

		currentTime = GetTimeFormatted()

		if (currentTime.hours ~= lastTime.hours or currentTime.minutes ~= lastTime.minutes or currentTime.seconds ~= lastTime.seconds) then
			OnTimeChanged(currentTime)
			
			if (currentTime.hours ~= lastTime.hours) then
				OnHourChanged()
			end

			if (currentTime.minutes ~= lastTime.minutes) then
				OnMinuteChanged()
			end
			
			if (currentTime.seconds ~= lastTime.seconds) then
				OnSecondChanged()
			end

			lastTime = currentTime
		end
	end
end)



function AddTask(_hours, _minutes, _seconds, _task)
	if (_hours == nil and tonumber(_hours)) then
		print("^1[ERROR] \"hours\" was nil or NaN when adding a new task!")
		return
	end
	if (_minutes == nil and tonumber(_minutes)) then
		print("^1[ERROR] \"minutes\" was nil or NaN when adding a new task!")
		return
	end
	if (_seconds == nil and tonumber(_seconds)) then
		print("^1[ERROR] \"minutes\" was nil or NaN when adding a new task!")
		return
	end
	if (_task == nil or type(_task) ~= "function") then
		print("^1[ERROR] \"task\" was nil or not a function when adding a new task!")
		return
	end

	_hours		= math.floor(_hours)
	_minutes	= math.floor(_minutes)
	_seconds	= math.floor(_seconds)

	table.insert(dayTasks, {
		hours	= _hours,
		minutes	= _minutes,
		seconds	= _seconds,
		task	= _task
	})
end

function AddTaskForEveryHour(_task)
	if (_task == nil or _task ~= "function") then
		print("^1[ERROR] \"task\" was nil when adding a new task for every hour!")
		return
	end

	table.insert(hourTasks, {
		task = _task
	})
end

function AddTaskForEveryMinute(_task)
	if (_task == nil or _task ~= "function") then
		print("^1[ERROR] \"task\" was nil when adding a new task for every minute!")
		return
	end

	table.insert(minuteTasks, {
		task = _task
	})
end

function AddTaskForEverySecond(_task)
	if (_task == nil or _task ~= "function") then
		print("^1[ERROR] \"task\" was nil when adding a new task for every second!")
		return
	end

	table.insert(secondTasks, {
		task = _task
	})
end
