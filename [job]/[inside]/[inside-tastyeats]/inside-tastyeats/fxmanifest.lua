fx_version 'cerulean'

game 'gta5'

client_scripts {
    'config.lua',
    'client.lua'
}

server_scripts {
    '@async/async.lua',
	'@oxmysql/lib/MySQL.lua',
    'config.lua',
    'server.lua'
}

dependencies {
	'oxmysql',
}
