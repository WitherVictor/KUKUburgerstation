/obj/item/container/syringe/medipen
	name = "蝴蝶注射笔"
	desc = "想更快在人身上扎洞时用得上。"
	desc_extended = "一次性皮下注射笔，用于将化学物质快速、安全地注入使用者的血液。"
	crafting_id = "medipen"
	icon = 'icons/obj/item/container/medipen.dmi'
	icon_state = "medipen"

	reagents = /reagent_container/syringe/medipen

	inject_amount_desired = INFINITY
	injection_sound = 'sound/effects/epi.ogg'

	can_draw = FALSE
	adjustable = FALSE

	injection_time = SECONDS_TO_DECISECONDS(0.5)
	quality_reduction_on_use = 100

	value = 20

	rarity = RARITY_UNCOMMON

/obj/item/container/syringe/medipen/update_sprite()
	. = ..()
	name = initial(name)
	desc_extended = initial(desc_extended)
	if(quality <= 0)
		name = "用过的[name]"
		desc_extended = "[desc_extended]这支已经用过，应予丢弃。"
	else
		var/list/names = list()
		for(var/r_id in reagents.stored_reagents)
			var/reagent/R = REAGENT(r_id)
			names += R.name
		desc_extended = "[desc_extended]这支含有[english_list(names,"无药物","、","和")]。"

/obj/item/container/syringe/medipen/update_icon()
	. = ..()
	icon = initial(icon)
	if(!reagents || reagents.volume_current <= 0)
		icon_state = "opened"
		flick("open",src)
	else
		icon_state = "closed"

/obj/item/container/syringe/medipen/update_underlays()
	. = ..()
	if(reagents && reagents.volume_current)
		var/image/I = new/image(icon,"liquid")
		I.appearance_flags = src.appearance_flags | RESET_COLOR
		I.color = reagents.color
		add_underlay(I)

/obj/item/container/syringe/medipen/mouse_wheel_on_object(var/mob/activator,delta_x,delta_y,location,control,params)
	return

/obj/item/container/syringe/medipen/click_self(var/mob/activator,location,control,params)
	return

/obj/item/container/syringe/medipen/adminomnizine
	name = "神之蝴蝶注射笔"
	value_burgerbux = 1

/obj/item/container/syringe/medipen/adminomnizine/Generate()
	reagents.add_reagent(/reagent/medicine/adminomnizine,reagents.volume_max)
	return ..()

/obj/item/container/syringe/medipen/bicaridine
	name = "外伤治疗蝴蝶注射笔"

/obj/item/container/syringe/medipen/bicaridine/Generate()
	reagents.add_reagent(/reagent/medicine/bicaridine_plus,reagents.volume_max)
	return ..()

/obj/item/container/syringe/medipen/kelotane
	name = "烧伤治疗蝴蝶注射笔"

/obj/item/container/syringe/medipen/kelotane/Generate()
	reagents.add_reagent(/reagent/medicine/kelotane,reagents.volume_max)
	return ..()

/obj/item/container/syringe/medipen/dylovene
	name = "解毒蝴蝶注射笔"

/obj/item/container/syringe/medipen/dylovene/Generate()
	reagents.add_reagent(/reagent/medicine/dylovene,reagents.volume_max)
	return ..()

/obj/item/container/syringe/medipen/dexaline
	name = "抗窒息蝴蝶注射笔"

/obj/item/container/syringe/medipen/dexaline/Generate()
	reagents.add_reagent(/reagent/medicine/dexalin,reagents.volume_max)
	return ..()

/obj/item/container/syringe/medipen/epinephrine
	name = "急救肾上腺素蝴蝶注射笔"

/obj/item/container/syringe/medipen/epinephrine/Generate()
	reagents.add_reagent(/reagent/medicine/adrenaline/epinephrine,reagents.volume_max)
	return ..()

/obj/item/container/syringe/medipen/iron
	name = "补血蝴蝶注射笔"

/obj/item/container/syringe/medipen/iron/Generate()
	reagents.add_reagent(/reagent/iron,reagents.volume_max)
	return ..()

/obj/item/container/syringe/medipen/mining
	name = "采矿蝴蝶注射笔"
	desc = "除了采矿胶囊之外，唯一能让你在火山灰暴中活下来的东西。"
	desc_extended = "效果极佳、价格昂贵的蝴蝶注射笔，内含强效混合药剂，即使在极端恶劣的环境中也能让你保持行动。建议不要在短时间内连续使用超过两支。"

/obj/item/container/syringe/medipen/mining/Generate()
	reagents.add_reagent(/reagent/medicine/inaprovaline,5)
	reagents.add_reagent(/reagent/medicine/tricordrazine,5)
	reagents.add_reagent(/reagent/medicine/adrenaline,5)
	reagents.add_reagent(/reagent/medicine/painkiller/morphine,5)
	return ..()

/obj/item/container/syringe/medipen/mining_plus
	name = "豪华采矿蝴蝶注射笔"
	desc = "除了采矿胶囊之外，唯一能让你在火山灰暴中活下来的东西。"
	desc_extended = "效果极佳、价格昂贵的蝴蝶注射笔，内含强效混合药剂，即使在极端恶劣的环境中也能让你保持行动。建议不要在短时间内连续使用超过两支。"

	reagents = /reagent_container/syringe/hypospray

/obj/item/container/syringe/medipen/mining_plus/Generate()
	reagents.add_reagent(/reagent/medicine/inaprovaline,10)
	reagents.add_reagent(/reagent/medicine/omnizine,10)
	reagents.add_reagent(/reagent/medicine/tricordrazine,10)
	reagents.add_reagent(/reagent/medicine/adrenaline,10)
	reagents.add_reagent(/reagent/medicine/painkiller/morphine,10)
	return ..()
