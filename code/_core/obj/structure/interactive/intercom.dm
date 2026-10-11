/obj/structure/interactive/intercom
	name = "舰内对讲机"
	desc = "有一天，当——"
	desc_extended = "连接舰内公共频率的对讲机。空手点击可开关麦克风，按住ALT空手点击可开关接收器。"
	icon = 'icons/obj/structure/radio.dmi'
	icon_state = "intercom"

	desired_light_range = 1
	desired_light_power = 1
	desired_light_color = "#00FF00"

	var/obj/item/device/radio/stored_radio = /obj/item/device/radio/nanotrasen

	plane = PLANE_WALL_ATTACHMENT

/obj/structure/interactive/intercom/PreDestroy()
	QDEL_NULL(stored_radio)
	. = ..()

/obj/structure/interactive/intercom/New(var/desired_loc)
	stored_radio = new stored_radio(src) //Initialized somewhere else. Don't know where, though, honestly.
	stored_radio.set_anchored(TRUE)
	stored_radio.broadcasting = FALSE
	stored_radio.receiving = TRUE
	return ..()

/obj/structure/interactive/intercom/update_overlays()
	. = ..()
	var/image/I = new/image(initial(icon),"intercom_light")
	I.plane = PLANE_LIGHTING_EFFECT
	add_overlay(I)

/obj/structure/interactive/intercom/Initialize()
	try_attach_to()
	setup_dir_offsets()
	return ..()

/obj/structure/interactive/intercom/PostInitialize()
	. = ..()
	update_sprite()

/obj/structure/interactive/intercom/clicked_on_by_object(var/mob/activator as mob,var/atom/object,location,control,params)

	if(!stored_radio)
		return ..()

	if(!is_inventory(object))
		return ..()

	INTERACT_CHECK
	INTERACT_CHECK_OBJECT
	INTERACT_DELAY(5)

	if(activator.attack_flags & CONTROL_MOD_DISARM)
		stored_radio.receiving = !stored_radio.receiving
		activator.to_chat(span("notice","你[stored_radio.receiving ? "打开" : "关闭"]了对讲机接收器。"))
	else
		stored_radio.broadcasting = !stored_radio.broadcasting
		activator.to_chat(span("notice","你[stored_radio.broadcasting ? "打开" : "关闭"]了对讲机麦克风。"))
		icon_state = stored_radio.broadcasting ? "intercom_speak" : "intercom"

	return TRUE

/obj/structure/interactive/intercom/active/Finalize()
	. = ..()
	stored_radio.broadcasting = TRUE


/obj/structure/interactive/intercom/active/poly/Finalize()
	. = ..()
	stored_radio.broadcasting_range = 3
	stored_radio.listen_range = 3
