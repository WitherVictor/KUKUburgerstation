/obj/item/analyzer/plant
	name = "植物分析仪"
	desc = "自2520年起，为植物培育精打细算。"
	desc_extended = "一种极其复杂的传感器，通过发射基本无害的辐射波测算植物属性和健康状况。"

	icon = 'icons/obj/item/analyzers/armor.dmi'
	icon_state = "inventory"
	value = 100

/obj/item/analyzer/plant/can_be_scanned(var/mob/activator,var/atom/target)
	return istype(target,/obj/structure/interactive/plant)

/obj/item/analyzer/plant/on_scan(var/mob/activator,var/atom/target,location,control,params)

	var/obj/structure/interactive/plant/P = target

	var/list/planet_list = list()

	planet_list += "名称：[P.name]"
	planet_list += "生长时长：[get_nice_time(P.age/10,TRUE)]"
	planet_list += "生长进度：[P.growth]（最低：[P.growth_min]，成熟：[P.growth_max]，可收获：[P.growth_produce_max]）"
	planet_list += "生长速度：[P.growth_speed*10*60]/分钟"
	planet_list += "效力：[P.potency]"
	planet_list += "产量：[P.yield_max]（成功率[CEILING(P.yield_percent,1)]%）"
	planet_list += "营养：[CEILING(P.nutrition,1)]/100"
	planet_list += "水分：[CEILING(P.hydration,1)]/100"

	for(var/k in planet_list)
		activator.to_chat(span("debug",k))

	next_scan = world.time + SECONDS_TO_DECISECONDS(1)

	return TRUE
