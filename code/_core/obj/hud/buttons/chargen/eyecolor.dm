mob/living/advanced/proc/handle_eyecolor_chargen(var/desired_color,var/update_blends=TRUE) //This needs to be called when the buttons are made visible.
	change_organ_visual("eye", desired_color = desired_color, should_update = update_blends)
	for(var/obj/hud/button/chargen/eye_color/B in buttons)
		B.eye_color = desired_color

	return TRUE

/obj/hud/button/chargen/eye_color
	name = "更改眼睛颜色"
	icon_state = "change_eyecolor"
	desc_extended = "点击这里更改角色的眼睛颜色。"

	screen_loc = "CENTER+1.5,CENTER-2"

	var/eye_color = "#FFFFFF"

	chargen_flags = CHARGEN_EYE

/obj/hud/button/chargen/eye_color/update_icon()

	var/icon/I = new/icon(icon,icon_state)
	swap_colors(I)
	icon = I

	return ..()

/obj/hud/button/chargen/eye_color/clicked_on_by_object(var/mob/activator,var/atom/object,location,control,params)

	. = ..()

	if(. && is_advanced(activator))
		var/mob/living/advanced/A = activator
		var/desired_color = input("眼睛颜色","眼睛颜色",eye_color) as color|null
		if(desired_color)
			A.handle_eyecolor_chargen(desired_color)

	return

