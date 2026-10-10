/obj/hud/inventory/container
	name = "容器"
	id = "container_debug"
	screen_loc = "CENTER,CENTER" //This is set elsewhere.
	alpha = 0 //Invisible until set elsewhere

	worn_slots = 0
	held_slots = 8
	icon_state = "square_round"

	priority = 1

	max_size = -1
	max_weight = -1

	x_offset_initial = 0
	y_offset_initial = TILE_SIZE

	x_offset_mul = 1
	y_offset_mul = 0

	flags = FLAGS_HUD_MOB

/obj/hud/inventory/container/backpack
	name = "背包"
	id = "backpack"
