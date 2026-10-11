/obj/item/clothing/head/hat/bandana
	name = "方巾"
	desc = "靠，当黑帮真爽。"
	desc_extended = "既可以当面巾遮脸，也可以当头巾戴。"
	icon = 'icons/obj/item/clothing/masks/bandana.dmi'
	icon_state = "inventory"
	slot_icons = TRUE


	item_slot = SLOT_HEAD | SLOT_FACE
	ignore_other_slots = TRUE

	dyeable = TRUE

	worn_layer = LAYER_MOB_CLOTHING_MASK
	item_slot_layer = 1

	armor = /armor/cloth

	value = 40

/obj/item/clothing/head/hat/bandana/pre_equip(var/atom/old_location,var/obj/hud/inventory/new_location)

	. = ..()

	if(new_location.item_slot & SLOT_HEAD)
		hidden_organs = list(BODY_HAIR_HEAD = TRUE, BODY_HAIR_FACE = FALSE)
		worn_layer = LAYER_MOB_CLOTHING_HELMET

	if(new_location.item_slot & SLOT_FACE)
		hidden_organs = list(BODY_HAIR_HEAD = FALSE, BODY_HAIR_FACE = TRUE)
		worn_layer = LAYER_MOB_CLOTHING_MASK


/obj/item/clothing/head/hat/bandana/red
	color = "#880000"
