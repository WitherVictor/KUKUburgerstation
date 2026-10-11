/obj/item/pinpointer/
	name = "个人定位器"
	desc = "它在哪儿？"
	desc_extended = "用来追踪和定位目标。"

	icon = 'icons/obj/item/pinpointer.dmi'
	icon_state = "red"

	var/atom/tracked_atom

	var/scan_mode = FALSE

	var/signal_offset

	value = 10

	weight = 2
	has_quick_function = TRUE

	var/unreliable = FALSE

	rarity = RARITY_UNCOMMON

/obj/item/pinpointer/quick(var/mob/activator,var/atom/object,location,params)
	return click_self(activator)

/obj/item/pinpointer/Destroy()
	tracked_atom = null
	. = ..()

/obj/item/pinpointer/get_examine_list(var/mob/activator)

	. = ..()

	if(tracked_atom)
		var/turf/T = get_turf(tracked_atom)
		var/turf/T2 = get_turf(src)
		. += div("notice","设备自身坐标为（[T2.x],[T2.y],[T2.z]）。")
		. += div("notice","正在追踪[tracked_atom.name]，目标坐标为（[T.x],[T.y],[T.z]）。")
	else
		. += div("notice","设备已关闭。")


/obj/item/pinpointer/proc/get_direction_name(var/direction)
	var/list/direction_names = list("north"="北","south"="南","east"="东","west"="西","north-east"="东北","north-west"="西北","south-east"="东南","south-west"="西南","none"="无方向")
	var/direction_text = dir2text(direction)
	return direction_names[direction_text] ? direction_names[direction_text] : direction_text

/obj/item/pinpointer/proc/can_track(var/atom/A)

	if(!A)
		return FALSE

	var/turf/T = get_turf(A)
	if(!T)
		return FALSE

	var/turf/T2 = get_turf(src)
	if(!T2)
		return FALSE

	if(!A || A.qdeleting || T.z != T2.z)
		return FALSE

	var/area/A1 = get_area(A)
	var/area/A2 = get_area(src)

	if(A1.area_identifier != A2.area_identifier)
		return FALSE

	return TRUE

/obj/item/pinpointer/PostInitialize()
	. = ..()
	update_sprite()

/obj/item/pinpointer/update_underlays()
	. = ..()
	if(!length(underlays))
		var/image/I = new/image(initial(icon),initial(icon_state))
		underlays += I

/obj/item/pinpointer/update_icon()

	. = ..()

	if(scan_mode)
		icon_state = "scan"
	else if(tracked_atom)
		var/turf/T1 = get_turf(src)
		var/turf/T2 = get_turf(tracked_atom)
		var/distance = get_dist_advanced(T1,T2)
		if(unreliable)
			var/rand_num = rand(5,10)
			distance = 	CEILING(distance,rand_num)
			distance += rand(5,10)
		var/desired_dir = get_dir_advanced(T1,T2)
		switch(distance)
			if(1 to VIEW_RANGE*0.5)
				icon_state = "[desired_dir]_close"
			if(VIEW_RANGE*0.5 to VIEW_RANGE)
				icon_state = "[desired_dir]_med"
			if(VIEW_RANGE to INFINITY)
				icon_state = "[desired_dir]_far"
			else
				icon_state = "direct"
	else
		icon_state = "null"


/obj/item/pinpointer/think()

	if(scan_mode || !can_track(tracked_atom) )
		tracked_atom = null

	update_sprite()

	return TRUE

/obj/item/pinpointer/custom/
	name = "自定义定位器"
	desc_extended = "用来追踪和定位目标。此型号可以扫描物体，然后追踪它。"
	icon_state = "brown"

	value = 30

/obj/item/pinpointer/custom/click_on_object(var/mob/activator as mob,var/atom/object,location,control,params)

	if(scan_mode && object)
		INTERACT_CHECK
		INTERACT_DELAY(10)
		if(!can_track(object))
			activator.to_chat(span("warning","你无法追踪这个目标！"))
			return TRUE
		tracked_atom = object
		activator.visible_message(span("notice","[activator.name]用[src.name]扫描了[object.name]。"),span("notice","你扫描了[object.name]，开始追踪它。"))
		scan_mode = FALSE
		START_THINKING(src)
		return TRUE

	return ..()

/obj/item/pinpointer/custom/click_self(var/mob/activator,location,control,params)

	INTERACT_CHECK
	INTERACT_DELAY(1)

	scan_mode = !scan_mode

	if(scan_mode)
		activator.to_chat(span("notice","你开启了扫描模式。扫描一个物体即可追踪它。"))
	else
		activator.to_chat(span("notice","你关闭了扫描模式。"))

	update_sprite()

	return TRUE


/obj/item/pinpointer/crew/
	name = "船员定位器"
	desc_extended = "用来追踪和定位目标。此型号可追踪纳米传讯船员的位置。"
	icon_state = "blue"

	value = 20

	var/desired_loyalty_tag = "NanoTrasen"

	var/encoded = TRUE

	rarity = RARITY_RARE

/obj/item/pinpointer/crew/click_self(var/mob/activator,location,control,params)

	INTERACT_CHECK
	INTERACT_DELAY(1)

	var/list/possible_crew = list()

	if(enable_friendly_fire)
		activator.to_chat(span("notice","不知为何，它似乎无法工作……"))
		return FALSE

	if(encoded && is_living(activator))
		var/mob/living/L = activator
		if(L.loyalty_tag != desired_loyalty_tag)
			activator.to_chat(span("warning","所有信息似乎都是你无法理解的密文……"))
			return FALSE

	for(var/mob/living/advanced/player/P in SSliving.all_players)
		if(P.loyalty_tag != desired_loyalty_tag)
			continue
		if(!can_track(P))
			continue
		var/name_mod = "[P.real_name]（[P.dead ? "死亡" : "存活"]，[get_direction_name(get_dir_advanced(activator,P))]，[get_dist_advanced(src,P)]米）"
		possible_crew[name_mod] = P

	scan_mode = TRUE
	update_sprite()

	var/choice = input("你想追踪谁？","船员定位器追踪",null) as null|anything in possible_crew

	INTERACT_CHECK_OTHER(src) //Hacky

	if(choice)
		var/mob/living/advanced/player/P = possible_crew[choice]
		tracked_atom = P
	else
		tracked_atom = null

	scan_mode = FALSE
	START_THINKING(src)

	return TRUE


/obj/item/pinpointer/crew/death
	name = "遗体定位器"
	icon_state = "grey"
	desc_extended = "用来追踪和定位目标。此型号专门追踪纳米传讯船员的遗体。"
	value = 100

/obj/item/pinpointer/crew/death/can_track(var/atom/A)

	var/mob/living/advanced/player/P = A
	if(!istype(P))
		return FALSE

	if(!P.dead)
		return FALSE

	. = ..()


/obj/item/pinpointer/crew/syndicate
	name = "辛迪加行动人员定位器"
	desc_extended = "用来追踪和定位目标。此型号可追踪辛迪加突袭者的位置。"
	icon_state = "syndicate"
	desired_loyalty_tag = "Syndicate"
	value = 1000
	encoded = TRUE
	can_save = FALSE

/obj/item/pinpointer/crew/revolutionary
	name = "革命军士兵定位器"
	desc_extended = "用来追踪和定位目标。此型号可追踪革命军士兵的位置。"
	icon_state = "rev"
	desired_loyalty_tag = "Revolutionary"
	value = 1000
	encoded = TRUE
	can_save = FALSE

/obj/item/pinpointer/landmark/
	name = "区域定位器"
	desc_extended = "用来追踪和定位目标。此型号可定位重要区域。"
	icon_state = "green"

	value = 10

/obj/item/pinpointer/landmark/click_self(var/mob/activator,location,control,params)

	INTERACT_CHECK
	INTERACT_DELAY(1)

	var/list/possible_landmarks = list()

	var/area/my_area = get_area(src)
	if(!my_area.area_identifier)
		activator.to_chat(span("warning","没有信号……"))
		return TRUE

	for(var/k in SSarea.all_areas)
		var/area/A = SSarea.all_areas[k]
		if(A.z != activator.z)
			continue
		if(!A.trackable)
			continue
		if(my_area.area_identifier != A.area_identifier)
			continue
		var/turf/T = locate(A.average_x,A.average_y,A.z)
		var/name_mod = "[A.name]（[get_direction_name(get_dir_advanced(activator,T))]，[get_dist_advanced(src,T)]米）"
		possible_landmarks[name_mod] = T

	if(!length(possible_landmarks))
		activator.to_chat(span("warning","找不到可追踪的目标！"))
		return TRUE

	scan_mode = TRUE
	update_sprite()

	var/choice = input("你想追踪什么目标？","区域定位器追踪","取消") as null|anything in possible_landmarks

	INTERACT_CHECK_OTHER(src) //Hacky

	if(choice)
		var/turf/T = possible_landmarks[choice]
		tracked_atom = T
	else
		tracked_atom = null

	scan_mode = FALSE
	START_THINKING(src)

	return TRUE

/obj/item/pinpointer/objective/
	name = "任务目标定位器"
	desc_extended = "用来追踪和定位目标。此型号可追踪任务目标的位置，仅在外勤区域有效。"
	icon_state = "yellow"

	value = 20

/obj/item/pinpointer/objective/click_self(var/mob/activator,location,control,params)

	INTERACT_CHECK
	INTERACT_DELAY(1)

	var/list/possible_artifacts = list()

	for(var/v in SSgamemode.active_gamemode.crew_active_objectives)
		var/objective/O = v
		if(!O.trackable)
			continue
		for(var/k in O.tracked_atoms)
			var/atom/A = k
			if(!can_track(A))
				continue
			var/name_mod = "[A.name]（[get_direction_name(get_dir_advanced(activator,A))]，[get_dist_advanced(src,A)]米）"
			possible_artifacts[name_mod] = A

	if(!length(possible_artifacts))
		activator.to_chat(span("warning","找不到可追踪的目标！"))
		return TRUE

	scan_mode = TRUE
	update_sprite()

	var/choice = input("你想追踪什么目标？","任务目标定位器追踪","取消") as null|anything in possible_artifacts

	INTERACT_CHECK_OTHER(src) //Hacky

	if(choice)
		var/atom/A = possible_artifacts[choice]
		tracked_atom = A
	else
		tracked_atom = null

	scan_mode = FALSE
	START_THINKING(src)

	return TRUE


/obj/item/pinpointer/boss/
	name = "首领定位器"
	desc_extended = "用来追踪和定位目标。此型号可追踪强大首领的位置，仅在外勤区域有效。"
	icon_state = "orange"

	value = 100

/obj/item/pinpointer/boss/click_self(var/mob/activator,location,control,params)

	INTERACT_CHECK
	INTERACT_DELAY(1)

	var/list/possible_bosses = list()

	for(var/k in SSbosses.tracked_bosses)
		var/mob/living/A = k
		if(!can_track(A))
			continue
		if(!is_living(A))
			continue
		if(A.health.health_current < 0)
			continue
		var/name_mod = "[A.name]（[get_direction_name(get_dir_advanced(activator,A))]，[get_dist_advanced(src,A)]米）"
		possible_bosses[name_mod] = A

	if(!length(possible_bosses))
		activator.to_chat(span("warning","找不到可追踪的目标！"))
		return TRUE

	scan_mode = TRUE
	update_sprite()

	var/choice = input("你想追踪什么目标？","首领定位器追踪","取消") as null|anything in possible_bosses

	INTERACT_CHECK_OTHER(src) //Hacky.

	if(choice)
		var/atom/A = possible_bosses[choice]
		tracked_atom = A
	else
		tracked_atom = null

	scan_mode = FALSE
	START_THINKING(src)

	return TRUE



/obj/item/pinpointer/deathmatch
	name = "死亡竞赛定位器"
	desc_extended = "用来追踪和定位目标。此型号能追踪所有人，不过精度不怎么样……"
	icon_state = "syndicate"
	value = 1000
	value_burgerbux = 1
	unreliable = TRUE
	can_save = FALSE

/obj/item/pinpointer/deathmatch/click_self(var/mob/activator,location,control,params)

	INTERACT_CHECK
	INTERACT_DELAY(1)

	var/list/possible_crew = list()

	if(!enable_friendly_fire)
		activator.to_chat(span("notice","不知为何，它似乎无法工作……"))
		return FALSE

	for(var/mob/living/advanced/player/P in SSliving.all_players)
		if(!can_track(P))
			continue
		var/signal_num = text2num("\ref[P]",16)
		signal_num += signal_offset
		signal_num = 1 + (signal_num % 200)
		var/rand_num = rand(5,10)
		var/distance_to_show = 	CEILING(get_dist_advanced(src,P),rand_num)
		var/name_mod = "信号#[signal_num]（[P.dead ? "死亡" : "存活"]，约[distance_to_show]米）"
		possible_crew[name_mod] = P

	scan_mode = TRUE
	update_sprite()

	var/choice = input("你想追踪谁？","死亡竞赛定位器追踪",null) as null|anything in possible_crew

	INTERACT_CHECK_OTHER(src) //Hacky

	if(choice)
		var/mob/living/advanced/player/P = possible_crew[choice]
		tracked_atom = P
	else
		tracked_atom = null

	scan_mode = FALSE
	START_THINKING(src)

	return TRUE



/obj/item/pinpointer/mobs
	name = "敌人定位器"
	desc_extended = "用来追踪和定位目标。此型号用于寻找可供猎杀的生物目标。"
	icon_state = "syndicate"
	value = 1000
	value_burgerbux = 1

	rarity = RARITY_MYTHICAL

/obj/item/pinpointer/mobs/click_self(var/mob/activator, var/mob/living/advanced/npc/a, var/mob/living/simple/a)
	INTERACT_CHECK
	INTERACT_DELAY(1)

	var/list/mobs = list()
	for(a in SSliving.all_mobs)
		if(!can_track(a))
			continue
		var/signal_num = text2num("\ref[a]",16)
		signal_num += signal_offset
		signal_num = 1 + (signal_num % 200)
		var/distance_to_show = get_dist_advanced(src,a)
		var/name_mod = "[a.name]（[a.dead ? "死亡" : "存活"]，约[distance_to_show]米）"
		mobs[name_mod] = a

	scan_mode = TRUE
	update_sprite()

	var/choice = input("你想追踪谁？","生物定位器追踪",null) as null|anything in mobs

	INTERACT_CHECK_OTHER(src) //Hacky

	if(choice)
		a = mobs[choice]
		tracked_atom = a
	else
		tracked_atom = null

	scan_mode = FALSE
	START_THINKING(src)

	return TRUE
