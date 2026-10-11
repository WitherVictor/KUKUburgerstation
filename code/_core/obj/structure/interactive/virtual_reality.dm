/obj/structure/interactive/virtual_reality
	icon = 'icons/obj/structure/vr_pad.dmi'
	icon_state = "pad"
	interaction_flags = FLAG_INTERACTION_LIVING | FLAG_INTERACTION_DEAD | FLAG_INTERACTION_NO_DISTANCE

/obj/structure/interactive/virtual_reality/Finalize()
	. = ..()
	update_sprite()

/obj/structure/interactive/virtual_reality/update_overlays()
	var/image/I = new/image(initial(icon),"light")
	I.plane = PLANE_EFFECT_LIGHTING
	add_overlay(I)

/obj/structure/interactive/virtual_reality/join_game
	name = "准备就绪"
	maptext = "<center>准备！</center>"

/obj/structure/interactive/virtual_reality/join_game/clicked_on_by_object(var/mob/caller,var/atom/object,location,control,params)

	if(istype(caller,/mob/living/advanced/player/virtual))
		var/mob/living/advanced/player/virtual/V = caller
		if(V in SSvirtual_reality.current_virtual_reality.teams["Ready"])
			SSvirtual_reality.current_virtual_reality.move_to_team(V,"Lobby")
			V.to_chat(span("notice","你已取消准备。再次与此全息影像交互即可准备就绪。"))
		else
			SSvirtual_reality.current_virtual_reality.move_to_team(V,"Ready")
			V.to_chat(span("notice","你已准备就绪。再次与此全息影像交互即可取消准备。"))

	. = ..()
