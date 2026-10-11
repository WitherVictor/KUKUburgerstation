/turf/bluespace
	name = "蓝空间"
	icon_state = "bluespace"
	opacity = 0
	plane = PLANE_SPACE

/turf/bluespace/New(var/desired_loc)
	. = ..()
	icon = null
	icon_state = null
	invisibility = 101

/turf/bluespace/Entered(atom/movable/Obj, atom/OldLoc)

	if(!Obj.qdeleting && !istype(Obj,/mob/abstract/) && Obj.plane != PLANE_SHUTTLE)
		if(Obj.mouse_opacity) Obj.visible_message(span("danger","[Obj.name]猛烈闪烁！"),span("danger","你猛烈闪烁！"))
		if(Obj.is_safe_to_delete())
			qdel(Obj)
		else if(length(bluepace_rift_markers))
			Obj.force_move(get_turf(pick(bluepace_rift_markers)))
			if(Obj.mouse_opacity) Obj.visible_message(span("danger","[Obj.name]凭空出现了！"),span("warning","你出现在了某个地方……"))
		return TRUE

	. = ..()

/turf/space
	name = "太空"
	icon = 'icons/turf/space/space.dmi'
	icon_state = "preview"
	opacity = 0
	plane = PLANE_SPACE
	dynamic_lighting = FALSE

/turf/space/is_space()
	return TRUE

/turf/space/Entered(atom/movable/Obj, atom/OldLoc)

	if(ismob(Obj) && !istype(Obj,/mob/abstract/))
		var/mob/M = Obj
		if(M.finalized)
			var/obj/marker/failsafe/FS = locate() in world
			if(FS)
				M.force_move(FS.loc)
			else
				var/atom/movable/fallback = pick(SSobj.cryo_spawnpoints)
				M.force_move(get_turf(fallback))

	. = ..()

/turf/space/blocking
	name = "深空"
	opacity = 1
