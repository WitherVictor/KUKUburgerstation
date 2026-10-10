/objective/sell_ore
	name = "出售材料"
	desc = "向货运部出售一定数量的材料。"

	credit_reward = 1000
	burgerbux_reward = 1
	points_reward = 5

	var/desired_quota = 50

/objective/sell_ore/get_description()
	return "向货运部出售[desired_quota]单位的矿石或材料（类型不限）。"

/objective/sell_ore/on_object_sold(var/atom/movable/object)

	if(istype(object,/obj/item/material/))
		var/obj/item/material/M = object
		desired_quota -= M.material_multiplier * M.amount
		check_completion()

	return ..()

/objective/sell_ore/check_completion()

	desired_quota = max(0,desired_quota)
	if(desired_quota == 0)
		return COMPLETED

	return ..()

/objective/sell_ore/setup()
	return TRUE
