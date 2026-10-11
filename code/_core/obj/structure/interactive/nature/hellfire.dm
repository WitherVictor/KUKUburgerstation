obj/structure/scenery/hellfire
	name = "火焰"
	desc = "感谢科学！"
	icon = 'icons/obj/effects/fire.dmi'
	icon_state = "3"

obj/structure/scenery/hellfire/New(var/desired_loc)
	set_dir(pick(NORTH,EAST,SOUTH,WEST))
	. = ..()
