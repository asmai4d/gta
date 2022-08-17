resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'ESX Billing'

version '1.1.0'

server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'@es_extended/locale.lua',
	'locales/ru.lua',
	'config.lua',
	'server/main.lua'
}

client_scripts {
	'@es_extended/locale.lua',
	'locales/ru.lua',
	'config.lua',
	'client/main.lua'
}

ui_page 'html/billing.html'

files {
	'html/billing.html',
	'html/listener.js',
}

dependency 'es_extended'