/obj/item/clothing/overwear/coat/chaplain
	name = "牧师长袍"
	icon = 'icons/obj/item/clothing/suit/religious.dmi'

	desc = "华丽至极！"
	desc_extended = "能够抵御魔法攻击。"

	armor = /armor/holy/garb
	size = SIZE_3


	value = 90

	mob_values_add = list(
		SKILL_PRAYER = 3
	)

/obj/item/clothing/overwear/coat/chaplain/witchhunter
	name = "猎巫人长袍"
	icon = 'icons/obj/item/clothing/suit/witchunter.dmi'

	desc = "别作反应。"
	desc_extended = "这件衣服曾属于被狂热妄念驱使的人，沾染过太多不该有的温热。"

	dynamic_inventory_count = 1 //to store your bible
	armor = /armor/leather/antimage


	protected_limbs = list(BODY_TORSO,BODY_GROIN,BODY_ARM_LEFT,BODY_ARM_RIGHT) //visibly covers these parts. Adding more would increase the weight TOO much.
	size = SIZE_3


	value = 2000

	rarity = RARITY_MYTHICAL
