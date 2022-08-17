ConfigFarmer = {}
ConfigFarmer.Framework = 'esx' ---[ 'esx' / 'qbcore' / 'vrp' ] Choose your framework.

ConfigFarmer.PlayerLoadEvent   = 'QBCore:Client:OnPlayerLoaded' --event for player load, ESX = esx:playerLoaded, qbcore = QBCore:Client:OnPlayerLoaded
ConfigFarmer.MainCoreEvent     = 'QBCore:GetObject' --ESX = 'esx:getSharedObject'   qbcore = 'QBCore:GetObject'
ConfigFarmer.ItemBoxEvent = 'none' --event to show the items, ex: 'inventory:client:ItemBox' , or 'none'
ConfigFarmer.CoreResourceName  = 'qb-core'   --ESX = 'es_extended'           QBCORE = 'qb-core'
ConfigFarmer.TargetResourceName  = 'qb-target' --If you have a custom target, change the name
ConfigFarmer.MenuResourceName  = 'qb-menu' --optional if you turn on the property useMenuToShowStatus
ConfigFarmer.InputResourceName  = 'qb-input' --qb-input 
ConfigFarmer.VehicleKeysResourceName = 'vehiclekeys:client:SetOwner' --set owner of vehicle
ConfigFarmer.DatabaseResourceName = 'oxmysql' --ghmattimysql or oxmysql
ConfigFarmer.ESXProgressBarResourceName = 'progressbar' --only for ESX

ConfigFarmer.ReputationIdentifier = 'farmerrep' --rep name that you use in your server for restaurants reputation
ConfigFarmer.cashMoneyId = 'cash' --identifier for normal money

ConfigFarmer.Farming = {
  dealer = {
    type = 'a_m_m_farmer_01',
    coord = vector4(1907.09, 4942.07, 48.85, 284.02), 
  },
  tractorCoord = vector4(1901.67, 4918.0, 48.72, 332.11), --tractor spawn
  job = nil,
  gang = nil,
  buySeedsitem = nil, --mandatory item to talk with the ped farmer and buy seeds
  tractoritem = nil, --mandatory item to talk with the ped farmer and rent the tractor to fertilize the field
  plants = {
    initialStageProp = 'prop_grass_dry_03', --proc_forest_grass01
    plantationFieldCoord = vector3(2030.7340087891, 4901.2221679688, 42.721950531006), --center of the plantation field
    rangeToPlant = 40, --range where the plant will spawn related to the plantationFieldCoord
    minDistanceBetweenPlants = 5,
    spawnGroundZ = -2,--used to adapt the plants to the ground if needed
    fertilizeKey = 38,--E
    radiusToPlantSeed = 1.8, --radius to plant new seeds
    mandatoryItem = nil, --mandatory item in inventory to clean field
  },
  waterCoord = vector3(2041.32, 4855.05, 43.11), --blip to turn on water to grow the seeds
  waterMandatoryItem = nil,
  seeds = {--list of diferent seeds that you can plant in the field
    [1] = {
      id = nil, --dont change
      itemName = 'seed_tomate',
      propName = 'prop_veg_crop_02',
      coord = nil,--dont change
      finalItemName = 'tomate',
      qtyFinalItem = 1,
    },
    [2] = {
      id = nil, --dont change
      itemName = 'seed_corn',
      propName = 'prop_plant_01a',
      coord = nil,--dont change
      finalItemName = 'corn_kernel',
      qtyFinalItem = 1,
    },
    [3] = {
      id = nil, --dont change
      itemName = 'seed_lettuce',
      propName = 'prop_veg_crop_03_cab',
      coord = nil,--dont change
      finalItemName = 'lettuce',
      qtyFinalItem = 1,
    }, 
    [4] = {
      id = nil, --dont change
      itemName = 'seed_potato',
      propName = 'prop_veg_crop_04_leaf',
      coord = nil,--dont change
      finalItemName = 'potato',
      qtyFinalItem = 1,
    },
    [5] = {
      id = nil, --dont change
      itemName = 'seed_pumpkin',
      propName = 'prop_veg_crop_03_pump',
      coord = nil,--dont change
      finalItemName = 'pumpkin',
      qtyFinalItem = 1,
    },
  },
  milk = {
    enable = true,
    collectItem = nil, -- in case you want a mandatory item to collect milk from the cow
    animalsProps = {
      'a_c_cow'
    },
    milkFinalItem = 'milk',
    cheeseCoord = vector3(407.28, 6452.29, 28.81), --coord where we can produce cheese
    qtyMilkToProduceCheese = 1, --quantity of milk for produce cheese for each iteration
    cheeseItem = 'cheese', --item name
  },
  fruits = {
    enable = true,
    collectItem = nil, -- in case you want a mandatory item to collect fruits from the trees
    treesCoords = {
      [1] = {
        coord = vector3(378.34, 6505.62, 27.94),
      },
      [2] = {
        coord = vector3(370.38, 6505.46, 28.41),
      },
      [3] = {
        coord = vector3(363.6, 6505.61, 28.55),
      },
      [4] = {
        coord = vector3(355.97, 6504.82, 28.45),
      },
      [5] = {
        coord = vector3(348.3, 6505.19, 28.79),
      },
      [6] = {
        coord = vector3(340.32, 6505.23, 28.69),
      },
    },
    nutritionItem = 'tree_nutrition', --nutrition for fruits
    qtyNutrition = 1, --qty nutrition to use for each tree
    fruitItems = { --items fruits
      'orange',
      'apple',
      'peach',
      'mango',
      'pineapple',
    }
  },
  eggs = {
    enable = true,
    collectItem = nil, -- in case you want a mandatory item to collect eggs
    chickenCoords = {
      [1] = {
        coord = vector4(2381.39, 5027.86, 44.97, 50.87),
      },
      [2] = {
        coord = vector4(2380.89, 5030.18, 44.95, 250.87), 
      }
    },
    feedChickenItem = 'corn_kernel', --you need to feed the chickens to receive eggs
    feedQty = 2, --two feedChickenItem to receive eggs
    rewardItem = 'chicken_egg',
  },
  mushrooms = { 
    enable = true,
    collectItem = nil, -- in case you want a mandatory item to collect eggs
    mushroomsCoords = {
      [1] = {
        coord = vector3(2182.24, 5563.4, 53.7),
      },
      [2] = {
        coord = vector3(-608.42, 5941.02, 23.44), 
      }
    },
    rangeMushrooms = 15, --range where the mushroom will spawn related to the mushroomsCoords center
    minDistanceBetweenMushroom = 5,
    rewardItem = 'mushroom',
  },
  vineyard = {
    enable = true,
    collectItem = nil, -- in case you want a mandatory item to cut grapes
    grapeLocations = {
      [1] = {
        coord = vector3(-1901.11, 1966.61, 147.24),
      },
      [2] = {
        coord = vector3(-1897.52, 1964.44, 147.39), 
      },
      [3] = {
        coord = vector3(-1893.84, 1962.41, 147.5),
      },
      [4] = {
        coord = vector3(-1908.86, 1965.63, 148.41), 
      },
      [5] = {
        coord = vector3(-1903.13, 1962.45, 149.04), 
      },
      [6] = {
        coord = vector3(-1899.55, 1960.42, 149.13), 
      },
    },
    rewardGrapeItem = 'grape',
    processGrapes = vector3(443.17, 6507.72, 29.33), --coords where the grapes are processed
    rewardItemProcessGrapes = 'grapejuice',
    qtyGrape = 3, --number of grapes to process grape juice
    produceWine = vector3(440.12, 6505.17, 28.78), --coords where the wine is created
    qtyProcessGrape = 1, --number of processed wine to create a bottle of wine
    rewardItemWine = 'wine', --item name for farmer wine
  },
  hayMissions = { --missions to feed farms with hay
    enable = true,
    collectItem = nil, --in case you want a mandatory item to collect hay
    hayTraillorItem = nil, --in case you want a mandatory item to have access to the hay trailer
    deliveryHayCoords = {
      vector3(1970.14, 5173.37, 47.74),
      vector3(1802.1, 4917.89, 43.0),
    }, --coord where you need to delivery the hay
  }
}

ConfigFarmer.Store = {
  enable = true, --enable farmer store
  props = {
    barrack = vector4(2059.84, 2663.43, 50.9, 42.73),
    ped = vector4(2058.79, 2663.86, 51.11, 222.5),
  },
  pedType = 'a_m_m_fatlatin_01',
  job = nil,
  gang = nil,
  mandatoryItem = nil, --item to iteract with the ped
}

ConfigFarmer.Blips = {
  {
    enable = true,--turn on or off blip
    title="Cow Farm", 
    colour=16, 
    id=141,
    display = 4,
    scale = 0.65,
    coord = vector3(425.11, 6471.56, 28.8), 
  },
  {
    enable = true,--turn on or off blip
    title="Cow Farm", 
    colour=16, 
    id=141,
    display = 4,
    scale = 0.65,
    coord = vector3(2431.16, 4771.9, 34.38), 
  },
	{
    enable = true,--turn on or off blip
    title="Farm Field Supply", 
    colour=16, 
    id=140,
    display = 4,
    scale = 0.65,
    coord = vector3(2041.5297851562, 4854.5625, 43.097927093506), 
  },
  {
    enable = true,--turn on or off blip
    title="Fruits Farm", 
    colour=16, 
    id=103,
    display = 4,
    scale = 0.65,
    coord = vector3(361.97, 6508.62, 28.46), 
  },
  {
    enable = true,--turn on or off blip
    title="Chikens Farm", 
    colour=16, 
    id=141,
    display = 4,
    scale = 0.65,
    coord = vector3(2382.1, 5029.44, 45.98), 
  },
  {
    enable = true,--turn on or off blip
    title="Farm Store", 
    colour=16, 
    id=59,
    display = 4,
    scale = 0.65,
    coord = vector3(2058.79, 2663.86, 51.11), 
  },
  {
    enable = true,--turn on or off blip
    title="Vineyard", 
    colour=16, 
    id=103,
    display = 4,
    scale = 0.65,
    coord = vector3(-1903.53, 1963.59, 148.71), 
  },
  {
    enable = true,--turn on or off blip
    title="Wine Lab", 
    colour=16, 
    id=464,
    display = 4,
    scale = 0.65,
    coord = vector3(441.58, 6506.91, 28.74), 
  },
}

ConfigFarmer.labMilkFarmer = {
  enable = true, --use my cheese lab or not
  barrilsCoord = vector4(410.96, 6452.60, 27.81, 185.75),
  ovenCoord = vector4(407.28, 6452.29, 27.81, 189),
  parasolCoord = vector4(405.09, 6453.3, 27.93,100),
  fruitPackCoord = vector4(409.04, 6452.45, 27.81, 191.12),
  boxCoord = vector4(404.62, 6454.85, 27.81, 191.12), 
  waterCoord = vector4(406.24, 6453.42, 27.81, 191.12),
}

ConfigFarmer.labWineFarmer = {
  enable = true, --use my wine produce lab or not
  boxCoord = vector4(442.97, 6507.63, 27.74, 185.75), 
  tableCoord = vector4(440.98, 6505.43, 27.74, 185.75), 
}

if ConfigFarmer.Framework == 'esx' then
  --esx only allow one level
  ConfigFarmer.ReputationLevels = {
      repLevelLimit = 1, --the level is between 0 and 1
      increaseRepValue = 0.01, --value to increase rep
      typeTractor = 'Tractor2', --type of trator
      crop = {min = 8, max = 20}, --number of bad weeds to clean
      platingTimer = 8000, --timer to plant the seed
      seedBagPrice = 5000, --value to pay for seeds bag
      numberSeedsInBag = {min = 5, max = 9}, --number of seed that player will receive for a bag
      buySeedsTimer = 5000, --timer to buy seeds
      waterTimer = 40000, --timer to turn on water and grow the seeds
      collectTimer = 5000, --timer to collect the plant
      milkTimer = 15000, --collect milk
      cowAttack = 25, -- 0 - 100 , % for cow attack farmer
      cowMilkQty = {min = 1, max = 2}, -- number of milk
      produceCheeseTimer = 30000, --produce cheese timer
      cheeseQty = {min = 1, max = 1}, -- number of cheese receive for each chesse iteration
      treeNutritionTimer = 7000, --timer to fertilize tree
      growFruitsTimer = 15, --number of minutes to wait after fertilize the trees
      collectFruitTimer = 10000, --collect fruit from the tree
      fruitQty = {min = 1, max = 1}, --number of fruit to collect from the tree
      rewardEggQty = {min = 1, max = 1}, --number of eggs to receive
      eggsTimer = 15000, --timer to collect eggs
      renewEggsTimer = 30, --number of minutes to wait after collect eggs
      mushroomToSpawn = {min = 3, max = 6}, --number of mushroom to spawn for player
      numMushroomReward = {min = 1, max = 1}, --number of mushroom to collect for each mushroom
      collectMushroomTimer = 10000, --collect mushroom timer
      collectGrapeTimer = 6000, --timer to collect grape timer
      renewGrapeTime = 60, --time in minutes to cut grapes again
      numGrapeReward = {min = 1, max = 1}, --number of grapes to collect for each iteration
      processGrapeTimer = 20000, --tread grapes timer
      rewardGrapeJuiceQty = {min = 1, max = 1}, --number of grapes juice to collect for each iteration
      produceWineTimer = 5000, --timer to create a bottle of wine
      rewardWineQty = {min = 1, max = 1}, --number of wine bottles to collect for each iteration
      grabHayTimer = 5000, --timer to grab the hay
      depositHayTimer = 1000, --timer to deposit the hay
      numOfHayToPickUp = {min = 6, max = 7}, --number of hay to pickup
      missionTimer = {min = 15, max = 20}, --timer in minutes to complete the hay mission
      missionMoneyReward = {min = 2000, max = 7000}, --money to receive after end the hay mission with success
  } 

elseif ConfigFarmer.Framework == 'qbcore' then
  ConfigFarmer.ReputationLevels = {--the last level will be the higther configuration, for example if the player have reputation of 20 the level will be the last one (Level 4)
      [1] = {
          repLevelLimit = 1, --the level is between 0 and 1
          increaseRepValue = 0.01, --value to increase rep
          typeTractor = 'Tractor2',
          crop = {min = 10, max = 20},
          platingTimer = 10000, --timer to plant the seed
          seedBagPrice = 5000, --value to pay for seeds bag
          numberSeedsInBag = {min = 3, max = 6}, --number of seed that player will receive for a bag
          buySeedsTimer = 5000, --timer to buy seeds
          waterTimer = 50000, --timer to turn on water and grow the seeds
          collectTimer = 5000, --timer to collect the plant
          milkTimer = 15000, --collect milk
          cowAttack = 30, -- 0 - 100 , % for cow attack farmer
          cowMilkQty = {min = 1, max = 1}, -- number of milk
          produceCheeseTimer = 30000, --produce cheese timer
          cheeseQty = {min = 1, max = 1}, -- number of cheese receive for each chesse iteration
          treeNutritionTimer = 8000, --timer to fertilize tree
          growFruitsTimer = 18, --number of minutes to wait after fertilize the trees
          collectFruitTimer = 13000, --collect fruit from the tree
          fruitQty = {min = 1, max = 1}, --number of fruit to collect from the tree
          rewardEggQty = {min = 1, max = 1}, --number of eggs to receive
          eggsTimer = 17000, --timer to collect eggs
          renewEggsTimer = 30, --number of minutes to wait after collect eggs
          mushroomToSpawn = {min = 3, max = 6}, --number of mushroom to spawn for player
          numMushroomReward = {min = 1, max = 1}, --number of mushroom to collect for each mushroom
          collectMushroomTimer = 12000, --collect mushroom timer
          collectGrapeTimer = 6000, --timer to collect grape timer
          renewGrapeTime = 60, --time in minutes to cut grapes again
          numGrapeReward = {min = 1, max = 1}, --number of grapes to collect for each iteration
          processGrapeTimer = 20000, --tread grapes timer
          rewardGrapeJuiceQty = {min = 1, max = 1}, --number of grapes juice to collect for each iteration
          produceWineTimer = 5000, --timer to create a bottle of wine
          rewardWineQty = {min = 1, max = 1}, --number of wine bottles to collect for each iteration
          grabHayTimer = 5000, --timer to grab the hay
          depositHayTimer = 1000, --timer to deposit the hay
          numOfHayToPickUp = {min = 6, max = 6}, --number of hay to pickup
          missionTimer = {min = 15, max = 17}, --timer in minutes to complete the hay mission
          missionMoneyReward = {min = 2000, max = 3000}, --money to receive after end the hay mission with success
      },
      [2] = {
          repLevelLimit = 3, --the level is between 1 and 3
          increaseRepValue = 0.01, --value to increase rep
          typeTractor = 'Tractor2',
          crop = {min = 8, max = 18},
          platingTimer = 8000, --timer to plant the seed
          seedBagPrice = 5000, --value to pay for seeds bag
          numberSeedsInBag = {min = 4, max = 6}, --number of seed that player will receive for a bag
          buySeedsTimer = 5000, --timer to buy seeds
          waterTimer = 40000, --timer to turn on water and grow the seeds
          collectTimer = 5000, --timer to collect the plant
          milkTimer = 13000, --collect milk
          cowAttack = 25, -- 0 - 100 , % for cow attack farmer
          cowMilkQty = {min = 1, max = 2}, -- number of milk
          produceCheeseTimer = 30000, --produce cheese timer
          cheeseQty = {min = 1, max = 1}, -- number of cheese receive for each chesse iteration
          treeNutritionTimer = 7000, --timer to fertilize tree
          growFruitsTimer = 15, --number of minutes to wait after fertilize the trees
          collectFruitTimer = 12000, --collect fruit from the tree
          fruitQty = {min = 1, max = 2}, --number of fruit to collect from the tree
          rewardEggQty = {min = 1, max = 1}, --number of eggs to receive
          eggsTimer = 15000, --timer to collect eggs
          renewEggsTimer = 30, --number of minutes to wait after collect eggs
          mushroomToSpawn = {min = 3, max = 6}, --number of mushroom to spawn for player
          numMushroomReward = {min = 1, max = 1}, --number of mushroom to collect for each mushroom
          collectMushroomTimer = 10000, --collect mushroom timer
          collectGrapeTimer = 5000, --timer to collect grape timer
          renewGrapeTime = 60, --time in minutes to cut grapes again
          numGrapeReward = {min = 1, max = 2}, --number of grapes to collect for each iteration
          processGrapeTimer = 18000, --tread grapes timer
          rewardGrapeJuiceQty = {min = 1, max = 1}, --number of grapes juice to collect for each iteration
          produceWineTimer = 5000, --timer to create a bottle of wine
          rewardWineQty = {min = 1, max = 1}, --number of wine bottles to collect for each iteration
          grabHayTimer = 5000, --timer to grab the hay
          depositHayTimer = 1000, --timer to deposit the hay
          numOfHayToPickUp = {min = 6, max = 7}, --number of hay to pickup
          missionTimer = {min = 15, max = 20}, --timer in minutes to complete the hay mission
          missionMoneyReward = {min = 2000, max = 4000}, --money to receive after end the hay mission with success
      },
      [3] = {
          repLevelLimit = 5, --the level is between 3 and 5
          increaseRepValue = 0.01, --value to increase rep
          typeTractor = 'Tractor3',
          crop = {min = 8, max = 15},
          platingTimer = 7000, --timer to plant the seed
          seedBagPrice = 5000, --value to pay for seeds bag
          numberSeedsInBag = {min = 5, max = 9}, --number of seed that player will receive for a bag
          buySeedsTimer = 4000, --timer to buy seeds
          waterTimer = 30000, --timer to turn on water and grow the seeds
          collectTimer = 4500, --timer to collect the plant
          milkTimer = 12000, --collect milk
          cowAttack = 15, -- 0 - 100 , % for cow attack farmer
          cowMilkQty = {min = 1, max = 3}, -- number of milk
          produceCheeseTimer = 25000, --produce cheese timer
          cheeseQty = {min = 1, max = 2}, -- number of cheese receive for each chesse iteration
          treeNutritionTimer = 6000, --timer to fertilize tree
          growFruitsTimer = 10, --number of minutes to wait after fertilize the trees
          collectFruitTimer = 10000, --collect fruit from the tree
          fruitQty = {min = 1, max = 2}, --number of fruit to collect from the tree
          rewardEggQty = {min = 1, max = 1}, --number of eggs to receive
          eggsTimer = 14000, --timer to collect eggs
          renewEggsTimer = 30, --number of minutes to wait after collect eggs
          mushroomToSpawn = {min = 4, max = 6}, --number of mushroom to spawn for player
          numMushroomReward = {min = 1, max = 1}, --number of mushroom to collect for each mushroom
          collectMushroomTimer = 8000, --collect mushroom timer
          collectGrapeTimer = 4000, --timer to collect grape timer
          renewGrapeTime = 55, --time in minutes to cut grapes again
          numGrapeReward = {min = 1, max = 3}, --number of grapes to collect for each iteration
          processGrapeTimer = 15000, --tread grapes timer
          rewardGrapeJuiceQty = {min = 1, max = 2}, --number of grapes juice to collect for each iteration
          produceWineTimer = 4000, --timer to create a bottle of wine
          rewardWineQty = {min = 1, max = 2}, --number of wine bottles to collect for each iteration
          grabHayTimer = 4000, --timer to grab the hay
          depositHayTimer = 1000, --timer to deposit the hay
          numOfHayToPickUp = {min = 6, max = 8}, --number of hay to pickup
          missionTimer = {min = 20, max = 35}, --timer in minutes to complete the hay mission
          missionMoneyReward = {min = 2000, max = 5500}, --money to receive after end the hay mission with success
      },
      [4] = {
          repLevelLimit = 10, --the level is between 5 and 10
          increaseRepValue = 0.01, --value to increase rep
          typeTractor = 'Tractor3',
          crop = {min = 6, max = 13},
          platingTimer = 5000, --timer to plant the seed
          seedBagPrice = 5000, --value to pay for seeds bag
          numberSeedsInBag = {min = 6, max = 9}, --number of seed that player will receive for a bag
          buySeedsTimer = 4000, --timer to buy seeds
          waterTimer = 28000, --timer to turn on water and grow the seeds
          collectTimer = 4000, --timer to collect the plant
          milkTimer = 11000, --collect milk
          cowAttack = 12, -- 0 - 100 , % for cow attack farmer
          cowMilkQty = {min = 1, max = 4}, -- number of milk
          produceCheeseTimer = 20000, --produce cheese timer
          cheeseQty = {min = 1, max = 2}, -- number of cheese receive for each chesse iteration
          treeNutritionTimer = 5000, --timer to fertilize tree
          growFruitsTimer = 9, --number of minutes to wait after fertilize the trees
          collectFruitTimer = 8000, --collect fruit from the tree
          fruitQty = {min = 1, max = 3}, --number of fruit to collect from the tree
          rewardEggQty = {min = 1, max = 2}, --number of eggs to receive
          eggsTimer = 13000, --timer to collect eggs
          renewEggsTimer = 30, --number of minutes to wait after collect eggs
          mushroomToSpawn = {min = 4, max = 6}, --number of mushroom to spawn for player
          numMushroomReward = {min = 1, max = 1}, --number of mushroom to collect for each mushroom
          collectMushroomTimer = 6000, --collect mushroom timer
          collectGrapeTimer = 4000, --timer to collect grape timer
          renewGrapeTime = 50, --time in minutes to cut grapes again
          numGrapeReward = {min = 2, max = 4}, --number of grapes to collect for each iteration
          processGrapeTimer = 12000, --tread grapes timer
          rewardGrapeJuiceQty = {min = 1, max = 2}, --number of grapes juice to collect for each iteration
          produceWineTimer = 3000, --timer to create a bottle of wine
          rewardWineQty = {min = 1, max = 3}, --number of wine bottles to collect for each iteration
          grabHayTimer = 3500, --timer to grab the hay
          depositHayTimer = 1000, --timer to deposit the hay
          numOfHayToPickUp = {min = 6, max = 12}, --number of hay to pickup
          missionTimer = {min = 25, max = 35}, --timer in minutes to complete the hay mission
          missionMoneyReward = {min = 2000, max = 7000}, --money to receive after end the hay mission with success
      }
  }

end

ConfigFarmer.Locale = 'EN'
ConfigFarmer.Locales = {
    ['EN'] = {
      ['NEW_LEVEL_REP'] = 'Raised your dealer reputation. Level %d',
      ['RENT_TRACTOR_LABEL'] = 'Tractor Keys',
      ['RENT_TRACTOR_DEL_LABEL'] = 'Delivery Tractor',
      ['RENT_TRACTOR_INVALID'] = 'The vehicle is not my Tractor.',
      ['COLLECT_PLANTS'] = 'You have to clean and fertilize the field',
      ['START_COLLECT_PLANTS'] = 'Use the tractor to fertilize and clean the field...',
      ['OPEN_WATER_PLANTS'] = 'The field is fertilized and clean. You can plant your seeds.',
      ['NO_SEED_SPACE'] = 'You have another seed close by.',
      ['SEED_OUT_FIELD'] = 'You cannot plant outside the field',
      ['SEED_PLANT'] = 'Planting the seed...',
      ['BUY_SEEDS_LABEL'] = 'Buy Seeds',
      ['NO_MONEY'] = 'You have no money.',
      ['BUY_SEED_PLANT'] = 'Buying seeds...',
      ['NO_CLEAN_FIELD'] = 'Field is not clean and fertilized',
      ['SEED_PLANTED_SUCCESS'] = 'Good job, a new plant will born here.',
      ['WATER_SEED_LABEL'] = 'Turn On Water',
      ['WATER_SEED_PLANT'] = 'Watering the plants...',
      ['COLLECT_PLANT_LABEL'] = 'Pick up Plant',
      ['COLLECT_PLANT'] = 'Harvesting Plant...',
      ['COLLECT_MILK_LABEL'] = 'Collect Milk',
      ['COLLECT_MILK'] = 'Collecting Milk...',
      ['COW_FAIL_MILK'] = 'You crippled the cow teats. The cow is furious and turned down the milk bucket.',
      ['CHEESE_PRODUCE_LABEL'] = 'Produce Cheese',
      ['PRODUCE_CHEESE'] = 'Producing Cheese...',
      ['NO_MILK'] = 'You have not enough milk to produce cheese.',
      ['SUCCESS_CHEESE'] = 'Great News, you produce Cheese!',
      ['TREE_FRUITS_LABEL'] = 'Pick up Fruit',
      ['TREE_FRUITS_NUTRITION_LABEL'] = 'Fertilize Tree',
      ['TREE_FRUITS_NUTRITION'] = 'Fertilizing Tree...',
      ['NO_NUTRITION'] = 'You have no nutrition for the Tree.',
      ['COLLECT_FRUIT_NO_TIME'] = 'Come later. The fruit is not good to pick up...',
      ['COLLECT_FRUIT'] = 'Collecting fruit...',
      ['NEW_FRUIT_SUCCESS'] = 'Nice job, the fruit smells good.',
      ['EGGS_LABEL'] = 'Pick up Eggs',
      ['GET_EGGS'] = 'Fedding the chickens...',
      ['NO_FOOD_CHICKEN'] = 'You need to feed the chickens with corn.',
      ['NEW_EGGS_SUCCESS'] = 'You receive fresh eggs',
      ['EGGS_NO_TIME'] = 'Come back later. The chickens need to rest.',
      ['COLLECT_MUSHROOM_LABEL'] = 'Pick up Mushroom',
      ['NEW_MUSHROOM_SUCCESS'] = 'You pick up the Mushroom',
      ['COLLECT_MUSHROOM'] = 'Collecting mushroom',
      ['OPEN_STORE_LABEL'] = 'Open Store',
      ['MARKET_ITEMS_MENU_HEADER'] = '🌱 Farmer Store',
      ['MARKET_ITEMS_BUY_MENU_HEADER'] = '💳 Buy Products',
      ['MARKET_ITEMS_BUY_MENU_DESCRIPTION'] = 'Buy fresh food from the Farmer Store',
      ['MARKET_ITEMS_SELL_MENU_HEADER'] = '🚚 Sell Products',
      ['MARKET_ITEMS_SELL_MENU_DESCRIPTION'] = 'Sell fresh products to the Farmer Store',
      ['CLOSE_MENU_HEADER'] = '⬅ Close',
      ['MARKET_ITEMS'] = 'Store Qty: %d Unit price: %d',
      ['MARKET_ITEMS_HEADER'] = 'Item %s',
      ['MARKET_ITEMS_SUBHEADER_SELL'] = 'Sell',
      ['MARKET_ITEMS_SUBHEADER_BUY'] = 'Buy',
      ['MARKET_ITEMS_INPUT_TEXT'] = 'Quantity',
      ['MARKET_ITEMS_INPUT_ERROR'] = 'Number of quantity invalid',
      ['INVALID_QTY_SELL'] = 'You have no quantity to sell.',
      ['MARKET_SELL_SUCCESS'] = 'Thank you. See you soon...',
      ['INVALID_QTY_BUY'] = 'We dont have the quantity that you want.',
      ['NO_CASH'] = 'You have no money...',
      ['MARKET_BUY_SUCCESS'] = 'Good choose, come back often.',
      ['NO_SPACE'] = 'You have no space in inventory.',
      ['GRAPE_LABEL'] = 'Cut Grapes',
      ['COLLECT_GRAPE'] = 'Cutting grapes...',
      ['GRAPE_NO_TIME'] = 'Come back later. The grapes are growing.',
      ['NEW_GRAPE_SUCCESS'] = 'You receive a new grape.',
      ['PROCESS_WINE_LABEL'] = 'Tread Grapes',
      ['PROCESS_GRAPE'] = 'Treading grapes...',
      ['NO_GRAPES'] = 'No grapes with you.',
      ['NEW_JUICE_GRAPE_SUCCESS'] = 'Smells good, you have a new grade juice.',
      ['PRODUCE_WINE_LABEL'] = 'Produce Wine',
      ['PRODUCE_WINE'] = 'Producing wine...',
      ['NO_GRAPES_JUICE'] = 'No grape juice with you.',
      ['NEW_WINE_SUCCESS'] = 'Very good the Farmer Wine.',
      ['RENT_HAY_TRACTOR_LABEL'] = 'Hay Traillor Keys',
      ['HAY_DEPOSIT_LABEL'] = 'Deposit Hay',
      ['HAY_WITHDRAW_LABEL'] = 'Withdraw Hay',
      ['GRAB_HAY_LABEL'] = 'Grab Hay',
      ['GRAB_HAY'] = 'Picking up the hay...',
      ['DEPOSIT_HAY'] = 'Delivering hay...',
      ['HAY_MISSION_START'] = 'I need many Hay. I pay you, if you collect Hay for my animals. Hurry up the time is couting.',
      ['HAY_MISSION_DELIVERY'] = 'The trailer is full. Follow the way point to delivery the hay.',
      ['TIME_DELIVERY_HAY_LABEL'] = 'Time to deliver: %d , Nº Hay: %d / %d',
      ['TIMEOUT_DELIVERY_HAY_LABEL'] = 'Very slow, delivery the trailer and try again.',
      ['MISSION_HAY_SUCCESS'] = 'Great, the trailor is mine but you receive your reward.',
    },
    ['PT'] = {
      ['NEW_LEVEL_REP'] = 'Aumentaste a reputação de traficante. Estás nivel %d',
      ['RENT_TRACTOR_LABEL'] = 'Chaves do Tractor',
      ['RENT_TRACTOR_DEL_LABEL'] = 'Entregar Tractor',
      ['RENT_TRACTOR_INVALID'] = 'Não é o meu Tractor.',
      ['COLLECT_PLANTS'] = 'Tens de limpar e fertalizar o terreno',
      ['START_COLLECT_PLANTS'] = 'Use o trator para fertilizar e limpar o campo de plantação...',
      ['OPEN_WATER_PLANTS'] = 'O terreno está fertalizado e limpo. Podes plantar as tuas sementes.',
      ['NO_SEED_SPACE'] = 'Tens outra semente perto.',
      ['SEED_OUT_FIELD'] = 'Não podes plantar fora da plantação',
      ['SEED_PLANT'] = 'A plantar a semente...',
      ['BUY_SEEDS_LABEL'] = 'Comprar sementes',
      ['NO_MONEY'] = 'Não tens dinheiro.',
      ['BUY_SEED_PLANT'] = 'A comprar sementes...',
      ['NO_CLEAN_FIELD'] = 'Terreno não está limpo e fertilizado',
      ['SEED_PLANTED_SUCCESS'] = 'Bom trabalho, uma nova planta vai nascer aqui.',
      ['WATER_SEED_LABEL'] = 'Ligar a Rega',
      ['WATER_SEED_PLANT'] = 'A regar as plantas...',
      ['COLLECT_PLANT_LABEL'] = 'Apanhar Planta',
      ['COLLECT_PLANT'] = 'A apanhar planta...',
      ['COLLECT_MILK_LABEL'] = 'Tirar Leite',
      ['COLLECT_MILK'] = 'A tirar leite...',
      ['COW_FAIL_MILK'] = 'Aleijaste as tetinhas da vava. A vaca está furiosa e virou o balde de leite.',
      ['CHEESE_PRODUCE_LABEL'] = 'Produzir Queijo',
      ['PRODUCE_CHEESE'] = 'A produzir Queijo...',
      ['NO_MILK'] = 'Não tens leite suficiente para produzir queijo.',
      ['SUCCESS_CHEESE'] = 'Boa, produziste Queijo!',
      ['TREE_FRUITS_LABEL'] = 'Apanhar Fruta',
      ['TREE_FRUITS_NUTRITION_LABEL'] = 'Adubar Arvore',
      ['TREE_FRUITS_NUTRITION'] = 'A adubar a Arvore...',
      ['NO_NUTRITION'] = 'Não tens nutrição para a Arvore.',
      ['COLLECT_FRUIT_NO_TIME'] = 'Volta mais tarde. A fruta não está boa para apanhar...',
      ['COLLECT_FRUIT'] = 'A apanhar fruta...',
      ['NEW_FRUIT_SUCCESS'] = 'Bom trabalho, a fruta cheira bem.',
      ['EGGS_LABEL'] = 'Apanhar Ovos',
      ['GET_EGGS'] = 'A alimentar as galinhas...',
      ['NO_FOOD_CHICKEN'] = 'Tens de alimentar as galinhas com milho.',
      ['NEW_EGGS_SUCCESS'] = 'Recebeste ovos fresquinhos',
      ['EGGS_NO_TIME'] = 'Volta mais tarde. As galinhas precisam de descansar.',
      ['COLLECT_MUSHROOM_LABEL'] = 'Apanhar Cogumelo',
      ['NEW_MUSHROOM_SUCCESS'] = 'Apanhaste o Cogumelo',
      ['COLLECT_MUSHROOM'] = 'A apanhar o cogumelo',
      ['OPEN_STORE_LABEL'] = 'Abrir a Loja',
      ['MARKET_ITEMS_MENU_HEADER'] = 'Loja do Agricultor',
      ['MARKET_ITEMS_BUY_MENU_HEADER'] = 'Comprar Produtos',
      ['MARKET_ITEMS_BUY_MENU_DESCRIPTION'] = 'Compra comida fresca da Loja do Agricultor',
      ['MARKET_ITEMS_SELL_MENU_HEADER'] = 'Vender Produtos',
      ['MARKET_ITEMS_SELL_MENU_DESCRIPTION'] = 'Vender produtos frescos à Loja do Agricultor',
      ['CLOSE_MENU_HEADER'] = '⬅ Sair',
      ['MARKET_ITEMS'] = 'Quantidade no loja: %d Preço unidade: %d',
      ['MARKET_ITEMS_HEADER'] = 'Item %s',
      ['MARKET_ITEMS_SUBHEADER_SELL'] = 'Vender',
      ['MARKET_ITEMS_SUBHEADER_BUY'] = 'Comprar',
      ['MARKET_ITEMS_INPUT_TEXT'] = 'Quantidade',
      ['MARKET_ITEMS_INPUT_ERROR'] = 'Número de quantidade inválido',
      ['INVALID_QTY_SELL'] = 'Não tens a quantidade que queres vender.',
      ['MARKET_SELL_SUCCESS'] = 'Obrigado. Volta sempre...',
      ['INVALID_QTY_BUY'] = 'Queres comprar uma quantidade que não temos.',
      ['NO_CASH'] = 'Não tens dinheiro. Se me voltas a tentar enganar vais ver...',
      ['MARKET_BUY_SUCCESS'] = 'Boa compra, volta sempre.',
      ['NO_SPACE'] = 'Tu não consegues carregar tanta mercadoria',
      ['GRAPE_LABEL'] = 'Cortar Uvas',
      ['COLLECT_GRAPE'] = 'A cortar uvas...',
      ['GRAPE_NO_TIME'] = 'Volta mais tarde. As uvas estão a crescer.',
      ['NEW_GRAPE_SUCCESS'] = 'Recebeste uma uva.',
      ['PROCESS_WINE_LABEL'] = 'Pisar Uvas',
      ['PROCESS_GRAPE'] = 'A pisar uvas...',
      ['NO_GRAPES'] = 'Não tens uvas contigo.',
      ['NEW_JUICE_GRAPE_SUCCESS'] = 'Cheira bem, tens ai uma nova pomada.',
      ['PRODUCE_WINE_LABEL'] = 'Produzir Vinho',
      ['PRODUCE_WINE'] = 'A produzir vinho...',
      ['NO_GRAPES_JUICE'] = 'Não tens mosto de uva contigo.',
      ['NEW_WINE_SUCCESS'] = 'Muito bom o vinho do Agricultor.',
      ['RENT_HAY_TRACTOR_LABEL'] = 'Trailer do Feno',
      ['HAY_DEPOSIT_LABEL'] = 'Depositar Feno',
      ['HAY_WITHDRAW_LABEL'] = 'Retirar Feno',
      ['GRAB_HAY_LABEL'] = 'Pegar no Feno',
      ['GRAB_HAY'] = 'A apanhar o feno...',
      ['DEPOSIT_HAY'] = 'A depositar o feno...',
      ['HAY_MISSION_START'] = 'Preciso de Feno. Eu pago se apanhares feno para os meus animais. Despacha-te o tempo está a contar.',
      ['HAY_MISSION_DELIVERY'] = 'O trailer está cheio. Segue o ponto no gps para entregar o feno.',
      ['TIME_DELIVERY_HAY_LABEL'] = 'Tempo de entrega: %d , Nº Feno: %d / %d',
      ['TIMEOUT_DELIVERY_HAY_LABEL'] = 'Muito lento, entrega o trailer e tenta novamente.',
      ['MISSION_HAY_SUCCESS'] = 'Boa, o trailer é meu mas tu recebes o teu prémio.',
    },
}

RegisterNetEvent('qp-farmer:sendNotification', function(msg, typeMsg, timer) --typeMsg possible results-> 'primary', 'error', 'success'
  if ConfigFarmer.Framework == 'esx' then
    TriggerEvent('esx:showNotification', msg)
  elseif ConfigFarmer.Framework == 'qbcore' then
    TriggerEvent('QBCore:Notify',msg, typeMsg, timer)
  end
end)

function DrawText3D(x, y, z, text)
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

function drawTxt(text,font,x,y,scale,r,g,b,a)
	SetTextFont(font)
	SetTextScale(scale,scale)
	SetTextColour(r,g,b,a)
	SetTextOutline()
	SetTextCentre(1)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x,y)
end