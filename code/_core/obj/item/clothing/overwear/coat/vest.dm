/obj/item/clothing/overwear/coat/vest/
	name = "战术储物背心"
	icon = 'icons/obj/item/clothing/suit/black_vest.dmi'

	desc = "我需要更多口袋。"
	desc_extended = "结实的背心，既挡子弹，也省得为整理物品发愁。"

	size = SIZE_1*6

	is_container = TRUE

	dynamic_inventory_count = 6
	container_max_size = SIZE_2

	armor = /armor/cloth/hard

	protected_limbs = list(BODY_TORSO)

	value = 90

/obj/item/clothing/overwear/coat/vest/clicked_on_by_object(var/mob/activator,var/atom/object,location,control,params)

	if(is_inventory(object)) //TODO: Move this to clothing?
		INTERACT_CHECK
		INTERACT_CHECK_OBJECT
		click_self(activator,location,control,params)
		return TRUE

	return ..()

/obj/item/clothing/overwear/coat/vest/colored
	name = "彩色背心"
	icon = 'icons/obj/item/clothing/suit/white_vest.dmi'

	dyeable = TRUE

/obj/item/clothing/overwear/coat/vest/colored/brown
	name = "工业背心"
	color = COLOR_BROWN_LIGHT

/obj/item/clothing/overwear/coat/vest/colored/medical
	name = "医疗背心"
	color = COLOR_WHITE

/obj/item/clothing/overwear/coat/vest/colored/grey
	name = "灰色背心"
	color = COLOR_GREY

/obj/item/clothing/overwear/coat/vest/colored/merc
	name = "佣兵背心"
	color = "#BCAC86"

/obj/item/clothing/overwear/coat/vest/colored/black
	name = "战术背心"
	color = "#212121"

/obj/item/clothing/overwear/coat/vest/sleeveless_leather_jacket
	name = "无袖皮夹克"
	icon = 'icons/obj/item/clothing/suit/leather_jacket_sleeveless.dmi'

	desc = "需要口袋，但又不需要太多的时候穿。"

	size = SIZE_2*2

	dynamic_inventory_count = 2
	container_max_size = SIZE_1

	armor = /armor/leather/coat

	value = 30


/obj/item/clothing/overwear/coat/vest/webbing
	name = "携行具"
	icon = 'icons/obj/item/clothing/suit/webbing.dmi'
	desc = "给大块头准备的。"
	desc_extended = "一套简洁的携行具，用来携带基本用品。有三个口袋，每个可容纳一件尺寸不超过2的物品。"

	size = SIZE_2*3

	dynamic_inventory_count = 3
	container_max_size = SIZE_2

	value = 100


/obj/item/clothing/overwear/coat/vest/poly
	name = "拼色背心"
	icon = 'icons/obj/item/clothing/suit/white_vest_poly.dmi'

	dyeable = TRUE

	polymorphs = list(
		"shirt" = COLOR_WHITE,
		"pockets" = COLOR_WHITE
	)

/obj/item/clothing/overwear/coat/vest/poly/merc
	name = "佣兵拼色背心"

	polymorphs = list(
		"shirt" = COLOR_OLIVE_DRAB,
		"pockets" = COLOR_BLACK
	)

/obj/item/clothing/overwear/coat/vest/poly/pockets_only
	name = "携行袋"

	polymorphs = list(
		"pockets" = COLOR_BLACK
	)

/obj/item/clothing/overwear/coat/vest/poly/janitor

	polymorphs = list(
		"shirt" = COLOR_GREY,
		"pockets" = COLOR_JANITOR
	)

/obj/item/clothing/overwear/coat/vest/syndicate
	name = "辛迪加作战携行具"
	desc = "上身储物装备的巅峰。"
	desc_extended = "结实耐用的军用携行具，能轻松收纳许多尺寸不超过2的物品。配发给辛迪加高级人员。"
	icon = 'icons/obj/item/clothing/suit/webbing_syndie.dmi'

	size = SIZE_2*5

	dynamic_inventory_count = 6
	container_max_size = SIZE_2
	value = 1500
	value_burgerbux = 1

	rarity = RARITY_RARE

/obj/item/clothing/overwear/coat/vest/revolutionary
	name = "革命军作战携行具"
	desc = "上身储物装备的巅峰。"
	desc_extended = "古老的军用携行具，能轻松收纳许多尺寸不超过2的物品。配发给革命军高级人员。"
	icon = 'icons/obj/item/clothing/suit/webbing_rev.dmi'

	size = SIZE_2*5

	dynamic_inventory_count = 6
	container_max_size = SIZE_2
	value = 1500
	value_burgerbux = 1

	rarity = RARITY_RARE
