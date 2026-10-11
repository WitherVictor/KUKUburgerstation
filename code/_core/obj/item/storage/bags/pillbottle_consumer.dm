/obj/item/storage/pillbottle/consumer
	icon = 'icons/obj/item/storage/consumer_pillbottle.dmi'
	desc_extended = "没有标签的零售药片瓶，最多可装30片药。"
	fill_icon_count = 0
	color_lid = COLOR_WHITE
	color_label = COLOR_WHITE
	color_canister = COLOR_WHITE

/obj/item/storage/pillbottle/consumer/chlorine
	name = "氯片瓶"
	desc = "泳池主人、战争罪犯和无人看管的孩子都爱它。"
	desc_extended = "标签注明内含20片氯片，每片5单位，用于化学加工。不可食用。"
	color_lid = COLOR_WHITE
	color_label = COLOR_CYAN
	color_canister = COLOR_WHITE


/obj/item/storage/pillbottle/consumer/chlorine/fill_inventory()
	for(var/i=1,i<=20,i++)
		new /obj/item/container/edible/pill/chlorine(src)
	. = ..()

/obj/item/storage/pillbottle/consumer/carbon
	name = "碳片瓶"
	desc = "忘了水吧，这才是真正的生命之本。"
	desc_extended = "标签注明内含20片碳片，每片5单位，用于化学加工。不可食用。"
	color_lid = COLOR_GREY
	color_label = COLOR_GREY_LIGHT
	color_canister = COLOR_GREY_DARK


/obj/item/storage/pillbottle/consumer/carbon/fill_inventory()
	for(var/i=1,i<=20,i++)
		new /obj/item/container/edible/pill/carbon(src)
	. = ..()

/obj/item/storage/pillbottle/consumer/painkillers
	name = "屁司匹林药片瓶"
	desc = "专治让你屁股疼的烦心事！"
	desc_extended = "标签注明内含20片屁司匹林，每片5单位，是缓解疼痛和压痛的基础止痛药。最多可装30片药。"
	color_lid = COLOR_RED
	color_label = COLOR_YELLOW
	color_canister = COLOR_BLUE


/obj/item/storage/pillbottle/consumer/painkillers/fill_inventory()
	for(var/i=1,i<=20,i++)
		new /obj/item/container/edible/pill/assprin(src)
	. = ..()

/obj/item/storage/pillbottle/consumer/charcoal
	name = "活性炭片瓶"
	desc = "不听话的坏化学家，就得把体内的冰毒清个干净！"
	desc_extended = "标签注明内含20片活性炭，每片5单位，是清除血液中药剂的基础药物。最多可装30片药。"
	color_lid = COLOR_YELLOW
	color_label = COLOR_GREY_LIGHT
	color_canister = COLOR_BLACK


/obj/item/storage/pillbottle/consumer/charcoal/fill_inventory()
	for(var/i=1,i<=20,i++)
		new /obj/item/container/edible/pill/charcoal(src)
	. = ..()
