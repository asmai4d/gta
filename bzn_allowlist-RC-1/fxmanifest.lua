fx_version   'cerulean'
lua54        'yes'
game         'gta5'

name         'bzn_allowlist'
author       'BenZoN'
version      '1.0.0'
repository   'https://github.com/benzon/bzn_allowlist'
description  'Cleanup of my old drp_whitelist script, extra functions optimized code (With time you learn new tricks)'

dependencies {
	'es_extended'
}

shared_scripts { 
	'@es_extended/imports.lua'
}

server_scripts {
    --'@mysql-async/lib/MySQL.lua',
    '@oxmysql/lib/MySQL.lua',
    'locale.lua',
    'locales/*.lua',
    'config.lua',
    'server/utils.lua',
    'server/main.lua'
}
