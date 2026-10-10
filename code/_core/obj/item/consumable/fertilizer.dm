/obj/item/consumable/fertilizer
	name = "长效灵"
	desc = "奇怪的太空肥料。"
	desc_extended = "对植物使用可提升其效力。"
	icon = 'icons/obj/item/container/spray_bottle.dmi'
	icon_state = "inventory"
	value = 50

/obj/item/consumable/fertilizer/click_on_object(var/mob/caller as mob,var/atom/object,location,control,params)
	if (!istype(object,/obj/structure/interactive/plant))
		return

	var/obj/structure/interactive/plant/O = object

	O.potency += 1
	caller.visible_message(span("notice","[caller.name]给[O.name]施了肥。"),span("notice","你给[O.name]施了肥。"))
	delete()
