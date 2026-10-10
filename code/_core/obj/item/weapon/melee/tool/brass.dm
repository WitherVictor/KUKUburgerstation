/obj/item/weapon/melee/tool/brass
	name = "工具"
	drop_sound = 'sound/items/drop/scrap.ogg'
	has_quick_function = TRUE


/obj/item/weapon/melee/tool/brass/wirecutters
	name = "黄铜钢丝钳"
	desc = "用来剪黄铜！大概也能剪电线。"
	desc_extended = "主要用于剪断电线的钳子。这把是黄铜做的！"
	icon = 'icons/obj/item/tools.dmi'
	icon_state = "cutters_clock"

	flags_tool = FLAG_TOOL_WIRECUTTER

	size = SIZE_2
	weight = 2

	value = 3

/obj/item/weapon/melee/tool/brass/wrench
	name = "发条扳手"
	desc = "敲一敲就修好了！"
	desc_extended = "一把适配已知宇宙中任何螺栓的扳手。活在这个时代真好。这把由黄铜和齿轮制成！"
	icon = 'icons/obj/item/tools.dmi'
	icon_state = "wrench_clock"

	flags_tool = FLAG_TOOL_WRENCH

	size = SIZE_2
	weight = 4

	value = 5

obj/item/weapon/melee/tool/brass/welder
	name = "发条焊接工具"
	desc = "由黄铜和齿轮制成的奇怪焊接工具。这到底是怎么工作的？"
	desc_extended = "使用特殊氢燃料的焊接工具，能胜任大多数焊接工作。"
	icon = 'icons/obj/item/tools.dmi'
	icon_state = "brasswelder"

	flags_tool = FLAG_TOOL_WELDER

	value = 5

	var/fuel_current = 0
	var/fuel_max = 100

	size = SIZE_2
	weight = 5

	var/active = FALSE

/obj/item/weapon/melee/tool/brass/welder/save_item_data(var/mob/living/advanced/player/P,var/save_inventory = TRUE,var/died=FALSE,var/loadout=FALSE)
	RUN_PARENT_SAFE
	SAVEVAR("fuel_current")

/obj/item/weapon/melee/tool/brass/welder/load_item_data_pre(var/mob/living/advanced/player/P,var/list/object_data,var/loadout=FALSE)
	RUN_PARENT_SAFE
	LOADVAR("fuel_current")

/obj/item/weapon/melee/tool/brass/welder/Generate()
	fuel_current = fuel_max
	return ..()

/obj/item/weapon/melee/tool/brass/welder/Finalize()
	fuel_current = min(fuel_current,fuel_max)
	return ..()

/obj/item/weapon/melee/tool/brass/welder/think()

	. = ..()

	add_fuel(-0.001)

	if(fuel_current <= 0)
		return FALSE

	if(!active)
		return FALSE


/obj/item/weapon/melee/tool/brass/welder/proc/add_fuel(var/fuel_amount = 0)

	if(!fuel_amount)
		return 0

	. = clamp(fuel_amount,-fuel_amount,fuel_max - fuel_current)

	fuel_current += .



/obj/item/weapon/melee/tool/brass/welder/click_self(var/mob/activator,location,control,params)

	INTERACT_CHECK
	INTERACT_DELAY(1)

	if(active)
		active = FALSE
		update_sprite()
		activator.to_chat(span("notice","你关闭了[src.name]。"))
		STOP_THINKING(src)
	else
		if(fuel_current > 0)
			active = TRUE
			update_sprite()
			activator.to_chat(span("notice","[src.name]启动了。"))
			START_THINKING(src)
		else
			activator.to_chat(span("warning","[src.name]似乎无法启动……"))

	return TRUE

/obj/item/weapon/melee/tool/brass/welder/update_overlays()

	. = ..()

	if(active)
		var/image/I = new/image(icon,"brasswelder_on")
		add_overlay(I)

	var/ratio = CEILING((fuel_current/fuel_max)*7,1)
	var/image/I = new/image(icon,"charge_[ratio]")
	add_overlay(I)

	return ..()

/obj/item/weapon/melee/tool/brass/crowbar
	name = "黄铜撬棍"
	desc = "为什么？"
	desc_extended = "一根弯曲的金属棒，至今仍被当作工具使用。这根是黄铜做的！"
	icon = 'icons/obj/item/tools.dmi'
	icon_state = "crowbar_clock"

	flags_tool = FLAG_TOOL_CROWBAR

	size = SIZE_2
	weight = 4

	value = 5

/obj/item/weapon/melee/tool/brass/screwdriver
	name = "黄铜螺丝刀"
	desc = "用来拧黄铜螺丝。"
	desc_extended = "一把螺丝刀。可用于更换武器击针，以及各种与螺丝有关的操作。这把是黄铜做的！"
	icon = 'icons/obj/item/tools.dmi'
	icon_state = "screwdriver_clock"

	value = 5

	size = SIZE_1
	weight = 2

	flags_tool = FLAG_TOOL_SCREWDRIVER

/obj/item/weapon/melee/tool/brass/multitool
	name = "黄铜多功能工具"
	desc = "拉特瓦尔的杰作。"
	desc_extended = "可向气闸和其他机械的电线发送脉冲的多功能工具。这件是黄铜做的。"
	icon = 'icons/obj/item/tools.dmi'
	icon_state = "brassmultitool"

	flags_tool = FLAG_TOOL_MULTITOOL

	size = SIZE_2
	weight = 3

	value = 10
