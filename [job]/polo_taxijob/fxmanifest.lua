fx_version 'adamant'

game 'gta5'

description 'ESX Taxi Job'

version '1.0.2'

client_scripts {
	'@es_extended/locale.lua',
	'locales/ru.lua',
	'locales/en.lua',
	'locales/fr.lua',
	'config.lua',
	'client/main.lua'
}

server_scripts {
	'@es_extended/locale.lua',
	'locales/ru.lua',
	'locales/en.lua',
	'locales/fr.lua',
	'config.lua',
	'server/main.lua'
}

dependency 'es_extended'
