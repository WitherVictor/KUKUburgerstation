/obj/hud/button/cash_money
	name = "信用点"
	desc = "宇宙通用货币。"
	desc_extended = "你的角色在纳米传讯星际银行账户中持有的信用点数量。完成任务目标或出售物品都能赚取信用点。"

	var/amount = 0

	screen_loc = "RIGHT,TOP-1:-16"

	icon_state = "currency"

	flags_hud = FLAG_HUD_MOB

	maptext_x = -2

/obj/hud/button/cash_money/update_owner(var/mob/desired_owner)

	. = ..()

	if(. && is_player(owner))
		var/mob/living/advanced/player/P = owner
		update_stats(P.currency)

	return TRUE


/obj/hud/button/cash_money/update_sprite()
	amount = round(amount)
	maptext = "<div align='right'>[nice_number(amount)]</div>"
	return ..()

/obj/hud/button/cash_money/update_overlays()
	. = ..()
	var/image/I = new/image(initial(icon),"credits")
	I.pixel_x = -32
	I.mouse_opacity = 0
	add_overlay(I)

/obj/hud/button/cash_money/proc/update_stats(var/new_value=0,var/silent=FALSE)

	new_value = max(new_value,0)

	if(amount != new_value)
		amount = new_value
		if(!silent) play_sound_target('sound/ui/tap-metallic.ogg',owner, sound_setting = SOUND_SETTING_UI)
		update_sprite()

	return TRUE


/obj/hud/button/microstransactions
	name = "汉堡币"
	desc_extended = "你的账号持有的汉堡币数量。汉堡币绑定账号，无法交易。游玩游戏即可获得汉堡币，并可在剧院兑换（几乎）没有实际用途的外观物品。"
	screen_loc = "RIGHT,TOP-1:-32"
	icon_state = "currency"

	flags_hud = FLAG_HUD_MOB

	mouse_opacity = 1

	has_quick_function = FALSE

	var/amount = 0

	maptext_x = -2

/obj/hud/button/microstransactions/update_overlays()
	. = ..()
	var/image/I = new/image(initial(icon),"burger")
	I.pixel_x = -32
	I.mouse_opacity = 0
	add_overlay(I)

/obj/hud/button/microstransactions/update_owner(var/mob/desired_owner)

	. = ..()

	if(. && is_player(owner))
		var/mob/living/advanced/player/P = owner
		if(P.client)
			var/savedata/client/globals/GD = GLOBALDATA(P.client.ckey)
			if(GD) update_stats(GD.loaded_data["burgerbux"])

	return TRUE


/obj/hud/button/microstransactions/proc/update_stats(var/new_value=0,var/silent=FALSE)

	new_value = max(new_value,0)

	if(amount != new_value)
		amount = new_value
		if(!silent) play_sound_target('sound/ui/tap-metallic.ogg',owner, sound_setting = SOUND_SETTING_UI)
		update_sprite()

	return TRUE

/obj/hud/button/microstransactions/update_sprite()
	amount = round(amount)
	maptext = "<div align='right'>[nice_number(amount)]</div>"
	return ..()
