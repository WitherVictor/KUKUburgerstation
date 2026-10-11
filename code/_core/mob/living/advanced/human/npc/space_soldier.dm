/mob/living/advanced/npc/space_soldier
	name = "太空士兵"
	desc = "自1775年起传播民主。"

	dna = /dna/human

	ai = /ai/advanced/space_soldier

	dialogue_id = /dialogue/npc/soldier/

	level = 60

	loadout = /loadout/space_soldier/assault_rifle

/mob/living/advanced/npc/space_soldier/Finalize()
	. = ..()
	src.add_organ(/obj/item/organ/internal/implant/hand/left/iff/space_cop)
	src.add_organ(/obj/item/organ/internal/implant/head/loyalty/space_cop)

/mob/living/advanced/npc/space_soldier/battle
	loadout = /loadout/space_soldier/battle_rifle

	level = 70

/mob/living/advanced/npc/space_soldier/dmca
	loadout = /loadout/space_soldier/dmca

	level = 70

/mob/living/advanced/npc/space_soldier/special_operative
	name = "太空特战人员"

	dialogue_id = null

	ai = /ai/advanced/space_soldier/special

	loadout = /loadout/space_soldier/spec_ops

	level = 90
