/area/dungeon/
	area_identifier = "Mission"
	dynamic_lighting = TRUE

/area/dungeon/z_00
	name = "第0层－上方地表"
	icon_state = "red"

	interior = TRUE //Well not really but still.

	flags_area = FLAG_AREA_NO_TELEPORT | FLAG_AREA_NO_CONSTRUCTION | FLAG_AREA_NO_EVENTS

/area/dungeon/z_01
	name = "未探索的地表森林"
	icon_state = "forrest"
	cheese_type = /reagent/nutrition/cheese/cheddar
	sunlight_freq = 8
	sunlight_color = "#CCB06A"

	tracks = TRACKS_FOREST

	interior = FALSE

/area/dungeon/z_01/snow
	name = "未探索的地表雪林"
	icon_state = "snow"
	weather = WEATHER_SNOW
	ambient_temperature = T0C - 20
	hazard = "cold"
	sunlight_freq = 8
	sunlight_color = "#898989"

	cheese_type = /reagent/nutrition/cheese/raclette

	tracks = TRACKS_MOUNTAIN

	sound_environment = ENVIRONMENT_PLAIN

	interior = FALSE

/area/dungeon/z_01/snow/interior
	name = "未探索的地表洞穴"
	sunlight_freq = 0
	interior = TRUE

/area/dungeon/z_01/forest
	name = "未探索的地表森林"
	icon_state = "forrest"
	cheese_type = /reagent/nutrition/cheese/cheddar
	sunlight_freq = 8
	sunlight_color = "#CCB06A"

	tracks = TRACKS_FOREST

	interior = FALSE

/area/dungeon/z_01/forest/interior
	name = "未探索的地表洞穴"
	sunlight_freq = 0
	interior = TRUE


/area/dungeon/z_02
	name = "未探索的深层丛林"
	icon_state = "jungle"
	ambient_temperature = T0C + 40

	cheese_type = /reagent/nutrition/cheese/brabander

	random_sounds = list(
		'sound/ambient/ambiruin_1.ogg',
		'sound/ambient/ambiruin_2.ogg',
		'sound/ambient/ambiruin_3.ogg',
		'sound/ambient/ambiruin_4.ogg',
		'sound/ambient/ambiruin_5.ogg',
		'sound/ambient/ambiruin_6.ogg',
		'sound/ambient/ambiruin_7.ogg',
	)

	tracks = TRACKS_JUNGLE

	interior = TRUE

/area/dungeon/z_03
	name = "未探索的深层熔岩洞穴"
	icon_state = "lava_cave"

	sunlight_freq = 8
	sunlight_color ="#7F3B11"

	random_sounds = list(
		'sound/ambient/lavacaves_1.ogg',
		'sound/ambient/lavacaves_2.ogg',
	)

	tracks = TRACKS_LAVA

	cheese_type = /reagent/nutrition/cheese/guava

	interior = FALSE
