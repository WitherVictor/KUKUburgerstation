/mob/living/advanced/npc/deathsquad
	name = "敢死队突击队员"
	desc = "纳米传讯敢死队的精英成员，奉命不留任何目击者。按官方说法，他们根本不存在。"
	ai = /ai/advanced/syndicate

	dna = /dna/human

	dialogue_id = /dialogue/npc/soldier

	loadout = /loadout/deathsquad

	level = 60

/mob/living/advanced/npc/deathsquad/Finalize()
	. = ..()
	src.add_organ(/obj/item/organ/internal/implant/hand/left/iff/deathsquad)
	src.add_organ(/obj/item/organ/internal/implant/head/loyalty/deathsquad)
