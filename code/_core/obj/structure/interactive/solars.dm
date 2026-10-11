/obj/structure/interactive/solar_panel
	name = "太阳能板"
	desc = "蓝色方块产出的绿色能源。这可不是瞎编的。"
	desc_extended = "一组光伏电池，将自然阳光转化为可用的电能。"
	icon = 'icons/obj/structure/solar.dmi'
	icon_state = "solar"

	collision_flags = FLAG_COLLISION_WALL
	collision_bullet_flags = FLAG_COLLISION_BULLET_INORGANIC

	value = 200

	density = TRUE
	anchored = TRUE

	layer = LAYER_OBJ_GRILLE

	//health = /health/construction/
	//health_base = 100

	wire_powered = TRUE

	pixel_z = 6

/obj/structure/interactive/solar_panel/power_process(var/power_multiplier=1)
	update_power_supply(get_power_supply())
	. = ..()

/obj/structure/interactive/solar_panel/get_power_supply()
	var/turf/T = loc
	if(!istype(loc))
		return 5
	return CEILING(10 + T.lightness * 290,1)
