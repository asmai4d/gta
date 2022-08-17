fx_version 'cerulean'
game 'gta5'

author 'matthias187@bdev'

files {
    'html/*.*',
    'html/**/*.*',
    'html/**/**/*.*',
    'html/**/**/**/*.*'
}

ui_page 'html/index.html'

shared_script 'config.lua'
client_script 'client.lua'
server_script 'server.lua'

lua54 'yes'
escrow_ignore {
    'config.lua'
}