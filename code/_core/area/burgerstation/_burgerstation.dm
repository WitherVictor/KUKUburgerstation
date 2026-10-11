/area/burgerstation
	name = "NSS汉堡站"
	icon_state = "ship"
	flags_area = FLAG_AREA_NO_TELEPORT | FLAG_AREA_NO_CONSTRUCTION

	sound_environment = ENVIRONMENT_STONEROOM

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

	trackable = TRUE

	area_identifier = "Burgerstation"

	safe_storage = TRUE

	allow_ghost = TRUE

	map_color = COLOR_WHITE

	dynamic_lighting = TRUE

	interior = TRUE

	requires_power = TRUE

	default_state_power_lights = ON|AUTO
	default_state_power_machines = ON|AUTO
	default_state_power_doors = ON|AUTO

/area/burgerstation/hall
	name = "走廊"
	icon_state = "hall"

	sound_environment = ENVIRONMENT_ALLEY

	map_color = COLOR_GREY_LIGHT

/area/burgerstation/hall/north
	name = "北部走廊"
	icon_state = "hall_n"

/area/burgerstation/hall/east
	name = "东部走廊"
	icon_state = "hall_e"

	flags_area = FLAG_AREA_NO_TELEPORT | FLAG_AREA_NO_CONSTRUCTION | FLAG_AREA_NO_EVENTS

/area/burgerstation/hall/south
	name = "南部走廊"
	icon_state = "hall_s"

/area/burgerstation/hall/west
	name = "西部走廊"
	icon_state = "hall_w"

/area/burgerstation/hall/central
	name = "中央主走廊"
	icon_state = "hall_c"

/area/burgerstation/hall/dorms
	name = "宿舍走廊"
	icon_state = "dorms_hall"

/area/burgerstation/bathrooms
	name = "卫生间"
	icon_state = "bath"

	sound_environment = ENVIRONMENT_ROOM

	map_color = COLOR_CYAN

/area/burgerstation/merchant
	name = "商人的店铺"
	icon_state = "village"

	map_color = COLOR_GOLD

/area/burgerstation/cafe
	name = "咖啡馆"
	icon_state = "cafe"

	map_color = COLOR_CYAN

/area/burgerstation/cafe/kitchen
	name = "厨房"
	icon_state = "kitchen"

	map_color = COLOR_BLUE

	default_state_power_lights = OFF

/area/burgerstation/cafe/kitchen/freezer
	name = "厨房冷库"
	icon_state = "cryo"

	map_color = COLOR_BLUE

/area/burgerstation/cafe/bar
	name = "酒吧"
	icon_state = "bar"

	map_color = COLOR_CYAN

	default_state_power_lights = OFF

/area/burgerstation/cafe/botany
	name = "植物培育区"
	icon_state = "hydro"

	map_color = COLOR_GREEN

/area/burgerstation/dressing
	name = "试衣间"
	icon_state = "dressing"

	map_color = COLOR_RED

	sound_environment = ENVIRONMENT_BATHROOM

/area/burgerstation/dorm
	name = "宿舍"
	icon_state = "dorm"
	flags_area = FLAG_AREA_NO_TELEPORT | FLAG_AREA_NO_CONSTRUCTION | FLAG_AREA_SAVEZONE

	sound_environment = ENVIRONMENT_ROOM

	map_color = COLOR_BLUE

/area/burgerstation/contractor
	name = "抓痕先生办公室"
	icon_state = "dorm"
	flags_area = FLAG_AREA_NO_TELEPORT | FLAG_AREA_NO_CONSTRUCTION | FLAG_AREA_SAVEZONE

	map_color = COLOR_RED

	sound_environment = ENVIRONMENT_ROOM

/area/burgerstation/prestige
	name = "转生中心"
	icon_state = "dorm"

	flags_area = FLAG_AREA_NO_TELEPORT | FLAG_AREA_NO_CONSTRUCTION | FLAG_AREA_NO_EVENTS

	map_color = COLOR_GREEN

/area/burgerstation/soccer
	name = "足球场"
	icon_state = "dorm"

	flags_area = FLAG_AREA_NO_TELEPORT | FLAG_AREA_NO_CONSTRUCTION | FLAG_AREA_NO_EVENTS

	map_color = COLOR_GREEN

/area/burgerstation/vr
	name = "虚拟现实室"
	icon_state = "dorm"

	flags_area = FLAG_AREA_NO_TELEPORT | FLAG_AREA_NO_CONSTRUCTION | FLAG_AREA_NO_EVENTS

	map_color = COLOR_GREEN

/area/burgerstation/help_desk
	name = "服务台"
	icon_state = "help"

	flags_area = FLAG_AREA_NO_TELEPORT | FLAG_AREA_NO_CONSTRUCTION | FLAG_AREA_NO_EVENTS

	map_color = COLOR_GREEN

/area/burgerstation/hop_office
	name = "人事主管办公室"
	icon_state = "cmd"

	flags_area = FLAG_AREA_NO_TELEPORT | FLAG_AREA_NO_CONSTRUCTION | FLAG_AREA_NO_EVENTS

	map_color = COLOR_COMMAND

/area/burgerstation/cloning
	name = "克隆区"
	icon_state = "clone"

	map_color = COLOR_MEDICAL

/area/burgerstation/science
	name = "采矿科研部"
	icon_state = "science"
	flags_area = FLAG_AREA_NO_TELEPORT | FLAG_AREA_NO_CONSTRUCTION | FLAG_AREA_NO_EVENTS

	map_color = COLOR_SCIENCE

/area/burgerstation/science/research_director
	name = "科研主管办公室"
	icon_state = "cmd"

/area/burgerstation/science/containment
	name = "科研收容区"
	icon_state = "red"

/area/burgerstation/cryo
	name = "冷冻休眠区"
	icon_state = "cryo"
	flags_area = FLAG_AREA_NO_TELEPORT | FLAG_AREA_NO_CONSTRUCTION | FLAG_AREA_SAVEZONE | FLAG_AREA_NO_EVENTS

	map_color = COLOR_GREEN

/area/burgerstation/cryo/locker_room
	name = "更衣室"
	icon_state = "armory"

	map_color = COLOR_GREEN_DARK

/area/burgerstation/arrivals
	name = "抵达码头"
	icon_state = "ariv"
	flags_area = FLAG_AREA_NO_TELEPORT | FLAG_AREA_NO_CONSTRUCTION | FLAG_AREA_NO_EVENTS

	map_color = COLOR_YELLOW

	sound_environment = ENVIRONMENT_STONEROOM

/area/burgerstation/arrivals/north
	name = "北部抵达码头"
	map_color = COLOR_YELLOW
	color = COLOR_YELLOW

/area/burgerstation/arrivals/south
	name = "南部抵达码头"
	map_color = COLOR_ORANGE
	color = COLOR_RED

/area/burgerstation/chapel
	name = "礼拜堂"
	icon_state = "chapel"

	sound_environment = ENVIRONMENT_STONEROOM

	map_color = COLOR_BROWN

/area/burgerstation/chapel/office
	name = "礼拜堂办公室"
	icon_state = "cmd"


/area/burgerstation/library
	name = "图书馆"
	icon_state = "library"

	sound_environment = ENVIRONMENT_CARPETTED_HALLWAY

	map_color = COLOR_RED_DARK

/area/burgerstation/janitor
	name = "清洁工储物间"
	icon_state = "janitor"

	sound_environment = ENVIRONMENT_ROOM

	map_color = COLOR_PURPLE

/area/burgerstation/engineering
	name = "工程部"
	icon_state = "eng"

	sound_environment = ENVIRONMENT_STONEROOM

	map_color = COLOR_ENGINEERING

/area/burgerstation/engineering/solars
	name = "太阳能板区"
	icon_state = "solars"

	map_color = COLOR_YELLOW

/area/burgerstation/engineering/solars/ne
	name = "右舷前部太阳能板区"

/area/burgerstation/engineering/solars/se
	name = "右舷后部太阳能板区"

/area/burgerstation/engineering/solars/nw
	name = "左舷前部太阳能板区"

/area/burgerstation/engineering/solars/sw
	name = "左舷后部太阳能板区"

/area/burgerstation/engineering/lobby
	name = "工程部大厅"
	icon_state = "eng"
	color = "#00FF00"

/area/burgerstation/engineering/ce
	name = "总工程师办公室"
	icon_state = "cmd"
	flags_area = FLAG_AREA_NO_TELEPORT | FLAG_AREA_NO_CONSTRUCTION | FLAG_AREA_NO_EVENTS | FLAG_AREA_NO_TELEPORT

	map_color = COLOR_ENGINEERING

/area/burgerstation/engineering/telecomms
	name = "电信机房"
	icon_state = "cmd"
	flags_area = FLAG_AREA_NO_TELEPORT | FLAG_AREA_NO_CONSTRUCTION | FLAG_AREA_NO_EVENTS | FLAG_AREA_NO_TELEPORT

	map_color = COLOR_ENGINEERING

/area/burgerstation/engineering/supermatter
	name = "超物质区"
	icon_state = "cmd"
	flags_area = FLAG_AREA_NO_TELEPORT | FLAG_AREA_NO_CONSTRUCTION | FLAG_AREA_NO_EVENTS | FLAG_AREA_NO_TELEPORT

	map_color = COLOR_ENGINEERING

/area/burgerstation/medical
	name = "医疗部"
	icon_state = "med"

	map_color = COLOR_MEDICAL

/area/burgerstation/medical/cmo
	name = "医疗主管办公室"
	icon_state = "cmd"
	flags_area = FLAG_AREA_NO_TELEPORT | FLAG_AREA_NO_CONSTRUCTION | FLAG_AREA_NO_EVENTS | FLAG_AREA_NO_TELEPORT

	map_color = COLOR_MEDICAL_LIGHT

/area/burgerstation/medical/chemistry
	name = "化学部"
	icon_state = "chem"

	map_color = COLOR_CHEMISTRY

/area/burgerstation/medical/lobby
	name = "医疗部大厅"
	icon_state = "lobby"

/area/burgerstation/briefing
	name = "简报室"
	icon_state = "brief"

	map_color = COLOR_BROWN

/area/burgerstation/bait_shop
	name = "鱼饵店"
	icon_state = "bait"

	map_color = COLOR_BLUE

/area/burgerstation/goblin_shop
	name = "鲍斯战利品"
	icon_state = "bait"

	map_color = COLOR_GREEN

/area/burgerstation/mining
	name = "采矿部"
	icon_state = "mining"

	map_color = COLOR_BROWN

/area/burgerstation/mining/lobby
	name = "采矿部大厅"
	icon_state = "lobby"

/area/burgerstation/mining/foreman
	name = "采矿工头办公室"
	icon_state = "cmd"

	map_color = COLOR_COMMAND

/area/burgerstation/tax
	name = "税务室"
	icon_state = "tax"

	map_color = COLOR_GREEN

/area/burgerstation/armory
	name = "军械库"
	icon_state = "armory"

	map_color = COLOR_NANOTRASEN

/area/burgerstation/armory/special
	name = "军械库－特种行动区"
	icon_state = "armory_special"

/area/burgerstation/armory/shooting_range
	name = "射击场"
	icon_state = "shooting_range"

	sound_environment = ENVIRONMENT_STONEROOM

/area/burgerstation/hanger
	name = "机库"
	icon_state = "hanger"

	sound_environment = ENVIRONMENT_CONCERT_HALL

	map_color = COLOR_BLUE

/area/burgerstation/hanger/blue
	name = "蓝色机库泊位"
	color = COLOR_BLUE

/area/burgerstation/hanger/red
	name = "红色机库泊位"
	color = COLOR_RED

/area/burgerstation/hanger/green
	name = "绿色机库泊位"
	color = COLOR_GREEN

/area/burgerstation/hanger/drop_pod_bay
	name = "空降舱泊位"
	color = COLOR_ORANGE

/area/burgerstation/cargo
	name = "货运部"
	icon_state = "cargo"

	map_color = COLOR_CARGO

/area/burgerstation/cargo/lobby
	name = "货运部大厅"
	icon_state = "lobby"

/area/burgerstation/maint
	name = "维护区"
	icon_state = "maint"
	ambient_sound = 'sound/ambient/vents_loop.ogg'

	random_sounds = list(
		'sound/ambient/maint_1.ogg',
		'sound/ambient/maint_2.ogg'
	)

	map_color = COLOR_GREY_DARK

	sound_environment = ENVIRONMENT_BATHROOM

	flags_area = FLAG_AREA_NO_TELEPORT | FLAG_AREA_NO_CONSTRUCTION | FLAG_AREA_DIRTY

/area/burgerstation/maint/north
	name = "北部维护区"
	icon_state = "maint_n"

/area/burgerstation/maint/east
	name = "东部维护区"
	icon_state = "maint_e"

/area/burgerstation/maint/south
	name = "南部维护区"
	icon_state = "maint_s"

/area/burgerstation/maint/west
	name = "西部维护区"
	icon_state = "maint_w"

/area/burgerstation/maint/disposals
	name = "废物输送维护区"
	icon_state = "disposals"

/area/burgerstation/chess
	name = "国际象棋区"
	icon_state = "disposals"
	ambient_sound = 'sound/ambient/vents_loop.ogg'

	random_sounds = list(
		'sound/ambient/maint_1.ogg',
		'sound/ambient/maint_2.ogg'
	)

	default_state_power_lights = OFF

	map_color = COLOR_ORANGE

	sound_environment = ENVIRONMENT_BATHROOM

/area/burgerstation/maint/pvp

	ambient_sound = 'sound/ambient/vents_loop.ogg'

	random_sounds = list(
		'sound/ambient/maint_1.ogg',
		'sound/ambient/maint_2.ogg'
	)

	map_color = COLOR_ORANGE
	sound_environment = ENVIRONMENT_BATHROOM



/area/burgerstation/maint/pvp/table
	name = "ERROR"
	icon_state = "pvp"
	flags_area = FLAG_AREA_NO_TELEPORT | FLAG_AREA_NO_CONSTRUCTION | FLAG_AREA_NO_LOYALTY | FLAG_AREA_NO_EVENTS | FLAG_AREA_NO_TELEPORT

	sound_environment = ENVIRONMENT_ALLEY

	map_color = COLOR_ORANGE

	link_to_parent_apc = TRUE
