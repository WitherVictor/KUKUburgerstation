/obj/item/legion_core
	name = "军团核心"
	desc = "随身携带的治愈之力。"
	desc_extended = "蕴含再生之力却会逐渐衰败的特殊核心，可在瞬间大幅治疗目标的有机组织。只能使用一次，生成10分钟后失效。"

	icon = 'icons/obj/item/legion_core.dmi'
	icon_state = "active"

	var/expiry_time = -1
	var/stabilized = FALSE

	value = 500

	rarity = RARITY_RARE

/obj/item/legion_core/get_base_value()

	. = ..()

	if(stabilized)
		. *= 1.25
	else if(expiry_time < 0)
		. *= 0.1

	. = CEILING(.,1)

/obj/item/legion_core/Generate()
	expiry_time = SECONDS_TO_DECISECONDS(600)
	return ..()

/obj/item/legion_core/Finalize()
	if(stabilized == TRUE)
		return ..()
	if(expiry_time == -1)
		expiry_time = -1
		update_sprite()
	else
		CALLBACK("expire_\ref[src]",expiry_time,src,src::expire())
	return ..()

/obj/item/legion_core/proc/expire()
	if(stabilized == TRUE)
		return
	expiry_time = -1
	update_sprite()
	value = get_base_value()
	return TRUE

/obj/item/legion_core/get_examine_list(var/mob/examiner)

	. = ..()

	if(stabilized == TRUE)
		. += div("warning","它已被稳定化，可以永久保留治疗能力。")

	if(expiry_time == -1)
		. += div("warning","它已经失效了。")


/obj/item/legion_core/update_icon()

	if(expiry_time == -1)
		icon_state = "inactive"
		name = "黯淡的军团核心"
	else
		icon_state = "active"
		name = "活性军团核心"

	return ..()

/obj/item/legion_core/click_self(var/mob/activator,location,control,params)
	click_on_object(activator,activator)
	return TRUE

/obj/item/legion_core/click_on_object(var/mob/activator,var/atom/object,location,control,params)

	if(is_living(object))

		INTERACT_CHECK
		INTERACT_CHECK_OBJECT
		INTERACT_DELAY(10)

		if(expiry_time == -1 && !stabilized)
			activator.to_chat(span("warning","[src.name]已经失效了！"))
			return TRUE

		var/mob/living/L = object
		if(L.dead || !L.health)
			activator.to_chat(span("warning","[src.name]只能对活着的生物使用！"))
			return TRUE

		if(activator == L)
			activator.visible_message(span("notice","[activator.name]用[src.name]治疗了自己的伤势。"),span("notice","你用[src.name]治疗了自己的伤势。"))
		else
			activator.visible_message(span("notice","[activator.name]用[src.name]治疗了[L.name]的伤势。"),span("notice","你用[src.name]治疗了[L.name]的伤势。"))

		L.health.adjust_loss_smart(brute=-100,burn=-100,tox=-100,oxy=-100,fatigue=-100,pain=-100,rad=-100,sanity=-100,mental=-100,organic=TRUE,robotic=FALSE)
		L.to_chat(span("notice","你感到焕然一新！"))
		qdel(src)

		return TRUE

	. = ..()

/obj/item/legion_core_stabilizer
	name = "军团核心稳定剂"
	desc = "腐化医学的奇迹就在眼前。"
	desc_extended = "强效化合物，可让军团核心永久保留治疗能力。"
	value = 200
	icon = 'icons/obj/item/legion_core.dmi'
	icon_state = "stabilizer"

	rarity = RARITY_UNCOMMON

/obj/item/legion_core_stabilizer/click_on_object(var/mob/activator,var/atom/object,location,control,params)

	if(istype(object,/obj/item/legion_core))
		INTERACT_CHECK
		INTERACT_CHECK_OBJECT
		INTERACT_DELAY(10)
		var/obj/item/legion_core/core = object
		core.stabilized = TRUE
		core.update_icon()
		core.name = "稳定的军团核心"
		core.desc_extended = "蕴含再生之力的特殊核心，可在瞬间大幅治疗目标的有机组织。只能使用一次；经过稳定化处理后，可永久保留治疗能力。"
		activator.to_chat(span("notice","你向[core.name]注入了[src.name]，使其永久保留治疗能力。"))
		qdel(src)
