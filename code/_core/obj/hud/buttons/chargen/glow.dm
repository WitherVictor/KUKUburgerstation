mob/living/advanced/proc/handle_glow_chargen(var/desired_color,var/update_blends = TRUE) //This needs to be called when the buttons are made visible.

	change_organ_visual("skin_glow", desired_color = desired_color, should_update = update_blends)

	for(var/obj/hud/button/chargen/glow/B in buttons)
		B.glow_color = desired_color

	return TRUE

/obj/hud/button/chargen/glow
	name = "更改发光颜色"
	desc_extended = "点击这里更改角色的发光颜色。"
	icon_state = "change_glowcolor"

	screen_loc = "CENTER-2.5,CENTER-2"

	var/glow_color = "#FFFFFF"

	user_colors = TRUE

	chargen_flags = CHARGEN_GLOW

/obj/hud/button/chargen/glow/clicked_on_by_object(var/mob/activator,var/atom/object,location,control,params)

	. = ..()

	if(. && is_advanced(activator))
		var/mob/living/advanced/A = activator
		var/desired_color = input("发光颜色","发光颜色",glow_color) as color|null
		if(desired_color)
			A.handle_glow_chargen(desired_color)
