/mob/living/simple/bot/medibot
	name = "医疗机器人"
	desc = "我需要治疗。"
	desc_extended = "按程序救治伤患的医疗机器人。必要时也会自卫。"

	loyalty_tag = "NanoTrasen"
	iff_tag = "NanoTrasen"

	icon = 'icons/mob/living/simple/medibot.dmi'
	icon_state = "preview"

	ai = /ai/bot/medical/

	var/healing_threshold = 10
	var/amount_to_inject = 10

	var/overlay_icon = 'icons/obj/item/storage/kits.dmi'
	var/overlay_icon_state = "firstaid"

	var/list/medicine = list(
		BRUTE = /reagent/medicine/bicaridine,
		BURN = /reagent/medicine/kelotane,
		TOX = /reagent/medicine/dylovene,
		OXY = /reagent/iron
	)

	damage_type = /damagetype/npc/medibot

	health = /health/mob/living/inorganic

	stun_angle = 180

	var/advanced = FALSE //Set to true if this medibot can revive.

	level = 3

/mob/living/simple/bot/medibot/post_death()

	. = ..()

	var/obj/item/storage/kit/K = new(src.loc)
	K.icon = overlay_icon
	K.icon_state = overlay_icon_state
	INITIALIZE(K)
	GENERATE(K)
	FINALIZE(K)

	var/obj/item/analyzer/health/H = new(src.loc)
	INITIALIZE(H)
	GENERATE(H)
	FINALIZE(H)

	var/obj/item/device/proximity/P = new(src.loc)
	INITIALIZE(P)
	GENERATE(P)
	FINALIZE(P)

	qdel(src)

/mob/living/simple/bot/medibot/Finalize()
	. = ..()
	update_sprite()

/mob/living/simple/bot/medibot/update_icon()

	. =..()

	if(is_busy(src))
		icon_state = "yellow"
	else if(ai && ai.objective_attack)
		icon_state = "red"
	else
		icon_state = "blue"

/mob/living/simple/bot/medibot/update_underlays()

	. = ..()

	var/image/I = new(overlay_icon,overlay_icon_state)
	underlays += I

/mob/living/simple/bot/medibot/proc/get_inject_amount(var/mob/living/target)

	. = list()

	for(var/DT in medicine)
		var/loss = target.health.damage[DT]
		if(loss < healing_threshold)
			continue
		var/reagent/R = REAGENT(medicine[DT])
		var/existing_reagent_amount = target.reagents.get_reagent_volume(medicine[DT])
		if(existing_reagent_amount)
			continue
		var/desired_amount = min(R.overdose_threshold,amount_to_inject)-existing_reagent_amount
		if(desired_amount > 0)
			.[medicine[DT]] = desired_amount

	return length(.) ? . : FALSE

/mob/living/simple/bot/medibot/proc/treat(var/mob/living/target)

	var/inject_amount = get_inject_amount(target)

	if(inject_amount)
		for(var/k in inject_amount)
			var/v = inject_amount[k]
			target.reagents.add_reagent(k,v,activator=src)

		target.visible_message(span("danger","[src.name]用高压注射器给[target.name]注射了药物。"),span("danger","[src.name]用高压注射器给你注射了药物。"))

		switch(rand(1,2))
			if(1)
				play_sound('sound/voice/medbot/feelbetter.ogg',get_turf(src),range_max=VIEW_RANGE)
				src.do_say("祝你早日康复！")
			if(2)
				play_sound('sound/voice/medbot/patchedup.ogg',get_turf(src),range_max=VIEW_RANGE)
				src.do_say("处理完毕！")

		update_icon()

	return TRUE

/mob/living/simple/bot/medibot/proc/can_treat(var/mob/living/target)

	if(target.qdeleting)
		return FALSE

	if(target == src)
		return FALSE

	if(!target.reagents)
		return FALSE

	if(!target.health)
		return FALSE

	if(!target.health.organic)
		return FALSE

	if(target.dead && !advanced)
		return FALSE

	if(get_dist(src,target) > 1)
		return FALSE

	if(!get_inject_amount(target))
		return FALSE

	return TRUE

/mob/living/simple/bot/medibot/proc/try_treat(var/mob/living/target)

	if(get_inject_amount(target))
		PROGRESS_BAR(src,src,SECONDS_TO_DECISECONDS(5),src::treat(),target)
		PROGRESS_BAR_CONDITIONS(src,src,src::can_treat(),target)
		target.visible_message(span("warning","[src.name]正试图给[target.name]注射！"),span("danger","[src.name]正试图给你注射！"))
		if(target.dead || target.has_status_effect(CRIT))
			play_sound('sound/voice/medbot/no.ogg',get_turf(src),range_max=VIEW_RANGE)
			src.do_say("不，撑住！")
		update_icon()
		return TRUE

	return FALSE



/mob/living/simple/bot/medibot/syndicate
	name = "医疗事故医生"
	overlay_icon_state = "tactical"

	loyalty_tag = "Syndicate"
	iff_tag = "Syndicate"

	health_base = 100

/mob/living/simple/bot/medibot/rogue
	name = "失控医疗机器人"

	loyalty_tag = "Robot"
	iff_tag = "Robot"

	ai = /ai/bot/medical/aggressive

	health_base = 200



/mob/living/simple/bot/medibot/rogue/Generate()
	var/desired_pack = pick("firstaid","brute","burn","toxin","rad","purple","oxy","tactical")
	var/desired_num = pick("","1","2","3","4")
	overlay_icon_state = "[desired_pack][desired_num]"
	return ..()


/mob/living/simple/bot/medibot/maint_pvp
	name = "搏击俱乐部医疗员"

	overlay_icon_state = "tactical"
	loyalty_tag = "NanoTrasen"
	iff_tag = "NanoTrasen"

	ai = /ai/bot/medical/aggressive

	health_base = 300

	anchored = TRUE

	advanced = TRUE
