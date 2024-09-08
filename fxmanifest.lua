fx_version 'cerulean'
game 'gta5'
use_experimental_fxv2_oal 'yes'
lua54 'yes'

author 'pf_scripts'
description 'Water Refill System'
repository 'https://github.com/PFScripts/pf_wrs'

shared_script '@ox_lib/init.lua'

client_scripts {'client/*.lua'}

server_scripts {'server/*.lua'}

ox_libs {'locale'}

files {'config/*.lua', 'locales/*.json'}