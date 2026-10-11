/obj/item/clothing/head/helmet/hardsuit/

	hidden_organs = list(
		BODY_HEAD = TRUE,
		BODY_HAIR_HEAD = TRUE,
		BODY_HAIR_FACE = TRUE,
		BODY_EYES = TRUE
	)

	blocks_clothing = SLOT_FACE_WRAP | SLOT_HEAD | SLOT_FACE | SLOT_EYES

/obj/item/clothing/head/helmet/hardsuit/engineering
	name = "工程硬式宇航服头盔"
	desc = "超物质完整度只剩9%了？唔，应该没事吧。"
	desc_extended = "工程师使用的硬式宇航服头盔，能承受极高温度，便于在引擎旁作业。"
	icon = 'icons/obj/item/clothing/hats/engineering_rig_helmet.dmi'
	rarity = RARITY_UNCOMMON

	defense_rating = list(
		BLADE = 25,
		BLUNT = 50,
		PIERCE = 25,
		LASER = 25,
		ARCANE = -75,
		HEAT = 100,
		COLD = 100,
		BOMB = 25,
		BIO = 50,
		RAD = 75,
		FATIGUE = INFINITY
	)

	size = SIZE_3


	value = 80

	slowdown_mul_worn = 1.1

/obj/item/clothing/head/helmet/hardsuit/syndie
	name = "撕裂者头盔mk1"
	desc = "把那他妈的磁盘抢过来！"
	desc_extended = "撕裂者硬式宇航服首个型号的配套头盔，在核行动人员活跃的年代十分常见。如今多作为剩余军用品，由辛迪加大头兵穿着。"
	icon = 'icons/obj/item/clothing/hats/syndie_basic.dmi'
	rarity = RARITY_UNCOMMON

	defense_rating = list(
		BLADE = 25,
		BLUNT = 50,
		PIERCE = 50,
		LASER = 75,
		ARCANE = -75,
		HEAT = 75,
		COLD = 75,
		BOMB = 75,
		BIO = 50,
		RAD = 50
	)

	size = SIZE_4

	value = 250

	slowdown_mul_worn = 1.05

/obj/item/clothing/head/helmet/hardsuit/syndie/advanced
	name = "撕裂者头盔mk2"
	desc = "周界已确保安全。"
	desc_extended = "辛迪加中高级行动人员目前使用的现役型号头盔。遇到戴着它的人，绝不能掉以轻心。"
	icon = 'icons/obj/item/clothing/hats/syndie_advanced.dmi'
	rarity = RARITY_RARE

	defense_rating = list(
		BLADE = 25,
		BLUNT = 75,
		PIERCE = 75,
		LASER = 100,
		ARCANE = -75,
		HEAT = 75,
		COLD = 75,
		BOMB = 75,
		BIO = 50,
		RAD = 50
	)

	size = SIZE_3

	value = 500

	slowdown_mul_worn = 1.1

/obj/item/clothing/head/helmet/hardsuit/syndie/elite
	name = "撕裂者头盔mk3"
	desc = "可以给你个建议吗？快跑。"
	desc_extended = "辛迪加顶尖特工使用的原型宇航服头盔，轻巧灵活，同时保持厚重防护。别试图独自面对戴着它的人。"
	icon = 'icons/obj/item/clothing/hats/syndie_elite.dmi'
	rarity = RARITY_MYTHICAL

	defense_rating = list(
		BLADE = 50,
		BLUNT = 50,
		PIERCE = 50,
		LASER = 75,
		ARCANE = -50,
		HEAT = 75,
		COLD = 75,
		BOMB = 75,
		BIO = 50,
		RAD = 50
	)

	size = SIZE_3

	slowdown_mul_worn = 0.75

	value = 1200

/obj/item/clothing/head/helmet/hardsuit/mining
	name = "采矿硬式宇航服头盔"
	desc = "挖——矿——挖——钻——石！"
	desc_extended = "矿工使用的硬式宇航服头盔，为应对落石、尘肺病和洞穴怪物等危险而设计。"
	icon = 'icons/obj/item/clothing/hats/hardsuit_mining.dmi'
	rarity = RARITY_UNCOMMON

	defense_rating = list(
		BLADE = 50,
		BLUNT = 75,
		PIERCE = 50,
		LASER = 50,
		ARCANE = -75,
		HEAT = 75,
		COLD = 75,
		BOMB = 50,
		BIO = 50,
		RAD = 50
	)

	size = SIZE_3


	value = 300

	slowdown_mul_worn = 1.1


/obj/item/clothing/head/helmet/hardsuit/medical
	name = "医疗宇航服头盔"
	desc = "他妈的让开！"
	desc_extended = "医护人员回收尸体时佩戴的硬式宇航服头盔，以免自己也变成尸体。"
	icon = 'icons/obj/item/clothing/hats/hardsuit_medical.dmi'
	rarity = RARITY_UNCOMMON

	defense_rating = list(
		BLADE = 25,
		BLUNT = 50,
		PIERCE = 25,
		LASER = 25,
		ARCANE = -50,
		HEAT = 75,
		COLD = 75,
		BOMB = 25,
		BIO = 150,
		RAD = 75
	)

	size = SIZE_3

	value = 300

	slowdown_mul_worn = 1.1

/obj/item/clothing/head/helmet/hardsuit/seva
	name = "SEVA防护服头盔"
	desc = "到我这里来。"
	desc_extended = "东欧型号危险环境防护服的配套头盔，深受科学家、拾荒者和崇拜异常现象的狂热分子喜爱！"
	icon = 'icons/obj/item/clothing/hats/seva_suit.dmi'
	rarity = RARITY_UNCOMMON

	defense_rating = list(
		BLADE = 25,
		BLUNT = 50,
		PIERCE = 25,
		LASER = 25,
		ARCANE = -50,
		HEAT = 25,
		COLD = 50,
		BOMB = 25,
		BIO = 150,
		RAD = 150
	)

	size = SIZE_3

	value = 400

	slowdown_mul_worn = 1.05

/obj/item/clothing/head/helmet/hardsuit/seva/mono
	name = "定制SEVA防护服头盔"
	icon = 'icons/obj/item/clothing/hats/sevamono_suit.dmi'
