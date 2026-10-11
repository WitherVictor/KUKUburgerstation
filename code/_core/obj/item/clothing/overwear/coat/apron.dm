/obj/item/clothing/overwear/coat/apron
	name = "围裙"
	icon = 'icons/obj/item/clothing/suit/apron.dmi'
	desc = "保护自己，远离污渍。"
	desc_extended = "厨师常用的普通围裙。"

	protected_limbs = list(BODY_TORSO, BODY_GROIN)

	armor = /armor/cloth/protective

	size = SIZE_2

	value = 20

	dyeable = TRUE

/obj/item/clothing/overwear/coat/apron/blue
	color = COLOR_BLUE

/obj/item/clothing/overwear/coat/apron/chef
	name = "主厨围裙"
	icon = 'icons/obj/item/clothing/suit/apron_chef.dmi'
	desc = "大师的象征。"
	desc_extended = "只有最讲究的主厨才会穿的特别围裙。"

	protected_limbs = list(BODY_TORSO, BODY_GROIN)

	armor = /armor/cloth/protective/chef

	size = SIZE_3

	value = 400

	dyeable = FALSE


/obj/item/clothing/overwear/coat/apron/blacksmith
	name = "皮围裙"
	icon = 'icons/obj/item/clothing/suit/apron_leather.dmi'
	desc = "打铁时保护你免受火焰和金属碎屑伤害的围裙。只穿围裙打铁固然性感，但也非常危险。"
	desc_extended = "带有大口袋，可存放两件尺寸不超过2的物品。"

	protected_limbs = list(BODY_TORSO, BODY_GROIN)

	is_container = TRUE
	dynamic_inventory_count = 2

	container_max_size = SIZE_2

	armor = /armor/leather/protective

	size = SIZE_3

	dyeable = FALSE

	value = 120
