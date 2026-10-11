/obj/effect/ritual_smoke
	name = "仪式烟雾"
	desc = "让我进去，让我进——去——！"
	desc_extended = "一种毫无道理、凭空出现的自然异常，会阻止生物通过。"
	icon = 'icons/obj/structure/shrine_smoke.dmi'
	icon_state = "smoke"
	plane = PLANE_EFFECT
	layer = LAYER_GHOST
	alpha = 255

	collision_flags = FLAG_COLLISION_WALL
	collision_bullet_flags = FLAG_COLLISION_BULLET_ORGANIC

	density = TRUE
	opacity = TRUE

	mouse_opacity = 2

/obj/effect/ritual_smoke/Cross(atom/movable/O,atom/oldloc)
	if(is_living(O))
		return FALSE
	return TRUE

/obj/effect/ritual_smoke/proc/remove()
	animate(src,alpha = 0)
	mouse_opacity = 0
	set_density(FALSE)
	set_opacity(FALSE)

/obj/effect/ritual_smoke/inner
	icon_state = "inner"

/obj/effect/ritual_smoke/outer
	icon_state = "outer"
