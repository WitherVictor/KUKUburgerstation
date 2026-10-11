/obj/item/clothing/uniform/priest
	name = "牧师制服"
	desc = "太空的虚无会让人皈依宗教，尤其是没穿宇航服就被扔进去的时候。"
	desc_extended = "NT认证牧师的制服。光凭这点，你就知道他们多半算不上好牧师。"
	flags_clothing = FLAG_CLOTHING_NOBEAST_FEET
	icon = 'icons/obj/item/clothing/uniforms/religious.dmi'

	item_slot = SLOT_TORSO | SLOT_GROIN

	flags_clothing = FLAG_CLOTHING_NOBEAST_FEET

	defense_rating = list(
		BLADE = 10,
		BLUNT = 10,
		PIERCE = 10,
		ARCANE = -10,
		COLD = 10,
		HOLY = 80,
		DARK = -80
	)

	value = 120
