/obj/item/broom
	name = "扫帚"
	icon = 'icons/obj/item/broom.dmi'
	desc = "拿起这把扫帚，横扫一切。"
	desc_extended = "点击目标位置，将周围可移动的物品向那里扫拢。适合清理垃圾，也适合敲人脑袋。"

	damage_type = /damagetype/melee/club/broom

	size = SIZE_3

	value = 200

	var/broom_range = 1

/obj/item/broom/click_on_object(var/mob/activator as mob,var/atom/object,location,control,params)


	if(object.plane >= PLANE_HUD)
		return ..()

	var/turf/T = get_turf(object)

	if(T)
		INTERACT_CHECK
		INTERACT_CHECK_OBJECT
		INTERACT_DELAY(10)
		var/broom_limit = 10
		for(var/obj/item/I in oview(T,broom_range))
			CHECK_TICK(50,FPS_SERVER)
			broom_limit--
			if(I.anchored)
				continue
			I.Move(get_step(I,get_dir(I,T)))
			if(broom_limit <= 0)
				break
		return TRUE

	return ..()

/obj/item/broom/magic
	name = "魔法扫帚"
	broom_range = 4
	value = 800
	rarity = RARITY_RARE
