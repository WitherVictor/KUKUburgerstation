/obj/item/device/proximity
	name = "接近传感器"
	desc = "滴答，滴答。"
	desc_extended = "简单的接近传感器，生物进入设定范围内时便会触发。使用多功能工具调节范围，使用滚轮设置启动延时。"
	icon_state = "motion"

	var/time_set = 50
	var/time_min = 0
	var/time_max = 300

	var/range_set = 2

	var/spam_fix_time = 0

	var/mob/last_activator = null

	value = 20

/obj/item/device/proximity/Destroy()
	last_activator = null
	return ..()

/obj/item/device/proximity/save_item_data(var/mob/living/advanced/player/P,var/save_inventory = TRUE,var/died=FALSE,var/loadout=FALSE)
	RUN_PARENT_SAFE
	SAVEVAR("time_set")
	SAVEVAR("range_set")

/obj/item/device/proximity/load_item_data_post(var/mob/living/advanced/player/P,var/list/object_data,var/loadout=FALSE)
	RUN_PARENT_SAFE
	LOADVAR("time_set")
	LOADVAR("range_set")

/obj/item/device/proximity/click_self(var/mob/activator,location,control,params)
	INTERACT_CHECK
	SPAM_CHECK(5)
	trigger(activator,src,-1,-1)
	return TRUE

/obj/item/device/proximity/trigger(var/mob/activator,var/atom/source,var/signal_freq,var/signal_code)
	last_activator = activator
	START_THINKING(src)
	active = TRUE
	var/turf/T = get_turf(src)
	play_sound('sound/items/timer/arm.ogg',T,range_max=VIEW_RANGE*0.5)
	create_alert(VIEW_RANGE,T,last_interacted,ALERT_LEVEL_NOISE)
	return ..()

/obj/item/device/proximity/think()

	. = ..()

	if(active)

		time_set -= 1

		if(time_set >= 0 && (time_set % clamp( FLOOR(1 + (time_set/10),1) ,1,30)) == 0)
			var/turf/T = get_turf(src)
			if(T)
				play_sound('sound/items/timer/beep.ogg',T,range_max=VIEW_RANGE*0.25)

		if(time_set < 0 && !(time_set % 10))
			for(var/mob/living/L in view(range_set,get_turf(src)))
				loc.trigger(last_interacted,src,-1,-1)
				play_sound('sound/items/timer/beep.ogg',get_turf(src),range_max=VIEW_RANGE*0.5)
				flick("motion_trigger",src)
				break

	return active

/obj/item/device/proximity/mouse_wheel_on_object(var/mob/activator,delta_x,delta_y,location,control,params)

	var/fixed_delta = clamp(delta_y,-1,1)

	if(time_set >= 15)
		fixed_delta = round(fixed_delta*5,5)
	else if(time_set >= 60)
		fixed_delta = round(fixed_delta*10,10)
	else if(time_set >= 120)
		fixed_delta = round(fixed_delta*10,30)

	var/old_time_set = time_set

	time_set = clamp(time_set + fixed_delta,time_min,time_max)

	if(old_time_set == time_set)
		activator.to_chat(span("notice","[src.name]的时间似乎不能再[time_set == time_min ? "缩短" : "延长"]了。"))
	else if(spam_fix_time <= world.time)
		activator.to_chat(span("notice","你将[src.name]的时间设为[time_set*0.1]秒……"))
	else
		activator.to_chat(span("notice","……[time_set*0.1]秒……"))

	spam_fix_time = world.time + 20

	return TRUE

/obj/item/device/proximity/clicked_on_by_object(var/mob/activator,var/atom/object,location,control,params)

	if(istype(object,/obj/item/weapon/melee/tool/multitool))
		INTERACT_CHECK
		INTERACT_CHECK_OBJECT
		INTERACT_DELAY(1)

		if(range_set > 0)
			range_set -= 1
			activator.to_chat(span("notice","你将[src.name]的范围设为[range_set]格……"))
			return TRUE
		range_set = 2
		activator.to_chat(span("notice","你将[src.name]的范围设为[range_set]格……"))
		return TRUE

	return ..()

/obj/item/device/proximity/get_examine_list(var/mob/examiner)
	. = ..()
	. += div("notice","计时器设定为[time_set*0.1]秒。")
	. += div("notice","范围设定为[range_set]格。")
