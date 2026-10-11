/obj/item/implanter
	name = "自动植入器"
	desc = "什么时候能用来丰胸？"
	desc_extended = "一种手持芯片植入器，可将芯片，有时甚至是器官，植入自己的皮肉和骨骼。扫描目标部位后按下按钮即可。只能用于使用者自身，无法为他人植入。"
	var/removes_existing = FALSE

	var/obj/item/organ/internal/stored_implant

	icon = 'icons/obj/item/implanter.dmi'
	icon_state = "implanter"

	value = 0

	weight = 3

	rarity = RARITY_UNCOMMON

/obj/item/implanter/PreDestroy()
	QDEL_NULL(stored_implant)
	. = ..()

/obj/item/implanter/update_icon()

	icon_state = initial(icon_state)

	if(stored_implant)
		icon_state = "[icon_state]_1"

	return ..()

/obj/item/implanter/New(var/desired_loc)
	. = ..()
	if(stored_implant)
		name = "[initial(name)] ([initial(stored_implant.name)])"
	update_sprite()


/obj/item/implanter/get_examine_details_list(var/mob/examiner)
	. = ..()
	. += div("notice","详细说明：[initial(stored_implant.desc_extended)]")

/obj/item/implanter/click_on_object(var/mob/activator as mob,var/atom/object,location,control,params)

	if(activator != object || !is_advanced(activator))
		return ..()

	INTERACT_CHECK
	INTERACT_CHECK_OBJECT
	INTERACT_DELAY(5)

	if(!stored_implant)
		activator.to_chat(span("warning","[src.name]内没有装载植入体！"))
		return TRUE

	var/mob/living/advanced/A = activator

	var/initial_id = initial(stored_implant.id)

	if(A.labeled_organs[initial_id])
		if(removes_existing)
			var/obj/item/organ/O = A.labeled_organs[initial_id]
			A.remove_organ(O,get_turf(A))
		else
			activator.to_chat(span("warning","你已经装有同类植入体了！"))
			return TRUE

	var/obj/item/organ/internal/implant/added_implant = A.add_organ(stored_implant)
	if(added_implant)
		activator.visible_message(span("notice","[activator.name]向自己的[added_implant.attached_organ.name]植入了某样东西。"),span("notice","你将[added_implant.name]植入了自己的[added_implant.attached_organ.name]。"))
		name = initial(name)
		stored_implant = null

	update_sprite()

	return TRUE

/obj/item/implanter/head/
	name = "头部植入器"

/obj/item/implanter/head/iff
	stored_implant = /obj/item/organ/internal/implant/hand/left/iff/nanotrasen
	removes_existing = FALSE
	value_burgerbux = 1

	rarity = RARITY_LEGENDARY
	can_save = FALSE

/obj/item/implanter/torso
	name = "躯干植入器"

/obj/item/implanter/torso/od_purge
	stored_implant = /obj/item/organ/internal/implant/torso/od_purge
	removes_existing = TRUE
	value = 1000

/obj/item/implanter/torso/death_alarm
	stored_implant = /obj/item/organ/internal/implant/torso/death_alarm
	removes_existing = TRUE
	value = 500
