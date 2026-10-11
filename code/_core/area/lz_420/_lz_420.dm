/area/lz_420
	name = "420号登陆区"
	trackable = TRUE
	area_identifier = "Mission"

/area/lz_420/exterior/
	name = "420号登陆区室外"
	icon_state = "jungle"
	weather = WEATHER_RAIN
	ambient_temperature = T0C + 40

	sunlight_freq = 8
	sunlight_color = "#29332C"

	cheese_type = /reagent/nutrition/cheese/brabander

	//ambient_sound = 'sound/ambient/crickets.ogg'

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

	sound_environment = ENVIRONMENT_PLAIN


/area/lz_420/interior/
	sunlight_freq = 0
	interior = TRUE

	sound_environment = ENVIRONMENT_STONEROOM

/area/lz_420/interior/cave
	name = "\improper 中央洞穴"
	icon_state = "cave"
	tracks = TRACKS_CAVE
	random_sounds = list(
		'sound/ambient/cave_1.ogg',
		'sound/ambient/cave_2.ogg',
	)
	cheese_type = /reagent/nutrition/cheese/gruyere

	sound_environment = ENVIRONMENT_QUARRY

/area/lz_420/interior/cave/north
	name = "北部洞穴"
	icon_state = "blue"

	sunlight_freq = 8
	sunlight_color ="#7F3B11"

	random_sounds = list(
		'sound/ambient/lavacaves_1.ogg',
		'sound/ambient/lavacaves_2.ogg',
	)

	tracks = TRACKS_LAVA

	cheese_type = /reagent/nutrition/cheese/guava

/area/lz_420/interior/cave/south
	name = "南部洞穴"
	icon_state = "red"

/area/lz_420/interior/cave/east
	name = "东部洞穴"
	icon_state = "green"

/area/lz_420/interior/cave/west
	name = "西部洞穴"
	icon_state = "yellow"

/area/lz_420/interior/nexus
	name = "\improper 枢纽"
	icon_state = "pink"
	sound_environment = ENVIRONMENT_STONEROOM

/area/lz_420/interior/nexus/entrance
	name = "\improper 枢纽东入口"
	icon_state = "hanger"

/area/lz_420/interior/nexus/central
	name = "\improper 枢纽中央走廊"
	icon_state = "hall_c"

	sound_environment = ENVIRONMENT_CONCERT_HALL

/area/lz_420/interior/nexus/west
	name = "\improper 枢纽西走廊"
	icon_state = "hall_w"

	sound_environment = ENVIRONMENT_STONEROOM

/area/lz_420/interior/nexus/east
	name = "\improper 枢纽东走廊"
	icon_state = "hall_e"

	sound_environment = ENVIRONMENT_STONEROOM

/area/lz_420/interior/nexus/south
	name = "\improper 枢纽南走廊"
	icon_state = "hall_s"

	sound_environment = ENVIRONMENT_STONEROOM

/area/lz_420/interior/nexus/north
	name = "\improper 枢纽北走廊"
	icon_state = "hall_n"

	sound_environment = ENVIRONMENT_STONEROOM

/area/lz_420/interior/nexus/maint
	name = "\improper 枢纽维护区"
	icon_state = "maint"

	sound_environment = ENVIRONMENT_BATHROOM

/area/lz_420/interior/nexus/chapel
	name = "\improper 枢纽教堂"
	icon_state = "chapel"

/area/lz_420/interior/nexus/armory
	name = "\improper 枢纽军械库"
	icon_state = "armory"

/area/lz_420/interior/nexus/cargo
	name = "\improper 枢纽货运部"
	icon_state = "cargo"

/area/lz_420/interior/nexus/kitchen
	name = "\improper 枢纽厨房"
	icon_state = "kitchen"

/area/lz_420/interior/nexus/science
	name = "\improper 枢纽科研部"
	icon_state = "science"

/area/lz_420/interior/nexus/garden
	name = "\improper 枢纽花园"
	icon_state = "grass"

/area/lz_420/interior/nexus/medical
	name = "\improper 枢纽医疗部"
	icon_state = "med"

/area/lz_420/interior/nexus/engineering
	name = "\improper 枢纽工程部"
	icon_state = "eng"

/area/lz_420/interior/nexus/wip
	name = "\improper 枢纽废弃区域"
	icon_state = "wip"
