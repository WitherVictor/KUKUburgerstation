/obj/hud/button/hunger
	name = "饥饿与口渴"
	desc = "两项都要保持充足！"
	desc_extended = "显示当前的饥饿与口渴程度。分别通过进食和饮水补充营养与水分。"

	icon = 'icons/hud/hunger.dmi'
	icon_state = "thirst_bar_0"

	user_colors = FALSE

	var/stored_hunger = -1
	var/stored_thirst = -1

	screen_loc = "RIGHT:-8,CENTER-1"

	flags_hud = FLAG_HUD_MOB

/obj/hud/button/hunger/get_examine_list(var/mob/examiner)
	. = ..()

	if(is_living(examiner))
		var/mob/living/L = examiner
		var/nutrition_percent = (L.nutrition_normal + L.nutrition_quality + L.nutrition_fast)/(L.nutrition_max)

		switch(nutrition_percent)
			if(-INFINITY to 0.2)
				. += div("danger","你快饿死了！")
			if(0.2 to 0.3)
				. += div("warning","你非常饿！")
			if(0.3 to 0.5)
				. += div("warning","你饿了。")
			if(0.5 to 0.7)
				. += div("notice","你可以吃点东西。")
			if(0.7 to 0.9)
				. += div("notice","你不饿。")
			if(0.9 to 1)
				. += div("notice","你吃饱了。")
			if(1 to INFINITY)
				. += div("warning","你吃撑了！")

		. += "总营养：[FLOOR(nutrition_percent*100,1)]%。"
		. += "营养健康度：[FLOOR(L.get_nutrition_quality_mod()*L.get_nutrition_mod()*100,1)]%。"


/obj/hud/button/hunger/update_owner()
	. = ..()
	if(owner)
		update_sprite()

/obj/hud/button/hunger/update_underlays()
	. = ..()
	var/icon/IC = new/icon(initial(icon),"base")
	swap_colors(IC)
	var/image/I = new/image(IC)
	I.appearance_flags = RESET_COLOR
	add_underlay(I)

/obj/hud/button/hunger/update_overlays()
	. = ..()
	var/image/I = new/image(initial(icon),"hunger_icon")
	I.pixel_y = -16
	I.appearance_flags = RESET_COLOR
	add_overlay(I)


/obj/hud/button/hunger/update_icon()

	. = ..()

	var/mob/living/L = owner

	//Color bullshit.
	var/good_color = "#00FF00"
	var/bad_color = "#FF0000"
	var/fat_color = "#EAEAEA"
	var/quality_color = "#FFFF00"
	if(owner && owner.client)
		var/color_scheme = owner.client.settings.loaded_data["hud_colors"]
		good_color = color_scheme[4]
		fat_color = color_scheme[5]
		bad_color = color_scheme[6]
		quality_color = color_scheme[7]

	icon = initial(icon)

	var/total_nutrition =  L.nutrition_quality+L.nutrition_fast+L.nutrition_normal
	var/fatass_mod = (total_nutrition - L.nutrition_max) / max(1,L.nutrition_max_hard - L.nutrition_max)
	if(fatass_mod > 0)
		var/fatass_icon = CEILING(clamp(fatass_mod * 4,0,4),1)
		icon_state = "bar_fat_[fatass_icon]"
		color = fat_color
	else
		var/hunger_icon = CEILING(clamp( (total_nutrition/L.nutrition_max) * 24,0,24),1)
		icon_state = "bar_[hunger_icon]"
		var/desired_color = blend_colors(bad_color, good_color, L.get_nutrition_mod())
		var/gold_number = L.get_nutrition_quality_mod() - 0.5
		if(gold_number > 0)
			desired_color = blend_colors(desired_color,quality_color,gold_number)
		color = desired_color
