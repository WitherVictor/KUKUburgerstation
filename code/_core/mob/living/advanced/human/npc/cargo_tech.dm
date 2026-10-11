/mob/living/advanced/npc/cargo_tech
	name = "半机械人货运技师"
	desc = "你需要帮助吗？"
	desc_extended = "纳米传讯生产的半机械人，按程序帮助那些提出蠢问题的人。"
	ai = /ai/advanced/guarding

	move_mod = 1
	species = "cyborg"

	dialogue_id = /dialogue/tutorial/front_desk

	level = 1

	loadout = /loadout/nanotrasen/cargo_tech

	health = null

	anchored = TRUE
	density = TRUE

/mob/living/advanced/npc/cargo_tech/Finalize()
	. = ..()
	src.add_organ(/obj/item/organ/internal/implant/head/loyalty/nanotrasen)
	src.add_organ(/obj/item/organ/internal/implant/hand/left/iff/nanotrasen)
