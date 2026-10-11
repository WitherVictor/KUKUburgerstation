
/area/crystalcanyon
	trackable = TRUE
	area_identifier = "Mission"

/area/crystalcanyon/outside
	name = "\improper 水晶平原"
	icon_state = "snow"
	weather = WEATHER_SNOW
	ambient_temperature = T0C - 20
	hazard = "cold"
	sunlight_freq = 4
	sunlight_color = "#1A3E4C"

	cheese_type = /reagent/nutrition/cheese/raclette

	tracks = TRACKS_MOUNTAIN

	sound_environment = ENVIRONMENT_PLAIN
/area/crystalcanyon/interior/cave
	name = "\improper 中央水晶洞穴"
	icon_state = "cave"
	tracks = TRACKS_CAVE
	random_sounds = list(
		'sound/ambient/cave_1.ogg',
		'sound/ambient/cave_2.ogg',
	)
	cheese_type = /reagent/nutrition/cheese/gruyere

	sound_environment = ENVIRONMENT_QUARRY

/area/crystalcanyon/interior/cave/north
	name = "\improper 北部水晶洞穴"
	icon_state = "blue"

	sunlight_freq = 8
	sunlight_color ="#7F3B11"

	random_sounds = list(
		'sound/ambient/lavacaves_1.ogg',
		'sound/ambient/lavacaves_2.ogg',
	)

	tracks = TRACKS_LAVA

	cheese_type = /reagent/nutrition/cheese/guava

/area/crystalcanyon/interior/cave/south
	name = "\improper 南部水晶洞穴"
	icon_state = "red"

/area/crystalcanyon/interior/cave/east
	name = "\improper 东部水晶洞穴"
	icon_state = "green"

/area/crystalcanyon/interior/cave/west
	name = "\improper 西部水晶洞穴"
	icon_state = "yellow"

/area/crystalcanyon/caves/xenohive
	name = "\improper 异形巢穴"
	icon_state = "hive"

	tracks = null

/area/crystalcanyon/deltaclinic
	name = "\improper 水晶洞穴德尔塔诊所"
	icon_state = "med"

/area/crystalcanyon/bravobngine
	name = "\improper 水晶洞穴工程前哨站"
	icon_state = "eng"

/area/crystalcanyon/charliebase
	name = "\improper 水晶洞穴采矿基地"
	icon_state = "mining"

/area/crystalcanyon/interior/revbar
	name = "\improper 革命军酒吧"
	icon_state = "red"

/area/crystalcanyon/interior/playerrev
	name = "\improper 革命军基地"
	icon_state = "red"

/area/crystalcanyon/downedshuttle
	name = "\improper 水晶洞穴坠毁的海湾号"
	icon_state = "red"

/area/crystalcanyon/clownplace
	name = "\improper 水晶洞穴鸣笛实验室"
	icon_state = "green"

area/crystalcanyon/interior/syndiship
	name = "\improper 辛迪加飞船"
	icon_state = "red"
