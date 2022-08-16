fx_version 'cerulean'
game 'gta5'
description 'Drug system by Vulegg#5757'
Author 'Vulegg#5757'

server_scripts {
    '__drug/sv.lua'
}

client_scripts {
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/CircleZone.lua',
    '__drug/cl.lua',
    'config.lua'
}

lua54        'yes'
shared_scripts {
    '@ox_lib/init.lua'
}

dependencies {
    'es_extended',
    'ox_inventory',
    'ox_lib',
    'qtarget',
    'PolyZone'
}