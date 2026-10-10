/ability/quick_draw
	name = "快速取物"
	desc = "将装备槽中的物品迅速取到惯用手中。"
	icon_state = "quick_draw"
	cost = 5
	cooldown = SECONDS_TO_DECISECONDS(1)
	var/attack_too = FALSE

	category = "Quick Draw"

/ability/quick_draw/on_cast_pre(var/mob/activator,var/atom/target,location,params)

	if(!is_advanced(activator))
		return FALSE

	var/mob/living/advanced/A = activator

	if(!A.inventories_by_id[BODY_TORSO_OB])
		return FALSE

	var/obj/hud/inventory/I = A.inventories_by_id[BODY_TORSO_OB]

	var/obj/item/I2 = I.get_top_object()
	if(!istype(I2))
		return FALSE

	. = ..()

	if(. && A.put_in_hands(I2))
		if(attack_too)
			var/obj/hud/inventory/new_inventory = I2.loc
			if(!new_inventory)
				return FALSE
			I2.click_on_object(activator,target,location,null,params)
		return TRUE


/ability/quick_draw/plus
	name = "快速取物+"
	desc = "将装备槽中的物品迅速取到惯用手中。如果该物品是武器，会尝试攻击目标位置。"
	icon_state = "quick_draw_plus"
	attack_too = TRUE
	cost = 20
