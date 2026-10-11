/obj/item/clothing/overwear/armor/seva
	name = "SEVA危险环境防护服"
	desc = "到我这里来。"
	desc_extended = "一种东欧式危险环境防护服，深受科学家、拾荒者和崇拜异常现象的狂热者喜爱！"
	icon = 'icons/obj/item/clothing/suit/seva_suit.dmi'

	protected_limbs = list(BODY_TORSO,BODY_GROIN,BODY_ARM_LEFT,BODY_ARM_RIGHT,BODY_LEG_LEFT,BODY_LEG_RIGHT,BODY_FOOT_LEFT,BODY_FOOT_RIGHT)
	worn_layer = LAYER_MOB_CLOTHING_HARDSUIT

	hidden_organs = list(
		BODY_TORSO = TRUE,
		BODY_GROIN = TRUE,
		BODY_ARM_RIGHT = TRUE,
		BODY_ARM_LEFT = TRUE,
		BODY_LEG_RIGHT = TRUE,
		BODY_LEG_LEFT = TRUE,
		BODY_FOOT_RIGHT = TRUE,
		BODY_FOOT_LEFT = TRUE
	)

	armor = /armor/leather/mining/advanced

	size = SIZE_6


	additional_clothing = list(/obj/item/clothing/head/helmet/full/seva)

	rarity = RARITY_UNCOMMON

	value = 1

/obj/item/clothing/overwear/armor/seva/mono
	name = "定制SEVA危险环境防护服"
	desc_extended = "一种东欧式危险环境防护服，深受科学家、拾荒者和崇拜异常现象的狂热者喜爱！这款由革命军为城市作战改装。"
	icon = 'icons/obj/item/clothing/suit/sevamono_suit.dmi'

	armor = /armor/leather/mining/elite

	additional_clothing = list(/obj/item/clothing/head/helmet/full/seva/mono)

	rarity = RARITY_RARE

/obj/item/clothing/overwear/armor/seva/mono/mowo
	name = "萌萌定制SEWA防护服"
	desc_extended = "东欧款危险环境防护服喵，科学家、拾荒者和崇拜异常现象的狂热者都喜欢喵！这是革命军为城市作战改装的款式喵。"
	icon = 'icons/obj/item/clothing/suit/sevamowo_suit.dmi'

	armor = /armor/leather/mining/advanced

	additional_clothing = list(/obj/item/clothing/head/helmet/full/seva/mono/mowo)

	rarity = RARITY_MYTHICAL

/obj/item/clothing/overwear/armor/seva/syndie
	name = "辛迪加SEVA危险环境防护服"
	desc_extended = "一种东欧式危险环境防护服，深受科学家、拾荒者和崇拜异常现象的狂热者喜爱！这款由革命军针对高温环境改装，并出口给辛迪加。"
	icon = 'icons/obj/item/clothing/suit/sevasyndie_suit.dmi'

	armor = /armor/leather/mining/elite

	additional_clothing = list(/obj/item/clothing/head/helmet/full/seva/syndie)

	rarity = RARITY_MYTHICAL
