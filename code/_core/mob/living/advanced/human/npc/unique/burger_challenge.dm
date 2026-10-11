/mob/living/advanced/npc/unique/burger_challenge
	name = "神秘人"
	desc = "接受挑战吧……如果你有胆量。"

	level = 30

	loadout = /loadout/hooded_figure

	dialogue_id = /dialogue/npc/burger_challenge

	anchored = 2




/mob/living/advanced/npc/unique/burger_challenge/Finalize()
	. = ..()
	src.add_organ(/obj/item/organ/internal/implant/hand/left/iff/nanotrasen)
	src.add_organ(/obj/item/organ/internal/implant/head/loyalty/nanotrasen)
	add_status_effect(IMMORTAL)
