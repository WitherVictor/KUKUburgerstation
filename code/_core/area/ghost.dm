/area/ghost/
	area_identifier = "Ghost"
	allow_ghost = TRUE
	safe_storage = TRUE //People will die a lot.
	flags_area = FLAG_AREA_NO_TELEPORT | FLAG_AREA_NO_CONSTRUCTION | FLAG_AREA_NO_EVENTS
	sound_environment = ENVIRONMENT_STONEROOM

	ambient_sound = 'sound/ambient/vents_loop.ogg'

	random_sounds = list(
		'sound/ambient/maint_1.ogg',
		'sound/ambient/maint_2.ogg'
	)

/area/ghost/hall
	name = "机密研究中心－走廊"
	icon_state = "hall"
	sound_environment = ENVIRONMENT_ALLEY

/area/ghost/hall/north
	name = "机密研究中心－北部走廊"
	icon_state = "hall_n"

/area/ghost/hall/east
	name = "机密研究中心－东部走廊"
	icon_state = "hall_e"

/area/ghost/hall/south
	name = "机密研究中心－南部走廊"
	icon_state = "hall_s"

/area/ghost/hall/west
	name = "机密研究中心－西部走廊"
	icon_state = "hall_w"

/area/ghost/hall/entrance
	name = "机密研究中心－入口走廊"
	icon_state = "hall_c"

/area/ghost/maint
	name = "机密研究中心－维护区"
	icon_state = "maint"
	sound_environment = ENVIRONMENT_BATHROOM

/area/ghost/maint/north
	name = "机密研究中心－北部维护区"
	icon_state = "maint_n"

/area/ghost/maint/east
	name = "机密研究中心－东部维护区"
	icon_state = "maint_e"

/area/ghost/maint/south
	name = "机密研究中心－南部维护区"
	icon_state = "maint_s"

/area/ghost/maint/west
	name = "机密研究中心－西部维护区"
	icon_state = "maint_w"

/area/ghost/maint/central
	name = "机密研究中心－中央维护区"
	icon_state = "disposals"

/area/ghost/medical
	name = "机密研究中心－医疗部"
	icon_state = "med"


/area/ghost/bathrooms
	name = "机密研究中心－卫生间"
	icon_state = "bath"

	sound_environment = ENVIRONMENT_ROOM

/area/ghost/bathrooms/male
	name = "机密研究中心－男厕"
	color = "blue"

/area/ghost/bathrooms/female
	name = "机密研究中心－女厕"
	color = "red"

/area/ghost/cafe
	name = "机密研究中心－咖啡馆"
	icon_state = "cafe"


/area/ghost/science
	name = "机密研究中心－科研部"
	icon_state = "science"

/area/ghost/command
	name = "机密研究中心－指挥部"
	icon_state = "brief"


/area/ghost/engineering
	name = "机密研究中心－工程部"
	icon_state = "eng"

	sound_environment = ENVIRONMENT_STONEROOM
