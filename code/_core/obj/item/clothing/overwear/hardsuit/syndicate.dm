/obj/item/clothing/overwear/hardsuit/syndie
	name = "撕裂者硬式宇航服mk1"
	desc = "把那他妈的磁盘抢过来！"
	desc_extended = "撕裂者硬式宇航服的首个型号，在核行动人员活跃的年代十分常见。如今多作为剩余军用品，由辛迪加大头兵穿着。"
	icon = 'icons/obj/item/clothing/suit/syndie_basic.dmi'


	armor = /armor/hardsuit/combat/syndicate

	size = SIZE_7

	additional_clothing = list(/obj/item/clothing/head/helmet/full/hardsuit/syndie)

	value = 400

	rarity = RARITY_RARE

/obj/item/clothing/overwear/hardsuit/syndie/advanced
	name = "撕裂者硬式宇航服mk2"
	desc = "周界已确保安全。"
	desc_extended = "辛迪加中高级行动人员目前使用的现役型号。遇到穿着它的人，绝不能掉以轻心。"
	icon = 'icons/obj/item/clothing/suit/syndie_advanced.dmi'


	armor = /armor/hardsuit/combat/syndicate/plus

	size = SIZE_6


	additional_clothing = list(/obj/item/clothing/head/helmet/full/hardsuit/syndie/advanced)

	value = 600

	rarity = RARITY_RARE

/obj/item/clothing/overwear/hardsuit/syndie/elite
	name = "撕裂者硬式宇航服mk3"
	desc = "听我一句劝：快跑。"
	desc_extended = "辛迪加最顶尖行动人员使用的原型宇航服。轻便灵活，同时保持厚重装甲。别尝试独自对付穿着它的人。"
	icon = 'icons/obj/item/clothing/suit/syndie_elite.dmi'


	armor = /armor/hardsuit/combat/syndicate/fast

	additional_clothing = list(/obj/item/clothing/head/helmet/full/hardsuit/syndie/elite)

	size = SIZE_6
	weight = 10 //Now the suit actually speeds you up.

	value = 1200

	speed_bonus = 0.1

	contraband = TRUE

	rarity = RARITY_MYTHICAL


/obj/item/clothing/overwear/hardsuit/syndie/ultra
	name = "撕裂者硬式宇航服mk4终极型"
	desc = "听我一句劝：快跑。"
	desc_extended = "辛迪加最顶尖行动人员使用的原型宇航服。轻便灵活，同时保持厚重装甲。别尝试独自对付穿着它的人。"
	icon = 'icons/obj/item/clothing/suit/syndie_ultra.dmi'


	armor = /armor/hardsuit/combat/syndicate/ultra

	additional_clothing = list(/obj/item/clothing/head/helmet/full/hardsuit/syndie/ultra)

	size = SIZE_6
	weight = 10.

	value = 1200

	speed_bonus = 0.4

	contraband = TRUE

	rarity = RARITY_LEGENDARY
