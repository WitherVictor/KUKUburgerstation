/mob/living/advanced/npc/unique/head/ce
	name = "总工程师"
	desc = "在这里不用担心等离子气体泄漏。"
	species = "human"
	dialogue_id = /dialogue/npc/chief_engineer/

	sex = FEMALE
	gender = FEMALE

	dna = /dna/human

	anchored = TRUE
	health = null

	level = 50

	loadout = /loadout/nanotrasen/head/ce

/mob/living/advanced/npc/unique/head/ce/setup_visuals()
	. = ..()
	change_organ_visual("skin", desired_color = "#967864")
	change_organ_visual("hair_head", desired_color = "#634933", desired_icon_state = "hair_shorthairg")
