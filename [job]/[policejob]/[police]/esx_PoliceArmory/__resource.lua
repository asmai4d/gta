--------------------------------
------- Created by Hamza -------
-------------------------------- 

resource_manifest_version "44febabe-d386-4d18-afbe-5e627f4af937"

description 'ESX Police Armory'

client_scripts {
    "config.lua",
    "client.lua"
}

server_scripts {
    "@oxmysql/lib/MySQL.lua",
    "config.lua",
    "server.lua"
}