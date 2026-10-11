// Tacticool or slavic armor for hardened ruskies. Thank you stalkerbuild and Parrot very cool.
/obj/item/clothing/overwear/armor/slavticool
	name = "\improper 斯拉夫卫士有限公司防护背心"
	icon = 'icons/obj/item/clothing/suit/squad_armor.dmi'
	desc = "自2238年起，守护你免受资本主义侵害。"
	desc_extended = "结实的防弹胸甲，配有肩甲和护膝，应该能抵御大多数轻武器射击。感觉比标准配发背心更轻。"

	protected_limbs = list(BODY_TORSO,BODY_GROIN,BODY_LEG_LEFT,BODY_LEG_RIGHT)

	armor = /armor/military/medium/hard

	size = SIZE_3

	value = 300

	rarity = RARITY_UNCOMMON

/obj/item/clothing/head/helmet/slavticool
	name = "\improper 斯拉夫卫士有限公司战斗头盔"
	icon = 'icons/obj/item/clothing/hats/squad_helmet.dmi'
	desc = "自2238年起，守护你免受资本主义侵害。"
	desc_extended = "用复杂的塑料基防弹材料和陶瓷制成的耐用战斗头盔，应该能替你挡下一颗，或者五颗子弹。"

	armor = /armor/military/medium/hard

	size = SIZE_2

	value = 150

	rarity = RARITY_UNCOMMON

/obj/item/clothing/head/helmet/slavticool/thermal
	name = "\improper 斯拉夫卫士有限公司热成像战斗头盔"
	desc_extended = "用复杂的塑料基防弹材料和陶瓷制成的耐用战斗头盔，应该能替你挡下一颗，或者五颗子弹。这款还配备了先进的单眼热成像镜。"

	additional_clothing = list(/obj/item/clothing/glasses/thermal/thermal_rev)

	value = 250

	rarity = RARITY_MYTHICAL
