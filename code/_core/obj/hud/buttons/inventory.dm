/obj/hud/button/close_inventory
	name = "关闭物品栏"
	icon_state = "close_inventory"
	screen_loc = "CENTER,CENTER"

	essential = TRUE

	flags_hud = FLAG_HUD_MOB | FLAG_HUD_INVENTORY | FLAG_HUD_SPECIAL

	has_quick_function = FALSE

	var/inventory_category = "none"

	var/obj/item/assoc_item

/obj/hud/button/close_inventory/Destroy()
	. = ..()
	assoc_item = null

/obj/hud/button/close_inventory/clicked_on_by_object(var/mob/activator,var/atom/object,location,control,params)

	. = ..()

	if(.)
		assoc_item.close_inventory(activator)

/obj/hud/button/hide_show_inventory
	name = "切换物品栏显示"
	desc = "想腾出更多屏幕空间？点这个按钮。"
	desc_extended = "隐藏物品栏。口袋、腰带、背包和双手等栏位仍会显示。"
	icon_state = "view_inventory"
	screen_loc = "LEFT:1,BOTTOM:12"

	flags_hud = FLAG_HUD_MOB | FLAG_HUD_INVENTORY

	has_quick_function = FALSE

/obj/hud/button/hide_show_inventory/clicked_on_by_object(var/mob/activator,var/atom/object,location,control,params)

	. = ..()

	if(. && is_advanced(owner))
		var/mob/living/advanced/A = owner
		A.toggle_inventory(FLAG_HUD_WORN,FLAG_HUD_SPECIAL,2)
		update_sprite()


/obj/hud/button/hide_show_inventory/update_icon()

	if(!is_advanced(owner))
		return ..()

	var/mob/living/advanced/A = owner


	if(A.draw_inventory)
		icon_state = initial(icon_state)
	else
		icon_state = "[initial(icon_state)]_off"

	..()

/obj/hud/button/close_inventory_defers

	icon_state = "close_inventory"
	screen_loc = "CENTER,CENTER"

	essential = TRUE

	flags_hud = FLAG_HUD_MOB | FLAG_HUD_INVENTORY | FLAG_HUD_SPECIAL

	has_quick_function = FALSE

/obj/hud/button/close_inventory_defers/clicked_on_by_object(var/mob/activator,var/atom/object,location,control,params)

	. = ..()

	if(. && is_advanced(activator))
		var/mob/living/advanced/A = activator
		A.clear_inventory_defers()

