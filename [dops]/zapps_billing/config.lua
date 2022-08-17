Config = {}
Config.Locale = 'ru'

--[[
    Key that opens the invoice menu. You can choose one from the list below:
    https://docs.fivem.net/docs/game-references/controls/
]]
Config.OpenMenuKey = 168 -- F7

--[[
    Normally, a user can only pay the invoices with the money they have in their BANK, not the cash they have in their inventory.
    If you want players to be able to pay using their cash as well, set this setting to true

    If this is set to true, the script will primarily take the cash the player has, and then the bank.
]]
Config.AllowPayFromCash = true

-- You may add as many societies as you like. Keep in mind that account needs to start with society_, as you name them in the addon_account database
Config.Societies = {
    {
        account = "society_police",
        jobs = {
            "police",
            "police"
        },
        name = "LSPD",
        logo = "https://s3-attachments.int-cdn.lcpdfrusercontent.com/monthly_2017_08/LSPD-Logo.png.00ce44da15343f5ad9237af817533d2f.png",
        boss = 1
    },
    {
        account = "society_ambulance",
        jobs = {
            "ambulance",
            "ambulance"
        },
        name = "EMS",
        logo = "http://www.rvcfire.org/stationsAndFunctions/AdminSppt/EMS/PublishingImages/paramedic-logo-simple-hi.png",
        boss = 1
    },
{
        account = "society_groove",
        jobs = {
            "groove",
            "groove"
        },
        name = "Механики",
        logo = "https://www.logolynx.com/images/logolynx/c2/c258d9654015c01dcee351d1392e0647.png",
        boss = 1
    }
}

--[[
    This is the maximum number of days someone can delay paying the invoice.
    If you set this to three, it'll take 3 days before the script will automatically auto-pay the invoice OR, if EnableInterest is set to true, start adding interest
    If you set this to -1, the system will never auto-pay.

    This setting is ignored if AllowedAuthorSetMaxDelay is set to true
]]
Config.MaxPayDelay = 3

--[[
    This option determines whether or not the person creating the invoice can select how many days someone will get to pay the invoice
]]
Config.AllowAuthorSetMaxDelay = true

--[[
    These settings only apply if AllowAuthorSetMaxDelay is set to true.
    These are the max and min values from between which the author can select a date.
]]

Config.AuthorMinDelay = 3
Config.AuthorMaxDelay = 10

--[[
    If this is set to true, the invoice will add an interest for every day that has passed after the MaxPayDelay date.
]]
Config.EnableInterest = true

--[[
    This is the amount of days that the interest will be added for INCLUDING the days without interest. After this amount of days, the invoice will be auto-paid
]]
Config.MaxInterestPayDelay = 7

--[[
    % interest to add each day that's passed during the interest period
]]
Config.DayInterest = 5

--[[
    This is the webhook to which invoice logs will be sent
]]
Config.Webhook = ""

--[[
    Since it can be difficult to understand the interest system, this is how it works:
    If we have Config.EnableInterest = true, then the interest system is enabled.
    This means that the script will behave as following:
        It will determine two dates:
            1. The date until which no interest will be added
            2. The date from which the interest will start adding

        This means that you could make it so that a player has 3 days to pay the invoice without having to cover
        any additional interest charges. However, if they take more than that, they'll have 7 more days to pay the invoice,
        but interest will start being added. This could mean that someone has 3 days to pay a $500 invoice, but if they take 7 days, the invoice
        could get all the way up to $5000 or more. This is configurable by the Config.DayInterest value. It's the amount of percentage that's added
        every time a new interest fee is added onto the total. For instance, it you set this to 5, it'll mean that every day AFTER date number 1,
        the fee will be upped by 5% OF THE ORIGINAL FEE. Previous interest's will not have any impact on this.
        If the player fails to pay the bill by date 2, it'll be auto-paid, meaning the amount (including interest fees) will be automatically drawn from his account.

    If however, you have set Config.EnableInterest = false, the only date applying will be one determined by Config.MaxPayDelay. If you set this to 3, the player will have
    3 days to pay the invoice. After those 3 days, the invoice will be auto-paid without any additional charges.

    If you have Config.EnableInterest = true, you may also allow players (whom have access to creating invoices) to select the amount of days for which no interest is added.
    This is decided by Config.AllowAuthorSetMaxDelay. If this is set to true, the script will behave so that while creating an invoice a user can select the amount of days.
    Otherwise, if this is false, the value from Config.MaxInterestPayDelay will be used instead.

    If you still struggle with this please feel free to open a ticket over at my Discord server: https://discord.gg/KDjcxnTSAd
    I'm always more than happy to help or explaing something further. All suggestions are more than welcome too.
]]