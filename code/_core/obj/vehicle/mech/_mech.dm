/mob/living/vehicle/mech
	name = "机甲"
	desc = "动漫化作兵器。"
	desc_extended = "人形装甲武器平台，可通过各种部件与武器模块改装，在各类环境中移动并执行任务。利用内置电池的能量自行制造弹药，自给能力强，价格也很高。"
	icon = 'icons/obj/vehicles/mechs.dmi'

	collision_flags = FLAG_COLLISION_WALKING
	collision_bullet_flags = FLAG_COLLISION_BULLET_INORGANIC

	anchored = TRUE //wait, why

	movement_delay = DECISECONDS_TO_TICKS(4)

	change_dir_on_move = FALSE

	blood_type = /reagent/blood/robot
	blood_volume = 1000

/mob/living/vehicle/mech/get_footsteps(var/list/original_footsteps,var/enter=TRUE)
	return original_footsteps + /footstep/mech_step

/mob/living/vehicle/mech/set_dir(var/desired_dir,var/force=FALSE)

	. = ..()

	if(.)
		var/turf/T = get_turf(src)
		play_sound('sound/effects/footsteps/mechmove.ogg',T)
		if(length(passengers) && passengers[1])
			create_alert(VIEW_RANGE,T,passengers[1],ALERT_LEVEL_NOISE)


/mob/living/vehicle/mech/Move(NewLoc,Dir=0,step_x=0,step_y=0)
	var/real_dir = get_dir(src,NewLoc)
	if(real_dir & dir)
		return ..()
	set_dir(real_dir)
	return FALSE

/mob/living/vehicle/mech/post_death()
	. = ..()
	update_sprite()

/mob/living/vehicle/mech/get_movement_delay(var/include_stance=TRUE)
	return movement_delay

/mob/living/vehicle/mech/update_icon()

	icon_state = initial(icon_state)

	if(dead)
		icon_state = "[icon_state]_dead"
	else if(!ai && !length(passengers))
		icon_state = "[icon_state]_open"

	..()
