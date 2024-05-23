fx_version 'cerulean'
games { 'gta5' }

author 'Noneya Business'
description 'A Vehicle Sabotage System Allowing Players To Cut Break Lines'
version '1.0.0'

client_scripts {
    'client/*.lua',
}

server_scripts {
    'server/*.lua',
    '@oxmysql/lib/MySQL.lua',
}

shared_scripts {
    'config.lua',
}