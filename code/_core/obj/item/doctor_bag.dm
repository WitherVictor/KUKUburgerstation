/obj/item/doctor_bag
	name = "医生医疗包"
	desc = "别乱动！"
	desc_extended = "一套先进的手术工具与通用医疗设备，助你胜任医生职责。\
	可治疗目标部位的外伤与烧伤；治疗强度和耗时受医疗技能及工具状态影响，目标躺下时效果更好。不能用于自我治疗。担任医生时，治疗其他玩家可赚取信用点。点击医疗包即可切换单个部位和全身治疗模式。"
	icon = 'icons/obj/item/doctor_bag.dmi'
	icon_state = "inventory"

	value = 1 //generated

	var/organic = TRUE
	var/heal_all_limbs = FALSE

	var/heal_brute = 20 //At 100 medicine.
	var/heal_burn = 20 //At 100 medicine.

	var/heal_brute_percent = 5 //At 100 medicine.
	var/heal_burn_percent = 5 //At 100 medicine.

	var/base_delay = SECONDS_TO_DECISECONDS(1)
	var/added_delay = SECONDS_TO_DECISECONDS(5) //At 0 medicine. Gets reduced to 0 at 100 medicine.

	rarity = RARITY_RARE

	size = SIZE_3

	quality = 100

	uses_until_condition_fall = 1

/obj/item/doctor_bag/get_base_value()
	. = 100 + ((heal_burn+heal_brute)*10 + (heal_brute_percent + heal_burn_percent)*40) * (SECONDS_TO_DECISECONDS(6) / (base_delay + added_delay*0.5)) * 1.5
	. = FLOOR(.,100)

/obj/item/doctor_bag/click_self(var/mob/activator,location,control,params)

	INTERACT_CHECK
	INTERACT_DELAY(1)

	heal_all_limbs = !heal_all_limbs
	if(heal_all_limbs)
		activator.to_chat(span("notice","你决定同时治疗全身，但单个部位的治疗效果会减弱。"))
	else
		activator.to_chat(span("warning","你决定集中治疗单个部位。"))

	return TRUE

/obj/item/doctor_bag/click_on_object(var/mob/activator,var/atom/object,location,control,params)

	if(is_living(object) && is_living(activator))
		var/mob/living/doctor_mob = activator
		var/mob/living/treating_mob = object
		if(doctor_mob == treating_mob)
			activator.to_chat(span("warning","手术操作太复杂了，无法用于自我治疗！"))
			return TRUE

		if(!heal_all_limbs && is_advanced(activator))
			var/mob/living/advanced/A = activator
			var/list/new_x_y = A.get_current_target_cords(params)
			params[PARAM_ICON_X] = new_x_y[1]
			params[PARAM_ICON_Y] = new_x_y[2]
			object = object.get_object_to_damage(activator,src,null,params,TRUE,TRUE)

		if(can_be_treated(activator,object))
			INTERACT_CHECK
			INTERACT_CHECK_OBJECT
			activator.visible_message(
				span("notice","[activator]开始治疗[is_living(object.loc) ? "[object.loc]的" : ""][object]……"),
				span("notice","你开始治疗[object]。")
			)
			PROGRESS_BAR(activator,src,SECONDS_TO_DECISECONDS(3),src::treat(),activator,object) //Takes 3 seconds to get started.
			PROGRESS_BAR_CONDITIONS(activator,src,src::can_be_treated(),activator,object)

		return TRUE

	. = ..()


/obj/item/doctor_bag/proc/can_be_treated(var/mob/living/activator,var/atom/target)

	INTERACT_CHECK_NO_DELAY(src)
	INTERACT_CHECK_NO_DELAY(target)

	if(!target.health)
		activator.to_chat(span("warning","你无法治疗[target]！"))
		return FALSE

	var/mob/living/actual_target
	if(is_living(target))
		actual_target = target
	else if(is_organ(target) && is_living(target.loc))
		actual_target = target.loc

	if(!actual_target || !allow_helpful_action(activator.loyalty_tag,actual_target))
		activator.to_chat(span("warning","你无法治疗[target]！"))
		return FALSE

	if(organic)
		if(!target.health.organic)
			activator.to_chat(span("warning","[src]只能治疗有机部位！"))
			return FALSE
	else
		if(target.health.organic)
			activator.to_chat(span("warning","[src]只能修理非有机部位！"))
			return FALSE

	if(target.health.damage[BRUTE] <= 0 && target.health.damage[BURN] <= 0)
		if(is_organ(target))
			var/obj/item/organ/O = target
			if(O.bleeding <= 0)
				activator.to_chat(span("notice","[O]已经不需要继续治疗了！"))
				return FALSE
		else
			activator.to_chat(span("notice","[target]已经不需要继续治疗了！"))
			return FALSE

	return TRUE



/**
 * Arguments:
 * * activator - Doctor doing the healing
 * * healed_atom - Either the mob or an organ of a mob we are attempting to treat.
 */
/obj/item/doctor_bag/proc/treat(mob/living/activator, atom/healed_atom)

	var/medicine_power = activator.get_skill_power(SKILL_MEDICINE,0,1,2) * (quality/100)

	var/mob/living/target_as_living
	if(is_organ(healed_atom) && is_living(healed_atom.loc))
		target_as_living = healed_atom.loc
	else
		target_as_living = healed_atom

	if(target_as_living == activator) //Self-treatment penalty.
		medicine_power *= 0.5

	if(!target_as_living.horizontal) //Not horizontal penalty.
		medicine_power *= 0.5

	if(heal_all_limbs && target_as_living) // If we are on the second healing mode, heal more broadly at a severe penalty.
		healed_atom = target_as_living
		medicine_power *= 0.25

	medicine_power = max(medicine_power,0.1)

	if(is_organ(healed_atom))
		var/obj/item/organ/O = healed_atom
		O.bleeding = max(0,O.bleeding - medicine_power) //Reduce bleeding.

	var/brute_to_heal = (-heal_brute*medicine_power) + (-heal_brute_percent*healed_atom.health.damage[BRUTE]*medicine_power)
	var/burn_to_heal = (-heal_burn*medicine_power) + (-heal_burn_percent*healed_atom.health.damage[BURN]*medicine_power)

	var/total_healed = 0
	if(brute_to_heal || burn_to_heal)
		total_healed += healed_atom.health.adjust_loss_smart(brute = brute_to_heal, burn = burn_to_heal,robotic=!organic,organic=organic)

	if(total_healed > 0 && is_player(activator) && !allow_hostile_action(activator.loyalty_tag,target_as_living))
		var/mob/living/advanced/player/P = activator
		var/experience_gain = total_healed*5
		P.add_skill_xp(SKILL_MEDICINE,CEILING(experience_gain,1))
		if(P.job && is_player(target_as_living))
			var/mob/living/advanced/player/target_as_player = target_as_living
			var/job/J = JOB(P.job)
			if(J && J.job_flags & FLAG_JOB_HEALING)
				var/income_multiplier = J.active_income_multiplier + J.active_income_multiplier_bonus*P.job_rank
				var/currency_gain = min(target_as_player.insurance,CEILING(total_healed*income_multiplier,1))
				if(currency_gain > 0)
					target_as_player.insurance -= currency_gain
					target_as_player.to_chat(span("notice","[P]为你治疗，已从你的医疗保险中扣除[currency_gain]信用点。"))
				currency_gain += CEILING(total_healed*0.25*income_multiplier,1) //Bonus
				var/currency_given = P.adjust_currency(currency_gain,silent=TRUE)
				if(currency_given > 0)
					P.to_chat(span("notice","你治疗了[target_as_player]，获得[currency_given]信用点报酬。"))

	if(reagents && !reagents.contains_lethal)
		var/reagent_transfer = min(10,reagents.volume_current)
		reagents.transfer_reagents_to(healed_atom.reagents,reagent_transfer, activator = activator)

	if(activator == target_as_living) //Self treatment.
		activator.visible_message(span("notice","[activator]治疗了自己的[healed_atom]。"),span("notice","你治疗了自己的[healed_atom]。"))
	else if(is_organ(healed_atom))
		activator.visible_message(span("warning","[activator]治疗了[target_as_living]的[healed_atom]。"),span("notice","你治疗了[target_as_living]的[healed_atom]。"))
	else
		activator.visible_message(span("warning","[activator]治疗了[healed_atom]。"),span("notice","你治疗了[healed_atom]。"))


	PROGRESS_BAR(activator,src,base_delay + max(0,added_delay*(1-medicine_power)),src::treat(),activator,healed_atom)
	PROGRESS_BAR_CONDITIONS(activator,src,src::can_be_treated(),activator,healed_atom)

	use_condition(1)

	return TRUE
