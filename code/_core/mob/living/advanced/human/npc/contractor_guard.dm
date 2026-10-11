/mob/living/advanced/npc/contractor_guard
	name = "纳米传讯精英守卫"
	desc = "被指派保护这位老人的顶尖守卫。"

	dna = /dna/human

	ai = /ai/advanced/guarding

	dialogue_id = null

	loadout = /loadout/nanotrasen/elite

	level = 80

/mob/living/advanced/npc/contractor_guard/Finalize()
	. = ..()
	src.add_organ(/obj/item/organ/internal/implant/hand/left/iff/nanotrasen)
	src.add_organ(/obj/item/organ/internal/implant/head/loyalty/nanotrasen)
