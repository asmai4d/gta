fx_version 'cerulean'
game 'gta5'

shared_script 'config.lua'
client_script 'client/client.lua'
server_script 'server/server.lua'

files {
    'html/*.*',
    'html/**/*.*',
    'html/**/**/*.*'
}

ui_page 'html/index.html'

lua54 'yes'

escrow_ignore {
    'config.lua'
}
dependency '/assetpacks'