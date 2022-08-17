lua54 'yes'


fx_version 'cerulean'

game 'gta5'

client_scripts {
'@es_extended/locale.lua',
'locales/*.lua',
'config.lua',
'code/client.lua',
'code/blip.lua',
}

locker_file 'lockers.json'

server_scripts {
'@es_extended/locale.lua',
'locales/*.lua',
'@mysql-async/lib/MySQL.lua',
'config.lua',
'code/server.lua',
'code/saveinterval.lua',
}

ui_page 'html/ui.html'

files {
    'html/*.*',
    'html/js/*.*',
    'html/css/*.*',
    'html/img/*.*',
    'html/img/items/*.*'
}

escrow_ignore {
    'config.lua',
    'locales/*.*',
    'code/blip.lua',
    'code/saveinterval.lua'
}
dependency '/assetpacks'