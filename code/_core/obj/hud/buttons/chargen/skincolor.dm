mob/living/advanced/proc/handle_skincolor_chargen(var/desired_color,var/update_blends = TRUE) //This needs to be called when the buttons are made visible.

	change_organ_visual("skin", desired_color = desired_color, should_update = update_blends)

	for(var/obj/hud/button/chargen/skin_color/B in buttons)
		B.skin_color = desired_color

	return TRUE

/obj/hud/button/chargen/skin_color
	name = "更改肤色"
	desc_extended = "点击这里更改角色的肤色。"
	icon_state = "change_skincolor"

	screen_loc = "CENTER-1.5,CENTER-2"

	var/skin_color = "#FFFFFF"

	user_colors = TRUE

	chargen_flags = CHARGEN_SKIN

/obj/hud/button/chargen/skin_color/clicked_on_by_object(var/mob/activator,var/atom/object,location,control,params)

	. = ..()

	if(. && is_advanced(activator))
		var/mob/living/advanced/A = activator
		var/desired_color = input("肤色","肤色",skin_color) as color|null
		if(desired_color)
			A.handle_skincolor_chargen(desired_color)
