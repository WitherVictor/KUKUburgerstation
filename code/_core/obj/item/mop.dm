/obj/item/mop
	name = "拖把"
	icon = 'icons/obj/item/mop.dmi'
	desc = "总算有件清洁工具了。"
	desc_extended = "非常结实的拖把，用来清理洒落的液体。"

	damage_type = /damagetype/melee/club/broom

	size = SIZE_3

	reagents = /reagent_container/mop

	value = 150

	weight = 2


/obj/item/mop/click_on_object(var/mob/activator as mob,var/atom/object,location,control,params)

	if(is_container(object) && object.reagents)
		var/obj/item/container/C = object
		INTERACT_CHECK
		INTERACT_CHECK_OBJECT
		INTERACT_DELAY(10)
		if(C.reagents.volume_current <= 0)
			activator.to_chat(span("warning","[object.name]是空的！"))
			return TRUE
		var/turf/T = get_turf(C)
		var/space_left = C.reagents.volume_max - C.reagents.volume_current
		var/overflow = src.reagents.volume_current - space_left
		if(overflow > 0)
			C.reagents.splash(activator,T,overflow,1)
		src.reagents.transfer_reagents_to(C.reagents,min(space_left,src.reagents.volume_current),should_update = FALSE, activator = activator)
		C.reagents.transfer_reagents_to(src.reagents,src.reagents.volume_max, activator = activator)
		play_sound('sound/effects/watersplash.ogg',T,range_max=VIEW_RANGE)
		return TRUE

	if(object.plane >= PLANE_HUD)
		return ..()

	var/turf/T = get_turf(object)

	if(T)
		INTERACT_CHECK
		INTERACT_CHECK_OBJECT
		INTERACT_DELAY(4)
		activator.set_dir(get_dir(activator,T))
		var/damagetype/DT = SSdamagetype.all_damage_types[damage_type]
		DT.do_attack_visuals(activator,get_turf(activator),T,T,0)
		if(src.reagents.volume_current <= 0)
			activator.to_chat(span("warning","[src.name]已经干了！"))
			return TRUE
		var/list/valid_sounds = list(
			'sound/effects/water_wade1.ogg',
			'sound/effects/water_wade2.ogg',
			'sound/effects/water_wade3.ogg',
			'sound/effects/water_wade4.ogg'
		)
		play_sound(pick(valid_sounds),T,range_max=VIEW_RANGE)
		src.reagents.splash(activator,T,5,TRUE,1)
		return TRUE

	return ..()
