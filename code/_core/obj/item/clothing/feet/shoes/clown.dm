/obj/item/clothing/feet/shoes/clown
	name = "小丑右鞋"
	desc = "恶作剧者行头的一部分。该死，这鞋真大！"
	desc_extended = "自带吱吱作响的脚步声，满足你的一切小丑需求。叭！"

	icon_state = "inventory_right"
	icon_state_worn = "worn_right"

	icon = 'icons/obj/item/clothing/shoes/clown.dmi'

	armor = /armor/cloth/clown

	size = SIZE_2


	value = 100

	speed_bonus = -0.05



/obj/item/clothing/feet/shoes/clown/get_footsteps(var/list/original_footsteps,var/enter=FALSE)
	original_footsteps += /footstep/clownstep
	return original_footsteps

/obj/item/clothing/feet/shoes/clown/left
	name = "小丑左鞋"
	icon_state = "inventory_left"
	icon_state_worn = "worn_left"

	item_slot = SLOT_FOOT
	item_slot_mod = SLOT_MOD_LEFT
	protected_limbs = list(BODY_FOOT_LEFT)
