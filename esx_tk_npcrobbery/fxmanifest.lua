fx_version 'cerulean'

game 'gta5'

description 'ESX NPC Robbery'

author 'TuKeh_'

version '1.1.1'

lua54 'yes'

client_scripts {
    '@es_extended/locale.lua',
    'config.lua',
    'locales/*.lua',
    'client/main.lua',
} 

server_scripts {
    '@es_extended/locale.lua',
    'locales/*.lua',
    'config.lua',
    'server/main.lua',
}

escrow_ignore {
    'locales/*.lua',
    'config.lua',
    'client/main.lua',
    'server/main.lua',
}

dependencies {
    'es_extended'
}

dependency '/assetpacks'