/obj/item/clothing/overwear/armor/cult
	name = "邪教长袍"
	desc = "万事都有个起步的时候，加入血之邪教也不例外。"
	desc_extended = "纳尔西邪教低阶侍僧常穿的长袍。没有超自然力量，但带有衬垫。"
	icon = 'icons/obj/item/clothing/suit/cult.dmi'
	worn_layer = LAYER_MOB_CLOTHING_HARDSUIT

	armor = /armor/dark/cult_robes

	size = SIZE_4


	value = 200

	additional_clothing = list(
		/obj/item/clothing/head/hat/cult
	)

	rarity = RARITY_UNCOMMON

/obj/item/clothing/overwear/armor/cult/old
	name = "古老邪教长袍"
	desc = "孩子，听听你家古老邪祟的话。"
	desc_extended = "邪教资深成员常穿的积灰旧长袍。虽满是灰尘，却蕴含着邪秽魔法。"
	icon = 'icons/obj/item/clothing/suit/cult_old.dmi'

	armor = /armor/dark/cult_robes/ancient

	size = SIZE_3

	value = 300

	additional_clothing = list(
		/obj/item/clothing/head/hat/cult/old
	)

	rarity = RARITY_MYTHICAL

/obj/item/clothing/overwear/armor/cult/hard
	name = "加固邪教长袍"
	desc = "现在再试着给我驱魔啊，蠢货！"
	desc_extended = "衬垫厚实的长袍，防护比其他长袍更强。"
	icon = 'icons/obj/item/clothing/suit/cult_hard.dmi'


	armor = /armor/dark/cult_robes/hard

	size = SIZE_5


	value = 500

	additional_clothing = list(
		/obj/item/clothing/head/helmet/full/hardsuit/cult
	)

	rarity = RARITY_RARE
