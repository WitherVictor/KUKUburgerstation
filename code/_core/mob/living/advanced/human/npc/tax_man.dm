/mob/living/advanced/npc/tax_man
	name = "税务官"
	desc = "处理你的税务。"
	desc_extended = "按时缴税，否则后果自负。"
	ai = null
	move_mod = 1

	dna = /dna/human

	dialogue_id = /dialogue/npc/taxman/
	anchored = TRUE

	level = 5

	loadout = /loadout/taxman

/mob/living/advanced/npc/tax_man/Finalize()
	. = ..()
	src.add_organ(/obj/item/organ/internal/implant/hand/left/iff/nanotrasen)
	src.add_organ(/obj/item/organ/internal/implant/head/loyalty/nanotrasen)


/mob/living/advanced/npc/tax_man/helper
	name = "税务助理"
	desc = "为你答疑解惑。"
	desc_extended = "按时缴税，否则后果自负。"


/mob/living/advanced/npc/tax_collector
	name = "征税员"
	desc = "把税交了。"
	desc_extended = "银河系最致命的会计之一。只要你不缴税，就会追杀你。"

	ai = /ai/advanced/taxman

	level = 18

	soul_size = SOUL_SIZE_UNCOMMON

	loadout = /loadout/tax_collector

/mob/living/advanced/npc/tax_collector/Finalize()
	. = ..()
	src.add_organ(/obj/item/organ/internal/implant/hand/left/iff/space_cop)
	src.add_organ(/obj/item/organ/internal/implant/head/loyalty/space_cop)
