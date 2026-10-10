/obj/item/fertilizer
	name = "长得旺肥料"
	desc = "银河系最好的太空时代肥料。"
	desc_extended = "一大袋强效速生肥料，足以为一平方米地面铺上肥沃土壤。"
	icon = 'icons/obj/item/fertilizer.dmi'
	icon_state = "inventory"

	var/uses_left = 1
	var/turf/simulated/turf_type = /turf/simulated/floor/colored/dirt/soil/rich

	value = 200

	rarity = RARITY_UNCOMMON

/obj/item/fertilizer/get_base_value()
	. = ..()
	return 20 + . * uses_left

/obj/item/fertilizer/save_item_data(var/mob/living/advanced/player/P,var/save_inventory = TRUE,var/died=FALSE,var/loadout=FALSE)
	RUN_PARENT_SAFE
	SAVEVAR("uses_left")

/obj/item/fertilizer/load_item_data_pre(var/mob/living/advanced/player/P,var/list/object_data,var/loadout=FALSE)
	RUN_PARENT_SAFE
	LOADVAR("uses_left")

/obj/item/fertilizer/Finalize()
	. = ..()
	update_sprite()

/obj/item/fertilizer/update_icon()
	. = ..()
	icon_state = initial(icon_state)
	if(uses_left <= 0)
		icon_state = "[icon_state]_empty"


/obj/item/fertilizer/click_on_object(var/mob/activator,var/atom/object,location,control,params)

	if(istype(object,/obj/structure/interactive/plant))
		object = object.loc

	if(!istype(object,/turf/simulated/floor/))
		return ..()

	INTERACT_CHECK
	INTERACT_DELAY(10)

	if(uses_left <= 0)
		activator.to_chat(span("warning","肥料已经用完了！"))
		return TRUE

	if(ispath(object.type,turf_type))
		activator.to_chat(span("notice","这块地面已经有土壤了！"))
		return TRUE

	var/turf/simulated/floor/T = object
	var/old_type = T.type

	activator.visible_message(span("notice","[activator.name]将[src.name]倒在[T.name]上，铺出了一层土壤。"))

	T.change_turf(turf_type)
	T.destruction_turf = old_type

	uses_left--

	value = get_base_value()

	update_sprite()

	return TRUE

