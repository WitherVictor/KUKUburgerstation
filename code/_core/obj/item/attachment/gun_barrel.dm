/obj/item/attachment/barrel_mod
	name = "占位枪管"

/obj/item/attachment/barrel_mod/reinforced_barrel
	name = "加固枪管"

	desc = "使用时请勿触碰。"
	desc_extended = "简单的枪管加固装置，减少耐久消耗。"
	icon_state = "barrel_reinforcement"

	attachment_stats = list(
		condition_use_mod = 0.75
	)

	value = 250
