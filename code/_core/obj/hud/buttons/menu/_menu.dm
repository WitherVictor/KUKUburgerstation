/obj/hud/button/menu
	name = "菜单按钮"
	icon = 'icons/hud/menu.dmi'
	mouse_opacity = 1

	flags_hud = FLAG_HUD_MOB

/obj/hud/button/menu/title
	name = "汉堡站13"
	icon_state = "title"
	screen_loc = "LEFT+1,CENTER+2"

/obj/hud/button/menu/selection
	var/command_to_run

/obj/hud/button/menu/selection/clicked_on_by_object(var/mob/activator,var/atom/object,location,control,params)

	. = ..()

	if(. && activator.client && command_to_run)
		winset(activator.client,null,"command=[command_to_run]")


/obj/hud/button/menu/selection/New(var/desired_loc)
	color = null
	return ..()

/obj/hud/button/menu/selection/MouseEntered(location,control,params)
	color = "#FFB200"
	return ..()

/obj/hud/button/menu/selection/MouseExited(location,control,params)
	color = null
	return ..()

/obj/hud/button/menu/selection/character_new
	name = "创建角色并加入"
	desc_extended = "点击这里创建新角色，并加入当前回合。"
	icon_state = "new"
	screen_loc = "LEFT+1,CENTER+1"
	command_to_run = "new-character"

/obj/hud/button/menu/selection/character_load
	name = "载入角色并加入"
	desc_extended = "点击这里载入已有角色，并加入当前回合。"
	icon_state = "load"
	screen_loc = "LEFT+1,CENTER-0"
	command_to_run = "load-character"


/obj/hud/button/menu/selection/join_antagonist
	name = "以对抗角色加入"
	desc_extended = "条件允许时，点击这里成为对抗角色。对抗角色可以在任务结束后、回合接近尾声时入场。需要一枚对抗角色代币。"
	icon_state = "antag"
	screen_loc = "LEFT+1,CENTER-1"
	command_to_run = "become-antagonist"


/obj/hud/button/menu/selection/observe
	name = "旁观"
	desc_extended = "点击这里以幽灵形态旁观当前回合。旁观后，你仍可以用活着的角色重新加入。"
	icon_state = "observe"
	screen_loc = "LEFT+1,CENTER-2"
	command_to_run = "observe"


/obj/hud/button/menu/selection/macros
	name = "按键宏"
	desc_extended = "点击这里编辑当前按键和按键宏。这些按键设置仅用于本服务器。"
	icon_state = "macros"
	screen_loc = "LEFT+1,CENTER-3"
	command_to_run = "edit-macros"
