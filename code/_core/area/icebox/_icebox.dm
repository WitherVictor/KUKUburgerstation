/area/box/
	name = "\improper B-0X"
	trackable = TRUE
	area_identifier = "Mission"

/area/box/exterior
	name = "\improper B-0X室外"
	icon_state = "snow"
	weather = WEATHER_SNOW
	ambient_temperature = T0C - 20
	hazard = "cold"
	sunlight_freq = 8
	sunlight_color = "#898989"

	cheese_type = /reagent/nutrition/cheese/raclette

	tracks = TRACKS_MOUNTAIN

	sound_environment = ENVIRONMENT_DIZZY

	interior = FALSE

/area/box/interior/
	interior = TRUE

/area/box/interior/caves
	name = "\improper 未探索的洞穴"
	icon_state = "cave"
	tracks = TRACKS_CAVE
	random_sounds = list(
		'sound/ambient/cave_1.ogg',
		'sound/ambient/cave_2.ogg',
	)
	cheese_type = /reagent/nutrition/cheese/gruyere

	sound_environment = ENVIRONMENT_QUARRY

/area/box/interior/syndicate_shuttle
	name = "\improper 未知飞船"
	icon_state = "syndicate"

	sound_environment = ENVIRONMENT_STONE_CORRIDOR

/area/box/interior/station
	name = "\improper B-0X空间站内部"
	icon_state = "ship"

	ambient_sound = 'sound/ambient/station_loop.ogg'
	random_sounds = list(
		'sound/ambient/station_1.ogg',
		'sound/ambient/station_2.ogg',
		'sound/ambient/station_3.ogg',
		'sound/ambient/station_4.ogg',
		'sound/ambient/station_5.ogg',
		'sound/ambient/station_6.ogg',
		'sound/ambient/station_7.ogg',
		'sound/ambient/station_8.ogg',
		'sound/ambient/station_9.ogg',
		'sound/ambient/station_10.ogg',
		'sound/ambient/station_11.ogg',
		'sound/ambient/station_12.ogg',
		'sound/ambient/station_13.ogg'
	)

	sound_environment = ENVIRONMENT_STONEROOM


/area/box/interior/station/hall
	name = "\improper B-0X走廊"
	icon_state = "hall"

	sound_environment = ENVIRONMENT_HANGAR

/area/box/interior/station/hall/north
	name = "\improper B-0X北走廊"
	icon_state = "hall_n"

/area/box/interior/station/hall/east
	name = "\improper B-0X东走廊"
	icon_state = "hall_e"

/area/box/interior/station/hall/south
	name = "\improper B-0X南走廊"
	icon_state = "hall_s"

/area/box/interior/station/hall/west
	name = "\improper B-0X西走廊"
	icon_state = "hall_w"

/area/box/interior/station/hall/central
	name = "\improper B-0X中央主走廊"
	icon_state = "hall_c"

/area/box/interior/station/hall/dorms
	name = "\improper B-0X宿舍走廊"
	icon_state = "dorms_hall"

/area/box/interior/station/bathrooms
	name = "\improper B-0X卫生间"
	icon_state = "bath"

	sound_environment = ENVIRONMENT_ROOM

/area/box/interior/station/hydroponics
	name = "\improper B-0X水培室"
	icon_state = "hydro"

/area/box/interior/station/cafe
	name = "\improper B-0X咖啡厅"
	icon_state = "cafe"
	safe_storage = TRUE

/area/box/interior/station/cafe/kitchen
	name = "\improper B-0X厨房"
	icon_state = "kitchen"

/area/box/interior/station/cafe/bar
	name = "\improper B-0X酒吧"
	icon_state = "bar"

/area/box/interior/station/dressing
	name = "\improper B-0X更衣室"
	icon_state = "dressing"

/area/box/interior/station/dorm
	name = "\improper B-0X宿舍"
	icon_state = "dorm"

/area/box/interior/station/help_desk
	name = "\improper B-0X咨询台"
	icon_state = "help"

/area/box/interior/station/cloning
	name = "\improper B-0X克隆室"
	icon_state = "clone"

/area/box/interior/station/science
	name = "\improper B-0X科研部"
	icon_state = "science"

/area/box/interior/station/cryo
	name = "\improper B-0X冷冻休眠区"
	icon_state = "cryo"

/area/box/interior/station/arrivals
	name = "\improper B-0X抵达码头"
	icon_state = "ariv"

	sound_environment = ENVIRONMENT_STONEROOM

/area/box/interior/station/chapel
	name = "\improper B-0X教堂"
	icon_state = "chapel"

/area/box/interior/station/library
	name = "\improper B-0X图书馆"
	icon_state = "library"

/area/box/interior/station/engineering
	name = "\improper B-0X工程部"
	icon_state = "eng"

/area/box/interior/station/medical
	name = "\improper B-0X医疗部"
	icon_state = "med"

/area/box/interior/station/medical/chemistry
	name = "\improper B-0X化学室"
	icon_state = "chem"

/area/box/interior/station/briefing
	name = "\improper B-0X简报室"
	icon_state = "brief"

/area/box/interior/station/armory
	name = "\improper B-0X军械库"
	icon_state = "armory"


/area/box/interior/station/hanger
	name = "\improper B-0X机库"
	icon_state = "hanger"

	sound_environment = ENVIRONMENT_STONEROOM

/area/box/interior/station/cargo
	name = "\improper B-0X货运部"
	icon_state = "cargo"

/area/box/interior/station/command
	name = "\improper B-0X指挥部"
	icon_state = "cmd"

/area/box/interior/station/maint
	name = "\improper B-0X维护区"
	icon_state = "maint"
	ambient_sound = 'sound/ambient/vents_loop.ogg'

	random_sounds = list(
		'sound/ambient/maint_1.ogg',
		'sound/ambient/maint_2.ogg'
	)

	sound_environment = ENVIRONMENT_BATHROOM

/area/box/interior/station/maint/north
	name = "\improper B-0X北部维护区"
	icon_state = "maint_n"

/area/box/interior/station/maint/east
	name = "\improper B-0X东部维护区"
	icon_state = "maint_e"

/area/box/interior/station/maint/south
	name = "\improper B-0X南部维护区"
	icon_state = "maint_s"

/area/box/interior/station/maint/west
	name = "\improper B-0X西部维护区"
	icon_state = "maint_w"

/area/box/interior/station/maint/disposals
	name = "\improper B-0X废物输送维护区"
	icon_state = "disposals"
