/obj/structure/interactive/powerbutton
	name = "红色大电源按钮"
	desc = "想知道它有什么用？哦，这里写着呢。"
	desc_extended = "开关前沿作战基地（FOB）供电的红色大按钮。控制照明，更重要的是，还控制基地的传送门。"

	icon = 'icons/obj/item/button.dmi'
	icon_state = "button"

	var/active = FALSE

	var/obj/structure/interactive/gateway/linked_gateway

	pixel_x = 0
	pixel_y = 4

	anchored = TRUE


/obj/structure/interactive/powerbutton/Initialize()
	if(!linked_gateway)
		linked_gateway = locate() in world
	. = ..()

/obj/structure/interactive/powerbutton/Finalize()

	for(var/area/fob/FOB in world)
		FOB.sync_lights(active)

	linked_gateway.set_active(active)

	. = ..()


/obj/structure/interactive/powerbutton/clicked_on_by_object(var/mob/caller,var/atom/object,location,control,params)

	if(!is_advanced(caller))
		return ..()

	INTERACT_CHECK
	INTERACT_DELAY(10)

	var/mob/living/advanced/A  = caller

	if(active && A.loyalty_tag == "NanoTrasen")
		A.to_chat(span("notice","前沿作战基地已经通电了！"))
		return TRUE

	flick("button_anim",src)

	play_sound('sound/effects/deny.ogg',get_turf(src))

	active = !active

	for(var/area/fob/FOB in world)
		FOB.sync_lights(active)

	linked_gateway.set_active(active)

	. = ..()
