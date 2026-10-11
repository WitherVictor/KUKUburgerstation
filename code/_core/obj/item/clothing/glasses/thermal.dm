/obj/item/clothing/glasses/thermal
	name = "热成像护目镜"
	desc = "戴在脸上的透视外挂！"
	desc_extended = "一副神奇的护目镜，让你隔着墙壁看见生物。"
	icon = 'icons/obj/item/clothing/glasses/thermal.dmi'


	armor = /armor/mechanical

	size = SIZE_1

	sight_mod = SEE_MOBS

	value = 400

	item_slot_layer = 2

	rarity = RARITY_LEGENDARY


/obj/item/clothing/glasses/thermal/thermoncle
	name = "单眼热成像镜"
	desc = "戴在一只眼睛上的透视外挂！"
	desc_extended = "一枚神奇的单眼热成像镜，让你隔着墙壁看见生物。"
	icon = 'icons/obj/item/clothing/glasses/thermoncle.dmi'

/obj/item/clothing/glasses/thermal/thermal_rev
	name = "OUTAD单眼热成像镜"
	desc = "布拉沃六号，准备透视。"
	desc_extended = "斯拉夫卫士有限公司的内置热成像夜视单眼镜，另配医疗和安保状态界面。理论上无论如何都不该拆得下来。"
	icon = 'icons/obj/item/clothing/glasses/thermal_rev.dmi'

	vision_mod = FLAG_VISION_SECURITY | FLAG_VISION_MEDICAL
	see_in_dark = VIEW_RANGE + ZOOM_RANGE

	value = 1000

	item_slot_layer = 4

	can_save = FALSE
