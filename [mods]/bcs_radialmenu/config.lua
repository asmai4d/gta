Config = {}

Config.Framework = 'ESX' -- ESX/QB/Standalone

--[[
    Things to note
    Label must be unique!
    Event, shouldclose, and client must exist if there is not submenu property
    args is optional
]]
local container = 120

Config.UI = {
    -- Everything is in px
    Size = {
        BUTTON_SIZE = 56,
        ITEM_SIZE = 48,
        CONTAINER_SIZE = container,
        RADIUS = container / 2,
        ICON_SIZE = 20
    },
    -- Colors must be a string
    Colors = {
        PRIMARY = '#00b4d8',
        PRIMARY_2 = '#0096c7',
        BORDER = '#dadada',
        TEXT = '#656565',
    }
}

Config.Open = {
    key = 'f4',
    commandonly = false, -- if this is true then it opens with command
    command = 'radialmenu'
}

Config.RadialMenu = {
    {
        label="Open Phone",
        event="Phone:radialOpen",
        shouldClose=true,
        icon="MdPhoneIphone",
        client=true
    },
    {
        label="Персонаж",
        icon="MdPerson",
        submenu= {
            {
                label="Гражданство",
                event="oakyIdentity:client:sendIdentity",
                shouldClose=true,
                icon="MdAccountBox",
                client=true
            },
            {
                label="Лицензия водителя",
                event="oakyIdentity:client:sendLicense",
                shouldClose=true,
                icon="MdAccountBox",
                client=true
            },
            {
                label="Лицензия оружия",
                event="oakyIdentity:client:sendWeapon",
                shouldClose=true,
                icon="MdAccountBox",
                client=true
            },
        }
    },
    {
        label="Open Clothes Menu",
        icon="MdSettingsAccessibility",
        submenu= {
            {
                label="Example 1",
                event="Example:event",
                shouldClose=true,
                icon="MdAccountBox",
                client=true
            },
            {
                label="Example 2",
                event="Example:event",
                shouldClose=true,
                icon="MdAccountBox",
                client=true
            },
            {
                label="Example 3",
                event="Example:event",
                shouldClose=true,
                icon="MdAccountBox",
                client=true
            },
        }
    },
}

Config.JobOption = {
    label = 'Job Menu',
    icon = 'MdWork',
}

Config.JobMenu = {
    ambulance = {
        {
            label="Stretcher Menu",
            icon="MdHotel",
            submenu= {
                {
                    label="Spawn Stretcher",
                    event="stretcher:spawn",
                    shouldClose=true,
                    icon="MdHotel",
                    client=true
                },
                {
                    label="Push Stretcher",
                    event="stretcher:push",
                    shouldClose=true,
                    icon="MdDirectionsWalk",
                    client=true
                },
                {
                    label="Delete Stretcher",
                    event="stretcher:delete",
                    shouldClose=true,
                    icon="MdClose",
                    client=true
                },
                {
                    label="Get Stretcher inside/out",
                    event="stretcher:toggleToCar",
                    shouldClose=true,
                    icon="MdLocalShipping",
                    client=true
                },
                {
                    label="Put/Pick patient to stretcher",
                    event="stretcher:togglePatient",
                    shouldClose=true,
                    icon="MdMedicalServices",
                    client=true
                },
            }
        },
        {
            label = "Revive Citizen",
            icon='MdMedicalServices',
            shouldClose = true,
            event="medic:revivePlayer",
            client= true
        },
        {
            label = "Bandage Citizen",
            icon='MdMedicalServices',
            shouldClose = true,
            event="medic:bandagePlayer",
            client= true
        }
    },
    police = {
        {
            label="Example 1",
            event="Example:event",
            shouldClose=true,
            icon="MdAccountBox",
            client=true
        },
        {
            label="Example 2",
            event="Example:event",
            shouldClose=true,
            icon="MdAccountBox",
            client=true
        },
        {
            label="Example 3",
            event="Example:event",
            shouldClose=true,
            icon="MdAccountBox",
            client=true
        },
    }
}