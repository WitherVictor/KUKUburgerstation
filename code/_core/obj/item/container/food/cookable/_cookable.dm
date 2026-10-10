/obj/item/container/food/cookable
	name = "可烹饪食材"
	health = /health/obj/item/misc/
	scale_sprite = FALSE
	var/cooked = FALSE

/obj/item/container/food/cookable/update_icon()
	. = ..()
	icon_state = "[initial(icon_state)][cooked ? "_cooked" : ""]"
	
/obj/item/container/food/cookable/dough
	name = "面团"
	desc = "把面团拿来。"
	desc_extended = "一团面。"
	icon = 'icons/obj/items/consumable/food/cookable_bread.dmi'
	icon_state = "dough_ball"
	crafting_id = "dough"
	cooked = FALSE

