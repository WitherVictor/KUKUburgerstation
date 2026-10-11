/obj/item/clothing/head/hat/skimask
	name = "滑雪面罩"
	desc = "大把大把的钞票。"
	desc_extended = "遮住你的脸和头，抢银行很好用，拿来滑雪也不错。"
	icon = 'icons/obj/item/clothing/masks/balaclava.dmi'
	icon_state = "inventory"
	slot_icons = TRUE

	item_slot = SLOT_HEAD | SLOT_FACE

	ignore_other_slots = TRUE

	flags_clothing = FLAG_CLOTHING_NOBEAST_HEAD

	dyeable = TRUE

	worn_layer = LAYER_MOB_CLOTHING_MASK
	item_slot_layer = 1

	armor = /armor/cloth/winter/mask

	hidden_organs = list(
		BODY_HAIR_HEAD = TRUE,
		BODY_HAIR_FACE = TRUE
	)

	value = 30

/obj/item/clothing/head/hat/skimask/pre_equip(var/atom/old_location,var/obj/hud/inventory/new_location)

	if(new_location.item_slot & SLOT_HEAD)
		hidden_organs[BODY_HAIR_HEAD] = TRUE
		hidden_organs[BODY_HAIR_FACE] = FALSE
		worn_layer = LAYER_MOB_CLOTHING_HELMET

	if(new_location.item_slot & SLOT_FACE)
		hidden_organs[BODY_HAIR_HEAD] = TRUE
		hidden_organs[BODY_HAIR_FACE] = TRUE
		worn_layer = LAYER_MOB_CLOTHING_HEADWRAP

	. = ..()


/obj/item/clothing/head/hat/skimask/black
	color = COLOR_BLACK

/obj/item/clothing/head/hat/skimask/medical
	name = "医疗全面罩"
	desc = "我来了！还带了药！"
	color = COLOR_MEDICAL

/obj/item/clothing/head/hat/skimask/tactical
	icon = 'icons/obj/item/clothing/masks/tacticool.dmi'
	icon_state = "inventory"

/obj/item/clothing/head/hat/skimask/tactical/black
	color = COLOR_BLACK
