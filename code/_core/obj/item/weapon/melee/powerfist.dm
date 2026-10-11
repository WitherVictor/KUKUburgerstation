/obj/item/weapon/melee/powerfist

	name = "动力拳套"
	desc = "你梦寐以求的东西。"
	desc_extended = "笨重的手套连着巨大的液压机。这能出什么问题呢？"

	icon = 'icons/obj/item/weapons/unarmed/powerfist.dmi'

	damage_type = /damagetype/unarmed/powerfist

	size = SIZE_2
	weight = 10

	value = 400

/obj/item/weapon/melee/powerfist/update_icon()

	. = ..()

	if(is_inventory(loc))
		var/obj/hud/inventory/I = loc
		if(I.click_flags & LEFT_HAND)
			icon_state = "inventory_left"
		else
			icon_state = "inventory_right"
