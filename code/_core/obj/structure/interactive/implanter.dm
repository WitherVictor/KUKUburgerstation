/obj/structure/interactive/hand_implanter
	name = "手部植入机"
	desc = "把手伸进去就行！"
	desc_extended = "一台企业级手部植入机。据说能自动为使用者的左手安装植入体。"
	icon = 'icons/obj/structure/scanner.dmi'
	icon_state = "hand"
	pixel_x = -4
	pixel_y = 4

	var/obj/item/organ/internal/stored_implant

	var/removes_existing = FALSE
	var/should_save_on_implant = FALSE

/obj/structure/interactive/hand_implanter/New(var/desired_loc)
	. = ..()
	if(stored_implant)
		name = "[initial(name)]（[initial(stored_implant.name)]）"


/obj/structure/interactive/hand_implanter/clicked_on_by_object(var/mob/activator,var/atom/object,location,control,params)

	if(!is_advanced(activator))
		return ..()

	INTERACT_CHECK
	INTERACT_CHECK_OBJECT
	INTERACT_DELAY(5)

	if(!stored_implant)
		activator.to_chat(span("warning","尚未装载植入体！"))
		return TRUE

	var/mob/living/advanced/A = activator

	var/initial_id = initial(stored_implant.id)

	if(A.labeled_organs[initial_id])
		if(removes_existing)
			var/obj/item/organ/O = A.labeled_organs[initial_id]
			if(O.type == stored_implant)
				activator.to_chat(span("warning","你已经有这种植入体了！"))
				return TRUE
			A.remove_organ(O,get_turf(A),TRUE)
		else
			activator.to_chat(span("warning","你已经有这种植入体了！"))
			return TRUE

	var/obj/item/organ/internal/implant/added_implant = A.add_organ(stored_implant)
	if(added_implant)
		activator.visible_message(span("notice","[activator.name]把某样东西植入了自己的[added_implant.attached_organ.name]。"),span("notice","你把[added_implant.name]植入了自己的[added_implant.attached_organ.name]。"))
		if(should_save_on_implant && is_player(A) && A.ckey_last)
			var/savedata/client/mob/mobdata = MOBDATA(A.ckey_last)
			if(mobdata) mobdata.save_character(A)
	else
		activator.to_chat(span("danger","安装植入体时发生了错误。"))

	return TRUE

/obj/structure/interactive/hand_implanter/IFF
	stored_implant = /obj/item/organ/internal/implant/hand/left/iff/nanotrasen

/obj/structure/interactive/hand_implanter/IFF/save
	should_save_on_implant = TRUE
	removes_existing = TRUE
