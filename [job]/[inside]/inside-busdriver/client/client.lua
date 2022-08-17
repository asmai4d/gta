ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

--------------------------------------------------------------------------------
local PlayerData = {}
local clothes = false
local Plate, Vehicle, MechanicPed, Route = nil,nil,nil,nil
local inspection = false
local Passengers = 0
local number = 1
local close = false
local WorkBlip = nil

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	PlayerData.job = job
end)

Citizen.CreateThread(function()
	local StartJobBlip = AddBlipForCoord(Config.BusDriver['Jobstart'].Pos.x, Config.BusDriver['Jobstart'].Pos.y, Config.BusDriver['Jobstart'].Pos.z)
	
	SetBlipSprite (StartJobBlip, 408)
	SetBlipDisplay(StartJobBlip, 4)
	SetBlipScale  (StartJobBlip, 0.8)
	SetBlipColour (StartJobBlip, 0)
	SetBlipAsShortRange(StartJobBlip, true)

	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString('Водитель автобуса')
	EndTextCommandSetBlipName(StartJobBlip)
end)


--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

-- Citizen.CreateThread(function ()
-- 	while true do
-- 		local sleep = 500
-- 		local ped = PlayerPedId()
-- 		local coords = GetEntityCoords(ped)
-- 		if inspection then
-- 			if(GetDistanceBetweenCoords(coords, Config.Deposit['Deposit'].Pos.x, Config.Deposit['Deposit'].Pos.y, Config.Deposit['Deposit'].Pos.z, true) < 8.0) then
-- 				sleep = 5
-- 				DrawMarker(Config.Deposit['Deposit'].Type, Config.Deposit['Deposit'].Pos.x, Config.Deposit['Deposit'].Pos.y, Config.Deposit['Deposit'].Pos.z-1, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.Deposit['Deposit'].Size.x, Config.Deposit['Deposit'].Size.y, Config.Deposit['Deposit'].Size.z, Config.Deposit['Deposit'].Color.r, Config.Deposit['Deposit'].Color.g, Config.Deposit['Deposit'].Color.b, 100, false, true, 2, false, false, false, false)
-- 				DrawMarker(30, Config.Deposit['Deposit'].Pos.x, Config.Deposit['Deposit'].Pos.y, Config.Deposit['Deposit'].Pos.z+0.1, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.7, 0.7, 0.7, 255, 255, 255, 100, false, true, 2, false, false, false, false)
-- 				if(GetDistanceBetweenCoords(coords,Config.Deposit['Deposit'].Pos.x, Config.Deposit['Deposit'].Pos.y, Config.Deposit['Deposit'].Pos.z, true) < 1.5) then
-- 					DrawText3Ds(Config.Deposit['Deposit'].Pos.x, Config.Deposit['Deposit'].Pos.y, Config.Deposit['Deposit'].Pos.z+1.4, 'To stow the vehicle, press [~g~E~w~]')
-- 					if IsControlJustReleased(0, Keys['E']) and IsPedInAnyVehicle(ped, false) then
-- 						local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), true)
-- 						if GetVehicleNumberPlateText(vehicle) == Plate then
-- 							ESX.Game.DeleteVehicle(Vehicle)
-- 							Vehicle = nil
-- 							Plate = nil
-- 							for i, v in pairs(Config.BusDriver['Coaches']) do
-- 								RemoveBlip(v.blip)
-- 							end
-- 							DeletePed(MechanicPed)
-- 							inspection = false
-- 							RemoveBlip(InspectionBlip)
-- 							RemoveBlip(RouteSelection)
-- 							MechanicPed = nil

-- 							number = 1
-- 							for i, v in pairs(Config.First) do
-- 								v.done = false
-- 							end
-- 							for i, v in pairs(Config.Second) do
-- 								v.done = false
-- 							end
-- 							Route = nil
-- 							close = false
-- 							RemoveBlip(DepositBlip)
-- 							Passengers = 0	
-- 							exports.pNotify:SendNotification({text = '<b>Bus Driver</b></br>You returned the vehicle!', timeout = 1500})
-- 							CreateSpawnBusBlip()
-- 						else
-- 							exports.pNotify:SendNotification({text = "<b>Bus Driver</b></br>It's not your bus", timeout = 4500})
-- 						end
-- 					end
-- 				end
-- 			end
-- 		end
-- 		Citizen.Wait(sleep)
-- 	end
-- end)

Citizen.CreateThread(function()
	while true do
		local sleep = 500
		local ped = PlayerPedId()
		local coords = GetEntityCoords(ped)
		
		--if PlayerData.job ~= nil and PlayerData.job.grade_name == 'BusDriver' then
			if(GetDistanceBetweenCoords(coords, Config.BusDriver['Jobstart'].Pos.x, Config.BusDriver['Jobstart'].Pos.y, Config.BusDriver['Jobstart'].Pos.z, true) < 8.0) then
				sleep = 5

				DrawMarker(Config.BusDriver['Jobstart'].Type, Config.BusDriver['Jobstart'].Pos.x, Config.BusDriver['Jobstart'].Pos.y, Config.BusDriver['Jobstart'].Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.BusDriver['Jobstart'].Size.x, Config.BusDriver['Jobstart'].Size.y, Config.BusDriver['Jobstart'].Size.z, Config.BusDriver['Jobstart'].Color.r, Config.BusDriver['Jobstart'].Color.g, Config.BusDriver['Jobstart'].Color.b, 100, false, true, 2, false, false, false, false)
				DrawMarker(30, Config.BusDriver['Jobstart'].Pos.x, Config.BusDriver['Jobstart'].Pos.y, Config.BusDriver['Jobstart'].Pos.z+0.90, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.7, 0.7, 0.7, 255, 255, 255, 100, false, true, 2, false, false, false, false)
				if(GetDistanceBetweenCoords(coords, Config.BusDriver['Jobstart'].Pos.x, Config.BusDriver['Jobstart'].Pos.y, Config.BusDriver['Jobstart'].Pos.z, true) < 1.5) then
					if not clothes then
						DrawText3Ds(Config.BusDriver['Jobstart'].Pos.x, Config.BusDriver['Jobstart'].Pos.y, Config.BusDriver['Jobstart'].Pos.z+1.4, 'To start job, press [~g~E~w~]')
						if IsControlJustReleased(0, Keys['E']) and not IsPedInAnyVehicle(ped, false) then
							exports.rprogress:Custom({
								Duration = 2500,
								Label = "Изменение износа...",
								Animation = {
									scenario = "WORLD_HUMAN_COP_IDLES", -- https://pastebin.com/6mrYTdQv
									animationDictionary = "idle_a", -- https://alexguirre.github.io/animations-list/
								},
								DisableControls = {
									Mouse = false,
									Player = true,
									Vehicle = true
								}
							})
							Citizen.Wait(2500)
							ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
								if skin.sex == 0 then
									TriggerEvent('skinchanger:loadClothes', skin, Config.Clothes.male)
								else
									TriggerEvent('skinchanger:loadClothes', skin, Config.Clothes.female)
								end
								clothes = true
								CreateSpawnBusBlip()
								exports.pNotify:SendNotification({text = '<b>Водитель автобуса</b></br>Работа началась, выводите автобус немедленно!', timeout = 1500})
							end)				
						elseif IsControlJustReleased(0, Keys['E']) and IsPedInAnyVehicle(ped, false) then
							exports.pNotify:SendNotification({text = '<b>Водитель автобуса</b></br>Покинуть автомобиль!', timeout = 1500})
						end
					else
						DrawText3Ds(Config.BusDriver['Jobstart'].Pos.x, Config.BusDriver['Jobstart'].Pos.y, Config.BusDriver['Jobstart'].Pos.z+1.4, 'Чтобы закончить работу, нажмите [~r~E~w~]')
						if IsControlJustReleased(0, Keys['E']) and not IsPedInAnyVehicle(ped, false) then
							exports.rprogress:Custom({
								Duration = 2500,
								Label = "Изменение износа...",
								Animation = {
									scenario = "WORLD_HUMAN_COP_IDLES", -- https://pastebin.com/6mrYTdQv
									animationDictionary = "idle_a", -- https://alexguirre.github.io/animations-list/
								},
								DisableControls = {
									Mouse = false,
									Player = true,
									Vehicle = true
								}
							})
							Citizen.Wait(2500)
								ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
                                    TriggerEvent('skinchanger:loadSkin', skin)
									clothes = false
									ESX.Game.DeleteVehicle(Vehicle)
									Vehicle = nil
									Plate = nil
									for i, v in pairs(Config.BusDriver['Coaches']) do
										RemoveBlip(v.blip)
									end
									DeletePed(MechanicPed)
									inspection = false
									RemoveBlip(InspectionBlip)
									RemoveBlip(RouteSelection)
									RemoveBlip(DepositBlip)
									MechanicPed = nil

									number = 1
									for i, v in pairs(Config.First) do
										v.done = false
									end
									for i, v in pairs(Config.Second) do
										v.done = false
									end
									Route = nil
									close = false
									Passengers = 0								
									exports.pNotify:SendNotification({text = '<b>Водитель автобуса</b></br>Работа сделана, вам здесь рады.!', timeout = 1500})			
								end)
						elseif IsControlJustReleased(0, Keys['E']) and IsPedInAnyVehicle(ped, false) then
							exports.pNotify:SendNotification({text = '<b>Водитель автобуса</b></br>Покиньте автомобиль!', timeout = 1500})
						end
					end
				end	
			end
		--end
	Citizen.Wait(sleep)
	end
end)

function CreateSpawnBusBlip()
	for i, v in pairs(Config.BusDriver['Coaches']) do
		v.blip = AddBlipForCoord(v.x, v.y, v.z)
	
		SetBlipSprite (v.blip, 513)
		SetBlipDisplay(v.blip, 4)
		SetBlipScale  (v.blip, 0.5)
		SetBlipColour (v.blip, 0)
		SetBlipAsShortRange(v.blip, true)
	
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString('Спавн автобусов')
		EndTextCommandSetBlipName(v.blip)
	end
end

Citizen.CreateThread(function()
	while true do
		local sleep = 500
		local ped = PlayerPedId()
		local coords = GetEntityCoords(ped)
		if clothes and not Plate then
			sleep = 5
			for i, v in pairs(Config.BusDriver['Coaches']) do
				if(GetDistanceBetweenCoords(coords,v.x, v.y, v.z, true) < 8.0) then
					DrawMarker(20, v.x, v.y, v.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.7, 0.7, 0.7, 255, 255, 255, 100, false, true, 2, false, false, false, false)
					if(GetDistanceBetweenCoords(coords,v.x, v.y, v.z, true) < 1.5) then
						DrawText3Ds(v.x, v.y, v.z+1.4, 'Чтобы вытащить автомобиль, нажмите [~g~E~w~]')
						if IsControlJustReleased(0, Keys['E']) and not IsPedInAnyVehicle(ped, false) then
							ESX.Game.SpawnVehicle('bus', vector3(v.x, v.y, v.z), 214.02, function(vehicle)
								SetVehicleNumberPlateText(vehicle, "BUS"..tostring(math.random(1000, 9999)))
								TaskWarpPedIntoVehicle(ped, vehicle, -1)
								SetVehicleEngineOn(vehicle, true, true)
								CreateInspectionBlip()
								Plate = GetVehicleNumberPlateText(vehicle)
								Vehicle = vehicle
								for i, v in pairs(Config.BusDriver['Coaches']) do
									RemoveBlip(v.blip)
								end
								exports.pNotify:SendNotification({text = "<b>Водитель автобуса</b></br>Теперь перейдите к осмотру автомобиля слева от вас", timeout = 4500})
							end)
						end
					end
				end
			end
		end	
		Citizen.Wait(sleep)
	end
end)

Citizen.CreateThread(function()
	while true do
		local sleep = 500
		local ped = PlayerPedId()
		local coords = GetEntityCoords(ped)
		if Plate and not inspection then
			sleep = 5
			if(GetDistanceBetweenCoords(coords,Config.BusDriver['Inspection'].Pos.x, Config.BusDriver['Inspection'].Pos.y, Config.BusDriver['Inspection'].Pos.z, true) < 20.0) then
				DrawMarker(25, Config.BusDriver['Inspection'].Pos.x, Config.BusDriver['Inspection'].Pos.y, Config.BusDriver['Inspection'].Pos.z-0.7, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 3.0, 3.0, 3.0, 255, 255, 255, 100, false, true, 2, false, false, false, false)
				if(GetDistanceBetweenCoords(coords,Config.BusDriver['Inspection'].Pos.x, Config.BusDriver['Inspection'].Pos.y, Config.BusDriver['Inspection'].Pos.z, true) < 3.5) then
					DrawText3Ds(Config.BusDriver['Inspection'].Pos.x, Config.BusDriver['Inspection'].Pos.y, Config.BusDriver['Inspection'].Pos.z+0.90, 'Чтобы отправить автомобиль на проверку, нажмите [~g~E~w~]')
					if IsControlJustReleased(0, Keys['E']) and IsPedInAnyVehicle(ped, false) then
						local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), true)
						if GetVehicleNumberPlateText(vehicle) == Plate then
							if ESX.Game.IsSpawnPointClear(vector3(Config.BusDriver['Inspection'].PosCar.x, Config.BusDriver['Inspection'].PosCar.y, Config.BusDriver['Inspection'].PosCar.z), 4) then	
								Vehicle = vehicle
								SetEntityCoords(vehicle, Config.BusDriver['Inspection'].PosCar.x, Config.BusDriver['Inspection'].PosCar.y, Config.BusDriver['Inspection'].PosCar.z, false, false, false, true)
								SetEntityHeading(vehicle, Config.BusDriver['Inspection'].PosCar.h)
								SetEntityCoords(ped, 457.28,-556.22,27.5, false, false, false, true)
								SetEntityHeading(ped, 86.45)
								FreezeEntityPosition(vehicle, true)
								TaskLeaveVehicle(ped, vehicle, 0)
								exports.pNotify:SendNotification({text = "<b>Водитель автобуса</b></br>Теперь идите к инспектору, который находится перед автомобилем.", timeout = 4500})
								local ped_hash = GetHashKey('mp_m_waremech_01')
								RequestModel(ped_hash)
								while not HasModelLoaded(ped_hash) do
									Citizen.Wait(1)
								end
								MechanicPed = CreatePed(1, ped_hash, Config.BusDriver['Inspection'].PosPed.x, Config.BusDriver['Inspection'].PosPed.y, Config.BusDriver['Inspection'].PosPed.z-1.0, Config.BusDriver['Inspection'].PosPed.h, false, true)
								SetBlockingOfNonTemporaryEvents(MechanicPed, true)
								SetPedDiesWhenInjured(MechanicPed, false)
								SetPedCanPlayAmbientAnims(MechanicPed, true)
								SetPedCanRagdollFromPlayerImpact(MechanicPed, false)
								SetEntityInvincible(MechanicPed, true)
								FreezeEntityPosition(MechanicPed, true)
							else
								exports.pNotify:SendNotification({text = "<b>Водитель автобуса</b></br>В настоящее время кто-то осматривает автомобиль", timeout = 4500})
							end			
						else
							exports.pNotify:SendNotification({text = "<b>Водитель автобуса</b></br>Это не ваш автобус", timeout = 4500})
						end
					end
				end
			end
		end	
		Citizen.Wait(sleep)
	end
end)

Citizen.CreateThread(function()
	while true do
		local sleep = 500
		local ped = PlayerPedId()
		local coords = GetEntityCoords(ped)
		if MechanicPed then
			sleep = 5
			if(GetDistanceBetweenCoords(coords,Config.BusDriver['Inspection'].PosPed.x, Config.BusDriver['Inspection'].PosPed.y, Config.BusDriver['Inspection'].PosPed.z, true) < 3.5) then
				DrawText3Ds(Config.BusDriver['Inspection'].PosPed.x, Config.BusDriver['Inspection'].PosPed.y, Config.BusDriver['Inspection'].PosPed.z+1.0, 'Чтобы начать осмотр автомобиля, нажмите [~g~E~w~]')
				if IsControlJustReleased(0, Keys['E']) and not IsPedInAnyVehicle(ped, false) then
					FreezeEntityPosition(MechanicPed, false)
					TaskGoToCoordAnyMeans(MechanicPed, Config.BusDriver['Inspection'].FirstWheel.x, Config.BusDriver['Inspection'].FirstWheel.y, Config.BusDriver['Inspection'].FirstWheel.z, 1.3)
					while true do
						Citizen.Wait(0)
						local PedCoords = GetEntityCoords(MechanicPed)
						if(GetDistanceBetweenCoords(PedCoords,Config.BusDriver['Inspection'].FirstWheel.x, Config.BusDriver['Inspection'].FirstWheel.y, Config.BusDriver['Inspection'].FirstWheel.z, true) < 0.5) then
							SetEntityHeading(MechanicPed,266.31)
							startAnim(MechanicPed, 'anim@gangops@morgue@table@', 'player_search')
							Citizen.Wait(5000)
							ClearPedTasks(MechanicPed)
							break
						end
					end
					TaskGoToCoordAnyMeans(MechanicPed, Config.BusDriver['Inspection'].SecondWheel.x, Config.BusDriver['Inspection'].SecondWheel.y, Config.BusDriver['Inspection'].SecondWheel.z, 1.3)
					while true do
						Citizen.Wait(0)
						local PedCoords = GetEntityCoords(MechanicPed)
						if(GetDistanceBetweenCoords(PedCoords,Config.BusDriver['Inspection'].SecondWheel.x, Config.BusDriver['Inspection'].SecondWheel.y, Config.BusDriver['Inspection'].SecondWheel.z, true) < 0.5) then
							SetEntityHeading(MechanicPed,266.31)
							startAnim(MechanicPed, 'anim@gangops@morgue@table@', 'player_search')
							Citizen.Wait(5000)
							ClearPedTasks(MechanicPed)
							break
						end
					end					
					TaskGoToCoordAnyMeans(MechanicPed, Config.BusDriver['Inspection'].PosPed.x, Config.BusDriver['Inspection'].PosPed.y, Config.BusDriver['Inspection'].PosPed.z, 1.3)
					FreezeEntityPosition(Vehicle, false)
					FreezeEntityPosition(MechanicPed, false)	
					CreateRouteSelection()	
					RemoveBlip(InspectionBlip)		
					exports.pNotify:SendNotification({text = "<b>Водитель автобуса</b></br>Ваш автомобиль подходит для тура, пожалуйста, пройдите к пункту выбора маршрута", timeout = 5500})
					local displaying = true
					DepositB()
					Citizen.CreateThread(function()
						Wait(5000)
						displaying = false
					end)
					inspection = true
					while displaying do
						Wait(0)
						local coordsPed = GetEntityCoords(MechanicPed, false)
						local coords = GetEntityCoords(PlayerPedId(), false)
						local dist = Vdist2(coordsPed, coords)
						if dist < 150 then                
							DrawText3Ds(coordsPed['x'], coordsPed['y'], coordsPed['z'] + 1.2, "Все в порядке, ты можешь идти")
						end
					end	
					Citizen.Wait(5000)
					DeletePed(MechanicPed)
					MechanicPed = nil
				end
			end
		end	
		Citizen.Wait(sleep)
	end
end)

Citizen.CreateThread(function()
	while true do
		local sleep = 500
		local ped = PlayerPedId()
		local coords = GetEntityCoords(ped)
		if inspection and not Route then
			sleep = 5
			if(GetDistanceBetweenCoords(coords,Config.BusDriver['RouteSelection'].Pos.x, Config.BusDriver['RouteSelection'].Pos.y, Config.BusDriver['RouteSelection'].Pos.z, true) < 20.0) then
				DrawMarker(21, Config.BusDriver['RouteSelection'].Pos.x, Config.BusDriver['RouteSelection'].Pos.y, Config.BusDriver['RouteSelection'].Pos.z+0.90, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 2.0, 2.0, 2.0, 255, 255, 255, 100, false, true, 2, false, false, false, false)
				if(GetDistanceBetweenCoords(coords,Config.BusDriver['RouteSelection'].Pos.x, Config.BusDriver['RouteSelection'].Pos.y, Config.BusDriver['RouteSelection'].Pos.z, true) < 3.5) then
					DrawText3Ds(Config.BusDriver['RouteSelection'].Pos.x, Config.BusDriver['RouteSelection'].Pos.y, Config.BusDriver['RouteSelection'].Pos.z+1.4, 'To select a route, press [~g~E~w~]')
					if IsControlJustReleased(0, Keys['E']) and IsPedInAnyVehicle(ped, false) then
						local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), true)
						if GetVehicleNumberPlateText(vehicle) == Plate then
							exports.pNotify:SendNotification({text = "<b>Водитель автобуса</b></br>Вы выбрали маршрут - перейдите к первой точке на карте", timeout = 4500})
							Route = Randomize(Config.Locations)
							RemoveBlip(RouteSelection)
							CreateRoute(Route.name)
						else
							exports.pNotify:SendNotification({text = "<b>Водитель автобуса</b></br>Это не ваш автобус", timeout = 4500})
						end
					end
				end	
			end
		end	
		Citizen.Wait(sleep)
	end
end)

function CreateRoute(type)
	while true do
		local sleep = 500
		local ped = PlayerPedId()
		local coords = GetEntityCoords(ped)
			if type == 'first' then
				CreateWorkBlip(type,number) 
				sleep = 5
				for i, v in pairs(Config.First) do
					if i == number then 
						if(GetDistanceBetweenCoords(coords,Config.First[number].x, Config.First[number].y, Config.First[number].z, true) < 20.0) and not v.done then
							DrawMarker(20, Config.First[number].x, Config.First[number].y, Config.First[number].z+0.90, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 2.0, 2.0, 2.0, 255, 255, 255, 100, false, true, 2, false, false, false, false)
							if(GetDistanceBetweenCoords(coords,Config.First[number].x, Config.First[number].y, Config.First[number].z, true) < 3.5) then
								DrawText3Ds(Config.First[number].x, Config.First[number].y, Config.First[number].z+1.4, 'Чтобы остановиться и пригласить пассажиров, нажмите [~g~E~w~]')
								if IsControlJustReleased(0, Keys['E']) and IsPedInAnyVehicle(ped, false) then
								local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), true)
									if GetVehicleNumberPlateText(vehicle) == Plate then
										SetEntityCoords(vehicle,Config.First[number].x, Config.First[number].y, Config.First[number].z, false, false, false, true)
										SetEntityHeading(vehicle,Config.First[number].h)
										FreezeEntityPosition(vehicle, true)
										
										SetVehicleDoorOpen(vehicle, 1, false, true)
										if Passengers == 3 then
											for i, v in pairs(Config.First[number].Peds['Peds']) do
												CordsV = GetEntityCoords(vehicle)
												local ped_hash = GetHashKey(Config.BusDriver['Peds'][math.random(1,#Config.BusDriver['Peds'])].ped)
												RequestModel(ped_hash)
												while not HasModelLoaded(ped_hash) do
													Citizen.Wait(1)
												end
												v.ped = CreatePed(1, ped_hash, Config.First[number].dx, Config.First[number].dy, Config.First[number].dz-0.5, 0.0, false, true)
												SetBlockingOfNonTemporaryEvents(v.ped, true)
												SetPedDiesWhenInjured(v.ped, false)
												SetPedCanPlayAmbientAnims(v.ped, true)
												SetPedCanRagdollFromPlayerImpact(v.ped, false)
												SetEntityInvincible(v.ped, true)
												TaskGoToCoordAnyMeans(v.ped, CordsV.x-10, CordsV.y+2, CordsV.z, 1.3)
												Passengers = 0
											end
											Citizen.Wait(3000)
											for i, v in pairs(Config.First[number].Peds['Peds']) do
												DeletePed(v.ped)
											end
										end
										
										for i, v in pairs(Config.First[number].Peds['Peds']) do
											local ped_hash = GetHashKey(Config.BusDriver['Peds'][math.random(1,#Config.BusDriver['Peds'])].ped)
											RequestModel(ped_hash)
											while not HasModelLoaded(ped_hash) do
												Citizen.Wait(1)
											end
											v.ped = CreatePed(1, ped_hash, v.x, v.y, v.z-0.5, v.h, false, true)
											SetBlockingOfNonTemporaryEvents(v.ped, true)
											SetPedDiesWhenInjured(v.ped, false)
											SetPedCanPlayAmbientAnims(v.ped, true)
											SetPedCanRagdollFromPlayerImpact(v.ped, false)
											SetEntityInvincible(v.ped, true)
											TaskGoToCoordAnyMeans(v.ped, Config.First[number].dx, Config.First[number].dy, Config.First[number].dz, 1.3)
											Passengers = 3
										end

										exports.rprogress:Custom({
											Duration = 3000,
											Label = "Посадка пассажиров...",
											Animation = {
												scenario = "", -- https://pastebin.com/6mrYTdQv
												animationDictionary = "", -- https://alexguirre.github.io/animations-list/
											},
											DisableControls = {
												Mouse = false,
												Player = true,
												Vehicle = true
											}
										})
										Citizen.Wait(3000)
										for i, v in pairs(Config.First[number].Peds['Peds']) do
											DeletePed(v.ped)
										end
										RemoveBlip(WorkBlip)
										WorkBlip = nil
										SetVehicleDoorShut(vehicle, 1, false)

										FreezeEntityPosition(vehicle, false)
										
										v.done = true
										if number >= #Config.First then
											close = true
											break
										end
										ESX.TriggerServerCallback('inside-busdriver:payout', function(money)
											exports.pNotify:SendNotification({text = '<b>Водитель автобуса</b></br>Вы заслужили '..money..'$ перейти к следующему пункту', timeout = 4500})
										end)
										number = number + 1
									else
										exports.pNotify:SendNotification({text = "<b>Водитель автобуса</b></br>Это не ваш автобус", timeout = 4500})
									end
								end
							end
						end
					end
				end
			elseif type == 'second' then
				CreateWorkBlip(type,number) 
				sleep = 5
				for i, v in pairs(Config.Second) do
					if i == number then 
						if(GetDistanceBetweenCoords(coords,Config.Second[number].x, Config.Second[number].y, Config.Second[number].z, true) < 20.0) and not v.done then
							DrawMarker(20, Config.Second[number].x, Config.Second[number].y, Config.Second[number].z+0.90, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 2.0, 2.0, 2.0, 255, 255, 255, 100, false, true, 2, false, false, false, false)
							if(GetDistanceBetweenCoords(coords,Config.Second[number].x, Config.Second[number].y, Config.Second[number].z, true) < 3.5) then
								DrawText3Ds(Config.Second[number].x, Config.Second[number].y, Config.Second[number].z+1.4, 'Чтобы остановиться и пригласить пассажиров, нажмите [~g~E~w~]')
								if IsControlJustReleased(0, Keys['E']) and IsPedInAnyVehicle(ped, false) then
								local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), true)
									if GetVehicleNumberPlateText(vehicle) == Plate then
										SetEntityCoords(vehicle,Config.Second[number].x, Config.Second[number].y, Config.Second[number].z, false, false, false, true)
										SetEntityHeading(vehicle,Config.Second[number].h)
										FreezeEntityPosition(vehicle, true)
											
										SetVehicleDoorOpen(vehicle, 1, false, true)
										if Passengers == 3 then
											for i, v in pairs(Config.Second[number].Peds['Peds']) do
												CordsV = GetEntityCoords(vehicle)
												local ped_hash = GetHashKey(Config.BusDriver['Peds'][math.random(1,#Config.BusDriver['Peds'])].ped)
												RequestModel(ped_hash)
												while not HasModelLoaded(ped_hash) do
													Citizen.Wait(1)
												end
												v.ped = CreatePed(1, ped_hash, Config.Second[number].dx, Config.Second[number].dy, Config.Second[number].dz-0.5, 0.0, false, true)
												SetBlockingOfNonTemporaryEvents(v.ped, true)
												SetPedDiesWhenInjured(v.ped, false)
												SetPedCanPlayAmbientAnims(v.ped, true)
												SetPedCanRagdollFromPlayerImpact(v.ped, false)
												SetEntityInvincible(v.ped, true)
												TaskGoToCoordAnyMeans(v.ped, CordsV.x-10, CordsV.y+2, CordsV.z, 1.3)
												Passengers = 0
											end
											Citizen.Wait(3000)
											for i, v in pairs(Config.Second[number].Peds['Peds']) do
												DeletePed(v.ped)
											end
										end
											
										for i, v in pairs(Config.Second[number].Peds['Peds']) do
											local ped_hash = GetHashKey(Config.BusDriver['Peds'][math.random(1,#Config.BusDriver['Peds'])].ped)
											RequestModel(ped_hash)
											while not HasModelLoaded(ped_hash) do
												Citizen.Wait(1)
											end
											v.ped = CreatePed(1, ped_hash, v.x, v.y, v.z-0.5, v.h, false, true)
											SetBlockingOfNonTemporaryEvents(v.ped, true)
											SetPedDiesWhenInjured(v.ped, false)
											SetPedCanPlayAmbientAnims(v.ped, true)
											SetPedCanRagdollFromPlayerImpact(v.ped, false)
											SetEntityInvincible(v.ped, true)
											TaskGoToCoordAnyMeans(v.ped, Config.Second[number].dx, Config.Second[number].dy, Config.Second[number].dz, 1.3)
											Passengers = 3
										end

										exports.rprogress:Custom({
											Duration = 3000,
											Label = "Посадка пассажиров...",
											Animation = {
												scenario = "", -- https://pastebin.com/6mrYTdQv
												animationDictionary = "", -- https://alexguirre.github.io/animations-list/
											},
											DisableControls = {
												Mouse = false,
												Player = true,
												Vehicle = true
											}
										})
										Citizen.Wait(3000)
										for i, v in pairs(Config.Second[number].Peds['Peds']) do
											DeletePed(v.ped)
										end

										RemoveBlip(WorkBlip)
										WorkBlip = nil
										SetVehicleDoorShut(vehicle, 1, false)

										FreezeEntityPosition(vehicle, false)
											
										v.done = true
										if number >= #Config.Second then
											close = true
											break
										end
										ESX.TriggerServerCallback('inside-busdriver:payout', function(money)
											exports.pNotify:SendNotification({text = '<b>Водитель автобуса</b></br>Вы заслужили '..money..'$ перейти к следующему пункту', timeout = 4500})
										end)
										number = number + 1
									else
										exports.pNotify:SendNotification({text = "<b>Водитель автобуса</b></br>Это не ваш автобус", timeout = 4500})
									end
								end
							end
						end
					end
				end
			end
			if close then
				ESX.TriggerServerCallback('inside-busdriver:payout', function(money)
					exports.pNotify:SendNotification({text = '<b>Водитель автобуса</b></br>Вы заслужили '..money..'$ Конец маршрута, переходите к следующему', timeout = 4500})
				end)
				number = 1
				for i, v in pairs(Config.First) do
					v.done = false
				end
				for i, v in pairs(Config.Second) do
					v.done = false
				end
				Route = nil
				close = false
				Passengers = 0
				CreateRouteSelection()
				break
			end
		Citizen.Wait(sleep)
	end
end

function CreateWorkBlip(type,number)
	if not WorkBlip then
		if type == 'first' then
			WorkBlip = AddBlipForCoord(Config.First[number].x, Config.First[number].y, Config.First[number].z)
			
			SetBlipSprite (WorkBlip, 162)
			SetBlipDisplay(WorkBlip, 4)
			SetBlipScale  (WorkBlip, 0.8)
			SetBlipColour (WorkBlip, 0)
			SetBlipAsShortRange(WorkBlip, true)
			
			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString('Автобусная остановка')
			EndTextCommandSetBlipName(WorkBlip)
			SetBlipRoute(WorkBlip, true)
		elseif type == 'second' then
			WorkBlip = AddBlipForCoord(Config.Second[number].x, Config.Second[number].y, Config.Second[number].z)
			
			SetBlipSprite (WorkBlip, 162)
			SetBlipDisplay(WorkBlip, 4)
			SetBlipScale  (WorkBlip, 0.8)
			SetBlipColour (WorkBlip, 0)
			SetBlipAsShortRange(WorkBlip, true)
			
			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString('Автобусная остановка')
			EndTextCommandSetBlipName(WorkBlip)
			SetBlipRoute(WorkBlip, true)
		end
	end
end

function CreateRouteSelection()
	RouteSelection = AddBlipForCoord(Config.BusDriver['RouteSelection'].Pos.x, Config.BusDriver['RouteSelection'].Pos.y, Config.BusDriver['RouteSelection'].Pos.z)
	
	SetBlipSprite (RouteSelection, 459)
	SetBlipDisplay(RouteSelection, 4)
	SetBlipScale  (RouteSelection, 0.8)
	SetBlipColour (RouteSelection, 0)
	SetBlipAsShortRange(RouteSelection, true)
	
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString('Выбор маршрута')
	EndTextCommandSetBlipName(RouteSelection)
end

function DepositB()
	DepositBlip = AddBlipForCoord(Config.Deposit['Deposit'].Pos.x, Config.Deposit['Deposit'].Pos.y, Config.Deposit['Deposit'].Pos.z)
	
	SetBlipSprite (DepositBlip, 68)
	SetBlipDisplay(DepositBlip, 4)
	SetBlipScale  (DepositBlip, 0.8)
	SetBlipColour (DepositBlip, 0)
	SetBlipAsShortRange(DepositBlip, true)
	
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString('Вернуть автомобиль')
	EndTextCommandSetBlipName(DepositBlip)
end

function CreateInspectionBlip()
	InspectionBlip = AddBlipForCoord(Config.BusDriver['Inspection'].Pos.x, Config.BusDriver['Inspection'].Pos.y, Config.BusDriver['Inspection'].Pos.z)
	
	SetBlipSprite (InspectionBlip, 464)
	SetBlipDisplay(InspectionBlip, 4)
	SetBlipScale  (InspectionBlip, 0.8)
	SetBlipColour (InspectionBlip, 0)
	SetBlipAsShortRange(InspectionBlip, true)
	
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString('Осмотр автобуса')
	EndTextCommandSetBlipName(InspectionBlip)
end

function Randomize(tb)
	local keys = {}
	for k in pairs(tb) do table.insert(keys, k) end
	return tb[keys[math.random(#keys)]]
end

function startAnim(ped, dictionary, anim)
	Citizen.CreateThread(function()
	  RequestAnimDict(dictionary)
	  while not HasAnimDictLoaded(dictionary) do
		Citizen.Wait(0)
	  end
		TaskPlayAnim(ped, dictionary, anim ,8.0, -8.0, -1, 50, 0, false, false, false)
	end)
end

function DrawText3Ds(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end


