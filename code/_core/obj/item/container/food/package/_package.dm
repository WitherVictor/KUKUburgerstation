/obj/item/container/edible/package
	name = "包装食品"
	desc = "能拿在手里的可食用物质。"
	desc_extended = "可以食用。"

	scale_sprite = FALSE

	var/obj/item/trash/packaging //The object created when you unwrap it.
	var/obj/item/trash/trash //The object created when there is nothing left to eat from it.

/obj/item/container/edible/package/on_consumed(var/mob/activator,var/mob/living/target) //When there are no reagents left.

	var/obj/hud/inventory/I

	if(is_inventory(src.loc))
		I = src.loc

	. = ..()

	if(trash)
		var/obj/item/trash/T = create_trash(activator)
		if(I) I.add_object(T,silent=TRUE)
		trash = null

	return TRUE

/obj/item/container/edible/package/proc/create_trash(var/mob/activator)
	var/obj/item/trash/T = new trash(get_turf(activator))
	INITIALIZE(T)
	GENERATE(T)
	FINALIZE(T)
	return T

/obj/item/container/edible/package/proc/create_packaging(var/mob/activator)
	var/obj/item/trash/T = new packaging(get_turf(activator))
	INITIALIZE(T)
	GENERATE(T)
	FINALIZE(T)
	return T


/obj/item/container/edible/package/feed(var/mob/activator,var/mob/living/target)

	if(packaging)
		activator.to_chat(span("warning","你得先拆开[src.name]的包装才能吃！"))
		return FALSE

	return ..()


/obj/item/container/edible/package/proc/unwrap(var/mob/activator,var/obj/hud/inventory/I)

	var/obj/item/trash/T = create_packaging(activator)

	activator.visible_message(span("notice","[activator.name]拆开了[src.name]的包装。"),span("notice","你拆开了[src.name]的包装。"))

	if(I)
		I.add_object(T)

	packaging = null

	return TRUE


/obj/item/container/edible/package/clicked_on_by_object(var/mob/activator,var/atom/object,location,control,params)

	if(is_inventory(object) && packaging)
		INTERACT_CHECK
		INTERACT_CHECK_OBJECT
		INTERACT_DELAY(5)
		unwrap(activator,object)
		return TRUE

	return ..()
