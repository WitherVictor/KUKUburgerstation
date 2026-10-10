/obj/hud/inventory/proc/grab_object(var/mob/activator as mob,var/atom/movable/object,location,control,params)

	if(src.qdeleting || activator.qdeleting)
		return FALSE

	if(activator == object)
		activator.to_chat(span("notice","你不能抓住自己，规则禁止色情角色扮演！"))
		return FALSE

	if(!ismovable(object) || !object.can_be_grabbed(activator))
		return FALSE

	if(!is_turf(activator.loc))
		return FALSE

	if(grabbed_object) //We already are grabbing something.
		if(grabbed_object == object)
			if(is_living(grabbed_object))
				return reinforce_grab(activator)
			else
				release_object(activator)
				return TRUE
		release_object(activator) //Release the old object, if any.

	if(is_occupied())
		activator.to_chat(span("notice","你需要空出一只手才能抓住它！"))
		return FALSE

	if(get_dist(activator,object) > 1)
		if(next_move > 0 || !activator.Move(get_step(activator.loc,get_dir(activator,object))))
			activator.to_chat(span("notice","你离得太远了！"))
			return FALSE

	if(object.grabbing_hand) //Someone else is grabbing already.
		if(object.grabbing_hand.grab_level >= 2)
			activator.to_chat(span("warning","[object.grabbing_hand.owner.name]把[object.name]抓得太紧了！"))
			return FALSE
		else
			object.grabbing_hand.release_object(activator) //Steal the grab.

	if(!object) //Possible race condition?
		return FALSE

	activator.set_dir(get_dir(activator,object))
	grabbed_object = object
	grabbed_object.grabbing_hand = src
	grab_time = world.time //To prevent instant agressive grab

	overlays.Cut()
	update_overlays()

	if(is_living(grabbed_object))
		var/mob/living/L = grabbed_object
		L.handle_transform()
		L.resist() //Forces hud update.
		if(is_living(activator))
			var/mob/living/LC = activator
			if(LC.has_status_effect(BUFF))
				reinforce_grab(activator,force=TRUE) //Instant reinforced grab.

	HOOK_CALL_ADV("grab_changed",owner,args)

	activator.visible_message(span("warning","[activator.name]抓住了[object.name]。"),span("notice","你抓住了[object.name]。"))

	return TRUE

/obj/hud/inventory/proc/check_grab()

	if(!grabbed_object)
		return FALSE

	if(is_living(owner))
		var/mob/living/L = owner

		if(L.dead || L.qdeleting)
			release_object(owner)
			return FALSE

		if(is_living(grabbed_object) && L.ai)
			var/mob/living/G = grabbed_object
			if(G.dead)
				release_object(owner)
				return FALSE

	if(!grabbed_object.can_be_grabbed(owner) || !can_grab(owner,grabbed_object))
		release_object(owner)
		return FALSE

	return TRUE

/obj/hud/inventory/proc/release_object(var/mob/activator)
	if(!grabbed_object)
		return FALSE
	if(activator && owner)
		if(activator == owner)
			activator.to_chat(span("notice","你松开了[grabbed_object.name]。"))
		else
			owner.visible_message(
				span("danger","[activator.name]迫使[owner.name]松开了[grabbed_object.name]！"),
				span("danger","[activator.name]迫使你松开了[grabbed_object.name]！")
			)
	var/mob/living/L
	if(is_living(grabbed_object))
		L = grabbed_object
	grabbed_object.grabbing_hand = null
	grabbed_object = null
	grab_level = 1
	overlays.Cut()
	update_overlays()
	if(L)
		L.handle_transform()
	if(owner) HOOK_CALL_ADV("grab_changed",owner,args)
	return TRUE

/obj/hud/inventory/proc/can_grab(var/mob/activator,var/atom/movable/object)

	if(!object || !activator || object.qdeleting || activator.qdeleting)
		return FALSE

	if(!activator.loc || !is_turf(activator.loc) || !object.loc || !is_turf(object.loc))
		return FALSE

	if(get_dist(activator,object) >= 2)
		return FALSE

	return TRUE

/obj/hud/inventory/proc/reinforce_grab(var/mob/living/activator,var/force=FALSE)

	if(!grabbed_object)
		CRASH("Tried calling reinforce_grab without a grabbed object!")

	if(qdeleting || activator.qdeleting || grabbed_object.qdeleting)
		return FALSE

	if(!force && world.time <= grab_time+SECONDS_TO_DECISECONDS(2)) //Prevents insta agressive-grab
		return FALSE

	if(grab_level > 1)
		return FALSE

	var/mob/living/grabbed_living = grabbed_object

	if(!allow_hostile_action(activator.loyalty_tag,grabbed_living))
		return FALSE

	var/turf/T = grabbed_object.loc

	if(!T || !is_turf(T))
		return FALSE

	activator.visible_message(
		span("warning","[activator.name]把[grabbed_living.name]抓得更紧了！"),
		span("warning","你把[grabbed_living.name]抓得更紧了！")
	)

	grab_level = 2 //Agressive grab
	grab_time = world.time
	grabbed_living.add_status_effect(DISARM)
	grabbed_living.handle_transform()

	if(activator.next_move <= 0)
		activator.Move(T)

	update_overlays() //Changing the appearance of the inventory.

	return TRUE
