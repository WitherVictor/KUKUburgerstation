/obj/item/clothing/glasses/sun
	name = "墨镜"

	desc = "不服也得忍着。"
	desc_extended = "一副简洁时髦的墨镜，可以反射阳光和激光。防护效果与矫正眼镜相反。"
	icon = 'icons/obj/item/clothing/glasses/sunglasses.dmi'

	armor = /armor/glasses/sunglasses

	value = 30

	item_slot_layer = 2

/*
/obj/item/clothing/glasses/sun/pre_equip(var/atom/old_location,var/obj/hud/inventory/new_location)

	. = ..()

	if(is_inventory(old_location))
		var/obj/hud/inventory/I = old_location
		I.owner?.remove_color_mod("eyes")

	if(new_location.item_slot & SLOT_FACE)
		var/list/desired_color = list(
			0.9,0,0,0,
			0,0.9,0,0,
			0,0,0.9,0,
			0,0,0,1,
			0,0,0,0
		)
		new_location.owner.add_color_mod("eyes",desired_color)
*/


/obj/item/clothing/glasses/sun/big
	name = "大号墨镜"
	icon = 'icons/obj/item/clothing/glasses/sunglasses_big.dmi'

/obj/item/clothing/glasses/sun/gar
	name = "热血墨镜"
	icon = 'icons/obj/item/clothing/glasses/gar.dmi'

	damage_type = /damagetype/melee/sword/grazer

	value = 1000

	worn_layer = LAYER_MOB_HAIR_ABOVE

	rarity = RARITY_RARE

/obj/item/clothing/glasses/sun/gar/giga
	name = "超热血墨镜"
	icon = 'icons/obj/item/clothing/glasses/gigagar.dmi'
	damage_type = /damagetype/melee/sword/katana

	value = 2500

	rarity = RARITY_MYTHICAL

/obj/item/clothing/glasses/sun/dicklickem
	name = "混蛋墨镜"

	desc = "是时候嚼屁股、踢泡泡糖了。"
	desc_extended = "镜片糊满了干结的体液，看着更像深色玻璃。幸好这也让它变得异常耐用。"

	icon = 'icons/obj/item/clothing/glasses/dicklickem.dmi'

	value = 1991

	rarity = RARITY_MYTHICAL


/obj/item/clothing/glasses/sun/augmented
	name = "强化墨镜"
	desc = "你的视觉得到了强化。"
	desc_extended = "为安保人员设计的强力强化墨镜，内置安保与医疗状态界面及热成像功能。硬汉专用。"
	icon = 'icons/obj/item/clothing/glasses/abomb_shades.dmi'

	sight_mod = SEE_MOBS
	vision_mod = FLAG_VISION_SECURITY | FLAG_VISION_MEDICAL

	armor = /armor/mechanical

	value = 1400

	rarity = RARITY_MYTHICAL


/obj/item/clothing/glasses/sun/security
	name = "安保墨镜"

	desc = "简直就像电子游戏一样！"
	desc_extended = "带有安保状态界面的墨镜，分析附近生物的敌我识别植入体，并在屏幕上显示结果。"
	icon = 'icons/obj/item/clothing/glasses/security_hud.dmi'

	vision_mod = FLAG_VISION_SECURITY

	armor = /armor/mechanical

	value = 160

/obj/item/clothing/glasses/sun/security/red
	name = "战斗传感套件墨镜"

	desc_extended = "带有辛迪加状态界面的墨镜，分析附近生物的敌我识别植入体，并在屏幕上显示结果。这款更加先进，通常由辛迪加高级特工佩戴，还内置热成像功能。"
	value = 1000

	armor = /armor/mechanical

	sight_mod = SEE_MOBS
	vision_mod = FLAG_VISION_SECURITY | FLAG_VISION_MEDICAL

/obj/item/clothing/glasses/sun/security/revolutionary
	name = "防弹护目镜"

	desc_extended = "一副老旧但保养良好的防弹护目镜，内置状态界面，可分析附近生物的敌我识别植入体并显示结果。这款更加先进，通常由革命军高级士兵佩戴，还内置热成像功能。"
	icon = 'icons/obj/item/clothing/glasses/rev_goggles.dmi'
	value = 1000


	armor = /armor/mechanical

	sight_mod = SEE_MOBS
	vision_mod = FLAG_VISION_SECURITY | FLAG_VISION_MEDICAL
