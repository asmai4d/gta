BDEV = {
    ESXEvent = "esx:getSharedObject",
    Accounts = {
        bank = "bank",
        money = "money" -- (unused as of now)
    },
    Locales = {
        clothingShop = "Магазин одежды",
        pressToEnter = "Нажмите ~INPUT_PICKUP~ чтобы попасть в магазин одежды.",
        bought = "вы совершили покупку на сумму %s$",
        notEnoughMoney = "Вы не можете позволить себе такую покупку.",
        outfitSaved = "Экипировка успешно сохранена.",
        outfitDeleted = "Экипировка успешно удалена.",
        changeClothing = "Выберите одежду.",
        removeOutfit = "Снять наряд.",
        changeOutfit = "Измените свой наряд.",
        outfits = "Наряды",
        nameOfOutfit = "Название нарядов",
        yes = "Да",
        no = "Нет",
        saveOutfit = "Вы хотите сохранить наряд?"
    },
    Blip = {
        Number = 73,
        Color = 0,
        Size = 0.8
    },
    Color = {215, 66, 245, 100}, -- for the Markers
    Marker = {
        type = 27,
        size = {1.0, 1.0, 1.0}, -- x , y, z
    },
    LabelOverride = {
        ["helmet_1"] = {
            [5] = "Toller Helm."
        }
    },
    PriceOverride = {
        ["helmet_1"] = {
            [5] = 187187,
            [6] = 8966
        },
        ["pants_1"] = {
            [132] = 12356
        }
    },
    CategoryPrices = { -- List of all components used ordered by top to bottom.
        ["helmet_1"] = 1000,
        ["mask_1"] = 500,
        ["tshirt_1"] = 187,
        ["torso_1"] = 123,
        ["arms"] = 0,
        ["pants_1"] = 1111,
        ["shoes_1"] = 999
    },
    Notify = function(msg)
        ESX.ShowNotification(msg)
    end,
    Shops = {
        {
            pos = vector3(72.3, -1399.1, 28.4),
            heading = 0.0
        },
        {
            pos = vector3(-703.8, -152.3, 36.42),
            heading = 0.0
        },
        {
            pos = vector3(-167.9, -299, 38.75),
            heading = 0.0
        },
        {
            pos = vector3(428.7, -800.1, 28.5),
            heading = 90.1
        },
        {
            pos = vector3(-829.4, -1073.7, 10.35),
            heading = 0.0
        },
        {
            pos = vector3(-1447.8, -242.5, 48.85),
            heading = 0.0
        },
        {
            pos = vector3(11.6, 6514.2, 30.9),
            heading = 0.0
        },
        {
            pos = vector3(123.6, -219.4, 53.6),
            heading = 0.0
        },
        {
            pos = vector3(1696.3, 4829.3, 41.1),
            heading = 0.0
        },
        {
            pos = vector3(618.1, 2759.6, 41.1),
            heading = 0.0
        },
        {
            pos = vector3(1190.6, 2713.4, 37.25),
            heading = 0.0
        },
        {
            pos = vector3(-1193.4, -772.3, 16.35),
            heading = 0.0
        },
        {
            pos = vector3(-3172.5, 1048.1, 19.9),
            heading = 0.0
        },
        {
            pos = vector3(-1108.4, 2708.9, 18.13),
            heading = 0.0
        }
    }
}