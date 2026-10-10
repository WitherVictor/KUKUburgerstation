/obj/item/weapon/melee/tool
	name = "工具"
	drop_sound = 'sound/items/drop/scrap.ogg'
	has_quick_function = TRUE

/obj/item/weapon/melee/tool/quick(var/mob/activator,var/atom/object,location,params)
	if(object) object.clicked_on_by_object(activator,src,location,null,params) //It's important it's called this way as not to call attack() if it fails.
	return TRUE

/obj/item/weapon/melee/tool/wirecutters
	name = "钢丝钳"
	desc = "我说的是剪靛蓝色那根线！"
	desc_extended = "主要用于剪断电线的钳子。"
	icon = 'icons/obj/item/weapons/melee/tools/wirecutters.dmi'

	flags_tool = FLAG_TOOL_WIRECUTTER

	size = SIZE_2
	weight = 2

	value = 3

/obj/item/weapon/melee/tool/hammer
	name = "锤子"
	desc = "真有需要，什么都能拿来当锤子。"
	desc_extended = "一把结实的锤子，用来敲打东西。遗憾的是，不太适合战斗。"
	icon = 'icons/obj/item/weapons/melee/tools/hammer.dmi'


	size = SIZE_2
	weight = 5

	value = 5


/obj/item/weapon/melee/tool/wrench
	name = "扳手"
	desc = "一把可调节、能变尺寸、还能控温的扳手！"
	desc_extended = "一把适配已知宇宙中任何螺栓的扳手。活在这个时代真好。"
	icon = 'icons/obj/item/weapons/melee/tools/wrench.dmi'

	flags_tool = FLAG_TOOL_WRENCH

	size = SIZE_2
	weight = 4

	value = 5

/obj/item/weapon/melee/tool/wrench/high
	name = "高冲击扳手"
	desc = "一把可调节、能变尺寸、还能控温的扳手！现在冲击力更强！"
	desc_extended = "一把适配已知宇宙中任何螺栓的扳手。活在这个时代真好。这款经过了抗冲击认证。"

	icon = 'icons/obj/item/weapons/melee/tools/wrench_impact.dmi'
	size = SIZE_2
	weight = 8

	value = 20

	damage_type = /damagetype/melee/club/mace/

/obj/item/weapon/melee/tool/welder
	name = "焊接工具"
	desc = "普通、常见、日常使用的焊接工具！记得戴护目镜！"
	desc_extended = "使用特殊氢燃料的焊接工具，能胜任大多数焊接工作。"
	icon = 'icons/obj/item/weapons/melee/tools/welder.dmi'

	flags_tool = FLAG_TOOL_WELDER

	value = 5

	var/fuel_current = 0
	var/fuel_max = 50

	size = SIZE_2
	weight = 5

	var/active = FALSE

/obj/item/weapon/melee/tool/welder/save_item_data(var/mob/living/advanced/player/P,var/save_inventory = TRUE,var/died=FALSE,var/loadout=FALSE)
	RUN_PARENT_SAFE
	SAVEVAR("fuel_current")

/obj/item/weapon/melee/tool/welder/load_item_data_pre(var/mob/living/advanced/player/P,var/list/object_data,var/loadout=FALSE)
	RUN_PARENT_SAFE
	LOADVAR("fuel_current")

/obj/item/weapon/melee/tool/welder/Generate()
	fuel_current = fuel_max
	return ..()

/obj/item/weapon/melee/tool/welder/Finalize()
	fuel_current = min(fuel_current,fuel_max)
	return ..()

/obj/item/weapon/melee/tool/welder/think()

	. = ..()

	add_fuel(-0.001)

	if(fuel_current <= 0)
		return FALSE

	if(!active)
		return FALSE


/obj/item/weapon/melee/tool/welder/proc/add_fuel(var/fuel_amount = 0)

	if(!fuel_amount)
		return 0

	. = clamp(fuel_amount,-fuel_amount,fuel_max - fuel_current)

	fuel_current += .



/obj/item/weapon/melee/tool/welder/click_self(var/mob/activator,location,control,params)

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

/obj/item/weapon/melee/tool/welder/update_overlays()

	. = ..()

	if(active)
		var/image/I = new/image(icon,"welder_on")
		add_overlay(I)

	var/ratio = CEILING((fuel_current/fuel_max)*7,1)
	var/image/I = new/image(icon,"charge_[ratio]")
	add_overlay(I)

	return ..()

/obj/item/weapon/melee/tool/crowbar
	name = "撬棍"
	desc = "《半衰期2》的撬棍音效。"
	desc_extended = "一根弯曲的金属棒，至今仍被当作工具使用。好用就别瞎改。"
	icon = 'icons/obj/item/weapons/melee/tools/crowbar.dmi'

	flags_tool = FLAG_TOOL_CROWBAR

	size = SIZE_2
	weight = 4

	value = 5

/obj/item/weapon/melee/tool/crowbar/red
	name = "红色撬棍"
	icon = 'icons/obj/item/weapons/melee/tools/crowbar_red.dmi'

/obj/item/weapon/melee/tool/multitool
	name = "多功能工具"
	desc = "就是好使。"
	desc_extended = "可向气闸和其他机械的电线发送脉冲的多功能工具。"
	icon = 'icons/obj/item/weapons/melee/tools/multitool.dmi'

	flags_tool = FLAG_TOOL_MULTITOOL

	size = SIZE_2
	weight = 3

	value = 10

/obj/item/weapon/melee/tool/screwdriver
	name = "螺丝刀"
	desc = "用来拧螺丝。"
	desc_extended = "一把螺丝刀。可用于更换武器击针，以及各种与螺丝有关的操作。"
	icon = 'icons/obj/item/weapons/melee/tools/screwdriver.dmi'

	value = 5

	size = SIZE_1
	weight = 2

	flags_tool = FLAG_TOOL_SCREWDRIVER

/obj/item/weapon/melee/tool/pickaxe
	name = "钢镐"
	desc = "挖——钻——石——！"
	desc_extended = "一种极其过时的硬岩挖掘工具，但非常有效，攻击地形时必定造成4倍暴击伤害。"
	icon = 'icons/obj/item/weapons/melee/clubs/pickaxe/normal.dmi'

	damage_type = /damagetype/melee/club/pickaxe/

	flags_tool = FLAG_TOOL_PICKAXE

	tool_time = SECONDS_TO_DECISECONDS(2)

	value = 10

	size = SIZE_3
	weight = 10

/obj/item/weapon/melee/tool/pickaxe_diamond
	name = "钻石镐"
	desc = "到现在我已经挖到两——颗——了——！"
	desc_extended = "一种极其过时的硬岩挖掘工具，但非常有效，攻击地形时必定造成4倍暴击伤害。\n不知为何用钻石制成。"
	icon = 'icons/obj/item/weapons/melee/clubs/pickaxe/diamond.dmi'

	damage_type = /damagetype/melee/club/pickaxe/diamond

	flags_tool = FLAG_TOOL_PICKAXE

	tool_time = SECONDS_TO_DECISECONDS(1.5)

	value = 1200

	size = SIZE_3
	weight = 7

/obj/item/weapon/melee/tool/shovel
	name = "铲子"
	desc = "挖土很好用。"
	desc_extended = "跟大家想的不同，朝自己脚下发射火箭并不会让这把铲子伤害更高。"
	icon = 'icons/obj/item/weapons/melee/clubs/shovel.dmi'

	damage_type = /damagetype/melee/club/shovel

	flags_tool = FLAG_TOOL_SHOVEL

	tool_time = SECONDS_TO_DECISECONDS(2)

	value = 10

	size = SIZE_3
	weight = 8

/obj/item/weapon/melee/tool/botany
	name = "附魔除草器"
	desc = "当初为什么要给它附魔来着？"
	desc_extended = "一种附魔的手动除草工具。精细采集某些魔法植物时需要使用它。"
	icon = 'icons/obj/item/weapons/melee/tools/weeder.dmi'

	value = 250

	size = SIZE_1
	weight = 1
