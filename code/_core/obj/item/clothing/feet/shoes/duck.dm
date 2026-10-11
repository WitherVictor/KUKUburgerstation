/obj/item/clothing/feet/shoes/duck
	name = "鸭子右拖鞋"
	desc = "制作这些拖鞋时伤害了鸭子。"
	desc_extended = "自带嘎嘎作响的脚步声，满足你的一切鸭子需求。嘎！"

	icon_state = "inventory_right"
	icon_state_worn = "worn_right"

	icon = 'icons/obj/item/clothing/shoes/duck.dmi'

	armor = /armor/cloth/clown

	size = SIZE_2


	value = 100

	speed_bonus = -0.05

	rarity = RARITY_UNCOMMON

/obj/item/clothing/feet/shoes/duck/get_footsteps(var/list/original_footsteps,var/enter=FALSE)
	original_footsteps += /footstep/quack
	return original_footsteps

/obj/item/clothing/feet/shoes/duck/left
	name = "鸭子左拖鞋"
	icon_state = "inventory_left"
	icon_state_worn = "worn_left"

	item_slot = SLOT_FOOT
	item_slot_mod = SLOT_MOD_LEFT
	protected_limbs = list(BODY_FOOT_LEFT)


//sqeak when stepped on
/obj/item/clothing/feet/shoes/duck/Crossed(atom/movable/O,atom/OldLoc)
	. = ..()
	play_sound(pick('sound/effects/footsteps/quack1.ogg','sound/effects/footsteps/quack2.ogg'),get_turf(src),range_max=VIEW_RANGE)
