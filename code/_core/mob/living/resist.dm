/mob/living/proc/can_resist(var/messages = TRUE)

	if(dead)
		if(messages) to_chat(span("warning","死后无法挣扎！"))
		return FALSE

	if(health?.stamina_current < 20)
		if(messages) to_chat(span("warning","你太疲惫了，无法挣扎！"))
		return FALSE

	if(has_status_effects(STAMCRIT,PARALYZE,SLEEP,PARRIED,FATIGUE,STUN))
		if(messages) to_chat(span("warning","你目前的状态无法挣扎！"))
		return FALSE

	return TRUE

/mob/living/proc/resist() //Return TRUE means you can resist. //Return FALSE means you can't resist

	if(next_resist > world.time)
		return FALSE

	if(!src.can_resist())
		next_resist = max(next_resist,world.time + 5) //Prevents spam.
		return FALSE

	if(grabbing_hand && grabbing_hand.owner)
		var/mob/living/advanced/attacker = grabbing_hand.owner

		var/src_power = src.get_attribute_power(ATTRIBUTE_STRENGTH,0.25,1,2)*5
		var/attacker_power = !attacker.dead ? attacker.get_attribute_power(ATTRIBUTE_STRENGTH,0,1)*10*grabbing_hand.grab_level : 0

		if(src.client && !allow_hostile_action(src.loyalty_tag,attacker))
			attacker_power = 0
			src_power = 100
		else if(attacker.horizontal && !src.horizontal)
			attacker_power *= 0.25
		else if(!attacker.horizontal && src.horizontal)
			src_power *= 0.25

		if(is_organ(grabbing_hand.loc))
			var/obj/item/organ/O = grabbing_hand.loc
			if(O.health && O.health.health_max > 0)
				attacker_power *= max(0,O.health.health_current/O.health.health_max)
				if(O.broken) attacker_power *= 0.25

		grab_difficulty = max((attacker_power - src_power)*2,1)

		if(grab_resist_counter >= grab_difficulty)
			src.visible_message(
				span("danger","[src.name]挣脱了[attacker.name]的抓握！"),
				span("warning","你挣脱了[attacker.name]的抓握！")
			)
			if(grabbing_hand)
				grabbing_hand.release_object()
				if(grabbing_hand.grab_level <= 1)
					attacker.add_status_effect(STAGGER,20,20,source=src)
				else
					attacker.add_status_effect(STUN,30,30,source=src)
			else
				attacker.add_status_effect(STUN,30,30,source=src)
			if(attacker.health)
				attacker.health.adjust_stamina(-src_power*4)
		else
			src.visible_message(
				span("danger","[src.name]试图挣脱[attacker.name]的抓握！"),
				span("warning","你试图挣脱！"),
			)
			if(attacker.health)
				attacker.health.adjust_stamina(-src_power) //Attacker needs the strength to resist too.
			grab_resist_counter += 1
			health.adjust_stamina(-attacker_power)
			next_resist = max(next_resist,world.time + 5)

		stat_elements_to_update |= stat_elements["resist"]

		return FALSE

	else if(on_fire)
		var/stacks_to_remove = 0
		if(horizontal)
			stacks_to_remove = min(fire_stacks,100)
			src.visible_message(
				span("warning","[src.name]在地上翻滚！"),
				span("danger","你迅速在地上翻滚！"),
			)
		else
			stacks_to_remove = min(fire_stacks,25)
			src.visible_message(
				span("warning","[src.name]迅速拍打身上的火焰！"),
				span("danger","你迅速拍打身上的火焰！"),
			)
		adjust_fire_stacks(-stacks_to_remove)
		health.adjust_stamina(-5)
		if(fire_stacks > 0)
			next_resist = max(next_resist,world.time + 15)

		stat_elements_to_update |= stat_elements["resist"]

		return FALSE

	else if(has_status_effect(REST))
		rest()
		return FALSE

	return TRUE

/mob/living/proc/get_resist_percent()
	if(grabbing_hand && grabbing_hand.owner)
		if(grab_difficulty <= 0)
			return -1
		return clamp(grab_resist_counter/grab_difficulty,0,1)
	if(on_fire)
		return clamp(1 - fire_stacks/fire_stacks_max,0,1)
	return -1

/mob/living/proc/rest()
	if(dead)
		to_chat(span("warning","你已经在休息了……安息吧。"))
		return FALSE
	if(STATUS_EFFECT_DURATION(src,REST) == -1)
		PROGRESS_BAR(src,src,3,src::remove_status_effect(),REST)
	else
		add_status_effect(REST,-1,-2, force = TRUE)
	return TRUE

/mob/living/advanced/resist()

	. = ..()

	if(. && handcuffed && !grabbing_hand)

		var/counter_to_add = src.get_attribute_power(ATTRIBUTE_STRENGTH,0.5,1,2)*10*(client ? 3 : 1)

		if(stored_handcuffs && stored_handcuffs.strength)
			counter_to_add *= (1/stored_handcuffs.strength)

		if(intent == INTENT_HARM)
			counter_to_add *= 3
			src.visible_message(
				span("danger","[src.name]试图挣脱手铐！"),
				span("danger","你毫不掩饰地试图挣脱手铐！")
			)
		else
			to_chat(span("warning","你试图悄悄挣脱手铐……"))

		handcuff_break_counter += counter_to_add
		health.adjust_stamina(-20)

		switch(handcuff_break_counter)
			if(0 to 25)
				src.to_chat(span("warning","……手铐相当牢固。"))
			if(25 to 50)
				src.to_chat(span("warning","……手铐有些松动了。"))
			if(50 to 75)
				src.to_chat(span("warning","……手铐开始撑不住了！"))
			if(75 to 99)
				src.to_chat(span("warning","……手铐已经很脆弱，随时可能断开！"))
			else
				src.set_handcuffs(FALSE)
				src.visible_message(
					span("danger","[src.name]挣断了手铐！"),
					span("danger","你挣断了手铐！")
				)


