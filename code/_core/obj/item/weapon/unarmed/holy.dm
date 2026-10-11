obj/item/weapon/unarmed/holy
	name = "祝圣指虎"
	desc = "神明指引我的拳头。"
	desc_extended = "套在拳头上的大块镀金钢材，攻击时会圣化敌人，但会让动作变得不够灵活。由太空教皇祝圣。"

	icon = 'icons/obj/item/weapons/unarmed/holy_knuckle.dmi'

	damage_type = /damagetype/unarmed/holy

	size = SIZE_1
	weight = 5

	value = 1000

	rarity = RARITY_RARE

obj/item/weapon/unarmed/holy/update_icon()

	. = ..()

	if(is_inventory(loc))
		var/obj/hud/inventory/I = loc
		if(I.click_flags & LEFT_HAND)
			icon_state = "inventory_left"
		else
			icon_state = "inventory_right"


obj/item/weapon/unarmed/holy/spiked
	name = "诅咒指虎"
	desc = "纳尔西指引我的拳头。"
	desc_extended = "套在拳头上的大块诅咒钢材，攻击时会诅咒敌人，但会让动作变得不够灵活。由纳尔西亲自诅咒！"

	icon = 'icons/obj/item/weapons/unarmed/dark_knuckle.dmi'

	damage_type = /damagetype/unarmed/holy/spiked

	size = SIZE_1
	weight = 5

	value = 1000

	rarity = RARITY_RARE
