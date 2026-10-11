/mob/living/advanced/npc/hostage

	desc = "一位非常重要的贵宾，也就是非常重要的‘非常重要的人物’。你应该护送他们返回空间站。"

	dna = /dna/human

	ai = /ai/advanced/hostage
	dialogue_id = /dialogue/npc/hostage/
	health_base = 200 //Extra health so the escort mission isn't fucking hell.
	level = 8

	loadout = /loadout/hostage/male

	var/hostage = TRUE

/mob/living/advanced/npc/hostage/Finalize()
	. = ..()
	src.add_organ(/obj/item/organ/internal/implant/hand/left/iff/nanotrasen)
	src.add_organ(/obj/item/organ/internal/implant/head/loyalty/nanotrasen)

/mob/living/advanced/npc/hostage/get_damage_received_multiplier(var/atom/attacker,var/atom/victim,var/atom/weapon,var/atom/hit_object,var/atom/blamed,var/damagetype/DT)
	return 0.5

/mob/living/advanced/npc/hostage/female
	loadout = /loadout/hostage/female
	gender = FEMALE
