obj/structure/interactive/artifact
	name = "珍贵遗物"
	desc = "运输起来安不安全可不好说。"
	desc_extended = "当前星球出产的珍贵遗物。纳米传讯可能想要它。"
	icon = 'icons/obj/structure/objectives.dmi'
	icon_state = "1"

	anchored = FALSE
	collision_flags = FLAG_COLLISION_WALL
	density = TRUE

	value = 1000

	bullet_block_chance = 75

	desired_light_power = 0.25
	desired_light_range = 2
	desired_light_color = "#FFFFFF"

obj/structure/interactive/artifact/Finalize()
	name = "[pick(SStext.adjectives)]的[pick(SStext.verbs)]遗物"
	return ..()

obj/structure/interactive/artifact/on_crush(var/message=TRUE)
	var/turf/T = get_turf(pick(bluepace_rift_markers))
	if(message) src.visible_message(span("danger","[name]剧烈震颤，随后消失在耀眼的闪光中！"))
	src.force_move(T)
	return FALSE

obj/structure/interactive/artifact/New(var/desired_loc)
	. = ..()
	icon_state = "[rand(1,9)]"
