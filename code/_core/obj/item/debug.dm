/obj/item/runtime
	name = "世界的破绽"
	desc = "天啊，卧槽。"
	desc_extended = "这他妈是什么？你怎么拿到的？回答我。"
	value = -1

/obj/item/runtime/click_self(var/mob/caller)
	INTERACT_CHECK
	INTERACT_DELAY(10)
	ASSERT(null) //Force a fake error.
	return TRUE


/obj/item/runtime/click_on_object(var/mob/caller as mob,var/atom/object,location,control,params)

	log_debug("caller: [caller.get_debug_name()].")
	log_debug("object: [object.get_debug_name()].")

	return TRUE

/obj/item/runtime/clicked_on_by_object(var/mob/caller as mob,var/atom/object,location,control,params)

	log_debug("caller: [caller.get_debug_name()].")
	log_debug("object: [object.get_debug_name()].")

	return TRUE
