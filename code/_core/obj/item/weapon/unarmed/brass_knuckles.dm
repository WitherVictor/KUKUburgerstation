obj/item/weapon/unarmed/brass_knuckles

	name = "铁指虎"
	desc = "徒手格斗的作弊工具。"
	desc_extended = "套在拳头上的大块金属，增加拳击威力，但会让动作变得不够灵活。"

	icon = 'icons/obj/item/weapons/unarmed/brass_knuckles.dmi'

	damage_type = /damagetype/unarmed/brass

	size = SIZE_1
	weight = 4

	value = 100

	rarity = RARITY_COMMON

obj/item/weapon/unarmed/brass_knuckles/update_icon()

	. = ..()

	if(is_inventory(loc))
		var/obj/hud/inventory/I = loc
		if(I.click_flags & LEFT_HAND)
			icon_state = "inventory_left"
		else
			icon_state = "inventory_right"



obj/item/weapon/unarmed/brass_knuckles/mod
	name = "尖刺指虎"
	desc = "徒手格斗的作弊工具。"
	desc_extended = "套在拳头上的大块黄铜，增加拳击威力，但会让动作变得不够灵活。这副还带有尖刺，格外致命。"

	icon = 'icons/obj/item/weapons/unarmed/spiked_knuckles.dmi'

	damage_type = /damagetype/unarmed/brass/spiked

	size = SIZE_1
	weight = 6

	value = 100

	rarity = RARITY_UNCOMMON
