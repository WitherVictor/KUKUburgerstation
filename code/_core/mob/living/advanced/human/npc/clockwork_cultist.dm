/mob/living/advanced/npc/clockwork_cultist
	name = "发条邪教徒"
	desc = "拉特瓦尔万岁！"
	desc_extended = "一名信奉拉特瓦尔的邪教徒。"
	ai = /ai/advanced/clockwork_cult

	dna = /dna/human

	loadout = /loadout/clockwork_cult

	health_base = 100
	mana_base = 100
	stamina_base = 100

	level = 28

/mob/living/advanced/npc/clockwork_cultist/Finalize()
	. = ..()
	src.add_organ(/obj/item/organ/internal/implant/hand/left/iff/clockwork_cult)
	src.add_organ(/obj/item/organ/internal/implant/head/loyalty/clockwork_cult)

