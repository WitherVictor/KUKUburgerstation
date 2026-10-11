/mob/living/advanced/npc/wizard_federation_guard
	name = "巫师联邦守卫"
	desc = "自2068年起调查战争罪行。"

	dna = /dna/human

	ai = /ai/advanced/guarding

	level = 22

	loadout = /loadout/wizard_guard

	dna = /dna/human/wizard

/mob/living/advanced/npc/wizard_federation_guard/Finalize()
	. = ..()
	src.add_organ(/obj/item/organ/internal/implant/hand/left/iff/nanotrasen)
	src.add_organ(/obj/item/organ/internal/implant/head/loyalty/nanotrasen)

