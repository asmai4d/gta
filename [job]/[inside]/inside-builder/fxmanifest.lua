fx_version 'cerulean'

game 'gta5'

server_scripts {
	'@async/async.lua',
	'@oxmysql/lib/MySQL.lua',
	'config.lua',
	'server/server.lua'
}

client_scripts {
	'config.lua',
	'client/client.lua'
}

dependencies {
	'oxmysql',
}