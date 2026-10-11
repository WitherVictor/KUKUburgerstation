var/global/list/all_fog = list()

/obj/effect/fog_of_war
	name = "战争迷雾"
	desc = "我的沉浸感啊。"
	desc_extended = "一种毫无道理、凭空出现的自然异常，会阻止生物通过。"
	icon = 'icons/obj/effects/fog.dmi'
	icon_state = "fog"
	plane = PLANE_EFFECT
	layer = LAYER_GHOST
	alpha = 255

	collision_flags = FLAG_COLLISION_WALL
	collision_bullet_flags = FLAG_COLLISION_BULLET_ORGANIC

	density = TRUE
	opacity = TRUE

	mouse_opacity = 2

/obj/effect/fog_of_war/Cross(atom/movable/O,atom/oldloc)
	if(is_living(O))
		return FALSE
	return TRUE

/obj/effect/fog_of_war/New(var/desired_loc)
	all_fog += src
	alpha = 200
	return ..()

/obj/effect/fog_of_war/proc/remove()
	animate(src,alpha = 0)
	set_density(FALSE)
	set_opacity(FALSE)
	mouse_opacity = 0
