fx_version "cerulean"
game "gta5"
version "1.0.0"

shared_script "config/*.lua"
client_script {
    "client/**.lua"
}
server_script {
    "@mysql-async/lib/MySQL.lua",
    "@oxmysql/lib/MySQL.lua",
    "server/*.lua",
}
