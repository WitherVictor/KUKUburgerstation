/obj/item/light
	var/obj/structure/interactive/lighting/light_type //Stored as a path
	color = COLOR_LIGHT

	size = SIZE_1

	weight = 0.25

/obj/item/light/click_on_object(var/mob/activator as mob,var/atom/object,location,control,params)

	if(istype(object,light_type))
		INTERACT_CHECK
		INTERACT_CHECK_OBJECT
		INTERACT_DELAY(5)
		var/obj/structure/interactive/lighting/L = object
		if(L.desired_light_color)
			var/obj/item/light/LT = new src.type(object.loc)
			LT.desired_light_color = L.desired_light_color
			INITIALIZE(LT)
			GENERATE(LT)
			FINALIZE(LT)
		L.desired_light_color = color
		L.update_atom_light()
		L.update_sprite()
		activator.visible_message(span("notice","[activator.name]将[src.name]装入了[object.name]。"),span("notice","你将[src.name]装入了[object.name]。"))
		qdel(src)
		return TRUE

	return ..()


/obj/item/light/tube
	name = "灯管"
	desc = "灯——管。"
	desc_extended = "灯具用的灯管，可替换原有灯管或装入新灯具。"
	icon = 'icons/obj/item/light_tube.dmi'
	icon_state = "inventory"
	light_type = /obj/structure/interactive/lighting/fixture/tube

	value = 4


/obj/item/light/bulb
	name = "灯泡"
	desc = "灯——泡。"
	desc_extended = "灯具用的灯泡，可替换原有灯泡或装入新灯具。"
	icon = 'icons/obj/item/light_bulb.dmi'
	icon_state = "inventory"
	light_type = /obj/structure/interactive/lighting/fixture/bulb

	value = 2
