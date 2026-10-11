/obj/item/weapon/melee/energy
	var/enabled = FALSE
	override_icon_state = TRUE
	override_icon_state_held = TRUE

	damage_type = /damagetype/melee/sword/energy
	var/damage_type_on = /damagetype/melee/sword/energy/on

/obj/item/weapon/melee/energy/can_block()
	return enabled

/obj/item/weapon/melee/energy/can_parry()
	return enabled

/obj/item/weapon/melee/energy/get_examine_details_list(var/mob/examiner)
	. = ..()
	if(enabled) . += span("notice","当前已激活。")

/obj/item/weapon/melee/energy/click_self(var/mob/activator,location,control,params)
	INTERACT_CHECK
	INTERACT_DELAY(3)
	enabled = !enabled
	update_sprite()
	return TRUE

/obj/item/weapon/melee/energy/update_icon()

	if(enabled)
		icon_state = "[initial(icon_state)]_on"
		if(wielded)
			icon_state_held_left = "[initial(icon_state_held_left)]_wielded_on"
			icon_state_held_right = "[initial(icon_state_held_right)]_wielded_on"
		else
			icon_state_held_left = "[initial(icon_state_held_left)]_on"
			icon_state_held_right = "[initial(icon_state_held_right)]_on"
		dan_icon_state = "[initial(dan_icon_state)]_on"
		dan_icon_state_wielded = "[initial(dan_icon_state_wielded)]_on"
		dan_icon_state_back = "[initial(dan_icon_state_back)]_on"
		damage_type = damage_type_on
	else
		icon_state = initial(icon_state)
		if(wielded)
			icon_state_held_left = "[initial(icon_state_held_left)]_wielded"
			icon_state_held_right = "[initial(icon_state_held_right)]_wielded"
		else
			icon_state_held_left = initial(icon_state_held_left)
			icon_state_held_right = initial(icon_state_held_right)
		dan_icon_state = initial(dan_icon_state)
		dan_icon_state_wielded = initial(dan_icon_state_wielded)
		dan_icon_state_back = initial(dan_icon_state_back)
		damage_type = initial(damage_type)

	update_held_icon()

	return ..()


/obj/item/weapon/melee/energy/clicked_on_by_object(var/mob/activator as mob,var/atom/object,location,control,params)



	if(is_item(object) && length(polymorphs))
		var/obj/item/I = object
		if(I.flags_tool & FLAG_TOOL_MULTITOOL)

			INTERACT_CHECK
			INTERACT_CHECK_OBJECT

			var/list/part_display_names = list("base"="基底","blade"="刀刃","core"="核心","shield"="盾面")
			var/list/color_choices = list()
			for(var/part in polymorphs)
				var/part_display = part_display_names[part] ? part_display_names[part] : part
				color_choices[part_display] = part
			var/choice = input("要更改[src.name]哪个部位的颜色？","选择颜色") as null|anything in color_choices
			if(!choice)
				activator.to_chat(span("notice","你决定不更改[src.name]的颜色。"))
				return TRUE
			choice = color_choices[choice]

			INTERACT_CHECK
			INTERACT_CHECK_OBJECT

			var/choice_color = input("要改成什么颜色？","选择颜色",color) as color|null

			INTERACT_CHECK
			INTERACT_CHECK_OBJECT
			INTERACT_DELAY(5)

			if(!choice_color)
				activator.to_chat(span("notice","你决定不更改[src.name]的颜色。"))
				return TRUE

			color = choice_color
			polymorphs[choice] = polymorphs[choice]
			activator.to_chat(span("notice","你更改了[src.name]的颜色。"))
			update_sprite()

			return TRUE

	return ..()

