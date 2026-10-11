/obj/structure/interactive/lighting/floor
	name = "地灯"
	desc = "已在太空站附近检测到电磁风暴。请检查所有设备是否存在过载风险。"
	desc_extended = "用于照亮周围区域。"

	icon = 'icons/obj/structure/lights_new.dmi'
	icon_state = "floor_light"

	desired_light_power = 0.25
	desired_light_range = 7
	desired_light_color = null //Set in update_icon

	layer = LAYER_OBJ
	plane = PLANE_FLOOR

	color = "#FFFFAA"
	var/color_frame = "#888888"

	collision_bullet_flags = FLAG_COLLISION_SPECIFIC

	health = /health/construction

	health_base = 10

	lightswitch = TRUE


/obj/structure/interactive/lighting/floor/on_destruction(var/mob/caller,var/damage = FALSE)

	var/turf/T = get_turf(src)

	if(desired_light_color)
		desired_light_color = null
		if(health)
			health.restore()
		create_destruction(T,list(/obj/item/material/shard = 1),/material/glass)
		play('sound/effects/glass_shatter.ogg',T)
		. = ..()
		update_atom_light()
		update_sprite()
	else
		create_destruction(T,list(/obj/item/material/sheet = 1),/material/steel)
		. = ..()
		qdel(src)



/obj/structure/interactive/lighting/floor/Initialize()

	if(color)
		desired_light_color = color
		color = "#FFFFFF"

	return ..()

/obj/structure/interactive/lighting/floor/PostInitialize()
	. = ..()
	update_sprite()

/obj/structure/interactive/lighting/floor/update_icon()

	if(desired_light_range && desired_light_power && desired_light_color)
		set_light(desired_light_range,desired_light_power,desired_light_color)

	icon = initial(icon)
	icon_state = initial(icon_state)

	var/icon/I = new /icon(icon,"floor")

	var/icon/F = new /icon(icon,"floor_bulb")
	F.Blend(color_frame,ICON_MULTIPLY)
	I.Blend(F,ICON_OVERLAY)

	if(on && desired_light_color)
		var/icon/L = new /icon(icon,"floor_light")
		L.Blend(desired_light_color,ICON_MULTIPLY)
		I.Blend(L,ICON_OVERLAY)

	icon = I

