/turf/simulated/floor/disco
	name = "迪斯科地板"
	desc = "漂亮的颜色！"
	desc_extended = "供人跳迪斯科的地板。周五夜晚到啦。"

	icon = 'icons/turf/floor/icons.dmi'
	icon_state = "disco"

	real_icon = 'icons/turf/floor/disco.dmi'
	real_icon_state = "disco_frame"

	footstep = /footstep/tile

	plane = PLANE_FLOOR_ATTACHMENT
	layer = LAYER_FLOOR_WEATHER

	health_base = 200

/turf/simulated/floor/disco/Initialize()
	. = ..()
	real_icon_state = "disco_light_[1 + ((x+y) % 4)]"
	pixel_x = -8
	pixel_y = -8
	name = "迪斯科灯光[1 + ((x+y) % 4)]"
	alpha = 255

/turf/simulated/floor/disco/Finalize()
	. = ..()
	update_sprite()
	src.set_light(1,0.5,"#FFFFFF")



/*
/turf/simulated/floor/disco/update_overlays()

	. = ..()

	var/desired_icon_state = "disco_light_[1 + ((x+y) % 4)]"

	if(!disco_images[desired_icon_state])
		var/image/I = new/image(real_icon,"disco_frame")
		I.appearance_flags = appearance_flags | RESET_COLOR | RESET_ALPHA
		I.blend_mode = BLEND_ADD
		I.plane = PLANE_WIRE
		I.layer = LAYER_FLOOR_WEATHER + 0.1
		disco_images[desired_icon_state] = I

	add_overlay(disco_images[desired_icon_state])
*/

