/obj/item/spraycan
	name = "喷漆罐"
	desc = "帮派那点破事。"
	desc_extended = "破坏公物的小混混、艺术家和抢地盘的帮派都用得上。使用前请确认喷嘴朝向正确。"
	icon_state = "spraycan"
	icon = 'icons/obj/item/spraycan.dmi'

	var/spray_color = COLOR_RED

	var/cap_on = TRUE

	var/icon/desired_spray
	var/spray_owner //ckey

	var/obj/effect/cleanable/spray/existing_spray

	value = 3000
	value_burgerbux = 10

	rarity = RARITY_RARE

/obj/item/spraycan/get_examine_list(var/mob/examiner)
	. = ..()
	if(cap_on == TRUE)
		. += span("notice","使用可选择喷绘图案。<br>空手点击可取下盖子。")
	else
		. += span("notice","使用可选择喷绘图案。<br>空手点击可盖回盖子。")

/obj/item/spraycan/PreDestroy()
	QDEL_NULL(desired_spray)
	QDEL_NULL(existing_spray)
	. = ..()

/obj/item/spraycan/Finalize()
	. = ..()
	update_sprite()

/obj/item/spraycan/click_self(var/mob/activator,location,control,params)

	if(!activator || !activator.client)
		return TRUE

	var/client/C = activator.client

	if(C.icon_request_details)
		C.icon_request_details.Cut()

	C.icon_request_details = list(
		"proc" = nameof(src::on_upload_spray()),
		"proc_src" = src,
		"width_limit" = 16,
		"height_limit" = 16
	)

	C.upload_icon()

	return TRUE

/obj/item/spraycan/proc/on_upload_spray(var/client/activator,var/icon/desired_icon)

	if(!activator || !activator.mob || get_dist(activator.mob,src) > 1)
		return FALSE

	if(desired_spray)
		qdel(desired_spray)

	desired_spray = desired_icon
	spray_owner = activator.ckey

	activator.to_chat(span("notice","喷绘图案设置成功！"))

	return TRUE

/obj/item/spraycan/click_on_object(var/mob/activator,var/atom/object,location,control,params)

	if(object.plane >= PLANE_HUD)
		return ..()

	var/turf/T = get_turf(object)

	if(T)
		INTERACT_CHECK
		INTERACT_DELAY(10)
		if(cap_on)
			activator.to_chat(span("warning","盖子还没取下！"))
			return TRUE
		if(!desired_spray)
			activator.to_chat(span("warning","尚未选择喷绘图案。"))
			return TRUE
		if(existing_spray && !existing_spray.qdeleting)
			qdel(existing_spray)
		var/obj/effect/cleanable/spray/C = new(T)
		C.icon = desired_spray
		C.name = "“艺术”——作者：[activator.ckey]"
		play_sound('sound/effects/spray.ogg',T)
		existing_spray = C

	return TRUE

	. = ..()

/obj/item/spraycan/clicked_on_by_object(var/mob/activator,var/atom/object,location,control,params)

	if(is_inventory(object))
		INTERACT_CHECK
		INTERACT_DELAY(10)
		toggle_cap(activator)
		return TRUE

	. = ..()


/obj/item/spraycan/proc/toggle_cap(var/mob/activator)
	cap_on = !cap_on
	update_sprite()
	activator.to_chat(span("notice","你[cap_on ? "盖回" : "取下"]了[src.name]的盖子。"))
	return TRUE

/obj/item/spraycan/update_icon()
	. = ..()
	icon_state = initial(icon_state)
	if(cap_on) icon_state = "[icon_state]_cap"

/obj/item/spraycan/update_overlays()
	. = ..()
	var/image/I = new/image(icon,"[icon_state]_colors")
	I.color = spray_color
	add_overlay(I)
