/obj/item/powercell/
	name = "标准电池"
	desc = "禁止下肚。"
	desc_extended = "用于为能量武器供电的电池，标注额定功率为10000兆瓦。"
	icon = 'icons/obj/item/cells.dmi'
	icon_state = "cell_basic"

	var/charge_current = 0
	var/charge_max = CELL_SIZE_BASIC

	size = SIZE_1

	value = 10

	weight = 2
	has_quick_function = TRUE //allows batteries in the belt slots

/obj/item/powercell/quick(var/mob/activator,var/atom/object,location,params)

	if(!is_advanced(activator) || !is_inventory(src.loc))
		return FALSE

	var/mob/living/advanced/A = activator

	return A.put_in_hands(src,params)

/obj/item/powercell/get_battery()
	return src

/obj/item/powercell/get_base_value()
	. = ..()
	. += CEILING(charge_max*0.0003,1)

/obj/item/powercell/get_value()
	. = ..()
	. += CEILING(charge_current*0.001,1)

/obj/item/powercell/save_item_data(var/mob/living/advanced/player/P,var/save_inventory = TRUE,var/died=FALSE,var/loadout=FALSE)
	RUN_PARENT_SAFE
	SAVEVAR("charge_current")

/obj/item/powercell/load_item_data_pre(var/mob/living/advanced/player/P,var/list/object_data,var/loadout=FALSE)
	RUN_PARENT_SAFE
	LOADVAR("charge_current")

/obj/item/powercell/Generate()
	charge_current = charge_max
	. = ..()
	update_sprite()



/obj/item/powercell/update_overlays()
	. = ..()
	var/charge_number = FLOOR(min(charge_current/charge_max,1) * 7, 1)
	var/image/I = new/image(initial(icon),"charge_[charge_number]")
	add_overlay(I)

/obj/item/powercell/advanced
	name = "高级电池"
	desc = "研发部，给我一块电池好不好？保证不用来做电击棒。"
	desc_extended = "用于为能量武器供电的电池，标注额定功率为25000兆瓦。"
	icon_state = "cell_advanced"
	charge_max = CELL_SIZE_ADVANCED

	size = SIZE_1

	value = 15

	weight = 3

	rarity = RARITY_UNCOMMON

/obj/item/powercell/industrial
	name = "工业电池"
	desc = "研发部，给我一块电池好不好？保证不用来做电击棒。"
	desc_extended = "用于为能量武器供电的笨重电池，标注额定功率为50000兆瓦。"
	icon_state = "cell_industrial"
	charge_max = CELL_SIZE_INDUSTRIAL

	size = SIZE_2

	rarity = RARITY_UNCOMMON


	value = 25

	weight = 5


/obj/item/powercell/bluespace
	name = "蓝空间电池"
	desc = "蓝空间科技，老子懒得解释。"
	desc_extended = "极其先进的蓝空间电池，内置微型次元袋，里面塞满了多得离谱的二极管。"
	icon_state = "cell_bluespace"
	charge_max = CELL_SIZE_BLUESPACE

	size = SIZE_2

	value = 1000

	weight = 4

	value_burgerbux = 1

	rarity = RARITY_MYTHICAL

/obj/item/powercell/vehicle
	name = "机甲级电池"
	desc = "禁止吞咽。"
	desc_extended = "巨大的机甲级电池，通常用于为机甲、机甲武器及其内部系统供电。"
	icon_state = "cell_vehicle"
	charge_max = CELL_SIZE_VEHICLE

	size = SIZE_4

	value = 30

	weight = 10

/obj/item/powercell/tiny
	name = "设备电池"
	desc = "禁止吞咽。"
	desc_extended = "通常用于为小型设备供电的微型电池。"
	icon_state = "cell_tiny"
	charge_max = CELL_SIZE_TINY

	size = SIZE_0

	value = 10

	weight = 1


/obj/item/powercell/recharging
	name = "聚变电池"
	desc = "禁止下肚。"
	desc_extended = "用于为能量武器供电的电池。它能自行充电！"
	icon = 'icons/obj/item/cells.dmi'
	icon_state = "cell_recharging"

	charge_max = CELL_SIZE_BASIC*0.5

	size = SIZE_2

	value = 1000

	weight = 6

	value_burgerbux = 1 //Citizens aren't supposed to have recharging power cells.

/obj/item/powercell/recharging/PostInitialize()
	START_THINKING(src)
	return ..()

/obj/item/powercell/recharging/think()

	charge_current = min(charge_current + charge_max*0.001,charge_max)

	var/obj/item/weapon/ranged/energy/E = src.loc
	if(E && istype(E) && E.charge_icon_state_count)
		var/desired_state = E.get_charge_icon_state()
		if(desired_state != E.old_charge_icon_state)
			E.overlays.Cut()
			E.update_overlays()

	return ..()

/obj/item/powercell/get_examine_list(var/mob/activator)
	return ..() + div("notice","剩余电量：[charge_current] / [charge_max]。")



/obj/item/powercell/dummy
	name = "占位电池"
	desc = "傻瓜专用。"
	desc_extended = "你不应该看到这个。"
	icon = 'icons/obj/item/cells.dmi'
	icon_state = "cell_recharging"

	charge_max = 100

	size = SIZE_1

	value = 0

	weight = 0

/obj/item/powercell/dummy/get_base_value()
	return 0

/obj/item/powercell/dummy/get_value()
	return 0
