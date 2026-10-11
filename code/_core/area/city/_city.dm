var/global/list/vr_possible_nuke_areas = list()

/area/city
	trackable = TRUE
	area_identifier = "Virtual Reality"

/area/city/exterior/
	sunlight_freq = 4
	sunlight_color = "#2C4D59"

/area/city/exterior/streets
	name = "城市街道"
	icon_state = "grass"

/area/city/interior
	sunlight_freq = 0
	sunlight_color = "FFFFFF"

/area/city/interior/New(var/desired_loc)
	. = ..()
	vr_possible_nuke_areas |= src

/area/city/interior/codebus
	name = "程序员整活巴士"
	icon_state = "pink"

/area/city/interior/greytide
	name = "灰潮"
	icon_state = "blue"

/area/city/interior/traitor_joes
	name = "叛徒乔商店"
	icon_state = "red"

/area/city/interior/die_lab
	name = "染杀实验室"
	icon_state = "purple"

/area/city/interior/warehouse
	name = "仓库"
	icon_state = "yellow"

/area/city/interior/combo_cafe
	name = "连击咖啡馆"
	icon_state = "green"

/area/city/interior/light
	name = "灯泡之家"
	icon_state = "white"

/area/city/interior/mall/
	name = "中央商场"
	icon_state = "hallway"

/area/city/interior/hive
	name = "巢穴"
	icon_state = "purple"

/area/city/interior/scotch
	name = "威利的苏格兰酒馆"
	icon_state = "orange"

/area/city/interior/mall/bathroom
	name = "中央商场卫生间"
	icon_state = "bathroom"

/area/city/interior/discount
	name = "折扣丹"
	icon_state = "orange"

/area/city/interior/space
	name = "外太空"
	icon_state = "space"

/area/city/interior/harmbaton
	name = "伤害警棍"
	icon_state = "security"

/area/city/interior/chem_lab
	name = "化学实验室"
	icon_state = "chemistry"

/area/city/interior/the_net
	name = "网络之家"
	icon_state = "green"

/area/city/interior/honk
	name = "鸣笛上膛"
	icon_state = "yellow"
