resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'Crafting Table 1.11'

files {
	'html/menu.html',
	'html/css/style.css',
	'html/css/scotty.css',
	'html/js/script.js',
	'html/js/scotty.js',
	'html/js/jquery-3.1.0.min.js',
	-- ICONS 
  'html/images/items/diamond.png',
  'html/images/items/rubber_band.png',
  'html/images/items/rubber_pack.png',
  'html/images/items/steel.png',
  'html/images/items/cigarett.png',
  'html/images/items/zabzeed.png',
  'html/images/items/weed_pooch.png',
  'html/images/items/weed.png',
  'html/images/items/honey_a.png',
  'html/images/items/bobbypin.png',
  'html/images/items/coke.png',
  'html/images/items/coke_pooch.png',
  'html/images/items/meth_pooch.png',
  'html/images/items/marijuana_cigarette.png',
  'html/images/items/gold.png',
  'html/images/items/iron.png',
  'html/images/items/fixkit.png',
  'html/images/items/leather.png',
  'html/images/items/steel.png',
  'html/images/items/WEAPON_SWITCHBLADE.png',
  'html/images/items/toolskit.png',
  'html/images/items/WEAPON_KNIFE.png',
  'html/images/items/parts1.png',
  'html/images/items/parts2.png',
  'html/images/items/parts3.png',
  'html/images/items/parts4.png',
  'html/images/items/parts5.png',
  'html/images/items/pro_wood.png',
  'html/images/items/WEAPON_SMG.png',
  'html/images/items/SteelScrap.png',
  'html/images/items/wood.png',
}

ui_page {
	'html/menu.html'
}

client_scripts {
  'config.lua',
	'client.lua',
}

server_scripts {
	'config.lua',
	'config_sv.lua',
	'server.lua'
}