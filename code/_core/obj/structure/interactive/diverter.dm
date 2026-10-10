#define MODE_NONE "none"
#define MODE_VALUE "value"
#define MODE_DENSITY "density"
#define MODE_MATERIAL "material"
#define MODE_LIVING "living"
#define MODE_WEAPON "weapon"
#define MODE_BUTCHERABLE "butcherable"
#define MODE_CRATE "crate"

/obj/structure/interactive/diverter/
	name = "气流分拣器"
	desc = "嘶——。"
	desc_extended = "一种特殊的传送带分拣设备，用强力气流将符合条件的物体推离传送带。"
	icon = 'icons/obj/structure/conveyor.dmi'
	icon_state = "diverter"

	collision_flags = FLAG_COLLISION_WALKING
	collision_bullet_flags = FLAG_COLLISION_BULLET_INORGANIC

	collision_dir = 0x0

	var/think_timer = 0

	var/list/atom/movable/tracked_movables = list()

	var/mode = MODE_NONE
	var/list/mode_labels = list(MODE_NONE = "全部", MODE_VALUE = "价值", MODE_DENSITY = "实体", MODE_MATERIAL = "原材料", MODE_LIVING = "生物", MODE_WEAPON = "武器", MODE_BUTCHERABLE = "可屠宰生物", MODE_CRATE = "货箱")
	var/value_threshold = 50

	density = TRUE

/obj/structure/interactive/diverter/clicked_on_by_object(var/mob/activator,var/atom/object,location,control,params)

	INTERACT_CHECK
	INTERACT_CHECK_OBJECT
	INTERACT_DELAY(5)

	if(istype(object,/obj/item))
		var/obj/item/T = object
		if(T.flags_tool & FLAG_TOOL_WRENCH)
			if(anchored)
				activator.to_chat(span("notice","你松开了分拣器的固定装置。"))
				anchored = FALSE
			else
				activator.to_chat(span("notice","你固定了分拣器。"))
				anchored = TRUE
		else if(T.flags_tool & FLAG_TOOL_MULTITOOL && mode == MODE_VALUE) // Should I REALLY make it need a multitool?
			value_threshold = clamp(input(activator, "请设置价值阈值。","[src]",value_threshold),-1,50000)
			activator.to_chat(span("notice","你将价值阈值设为[value_threshold]。"))
	else
		if(activator.attack_flags & CONTROL_MOD_DISARM)
			var/list/modes = list()
			for(var/mode_value in mode_labels)
				modes[mode_labels[mode_value]] = mode_value
			modes["取消"] = "CANCEL"
			var/whatmode = input(activator, "请选择分拣模式。","[src]",mode_labels[mode]) as null|anything in modes
			if(whatmode == null || modes[whatmode] == "CANCEL")
				return
			mode = modes[whatmode]
			name = "[initial(name)]（[mode_labels[mode]]）"
		else
			activator.visible_message(span("notice","[activator.name]转动了[src.name]。"),span("notice","你转动了[src.name]。"))
			set_dir(turn(dir,90))

			update_sprite()

	return TRUE

/obj/structure/interactive/diverter/Initialize()

	if(.)
		collision_dir = turn(dir,180)

	return ..()

/obj/structure/interactive/diverter/PostInitialize()
	. = ..()
	name = "[initial(name)]（[mode_labels[mode]]）"
	update_sprite()

/obj/structure/interactive/diverter/update_icon()
	. = ..()
	icon_state = "diverter_on"

/obj/structure/interactive/diverter/proc/should_push(var/atom/movable/M)
	if(!anchored)
		return FALSE
	switch(mode)
		if(MODE_NONE)
			return TRUE
		if(MODE_VALUE)
			if(is_item(M)) // Can't put this in the "if" right above it...
				var/obj/item/I = M
				return I.get_value() >= value_threshold
		if(MODE_DENSITY)
			return M.density && M.collision_flags != FLAG_COLLISION_NONE
		if(MODE_MATERIAL)
			return istype(M,/obj/item/material) && !istype(M,/obj/item/material/shard)
		if(MODE_LIVING)
			if(is_living(M))
				var/mob/living/L = M
				if(!L.dead || L.ckey_last)
					return TRUE
		if(MODE_WEAPON)
			return istype(M,/obj/item/weapon)
		if(MODE_BUTCHERABLE)
			if(is_living(M))
				var/mob/living/L = M
				if(L.override_butcher || length(L.butcher_contents))
					return TRUE
		if(MODE_CRATE)
			return istype(M,/obj/structure/interactive/crate)


/obj/structure/interactive/diverter/think()

	for(var/k in tracked_movables)
		var/v = tracked_movables[k]
		if(v > world.time)
			continue
		var/atom/movable/M = k
		if(!M.anchored && !M.grabbing_hand && should_push(M) && M.loc == src.loc)
			M.Move(get_step(src,dir))
		tracked_movables -= k

	think_timer--

	return think_timer

/obj/structure/interactive/diverter/Crossed(atom/movable/O,atom/OldLoc)

	tracked_movables[O] = world.time + 4

	if(!think_timer)
		START_THINKING(src)

	think_timer = 10

	return ..()

/obj/structure/interactive/diverter/get_examine_list(mob/examiner)
	. = ..()
	if(mode == MODE_VALUE)
		. += div("notice","当前会分拣价值不低于[value_threshold]信用点的物品。")

/obj/structure/interactive/diverter/high_value
	desc_extended = "一种特殊的传送带分拣设备，用强力气流将符合条件的物体推离传送带。这款会扫描物品价值，并推走价值达到指定阈值的物品。"
	mode = MODE_VALUE

/obj/structure/interactive/diverter/density
	desc_extended = "一种特殊的传送带分拣设备，用强力气流将符合条件的物体推离传送带。这款会检测物体是否具有实体碰撞。"
	mode = MODE_DENSITY

/obj/structure/interactive/diverter/material
	desc_extended = "一种特殊的传送带分拣设备，用强力气流将符合条件的物体推离传送带。这款会检测物体是否为原材料。"
	mode = MODE_MATERIAL

/obj/structure/interactive/diverter/living
	desc_extended = "一种特殊的传送带分拣设备，用强力气流将符合条件的物体推离传送带。这款会检测目标是否为活着或可复苏的人或生物。"
	mode = MODE_LIVING

/obj/structure/interactive/diverter/weapon
	desc_extended = "一种特殊的传送带分拣设备，用强力气流将符合条件的物体推离传送带。这款会检测物体是否为武器。"
	mode = MODE_WEAPON

/obj/structure/interactive/diverter/butcherable
	desc_extended = "一种特殊的传送带分拣设备，用强力气流将符合条件的物体推离传送带。这款会检测目标是否能屠宰成食材。"
	mode = MODE_BUTCHERABLE

/obj/structure/interactive/diverter/crate
	desc_extended = "一种特殊的传送带分拣设备，用强力气流将符合条件的物体推离传送带。这款会检测物体是否为货箱。"
	mode = MODE_CRATE

#undef MODE_NONE
#undef MODE_VALUE
#undef MODE_DENSITY
#undef MODE_MATERIAL
#undef MODE_LIVING
#undef MODE_WEAPON
#undef MODE_BUTCHERABLE
#undef MODE_CRATE
