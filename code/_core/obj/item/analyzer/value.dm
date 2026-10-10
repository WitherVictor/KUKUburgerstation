/obj/item/analyzer/value
	name = "价值分析仪"
	desc = "值这个价吗？"
	desc_extended = "一种特殊的摄像头与传感器组合，可计算物品当前的市场价值。"

	icon = 'icons/obj/item/analyzers/value.dmi'
	icon_state = "inventory"
	value = 450

/obj/item/analyzer/value/can_be_scanned(var/mob/activator,var/atom/target)
	return ismovable(target)

/obj/item/analyzer/value/on_scan(var/mob/activator,var/atom/target,location,control,params)
	var/atom/movable/M = target
	var/calculated_value = M.get_value()
	activator.to_chat(span("notice","[target.name]及其内容物的总价值为[nice_number(CEILING(calculated_value,1))]信用点。"))
	next_scan = world.time + SECONDS_TO_DECISECONDS(4)
	return TRUE
