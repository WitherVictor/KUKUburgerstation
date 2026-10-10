/obj/hud/button/research/info
	name = "信息"
	icon = 'icons/hud/hud.dmi'
	icon_state = "square_round"
	maptext = "<center>信息</center>"
	layer = LAYER_SCREEN_BLOOD+3

/obj/hud/button/research/info/time
	name = "剩余时间"
	screen_loc = "LEFT,TOP"
	maptext = "<center>时间<br>1:00</center>"
	layer = LAYER_SCREEN_BLOOD+3

/obj/hud/button/research/info/level
	name = "当前等级"
	screen_loc = "LEFT,TOP-1"
	maptext = "<center>等级<br>1</center>"
	layer = LAYER_SCREEN_BLOOD+3

/obj/hud/button/research/info/score
	name = "得分"
	screen_loc = "LEFT,TOP-2"
	maptext = "<center>得分<br>0</center>"
	layer = LAYER_SCREEN_BLOOD+3

/obj/hud/button/research/info/effect
	name = "文字"
	screen_loc = "CENTER,CENTER"
	icon_state = "none"
	maptext = "<center>+1</center>"
	layer = LAYER_SCREEN_BLOOD+5

/obj/hud/button/research/info/quit
	name = "退出按钮"
	screen_loc = "TOP,RIGHT"
	icon_state = "square_round_small"
	maptext = "<center>退出</center>"
	layer = LAYER_SCREEN_BLOOD+4
	mouse_opacity = 1

/obj/hud/button/research/info/quit/clicked_on_by_object(var/mob/activator,var/atom/object,location,control,params)

	. = ..()

	if(. && is_living(activator))
		var/mob/living/L = activator
		L.toggle_research_game(TRUE,FALSE)

	return TRUE

/obj/hud/button/research/info/effect/proc/do_effect(var/obj/hud/button/research/piece/P,var/points_given)
	maptext = "<center><font size=2>+[points_given]</font></center>"
	screen_loc = P.screen_loc
	var/direction = pick(-1,1)
	animate(src,maptext_x = direction*TILE_SIZE*2, maptext_y = RESEARCH_BOARD_SIZE*TILE_SIZE, easing = QUAD_EASING | EASE_OUT, time = 5*RESEARCH_BOARD_SIZE)
	spawn(10*RESEARCH_BOARD_SIZE)
		update_owner(null)
	return TRUE

/obj/hud/button/research/info/text
	name = "文字"
	screen_loc = "CENTER,CENTER"
	icon_state = "none"

	maptext = null
	maptext_x = -(TILE_SIZE*VIEW_RANGE) + 16
	maptext_width = TILE_SIZE*VIEW_RANGE*2
	maptext_height = TILE_SIZE*VIEW_RANGE

	mouse_opacity = 0

	layer = LAYER_SCREEN_BLOOD+5
