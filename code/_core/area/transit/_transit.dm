/area/transit
	name = "航行区"
	icon_state = "shuttle"
	flags_area = FLAGS_AREA_NO_CONSTRUCTION | FLAGS_AREA_NO_EVENTS | FLAGS_AREA_NO_TELEPORT
	var/turf/transit_turf = /turf/simulated/floor/plating
	safe_storage = TRUE
	trackable = TRUE
	allow_ghost = FALSE
	map_color = COLOR_PINK
	interior = TRUE

/area/transit/New(var/desired_loc)
	transit_areas[type] = src
	return ..()

/area/transit/cargo/ship
	name = "货运穿梭机"
	area_identifier = "Burgerstation"

/area/transit/cargo/bluespace
	name = "货运穿梭机"
	transit_turf = /turf/bluespace

	cheese_type = /reagent/nutrition/cheese/bluespace

/area/transit/cargo/centcomm
	name = "货运穿梭机"
	area_identifier = "Centcomm"

/area/transit/cargo_inbound/ship
	name = "货运穿梭机"
	area_identifier = "Burgerstation"


/area/transit/cargo_inbound/bluespace
	name = "货运穿梭机"

	cheese_type = /reagent/nutrition/cheese/bluespace

/area/transit/cargo_inbound/centcomm
	name = "货运穿梭机"
	area_identifier = "Centcomm"


