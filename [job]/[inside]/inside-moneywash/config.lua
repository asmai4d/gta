Keys = {
    ['ESC'] = 322, ['F1'] = 288, ['F2'] = 289, ['F3'] = 170, ['F5'] = 166, ['F6'] = 167, ['F7'] = 168, ['F8'] = 169, ['F9'] = 56, ['F10'] = 57,
    ['~'] = 243, ['1'] = 157, ['2'] = 158, ['3'] = 160, ['4'] = 164, ['5'] = 165, ['6'] = 159, ['7'] = 161, ['8'] = 162, ['9'] = 163, ['-'] = 84, ['='] = 83, ['BACKSPACE'] = 177,
    ['TAB'] = 37, ['Q'] = 44, ['W'] = 32, ['E'] = 38, ['R'] = 45, ['T'] = 245, ['Y'] = 246, ['U'] = 303, ['P'] = 199, ['['] = 39, [']'] = 40, ['ENTER'] = 18,
    ['CAPS'] = 137, ['A'] = 34, ['S'] = 8, ['D'] = 9, ['F'] = 23, ['G'] = 47, ['H'] = 74, ['K'] = 311, ['L'] = 182,
    ['LEFTSHIFT'] = 21, ['Z'] = 20, ['X'] = 73, ['C'] = 26, ['V'] = 0, ['B'] = 29, ['N'] = 249, ['M'] = 244, [','] = 82, ['.'] = 81,
    ['LEFTCTRL'] = 36, ['LEFTALT'] = 19, ['SPACE'] = 22, ['RIGHTCTRL'] = 70,
    ['HOME'] = 213, ['PAGEUP'] = 10, ['PAGEDOWN'] = 11, ['DEL'] = 178,
    ['LEFT'] = 174, ['RIGHT'] = 175, ['TOP'] = 27, ['DOWN'] = 173,
}

icfg = {}
icfg.Timer = 300
icfg.LaundryMaxMoneyWash = 5000
icfg.LaundryMinMoneyWash = 2500
icfg.MaxWashingTime = 600
icfg.MinWashingTime = 300
icfg.WashingTax = 0.75
icfg.DropWorkPermitChance = 85

icfg.LaundryPlaces = {
    Laundry1 = {
        Pos = {x = 1136.36, y = -992.11, z = 46.11},
    },
    Laundry2 = {
        Pos = {x = 1136.18, y = -990.78, z = 46.11},
    },
    Laundry3 = {
        Pos = {x = 1136.00, y = -989.45, z = 46.11},
    },
    Laundry4 = {
        Pos = {x = 1135.74, y = -988.12, z = 46.11},
    },
}

icfg.MaxDrivers = 5
icfg.DepositPrice = 2000
icfg.LaundererMaxMoneyWash = 5000
icfg.LaundererMinMoneyWash = 2500
icfg.AutoRepairsVehicle = "minivan"
icfg.LaundererPlaces = {
    Base = {
        Pos = {x = 1130.31, y = -776.86, z = 57.61},
    },
    Garage = {
        BlipLabel = "Авторемонтный гараж",
        BlipColor = 75,
        BlipScale = 0.6,
        BlipType = 569,
        ChoosePos = {x = 1135.03, y = -789.32, z = 57.60},
        ReturnVehicle = {x = 1139.89, y = -792.37, z = 57.60},
        SpawnPoint1 = {x = 1140.60, y = -797.31, z = 57.34, h = 357.53},
        SpawnPoint2 = {x = 1137.52, y = -797.24, z = 57.34, h = 357.53},
        SpawnPoint3 = {x = 1132.43, y = -797.69, z = 57.33, h = 357.53},
    },
}

icfg.LocationBlip = {
    BlipLabel = "Место доставки черных денег",
    BlipColor = 0,
    BlipType = 1,
    BlipScale = 0.6,
}

icfg.DeliveryPlace = {
    [1] = {x = -237.17, y = -1597.70, z = 33.72, blip},
    [2] = {x = -4.28, y = -1484.35, z = 30.00, blip},
    [3] = {x = 108.33, y = -1565.79, z = 29.35, blip},
    [4] = {x = 257.84, y = -1775.86, z = 28.27, blip},
    [5] = {x = 318.03, y = -1002.99, z = 29.05, blip},
    [6] = {x = -1319.90, y = -243.41, z = 42.23, blip},
    [7] = {x = 1829.76, y = 3859.85, z = 33.39, blip},
    [8] = {x = 1896.30, y = 3889.19, z = 32.60, blip},
    [9] = {x = 477.75, y = 3553.98, z = 32.99, blip},
    [10] = {x = 348.50, y = 3392.68, z = 36.15, blip},
    [11] = {x = 169.20, y = 3042.01, z = 42.82, blip},
    [12] = {x = -393.37, y = 6087.13, z = 31.25, blip},
    [13] = {x = -356.11, y = 6068.25, z = 31.25, blip},
    [14] = {x = -173.68, y = 6315.56, z = 31.06, blip},
    [15] = {x = -314.82, y = 6311.92, z = 32.11, blip},
    [16] = {x = 55.26, y = 6668.12, z = 31.68, blip},
    [17] = {x = 1463.08, y = 6548.35, z = 14.06, blip},
    [18] = {x = 1012.98, y = -1842.77, z = 31.25, blip},
    [19] = {x = 974.92, y = -1711.03, z = 29.92, blip},
    [20] = {x = 974.52, y = -1460.16, z = 31.02, blip},
}