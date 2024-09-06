fx_version 'cerulean'
game 'gta5'

description 'Water Refill System'

shared_scripts {
  '@ox_lib/init.lua',
  'config.lua'
}


client_scripts { 
  "client/*.lua"
}

server_scripts { 
  "server/*.lua"
}


lua54 'yes'
use_fxv2_oal 'yes'