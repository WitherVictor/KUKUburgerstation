/obj/item/flare
	name = "照明棒"
	desc = "照亮前路。"
	desc_extended = "用于照亮黑暗区域的高亮便携照明棒，可持续燃烧约5分钟。使用说明：取下盖子，用盖子上粗糙的黑色部分擦划红色点火片，然后扔出照明棒。"
	icon = 'icons/obj/item/flare.dmi'
	icon_state = "flare"

	var/obj/item/flare_cap/stored_cap

	var/ignited = FALSE
	var/has_fuel = TRUE

	desired_light_range = VIEW_RANGE
	desired_light_power = 1
	desired_light_color = "#FF7777"

	size = SIZE_1

	value = 20

/obj/item/flare/PreDestroy()
	QDEL_NULL(stored_cap)
	. = ..()

/obj/item/flare/save_item_data(var/mob/living/advanced/player/P,var/save_inventory = TRUE,var/died=FALSE,var/loadout=FALSE)
	RUN_PARENT_SAFE
	SAVEATOM("stored_cap")
	SAVEVAR("ignited")
	SAVEVAR("has_fuel")

/obj/item/flare/load_item_data_pre(var/mob/living/advanced/player/P,var/list/object_data,var/loadout=FALSE)
	RUN_PARENT_SAFE
	LOADATOM("stored_cap")
	LOADVAR("ignited")
	LOADVAR("has_fuel")

/obj/item/flare/Finalize()
	. = ..()
	update_sprite()

/obj/item/flare/clicked_on_by_object(var/mob/activator,var/atom/object,location,control,params)

	if(istype(object,/obj/item/flare_cap/))
		INTERACT_CHECK
		INTERACT_CHECK_OBJECT
		INTERACT_DELAY(10)
		if(is_living(activator))
			var/mob/living/L = activator
			if(L.attack_flags & CONTROL_MOD_DISARM)
				stored_cap.drop_item(src)
				stored_cap = object
				activator.to_chat(span("notice","你将[object.name]重新盖到[src.name]上。"))
				play_sound('sound/items/flare_cap.ogg',get_turf(src))
				return TRUE
		ignite(activator)
		return TRUE

	if(stored_cap && istype(object,/obj/hud/inventory) && is_advanced(activator))
		INTERACT_CHECK
		INTERACT_DELAY(10)
		var/mob/living/advanced/A = activator
		A.put_in_hands(stored_cap,params)
		activator.to_chat(span("notice","你从[src.name]上取下了[stored_cap.name]。"))
		play_sound('sound/items/flare_cap.ogg',get_turf(src))
		stored_cap = null
		update_sprite()
		return TRUE

	. = ..()

/obj/item/flare/post_move(var/atom/old_loc)

	. = ..()

	if(is_inventory(old_loc) != is_inventory(loc))
		update_sprite()


/obj/item/flare/proc/ignite(var/mob/activator)

	if(!has_fuel)
		activator.to_chat(span("warning","[src.name]已经燃尽了！"))
		return FALSE

	if(ignited)
		if(activator)
			if(prob(1))
				activator.to_chat(span("warning","[src.name]都他妈已经点着了！"))
			else
				activator.to_chat(span("warning","[src.name]已经点着了！"))
		return FALSE

	ignited = TRUE

	activator?.visible_message(span("notice","[activator.name]点燃了[src.name]。"),span("notice","你点燃了[src.name]。"))

	var/flare_time = rand(280,320)
	CALLBACK("\ref[src]_flare_time",SECONDS_TO_DECISECONDS(flare_time),src,src::expire())

	play_sound('sound/items/flare_in.ogg',get_turf(src))

	update_sprite()
	update_atom_light()

	return TRUE

/obj/item/flare/proc/expire()
	ignited = FALSE
	has_fuel = FALSE
	update_sprite()
	update_atom_light()
	play_sound('sound/items/flare_out.ogg',get_turf(src))
	return TRUE

/obj/item/flare/update_atom_light()

	if(ignited)
		set_light_sprite(desired_light_range, desired_light_power, desired_light_color,desired_light_angle)
	else
		set_light_sprite(FALSE)

	return TRUE

/obj/item/flare/get_base_transform()
	. = ..()
	if(is_inventory(loc))
		var/matrix/M = .
		M.Turn(90)

/obj/item/flare/update_sprite()
	. = ..()
	transform = get_base_transform()
	update_held_icon()

/obj/item/flare/update_icon()

	. = ..()

	if(has_fuel)
		icon_state = "flare"
	else
		icon_state = "flare_spent"


/obj/item/flare/update_overlays()

	. = ..()

	if(stored_cap)
		var/image/I = new/image(icon,"cap")
		add_overlay(I)

	if(ignited)
		var/image/I = new/image(icon,"fire")
		add_overlay(I)
		/*
		var/image/I2 = new/image(icon,"lense")
		I2.pixel_x = -8
		I2.blend_mode = BLEND_ADD
		add_overlay(I2)
		*/

/obj/item/flare/Generate()
	. = ..()
	stored_cap = new(src)
	INITIALIZE(stored_cap)
	GENERATE(stored_cap)
	FINALIZE(stored_cap)

/obj/item/flare_cap
	name = "照明棒盖"
	desc = "请勿吞食。"
	desc_extended = "取下的照明棒盖，顶部带有粗糙的擦划面。"
	icon = 'icons/obj/item/flare.dmi'
	icon_state = "cap"

	size = SIZE_1

	value = 1
