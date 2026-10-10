/obj/item/container/syringe
	name = "注射器"
	desc = "想在人身上扎洞又不惹麻烦时用得上。"
	desc_extended = "将化学物质直接注入血液，以提高效果，但使用时会损耗耐久。可在注射和抽取模式之间切换。"
	crafting_id = "syringe"

	reagents = /reagent_container/syringe/

	var/inject_amount_desired = 5
	var/inject_amount_precision = 1
	var/injecting = FALSE
	var/spam_fix_time = 0

	//Has special snowflake code that handles this. Don't change these.
	allow_reagent_transfer_to = FALSE
	allow_reagent_transfer_from = FALSE

	weight = 0.1

	var/injection_sound = null //Optional injection sound to use.
	var/injection_time = SECONDS_TO_DECISECONDS(2) //Time in deciseconds to take when performing an injection. Draws are double this. Self injections are half this.
	var/inject_amount_max = INFINITY //Set to a value other than infinity to add a hard limit to injections. Limit is then limited again by the reagent's container.
	var/can_inject = TRUE //Set to true if this can inject into other beings.
	var/can_draw = TRUE //Set to true if this can draw reagents from beings or objects.
	var/adjustable = TRUE //Set to true if the injection amount can change. Otherwise, uses inject_amount_max.
	var/stealthy = FALSE //Set to true if the injection doesn't alert the victim, other than the "tiny prick".
	var/quality_reduction_on_use = 15 //How much quality (out of 100) to take away per use.

	quality = 100

/obj/item/container/syringe/save_item_data(var/mob/living/advanced/player/P,var/save_inventory = TRUE,var/died=FALSE,var/loadout=FALSE)
	RUN_PARENT_SAFE
	if(adjustable)
		SAVEVAR("inject_amount_desired")
	if(can_inject && can_draw)
		SAVEVAR("injecting")

/obj/item/container/syringe/load_item_data_pre(var/mob/living/advanced/player/P,var/list/object_data,var/loadout=FALSE)
	RUN_PARENT_SAFE
	if(adjustable)
		LOADVAR("inject_amount_desired")
	if(can_inject && can_draw)
		LOADVAR("injecting")

/obj/item/container/syringe/mouse_wheel_on_object(var/mob/activator,delta_x,delta_y,location,control,params)

	if(!adjustable)
		return ..()

	INTERACT_CHECK

	var/fixed_delta = clamp(delta_y,-1,1)

	var/last_amount = inject_amount_desired

	inject_amount_desired += fixed_delta*inject_amount_precision
	inject_amount_desired = CEILING(inject_amount_desired,inject_amount_precision)
	if(inject_amount_desired > inject_amount_max)
		inject_amount_desired = inject_amount_max
	else if(inject_amount_desired < inject_amount_precision)
		//Cannot go lower
		inject_amount_desired = inject_amount_precision

	//Normal operation.
	if(last_amount != inject_amount_desired)
		if(spam_fix_time <= world.time)
			activator.to_chat(span("notice","你将[src.name]的注射量上限调为[inject_amount_desired]单位……"))
		else
			activator.to_chat(span("notice","……[inject_amount_desired]单位……"))

	spam_fix_time = world.time + 20

/obj/item/container/syringe/Finalize()

	inject_amount_max = min(inject_amount_max,reagents.volume_max)

	if(!inject_amount_desired)
		inject_amount_desired = inject_amount_max

	if(!can_inject && !can_draw)
		log_error("LOGIC ERROR: Syringe [src.get_debug_name()] couldn't inject or draw reagents!")
	else if(!can_inject)
		injecting = FALSE
	else if(!can_draw)
		injecting = TRUE
	else if(!isnum(injecting) && can_inject && can_draw && !injecting && length(reagents.stored_reagents))
		injecting = TRUE
	else
		injecting = FALSE

	. = ..()

	inject_amount_desired = clamp(inject_amount_desired,1,reagents.volume_max)

	update_sprite()

/obj/item/container/syringe/click_self(var/mob/activator,location,control,params)

	if(can_inject && can_draw)
		INTERACT_CHECK
		INTERACT_DELAY(1)
		injecting = !injecting
		update_sprite()
		return TRUE

	. = ..()

/obj/item/container/syringe/proc/can_inject(var/mob/activator,var/atom/target)

	if(!activator || !target)
		return FALSE

	INTERACT_CHECK_NO_DELAY(src)
	INTERACT_CHECK_NO_DELAY(target)

	if(quality <= 0)
		activator.to_chat(span("warning","[src.name]损坏得太严重，无法使用！"))
		return FALSE

	if(!target.reagents)
		activator.to_chat(span("warning","你无法对[target.name]使用它！"))
		return FALSE

	if(injecting)
		if(reagents.volume_current <= 0)
			activator.to_chat(span("warning","[src.name]已经空了！"))
			return FALSE
	else
		if(reagents.volume_current >= reagents.volume_max)
			activator.to_chat(span("warning","[src.name]已经装满了！"))
			return FALSE

	if(is_living(activator))
		var/mob/living/attacker = activator

		var/mob/living/victim
		if(is_living(target))
			victim = target
		else if(is_living(target.loc))
			victim = target.loc

		if(victim != attacker)
			if(!allow_hostile_action(attacker.loyalty_tag,victim))
				if(injecting)
					if(reagents.contains_lethal)
						attacker.to_chat(span("warning","你的忠诚标记阻止你伤害[victim.name]！"))
						return FALSE
				else
					if(!victim.blood_type || !victim.blood_volume_max)
						attacker.to_chat(span("notice","[victim.name]体内没有可抽取的东西！"))
						return FALSE

					if((victim.blood_volume-inject_amount_desired)/victim.blood_volume_max < 0.9)
						attacker.to_chat(span("warning","你的忠诚标记阻止你伤害[victim.name]！"))
						return FALSE


	return TRUE

/obj/item/container/syringe/click_on_object(var/mob/activator as mob,var/atom/object,location,control,params)

	if(object.plane >= PLANE_HUD)
		return ..()

	var/atom/victim = object

	if(is_advanced(activator))
		var/mob/living/advanced/A = activator
		var/list/new_x_y = A.get_current_target_cords(params)
		params[PARAM_ICON_X] = new_x_y[1]
		params[PARAM_ICON_Y] = new_x_y[2]
		object = object.get_object_to_damage(activator,src,null,params,TRUE,TRUE)

	if(!object.reagents)
		return ..()

	INTERACT_CHECK
	INTERACT_CHECK_OBJECT
	INTERACT_DELAY(1)

	if(istype(object,/obj/item/container/))
		inject(activator,object,injecting ? inject_amount_desired : -inject_amount_desired)
		return TRUE

	if(can_inject(activator,object))

		var/self_inject = FALSE

		var/real_object_name = object.name
		if(victim != object)
			real_object_name = "[victim.name]的[object.name]"
			if(victim == activator)
				self_inject = TRUE

		var/transfer_amount = 0
		if(injecting)
			transfer_amount = inject_amount_desired
			if(!stealthy) activator.visible_message(span("danger","[activator.name]试图用[src.name]向[real_object_name]注射！"),span("warning","你试图用[src.name]向[real_object_name]注射。"))
		else
			transfer_amount = -inject_amount_desired
			if(!stealthy) activator.visible_message(span("danger","[activator.name]试图用[src.name]从[real_object_name]抽血！"),span("warning","你试图用[src.name]从[real_object_name]抽血。"))

		if(injection_time > 0)
			var/injection_time_to_use = injection_time
			if(self_inject)
				injection_time_to_use *= 0.5
			if(!injecting)
				injection_time_to_use *= 2
			PROGRESS_BAR(activator,src,injection_time_to_use,src::inject(),activator,object,transfer_amount)
			PROGRESS_BAR_CONDITIONS(activator,src,src::can_inject(),activator,object)
		else
			inject(activator,object,transfer_amount)


	return TRUE

/obj/item/container/syringe/proc/inject(var/mob/activator,var/atom/object,var/amount=5)

	if(amount < 0) //Draw
		if(is_organ(object)) //Targeting an organ.
			if(is_living(object.loc)) //We're drawing, so just draw blood from the owner instead.
				var/mob/living/L = object.loc
				L.draw_blood(activator,src,-amount)
			else
				activator.to_chat(span("warning","你似乎无法用[src]从[object]抽取任何东西！"))
		else if(is_living(object)) //Living object with blood, hopefully.
			var/mob/living/L = object
			L.draw_blood(activator,src,-amount)
		else if(object.reagents) //Non-organ object with reagents.
			var/transfer_amount = object.reagents.transfer_reagents_to(reagents,-amount, activator = activator)
			if(transfer_amount)
				activator.visible_message(span("warning","[activator.name]从[object.name]抽取了液体。"),span("notice","你从[object.name]抽取了[transfer_amount]单位液体。"))
		else
			activator.to_chat(span("warning","你似乎无法用[src.name]从[object.name]抽取任何东西！"))
		if(!injecting && reagents.volume_current >= reagents.volume_max && can_inject)
			injecting = TRUE
			update_sprite()


	else if(amount > 0) //Inject
		var/atom/object_to_inject = object
		if(is_organ(object_to_inject) && is_living(object_to_inject.loc)) //Targeting an organ. We're injecting into the blood stream.
			object_to_inject = object_to_inject.loc
		if(object_to_inject.reagents && object_to_inject.reagents.volume_current + amount <= object_to_inject.reagents.volume_max) //We're not too picky about what we inject.
			var/transfer_amount = reagents.transfer_reagents_to(object_to_inject.reagents,amount, activator = activator)
			if(transfer_amount)
				if(injection_sound)
					play_sound(injection_sound,get_turf(src))
				activator.visible_message(span("warning","[activator.name]用[src.name]向[object.name]注入了液体。"),span("notice","你向[object.name]注入了[transfer_amount]单位液体。"))
		else
			activator.to_chat(span("warning","你似乎无法用[src.name]向[object.name]注射！"))
		if(injecting && reagents.volume_current <= 0 && can_draw)
			injecting = FALSE
			update_sprite()


	if(is_organ(object))
		var/obj/item/organ/O = object
		if(O.health && O.health.organic)
			var/mob/living/L = is_living(O.loc) ? O.loc : null
			L?.to_chat(span("warning","你的[O.name]感到轻微的针刺。"))
			var/damage_to_deal = quality > 50 ? 0 : min(1 - quality/100,1)*20
			if(damage_to_deal > 0 && object.health?.adjust_loss_smart(brute=damage_to_deal*0.25,pain=damage_to_deal,organic=TRUE,robotic=FALSE) && O.send_pain_response(10) && !stealthy)
				L?.to_chat(span("danger","[src.name]粗糙的针头扎得很疼！"))
		adjust_quality(-quality_reduction_on_use)
	else if(is_living(object))
		var/mob/living/L = object
		if(L.health && L.health.organic)
			L.to_chat(span("warning","你感到轻微的针刺。"))
			var/damage_to_deal = quality > 50 ? 0 : min(1 - quality/100,1)*20
			if(damage_to_deal > 0 && L.health.adjust_loss_smart(brute=damage_to_deal*0.25,pain=damage_to_deal,organic=TRUE,robotic=FALSE) && L.send_pain_response(10) && !stealthy)
				L.to_chat(span("danger","[src.name]粗糙的针头扎得很疼！"))
		adjust_quality(-quality_reduction_on_use)

	return FALSE
