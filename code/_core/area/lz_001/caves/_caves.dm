/area/lz_001/caves
	name = "未探索洞穴"
	icon_state = "cave"
	tracks = TRACKS_CAVE
	random_sounds = list(
		'sound/ambient/cave_1.ogg',
		'sound/ambient/cave_2.ogg',
	)
	cheese_type = /reagent/nutrition/cheese/gruyere

	interior = TRUE

	sound_environment = ENVIRONMENT_QUARRY

/area/lz_001/caves/lava
	name = "岩浆洞穴"
	icon_state = "lava_cave"

	//sunlight_power = 1
	sunlight_freq = 8
	sunlight_color ="#7F3B11"

	random_sounds = list(
		'sound/ambient/lavacaves_1.ogg',
		'sound/ambient/lavacaves_2.ogg',
	)

	tracks = TRACKS_LAVA

	cheese_type = /reagent/nutrition/cheese/guava


/area/lz_001/caves/lava/brighter
	name = "岩浆洞穴地狱厅"
	icon_state = "volcanic"
	weather = WEATHER_VOLCANIC
	ambient_temperature = T0C + 80

	desired_light_range = 8
	desired_light_power = 1

	sunlight_color ="#A8663F"


/area/lz_001/caves/crab
	name = "蟹王巢穴"
	icon_state = "king_crab"

	tracks = null

/area/lz_001/caves/ocean_pass
	name = "海洋通道"
	icon_state = "ocean_pass"

	tracks = null

/area/lz_001/caves/diamond_cave
	name = "钻石洞穴"
	icon_state = "diamond_cave"

	tracks = null

/area/lz_001/caves/glow_cave
	name = "荧光菇洞穴"
	icon_state = "glow_cave"

	tracks = null

	cheese_type = /reagent/nutrition/cheese/oasis

/area/lz_001/caves/desert_cave
	name = "沙漠掠夺者洞穴"
	icon_state = "desert_cave"

	tracks = null

	cheese_type = /reagent/nutrition/cheese/kadchgall

/area/lz_001/caves/desert_oasis
	name = "沙漠掠夺者绿洲"
	icon_state = "glow_cave"

	tracks = null

	cheese_type = /reagent/nutrition/cheese/oasis

/area/lz_001/caves/east_ocean
	name = "东部海洋"
	icon_state = "lagoon"

	sunlight_freq = 8
	sunlight_color ="#8CB08F"

	tracks = null

	cheese_type = /reagent/nutrition/cheese/oasis

/area/lz_001/caves/lagoon
	name = "海盗潟湖"
	icon_state = "lagoon"

	sunlight_freq = 8
	sunlight_color ="#8CB08F"

	tracks = null

	cheese_type = /reagent/nutrition/cheese/oasis

/area/lz_001/caves/lagoon/ship
	name = "套套船长的船"
	icon_state = "ship"

	sunlight_freq = 8
	sunlight_color ="#8CB08F"

	tracks = null

/area/lz_001/caves/knight/
	name = "骑士登陆地"
	icon_state = "day"

	sunlight_freq = 8
	sunlight_color ="#AEB05D"

	tracks = null

/area/lz_001/caves/knight/cave
	name = "骑士登陆地洞穴"
	icon_state = "knight"

	tracks = null

/area/lz_001/caves/hive
	name = "异形巢穴"
	icon_state = "hive"

	tracks = null
