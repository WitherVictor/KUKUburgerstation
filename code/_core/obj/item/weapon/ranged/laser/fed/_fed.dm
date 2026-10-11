/obj/item/weapon/ranged/energy/fed  //I mean, you basically just feed it shit?
	charge_cost = 10
	battery = /obj/item/powercell/dummy

	var/charge_per_feed = 100
	var/action_name = "feed"
	var/fed_item = null
	var/feed_delay = 1

/obj/item/weapon/ranged/energy/fed/clicked_on_by_object(var/mob/activator,var/atom/object,location,control,params)

	if(is_item(object))
		if(istype(object,fed_item))
			INTERACT_CHECK
			INTERACT_CHECK_OBJECT
			INTERACT_DELAY(5)
			battery.charge_current += charge_per_feed
			activator.to_chat(span("notice","你为[src.name]补充了能量。"))
			qdel(object)
			return
		else
			activator.to_chat(span("warning","不能用这个补充能量！"))
			return FALSE

	if(is_item(object))
		var/obj/item/I = object
		if(I.flags_tool & FLAG_TOOL_CROWBAR)
			INTERACT_CHECK
			INTERACT_CHECK_OBJECT
			INTERACT_DELAY(5)
			if(battery)
				activator.to_chat(span("warning","你无法撬出[battery.name]。"))
			else
				activator.to_chat(span("warning","[src.name]里没有可撬出的东西！"))
			return TRUE

	. = ..()
