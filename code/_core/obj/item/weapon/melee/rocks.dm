/obj/item/weapon/melee/rock
	name = "石头"
	desc = "要是月球上有两个宇航员，其中一个用石头杀了另一个，那也太操蛋了吧？"
	desc_extended = "只有傻子或走投无路的人才会拿它当武器。如果你还有空读这段话，多半还没到那份上。"

	icon = 'icons/obj/items/weapons/melee/nature/rocks.dmi'
	icon_state = "inventory01"


	icon_state_worn = "worn"

	damage_type = "rock"

	item_slot = SLOT_GROIN_O
	worn_layer = LAYER_MOB_CLOTHING_BACK

/obj/item/weapon/melee/rock/New()
	. = ..()
	icon_state = pick("inventory0[rand(1,3)]")
	pixel_x = rand(-12,12)
	pixel_y = rand(-12,12)
