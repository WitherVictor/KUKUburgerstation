/obj/item/proc/try_strip(var/mob/activator)
	if(!can_strip(activator,TRUE))
		return FALSE
	PROGRESS_BAR(activator,src,5,src::strip(),activator)
	PROGRESS_BAR_CONDITIONS(activator,src,src::can_strip(),activator,TRUE)
	return TRUE

/obj/item/proc/strip(var/mob/activator)

	var/atom/old_loc = src.loc

	if(activator && src.loc && is_advanced(src.loc.loc))
		activator.visible_message(
			span("notice","[activator.name]从[src.loc.loc]身上取下了[src.name]。"),
			span("notice","你取下了[src.name]。")
		)

	drop_item(get_turf(src))

	if(!src.qdeleting && activator && is_advanced(activator))
		var/mob/living/advanced/A = activator
		A.put_in_hands(src)
		A.on_strip(src,old_loc)

	return TRUE

/obj/item/proc/can_strip(var/mob/activator,var/messages=FALSE)

	INTERACT_CHECK_NO_DELAY(src)

	if(!istype(loc,/obj/hud/inventory/organs/))
		if(messages) activator.to_chat(span("warning","物品已经不在那里了！"))
		return FALSE

	var/obj/hud/inventory/I = loc
	if(I.ultra_persistant)
		if(messages) activator.to_chat(span("warning","你无法取下它！"))
		return FALSE

	if(!is_living(I.owner))
		if(messages) activator.to_chat(span("warning","目标已经不在那里了！"))
		return FALSE

	if(!is_living(activator))
		return FALSE

	var/mob/living/L = I.owner
	var/mob/living/CL = activator

	INTERACT_CHECK_OTHER(L)

	if(src.anchored)
		if(messages) activator.to_chat(span("warning","[I.name]牢牢固定在[L.name]身上！"))
		return FALSE

	if(L.ckey_owner == CL.ckey_owner) //Same ckey.
		if(L.loyalty_tag == CL.loyalty_tag) //Prevents joining as NanoTrasen and giving yourself stuff as antag.
			return FALSE
	else
		if(CL.loyalty_tag == "NanoTrasen")
			if(!allow_hostile_action(CL.loyalty_tag,L) && (!L.dead || is_player(L)))
				if(messages) activator.to_chat(span("warning","你不能取走友军的装备！"))
				return FALSE
		else
			if(!L.dead) //Others can only strip when dead.
				if(messages) activator.to_chat(span("warning","你只能取走死者的装备！"))
				return FALSE
			if(L.loyalty_tag == "NanoTrasen")
				if(messages) activator.to_chat(span("warning","你拒绝使用纳米传讯的劣质货！"))
				return FALSE

	if(L.horizontal) //Can strip someone if they're horizontal.
		return TRUE

	if(is_advanced(L))
		var/mob/living/advanced/A = L
		if(A.handcuffed) //Can strip someone if they're handcuffed.
			return TRUE

	if(!I.worn && L.dir & get_dir(CL,I)) //Allow removing of non-worn items from behind (pickpocketing).
		return TRUE

	if(messages) activator.to_chat(span("warning","[L.name]目前的状态不允许你取走装备！"))

	return FALSE
