/obj/item/analyzer/armor
	name = "护甲分析仪"
	desc = "自2520年起，为装备搭配精打细算。"
	desc_extended = "一种极其复杂的传感器，通过发射基本无害的辐射波测算物体的物理防护能力。"

	icon = 'icons/obj/item/analyzers/armor.dmi'
	icon_state = "inventory"
	value = 250

	var/scan_all = FALSE

/obj/item/analyzer/armor/can_be_scanned(var/mob/activator,var/atom/target)
	return is_living(target)

/obj/item/analyzer/armor/on_scan(var/mob/activator,var/atom/target,location,control,params)

	if(!target || !target.health)
		activator.to_chat(span("warning","未检测到有效目标！"))

	if(is_player(activator))
		var/mob/living/advanced/player/P = activator
		var/list/attack_coords = P.get_current_target_cords(params)
		params[PARAM_ICON_X] = attack_coords[1]
		params[PARAM_ICON_Y] = attack_coords[2]

	var/atom/object_to_analyze = target.get_object_to_damage(activator,activator,null,params,TRUE,TRUE,0)
	var/list/armor_list
	if(!scan_all)
		if(target == object_to_analyze)
			activator.to_chat(span("notice bold","正在输出[target.name]的护甲防护数据……"))
		else
			activator.to_chat(span("notice bold","正在输出[target.name]的[object_to_analyze.name]的护甲防护数据……"))

		armor_list = target.health.get_defense(activator,object_to_analyze,TRUE)
	else if(is_advanced(target))
		var/mob/living/advanced/A = target
		armor_list = A.overall_clothing_defense_rating
	else
		activator.to_chat(span("notice","护甲分析仪只能扫描类人生物的装备总防护！"))
		return TRUE

	var/list/armor_labels = list(BLADE = "切割", BLUNT = "钝击", PIERCE = "穿刺", LASER = "激光", ARCANE = "奥术", HEAT = "高温", COLD = "寒冷", SHOCK = "电击", ACID = "酸蚀", BOMB = "爆炸", BIO = "生物武器", RAD = "辐射", HOLY = "神圣", DARK = "黑暗", FATIGUE = "疲劳", PAIN = "疼痛", ION = "离子", SANITY = "理智", MENTAL = "精神", ALL = "全部", BRUTE = "物理", BURN = "灼烧", TOX = "毒素", OXY = "缺氧", "deflection" = "偏转")
	for(var/k in armor_list)
		if(k == "items")
			continue
		var/armor_label = armor_labels[k] ? armor_labels[k] : uppertext(k)
		activator.to_chat(span("debug","[armor_label]：[armor_list[k]]。"))
	activator.to_chat(span("notice bold","数据输出完毕。"))

	next_scan = world.time + SECONDS_TO_DECISECONDS(4)

	return TRUE
/obj/item/analyzer/armor/click_self(mob/activator, location, control, params)
	if(scan_all)
		scan_all = FALSE
		activator.to_chat(span("notice","你将[src.name]设为扫描单个器官的防护值。"))
	else
		scan_all = TRUE
		activator.to_chat(span("notice","你将[src.name]设为扫描穿戴装备的总防护值。"))
	. = ..()
