/obj/item/storage/pillbottle
	name = "药片瓶"
	desc = "药片在这儿！"
	desc_extended = "没有标签的医用药片瓶，最多可装30片药。"
	icon = 'icons/obj/item/storage/prescription_pillbottle.dmi'
	icon_state = "base"

	size = SIZE_1
	dynamic_inventory_count = 1
	container_max_size = SIZE_0
	container_max_slots = 30
	container_whitelist = list(
		/obj/item/container/edible/pill,
	)

	var/color_lid = "#FFFFFF"
	var/color_label = "#FFFFFF"
	var/color_canister = "#D35400"

	var/fill_icon_count = 7

	drop_sound = 'sound/items/drop/pillbottle.ogg'

	value = 20

/obj/item/storage/pillbottle/save_item_data(var/mob/living/advanced/player/P,var/save_inventory = TRUE,var/died=FALSE,var/loadout=FALSE)
	RUN_PARENT_SAFE
	SAVEVAR("color_lid")
	SAVEVAR("color_label")
	SAVEVAR("color_canister")

/obj/item/storage/pillbottle/load_item_data_pre(var/mob/living/advanced/player/P,var/list/object_data,var/loadout=FALSE)
	RUN_PARENT_SAFE
	LOADVAR("color_lid")
	LOADVAR("color_label")
	LOADVAR("color_canister")

/obj/item/storage/pillbottle/Finalize()
	. = ..()
	update_sprite()

/obj/item/storage/pillbottle/update_inventory()
	. = ..()
	update_sprite()

/obj/item/storage/pillbottle/update_overlays()

	. = ..()

	var/image/lid = new/image(icon,"lid")
	lid.appearance_flags = src.appearance_flags | RESET_COLOR
	lid.color = color_lid
	add_overlay(lid)

	var/image/canister = new/image(icon,"canister")
	canister.appearance_flags = src.appearance_flags | RESET_COLOR
	canister.color = color_canister
	add_overlay(canister)

	var/image/label = new/image(icon,"label")
	label.appearance_flags = src.appearance_flags | RESET_COLOR
	label.color = color_label
	add_overlay(label)


/obj/item/storage/pillbottle/update_icon()

	. = ..()

	if(fill_icon_count > 0)
		var/chosen_color
		var/filled_slots = 0
		for(var/k in src.inventories)
			var/obj/hud/inventory/I = k
			filled_slots += length(I.contents)
			if(!chosen_color)
				var/obj/item/I2 = I.get_top_object()
				if(I2) chosen_color = I2.color

		var/icon_mod = CEILING( (filled_slots/(dynamic_inventory_count*container_max_slots)) * fill_icon_count,1)
		icon_state = "contents_[icon_mod]"
		color = chosen_color
	else
		icon_state = null


/obj/item/storage/pillbottle/bicaridine
	name = "比卡利定药片瓶"
	desc = "红色治外伤。"
	desc_extended = "标签注明内含20片比卡利定，每片5单位，用于基础外伤治疗。最多可装30片药。"

/obj/item/storage/pillbottle/bicaridine/fill_inventory()
	for(var/i=1,i<=20,i++)
		new /obj/item/container/edible/pill/bicaridine(src)
	. = ..()

/obj/item/storage/pillbottle/bicaridine_small
	name = "比卡利定药片瓶"
	desc = "红色治外伤。"
	desc_extended = "标签注明内含10片比卡利定，每片5单位，用于基础外伤治疗。最多可装30片药。"

/obj/item/storage/pillbottle/bicaridine_small/fill_inventory()
	for(var/i=1,i<=10,i++)
		new /obj/item/container/edible/pill/bicaridine(src)
	. = ..()

/obj/item/storage/pillbottle/kelotane
	name = "克罗烷药片瓶"
	desc = "黄色治烧伤。"
	desc_extended = "标签注明内含20片克罗烷，每片5单位，用于基础烧伤治疗。最多可装30片药。"

/obj/item/storage/pillbottle/kelotane/fill_inventory()
	for(var/i=1,i<=20,i++)
		new /obj/item/container/edible/pill/kelotane(src)
	. = ..()

/obj/item/storage/pillbottle/kelotane_small
	name = "克罗烷药片瓶"
	desc = "黄色治烧伤。"
	desc_extended = "标签注明内含10片克罗烷，每片5单位，用于基础烧伤治疗。最多可装30片药。"

/obj/item/storage/pillbottle/kelotane_small/fill_inventory()
	for(var/i=1,i<=10,i++)
		new /obj/item/container/edible/pill/kelotane(src)
	. = ..()

/obj/item/storage/pillbottle/dylovene
	name = "地洛文药片瓶"
	desc = "绿色解毒。"
	desc_extended = "标签注明内含20片地洛文，每片5单位，是基础解毒药。最多可装30片药。"

/obj/item/storage/pillbottle/dylovene/fill_inventory()
	for(var/i=1,i<=20,i++)
		new /obj/item/container/edible/pill/dylovene(src)
	. = ..()

/obj/item/storage/pillbottle/dylovene_small
	name = "地洛文药片瓶"
	desc = "绿色解毒。"
	desc_extended = "标签注明内含10片地洛文，每片5单位，是基础解毒药。最多可装30片药。"

/obj/item/storage/pillbottle/dylovene_small/fill_inventory()
	for(var/i=1,i<=10,i++)
		new /obj/item/container/edible/pill/dylovene(src)
	. = ..()


/obj/item/storage/pillbottle/iron
	name = "铁剂药片瓶"
	desc = "没血了？小事一桩！"
	desc_extended = "标签注明内含20片铁剂，每片10单位，用于辅助治疗失血。最多可装30片药。"

/obj/item/storage/pillbottle/iron/fill_inventory()
	for(var/i=1,i<=20,i++)
		new /obj/item/container/edible/pill/iron(src)
	. = ..()

/obj/item/storage/pillbottle/iron_small
	name = "铁剂药片瓶"
	desc = "没血了？小事一桩！"
	desc_extended = "标签注明内含10片铁剂，每片10单位，用于辅助治疗失血。最多可装30片药。"

/obj/item/storage/pillbottle/iron_small/fill_inventory()
	for(var/i=1,i<=10,i++)
		new /obj/item/container/edible/pill/iron(src)
	. = ..()

/obj/item/storage/pillbottle/omnizine
	name = "全能灵药药片瓶"
	desc = "包治百病！无效退款！*"
	desc_extended = "标签注明内含20片全能灵药，每片10单位，是通用治疗药剂。最多可装30片药。"

/obj/item/storage/pillbottle/omnizine/fill_inventory()
	for(var/i=1,i<=20,i++)
		new /obj/item/container/edible/pill/omnizine(src)
	. = ..()

/obj/item/storage/pillbottle/charcoal
	name = "活性炭药片瓶"
	desc = "不听话的坏化学家，就得把体内的冰毒清个干净！"
	desc_extended = "标签注明内含20片活性炭，每片5单位，是清除血液中药剂的基础药物。最多可装30片药。"

/obj/item/storage/pillbottle/charcoal/fill_inventory()
	for(var/i=1,i<=20,i++)
		new /obj/item/container/edible/pill/charcoal(src)
	. = ..()

/obj/item/storage/pillbottle/antihol_small
	name = "解酒剂药片瓶"
	desc = "让你酒醒的速度比降薪还快。"
	desc_extended = "标签注明内含10片解酒剂，每片10单位，可分解并清除体内的酒精。最多可装30片药。"

/obj/item/storage/pillbottle/antihol_small/fill_inventory()
	for(var/i=1,i<=10,i++)
		new /obj/item/container/edible/pill/antihol(src)
	. = ..()

/obj/item/storage/pillbottle/potassium_iodide_small
	name = "碘化钾药片瓶"
	desc = "不，老兄，你刚才说的是——"
	desc_extended = "标签注明内含10片碘化钾，每片10单位，是基础抗辐射药物。最多可装30片药。"

/obj/item/storage/pillbottle/potassium_iodide_small/fill_inventory()
	for(var/i=1,i<=10,i++)
		new /obj/item/container/edible/pill/potassium_iodide(src)
	. = ..()

/obj/item/storage/pillbottle/space_prussian_blue_small
	name = "太空普鲁士蓝药片瓶"
	desc = "据说是用老马的骨头做的。"
	desc_extended = "标签注明内含10片太空普鲁士蓝，每片10单位，是有效的抗辐射药物。最多可装30片药。"

/obj/item/storage/pillbottle/space_prussian_blue_small/fill_inventory()
	for(var/i=1,i<=10,i++)
		new /obj/item/container/edible/pill/space_prussian_blue(src)
	. = ..()
