/turf/simulated/floor/grass/
	name = "茂密草丛"
	desc = "地上的一片草。"
	desc_extended = "哇，丹尼尔，又带着那片绿草回来了！"
	layer = LAYER_FLOOR_GRASS_DENSE

	corner_icons = TRUE
	corner_category = "dense_grass"

	icon = 'icons/turf/floor/icons.dmi'
	icon_state = "grass_new"

	real_icon = 'icons/turf/floor/grass_new.dmi'
	real_icon_state = "grass"

	footstep = /footstep/grass

	destruction_turf = /turf/simulated/floor/colored/grass

	material_id = /material/grass/

	organic = TRUE

	map_color = "#267F00"

	health_base = 300

/turf/simulated/floor/grass/jungle
	name = "茂密丛林草丛"
	color = "#969696"
	destruction_turf = /turf/simulated/floor/colored/grass/jungle
	desc = "一片丛林中的草。"
	desc_extended = "与某些人的想法不同，丛林草可不是喜欢听丛林音乐的草。"
	map_color = "#69702A"

/*
/turf/simulated/floor/grass/smooth_turfs()

	var/list/smooth_code = get_smooth_code()

	var/ne = smooth_code[1]
	var/nw = smooth_code[2]
	var/se = smooth_code[3]
	var/sw = smooth_code[4]

	if("[ne][nw][se][sw]" != "iiii")
		return ..()

	icon = real_icon
	icon_state = "grass[rand(0,3)]"
	pixel_x = (32 - 48)/2
	pixel_y = (32 - 48)/2
	layer = initial(layer) + 0.1

	return TRUE
*/
