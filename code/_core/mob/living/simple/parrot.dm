/mob/living/simple/parrot
	name = "鹦鹉"
	desc = "嘎！"
	desc_extended = "一只普通的彩色鹦鹉。"
	icon = 'icons/mob/living/simple/parrot.dmi'
	icon_state = "fly"

	damage_type = /damagetype/unarmed/claw/


	health_base = 25
	stamina_base = 50
	mana_base = 25

	listener = TRUE

	value = 500

	var/sitting = FALSE

	loyalty_tag = "Parrot"
	iff_tag = "Parrot"

	size = SIZE_CRITTER

	blood_type = /reagent/blood/bird
	blood_volume = 100

	butcher_contents = list(
		/obj/item/container/edible/dynamic/chicken/raw
	)

	level = 2

/mob/living/simple/parrot/Finalize()
	post_move(src.loc)
	return ..()

/mob/living/simple/parrot/post_move(var/atom/old_loc)

	if(dead || !src.z)
		return ..()

	var/old_sitting = sitting

	for(var/obj/structure/S in loc.contents)
		if(!S.density)
			continue
		if(S.collision_flags & FLAG_COLLISION_WALKING)
			sitting = TRUE
			break

	if(old_sitting != sitting)
		update_sprite()

	. = ..()

/mob/living/simple/parrot/post_death()
	update_sprite()
	return ..()

/mob/living/simple/parrot/update_icon()

	if(dead)
		icon_state = "dead"
	else if(sitting)
		icon_state = "sit"
	else
		icon_state = "fly"

	return ..()

/mob/living/simple/parrot/on_listen(var/atom/speaker,var/datum/source,var/text,var/raw_text,var/language_text,var/talk_type,var/frequency,var/language =LANGUAGE_BASIC,var/talk_range=TALK_RANGE)

	if(!CALLBACK_EXISTS("\ref[src]_parrot") && length_char(text) <= 30 && speaker != src && prob(5))
		var/desired_text = text
		if(prob(80))
			desired_text = "嘎！[uppertext(remove_trailing_punctuation(desired_text))]！"
		if(length_char(desired_text))
			CALLBACK_GLOBAL("\ref[src]_parrot",rand(30,100),.proc/talk,src,src,desired_text,TEXT_TALK,null,language,TALK_RANGE)

	return TRUE

/mob/living/simple/parrot/mono
	name = "莫诺"
	desc = "嘎！给太阳能板接线！嘎！"
	desc_extended = "总工程师信赖的宠物鸟。"

	loyalty_tag = "NanoTrasen"
	iff_tag = "NanoTrasen"

	ai = /ai/pet

/mob/living/simple/parrot/mono/setup_name()
	name = initial(name)
	return TRUE

/mob/living/simple/parrot/clockwork
	name = "发条鹰"
	desc = "机械般的嘎叫声！"
	desc_extended = "一只普通的黄铜鹰。"
	icon = 'icons/mob/living/simple/clockwork_hawk.dmi'

	damage_type = /damagetype/unarmed/claw/


	health_base = 100
	stamina_base = 100
	mana_base = 100

	listener = TRUE

	value = 1500

	loyalty_tag = "Clockwork"
	iff_tag = "Clockwork"

	blood_type = /reagent/blood/robot

	butcher_contents = list()

	armor = /armor/default_organic

	level = 8
