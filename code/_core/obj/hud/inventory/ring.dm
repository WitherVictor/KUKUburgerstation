/obj/hud/inventory/organs/ring
	name = "戒指"
	icon = 'icons//hud/hud_tiny.dmi'
	icon_state = "slot_ring"
	screen_loc = "CENTER,CENTER"

	item_slot = SLOT_RING

	max_slots = 1
	worn = TRUE

	flags_hud = FLAG_HUD_INVENTORY | FLAG_HUD_WORN | FLAG_HUD_MOB

	priority = 100

	x_offset = -9
	y_offset = -9

/obj/hud/inventory/organs/ring/nw
	name = "戒指槽 1"
	screen_loc = "LEFT+2:3,BOTTOM+4:32"
	id = BODY_RING_01

/obj/hud/inventory/organs/ring/ne
	name = "戒指槽 2"
	screen_loc = "LEFT+2:19,BOTTOM+4:32"
	id = BODY_RING_02

/obj/hud/inventory/organs/ring/se
	name = "戒指槽 3"
	id = BODY_RING_03
	screen_loc = "LEFT+2:19,BOTTOM+4:16"

/obj/hud/inventory/organs/ring/sw
	name = "戒指槽 4"
	id = BODY_RING_04
	screen_loc = "LEFT+2:3,BOTTOM+4:16"

