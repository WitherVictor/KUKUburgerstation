/obj/item/tempering
	name = "强化用品"
	icon = 'icons/obj/item/tempering.dmi'
	icon_state = "error"

	var/obj/item/temper_whitelist //Type

	var/increase = 5

	var/minimum = 100
	var/maximum = 200

	var/uses_left = 1 //How many times can this object be used to improve something? Set to -1 for infinity.

	rarity = RARITY_UNCOMMON

/obj/item/tempering/save_item_data(var/mob/living/advanced/player/P, var/save_inventory=TRUE, var/died=FALSE,var/loadout=FALSE)
	RUN_PARENT_SAFE
	SAVEVAR("uses_left")

/obj/item/tempering/load_item_data_post(var/mob/living/advanced/player/P, var/list/object_data,var/loadout=FALSE)
	RUN_PARENT_SAFE
	LOADVAR("uses_left")

/obj/item/tempering/get_examine_list(var/mob/examiner)
	. = ..()
	. += span("notice","使用ALT+单击可跳过确认提示，并可对带有储物空间的物品使用。")
	if(uses_left == -1)
		. += span("notice","使用次数<b>无限</b>。")
	else if(uses_left <= 0)
		. += span("warning","使用次数已耗尽。")
	else
		. += span("notice","还可使用<b>[uses_left]</b>次。")

/obj/item/tempering/click_on_object(var/mob/activator,var/atom/object,location,control,params)

	if(is_item(object))
		INTERACT_CHECK
		INTERACT_CHECK_OBJECT
		if(activator.attack_flags & CONTROL_MOD_DISARM)
			if(can_temper(activator,object))
				on_temper(activator,object)
			return TRUE
		else if(!is_inventory(object))
			if(can_temper(activator,object))
				var/list/choices = list("是"="Yes","否"="No","取消"="Cancel")
				var/choice = input("确定要强化[object.name]吗？","下次使用ALT+单击可跳过确认") as null|anything in choices
				if(choice && choices[choice] == "Yes")
					INTERACT_CHECK
					INTERACT_CHECK_OBJECT
					on_temper(activator,object)
					return TRUE

	. = ..()

/obj/item/tempering/proc/can_temper(var/mob/activator,var/obj/item/I)

	//Check if there are uses.
	if(uses_left != -1 && uses_left <= 0)
		activator.to_chat(span("warning","[src.name]的使用次数已耗尽！"))
		return FALSE

	//Check if the object can save.
	if(!I.can_save)
		activator.to_chat(span("warning","无法用[src.name]强化[I.name]！请尝试强化这套服装的主体部分。"))
		return FALSE

	//Check the type.
	var/is_valid_object = FALSE
	if(islist(temper_whitelist))
		for(var/k in temper_whitelist)
			if(!istype(I,k))
				continue
			is_valid_object = TRUE
			break
	else if(istype(I,temper_whitelist))
		is_valid_object = TRUE

	if(!is_valid_object)
		activator.to_chat(span("warning","无法用[src.name]强化[I.name]！"))
		return FALSE

	return TRUE

/obj/item/tempering/proc/on_temper(var/mob/activator,var/obj/item/I)

	activator.visible_message(
		span("notice","[activator.name]用[src.name]强化了[I.name]。"),
		span("notice","你用[src.name]强化了[I.name]。")
	)

	if(is_clothing(I))
		var/obj/item/clothing/C = I
		C.sync_additional_clothing()

	if(uses_left > 0)
		uses_left--
		if(uses_left <= 0)
			qdel(src)

	return TRUE


