/obj/item/clothing/head/hat/winter
	name = "冬季兜帽"
	desc = "保护头部免受风寒侵袭。"
	desc_extended = "空手点击已戴上的兜帽或穿着的冬季外套，即可放下兜帽。"
	icon = 'icons/obj/item/clothing/hats/winter_hood.dmi'

	hidden_organs = list(
		BODY_HAIR_HEAD = TRUE
	)

	armor = /armor/cloth/winter/mask

	protection_cold = list(
		BODY_HEAD = 5,
	)

	size = SIZE_2


	value = 30

	can_save = FALSE
