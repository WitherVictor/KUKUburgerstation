/mob/living/advanced/npc/space_cop
	name = "太空警察"
	desc = "自2068年起调查银河战争罪行。"

	dna = /dna/human

	ai = /ai/advanced/space_cop

	dialogue_id = /dialogue/npc/soldier/

	level = 16

	loadout = /loadout/space_cop


	soul_size = RARITY_UNCOMMON

	combat_dialogue = /combat_dialogue/solarian

/mob/living/advanced/npc/space_cop/Finalize()
	. = ..()
	src.add_organ(/obj/item/organ/internal/implant/hand/left/iff/space_cop)
	src.add_organ(/obj/item/organ/internal/implant/head/loyalty/space_cop)
