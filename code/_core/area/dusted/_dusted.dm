/area/dusted
	trackable = TRUE
	area_identifier = "Virtual Reality"
	flags_area = FLAG_AREA_NO_TELEPORT | FLAG_AREA_NO_CONSTRUCTION

	sunlight_freq = 4
	sunlight_color = "#C1AA7C"

/area/dusted/exterior
	name = "尘封之地室外"
	icon_state = "purple"

/area/dusted/out_of_bounds
	name = "边界之外"
	icon_state = "red"

/area/dusted/out_of_bounds/is_space()
	return TRUE

/area/dusted/interior
	name = "尘封之地室内"
	sunlight_freq = 0
	sunlight_color = "FFFFFF"
	icon_state = "blue"


/area/dusted/interior/grey
	name = "灰色建筑"
	sunlight_freq = 0
	sunlight_color = "FFFFFF"
	icon_state = "green"

/area/dusted/exterior/fountain
	name = "喷泉"
	icon_state = "river"

/area/dusted/exterior/market
	name = "市场"
	icon_state = "shop"

/area/dusted/exterior/bar_zone
	name = "酒吧外"
	icon_state = "bar"

/area/dusted/exterior/center_long_alley
	name = "中央长巷"
	icon_state = "hall_c"

/area/dusted/exterior/grass_alley
	name = "草地小巷"
	icon_state = "hall_e"

/area/dusted/exterior/cargo_dump
	name = "货物堆场"
	icon_state = "cargo"
