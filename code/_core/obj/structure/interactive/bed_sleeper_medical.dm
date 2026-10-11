
/obj/structure/interactive/bed/sleeper/medical
	name = "医疗休眠舱"
	desc = "未来的医疗技术！"
	desc_extended = "特殊的医疗休眠舱，舱内有人且舱门关闭时，会自动治疗物理损伤、灼伤和毒素损伤并缓解疼痛。舱门需要手动关闭。高级型号还能处理辐射、精神状态和血量异常。"
	base_color = "#FFFFFF"
	secondary_color = "#0094FF"
	tertiary_color = "#0094FF"
	var/advanced = FALSE
	var/heal_multiplier = 1

/obj/structure/interactive/bed/sleeper/medical/weak
	name = "家用级医疗休眠舱"
	base_color = "#A59FBC"
	secondary_color = "#009469"
	tertiary_color = "#D8D8EC"
	heal_multiplier = 0.25

/obj/structure/interactive/bed/sleeper/medical/solarian
	name = "太阳系医疗休眠舱"
	base_color = "#A5D5D1"
	secondary_color = "#4D9BBC"
	tertiary_color = "#D8C2E1"
	heal_multiplier = 0.75

/obj/structure/interactive/bed/sleeper/medical/think()

	if(door_state == SLEEPER_CLOSED && buckled && is_living(buckled))
		var/mob/living/L = buckled
		L.brute_regen_buffer = min(L.brute_regen_buffer+heal_multiplier,10*heal_multiplier)
		L.burn_regen_buffer = min(L.burn_regen_buffer+heal_multiplier,10*heal_multiplier)
		L.tox_regen_buffer = min(L.tox_regen_buffer+heal_multiplier,10*heal_multiplier)
		L.pain_regen_buffer = min(L.pain_regen_buffer+heal_multiplier,10*heal_multiplier)
		if(advanced)
			L.rad_regen_buffer = min(L.rad_regen_buffer+heal_multiplier,1)
			L.sanity_regen_buffer = min(L.sanity_regen_buffer+heal_multiplier,10*heal_multiplier)
			L.mental_regen_buffer = min(L.mental_regen_buffer+heal_multiplier,10*heal_multiplier)
			if(L.blood_type)
				if(L.blood_volume > L.blood_volume_max)
					L.blood_volume = max(L.blood_volume - heal_multiplier,L.blood_volume_max)
				else if(L.blood_volume < L.blood_volume_max)
					L.blood_volume = min(L.blood_volume + heal_multiplier,L.blood_volume_max)

	return TRUE

/obj/structure/interactive/bed/sleeper/medical/close(var/mob/activator)
	if(!buckled)
		var/mob/living/advanced/A = locate() in get_turf(src)
		if(A)
			buckle(A,activator)
	if(close_sound)
		play_sound(close_sound,src.loc,range_max=VIEW_RANGE)
	door_state = SLEEPER_CLOSING
	update_icon()
	CALLBACK("on_close_\ref[src]",close_time,src,src::on_close(),activator)

/obj/structure/interactive/bed/sleeper/medical/on_open(var/mob/activator)
	door_state = SLEEPER_OPENED
	opened_time = 0
	update_icon()
	check_collisions()
	STOP_THINKING(src)
	return TRUE

/obj/structure/interactive/bed/sleeper/medical/on_close(var/mob/activator)
	door_state = SLEEPER_CLOSED
	opened_time = 0
	update_icon()
	check_collisions()
	START_THINKING(src)
	return TRUE

/obj/structure/interactive/bed/sleeper/medical/syndicate
	name = "辛迪加高级医疗休眠舱"
	base_color = "#303030"
	secondary_color = "#7F0000"
	tertiary_color = "#7F0000"
	advanced = TRUE
