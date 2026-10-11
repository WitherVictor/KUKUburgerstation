/mob/living/advanced/npc/unique/goblin_merchant
	name = "地精商人"
	desc = "自公元前4506年起靠劫掠聚落牟利。"

	species = "goblin"

	pixel_z = 1

	blood_type = /reagent/blood/goblin

	dialogue_id = /dialogue/npc/goblin_merchant/

	health = null

	anchored = TRUE
	density = TRUE

	size = SIZE_10

	level = 12

	dna = /dna/goblin

	loadout = /loadout/goblin/merchant

/mob/living/advanced/npc/unique/goblin_merchant/Finalize()
	. = ..()
	src.add_organ(/obj/item/organ/internal/implant/hand/left/iff/nanotrasen)
	src.add_organ(/obj/item/organ/internal/implant/head/loyalty/nanotrasen)
	add_status_effect(IMMORTAL)
