/mob/living/advanced/npc/unique/rogue/that_guy
	name = "那个家伙"
	desc = "嘿，是猎魔海报上的那个家伙。哈哈，他要杀我了。"

	sex = MALE
	gender = MALE

	blood_type = /reagent/blood/human/ab_negative

	dna = /dna/human

	loadout = /loadout/that_guy

/mob/living/advanced/npc/unique/rogue/that_guy/setup_visuals()
	. = ..()
	change_organ_visual("skin", desired_color = "#CB7F4F")
	change_organ_visual("hair_head", desired_color = "#8A5B34", desired_icon_state = "hair_crewcut")
