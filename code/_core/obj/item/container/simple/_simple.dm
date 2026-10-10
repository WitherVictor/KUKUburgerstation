/obj/item/container/simple/
	var/initial_reagent = null

/obj/item/container/simple/quick(var/mob/activator,var/atom/object,location,params)
	return try_transfer_reagents(activator,activator,location,null,params)

/obj/item/container/simple/get_consume_verb()
	return "drink" //this

/obj/item/container/simple/get_consume_sound()
	return 'sound/items/consumables/drink.ogg'

/obj/item/container/simple/click_on_object(var/mob/activator,var/atom/object,location,control,params)

	if(allow_reagent_transfer_to && istype(object,/obj/item/weapon/melee))
		var/obj/item/weapon/melee/M = object
		if(!M.reagents)
			activator.to_chat(span("warning","无法给[M.name]涂上液体！"))
			return FALSE
		var/reagent_transfer = min(5,reagents.volume_current)
		if(reagent_transfer <= 0)
			activator.to_chat(span("warning","[src.name]已经空了！"))
			return TRUE
		if(M.reagents.volume_current >= M.reagents.volume_max)
			activator.to_chat(span("warning","[M.name]已经涂满液体了！"))
			return TRUE
		reagents.transfer_reagents_to(M.reagents,reagent_transfer, activator = activator)
		activator.visible_message(span("warning","[activator.name]将[src.name]中的液体涂到了[M.name]上。"),span("notice","你小心地将[src.name]中的液体涂到了[M.name]上。"))
		return TRUE

	. = ..()

/obj/item/container/simple/click_self(var/mob/activator,location,control,params)

	if(allow_reagent_transfer_to || allow_reagent_transfer_from)
		INTERACT_CHECK
		INTERACT_DELAY(1)
		if(activator.attack_flags & CONTROL_MOD_DISARM)
			var/choice = input("每次要转移多少单位？","最少：1，最多：[reagents.volume_max]") as null|num
			INTERACT_CHECK
			if(choice)
				transfer_amount = clamp(choice,1,reagents.volume_max)
				transfer_amount = CEILING(transfer_amount,1)
				activator.to_chat(span("notice","你现在每次用[src]转移[transfer_amount]单位。"))
			return TRUE

		var/initial_amount = initial(transfer_amount)

		transfer_amount += initial_amount
		if(transfer_amount > reagents.volume_max)
			transfer_amount = initial_amount

		activator.to_chat(span("notice","你现在每次用[src]转移[transfer_amount]单位。"))

		return TRUE

	. = ..()


/obj/item/container/simple/Generate()
	. = ..()
	if(initial_reagent)
		reagents.add_reagent(initial_reagent,reagents.volume_max)
