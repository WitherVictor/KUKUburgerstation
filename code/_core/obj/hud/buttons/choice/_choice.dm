/obj/hud/button/choice
	name = "选择"
	desc = "按下此处。"
	desc_extended = "按下这个按钮。"
	icon_state = "square"
	screen_loc = "CENTER,CENTER"

	icon = 'icons/hud/prompts.dmi'

	flags = FLAGS_HUD_SPECIAL

	var/choice/linked_choice

	user_colors = FALSE

	has_quick_function = FALSE

/obj/hud/button/choice/Destroy()
	linked_choice = null
	return ..()

/obj/hud/button/choice/New(var/desired_loc,var/desired_choice)
	linked_choice = desired_choice
	return ..()

/obj/hud/button/choice/clicked_on_by_object(var/mob/caller,object,location,control,params)
	linked_choice.choice_made = id
	return TRUE

/obj/hud/button/choice/yes
	name = "是"
	id = "yes"
	icon_state = "yes"
	screen_loc = "CENTER+2,CENTER"

/obj/hud/button/choice/no
	name = "否"
	id = "no"
	icon_state = "no"
	screen_loc = "CENTER-2,CENTER"

/obj/hud/button/choice/cancel
	name = "取消"
	id = "cancel"
	icon_state = "cancel"
	screen_loc = "CENTER,CENTER-2"



