/obj/item/clothing/glasses/medical_hud
	name = "医疗状态目镜"

	desc = "简直就像电子游戏一样！"
	desc_extended = "带有医疗状态界面的目镜，分析附近生物的健康状况并显示在屏幕上。"
	icon = 'icons/obj/item/clothing/glasses/medical_hud.dmi'

	vision_mod = FLAG_VISION_MEDICAL

	value = 120

	armor = /armor/mechanical

	item_slot_layer = 2

	mob_values_add = list(
		SKILL_MEDICINE = 3
	)


/obj/item/clothing/glasses/medical_hud/advanced
	name = "先进医疗状态目镜"

	desc = "简直就像电子游戏一样！"
	desc_extended = "带有医疗状态界面的目镜，分析附近生物的健康状况并显示在屏幕上。这款还能显示伤者的伤害类型。"
	icon = 'icons/obj/item/clothing/glasses/medical_hud.dmi'
	vision_mod = FLAG_VISION_MEDICAL | FLAG_VISION_MEDICAL_ADVANCED

	value = 200

	mob_values_add = list(
		SKILL_MEDICINE = 5
	)

	rarity = RARITY_UNCOMMON
