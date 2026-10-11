/mob/living/advanced/npc/cultist
	name = "邪教徒"
	desc = "*难以理解的胡言乱语*"
	desc_extended = "一名信奉纳尔西的邪教徒。"
	ai = /ai/advanced/cult

	dna = /dna/human

	loadout = /loadout/cultist

	health_base = 100
	mana_base = 100
	stamina_base = 100

	level = 12

/mob/living/advanced/npc/cultist/Finalize()
	. = ..()
	src.add_organ(/obj/item/organ/internal/implant/hand/left/iff/cult)
	src.add_organ(/obj/item/organ/internal/implant/head/loyalty/cult)

/mob/living/advanced/npc/cultist/old
	name = "古老邪教徒"
	loadout = /loadout/cultist/old

	level = 28


/mob/living/advanced/npc/cultist/hard
	name = "邪教大师"
	loadout = /loadout/cultist/hard

	level = 50
