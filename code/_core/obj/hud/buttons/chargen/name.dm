/obj/hud/button/chargen/change_name
	name = "更改姓名"
	desc = "名字又算得了什么？"
	desc_extended = "当前角色的姓名。点击这里更改。姓名只允许使用拉丁字母，不允许使用数字。"
	icon = 'icons/hud/nameplate.dmi'
	icon_state = "nameplate"

	screen_loc = "CENTER-1,CENTER+2"

	maptext = "<center>无效姓名</center>"
	maptext_y = 5
	maptext_height = TILE_SIZE
	maptext_width = TILE_SIZE*3

	user_colors = TRUE

/obj/hud/button/chargen/change_name/update_owner(var/mob/desired_owner)

	if(desired_owner && is_player(desired_owner))
		var/mob/living/advanced/player/P = desired_owner
		maptext = "<center>[P.real_name]</center>"

	return ..()


/obj/hud/button/chargen/change_name/clicked_on_by_object(var/mob/activator,var/atom/object,location,control,params)

	. = ..()

	if(is_player(activator) && activator.client)
		var/mob/living/advanced/player/P = activator

		var/choice = input(P,"你希望叫什么名字？","更改姓名",P.real_name) as text|null

		if(!choice) return

		if(activator.client)
			choice = police_text(P.client,choice,check_name=TRUE,check_characters=TRUE,min_length=2,max_length=40)

		if(!choice) return

		P.real_name = choice
		P.setup_name()
		maptext = "<center>[P.real_name]</center>"

