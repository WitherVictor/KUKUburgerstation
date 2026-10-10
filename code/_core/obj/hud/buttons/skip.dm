/obj/hud/button/skip
	name = "跳过过场"
	desc = "这些过场可是我用心做的！"
	desc_extended = "跳过当前过场。"
	icon_state = "skip"
	screen_loc = "RIGHT,BOTTOM:12"

	var/sneaking = 0

	flags_hud = FLAG_HUD_SPECIAL

	has_quick_function = FALSE


/obj/hud/button/skip/clicked_on_by_object(var/mob/activator,var/atom/object,location,control,params)

	. = ..()

	if(.)
		activator.skip_cutscene = TRUE
