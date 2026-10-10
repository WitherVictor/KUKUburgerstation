/obj/item/container/simple/can
	name = "普通汽水罐"
	desc = "错误。"
	desc_extended = "用于盛装试剂。"
	crafting_id = "soda_can"

	icon = 'icons/obj/item/container/cup/cans_new.dmi'
	icon_state = ""

	reagents = /reagent_container/beaker/bottle/

	allow_reagent_transfer_to = FALSE //Needs to be open, first.
	allow_reagent_transfer_from = FALSE

	var/open = TRUE

	drop_sound = 'sound/items/drop/soda.ogg'

	size = SIZE_1

/obj/item/container/simple/can/click_self(var/mob/activator,location,control,params)

	if(open) return ..()

	INTERACT_CHECK
	INTERACT_DELAY(1)

	activator.visible_message(span("notice","[activator.name]打开了[src.name]。"),span("notice","你打开了[src.name]。"))
	//TODO: Pop sounds for certain objects.
	open = TRUE
	allow_reagent_transfer_to = TRUE
	allow_reagent_transfer_from = TRUE

	return TRUE

/obj/item/container/simple/can/cola/
	name = "太空可乐"
	icon_state = "cola"
	value = 1

/obj/item/container/simple/can/cola/Generate()
	reagents.add_reagent(/reagent/nutrition/soda/cola,reagents.volume_max)
	open = FALSE
	return ..()

/obj/item/container/simple/can/grape_soda/
	name = "星吻葡萄汽水"
	icon_state = "grape_soda"
	value = 1

/obj/item/container/simple/can/grape_soda/Generate()
	reagents.add_reagent(/reagent/nutrition/soda/grape,reagents.volume_max)
	open = FALSE
	return ..()

/obj/item/container/simple/can/orange_soda/
	name = "星吻橙味汽水"
	icon_state = "orange_soda"
	value = 1

/obj/item/container/simple/can/orange_soda/Generate()
	reagents.add_reagent(/reagent/nutrition/soda/orange,reagents.volume_max)
	open = FALSE
	return ..()

/obj/item/container/simple/can/iced_tea/
	name = "磁盘！冰茶"
	icon_state = "iced_tea"
	value = 1

/obj/item/container/simple/can/iced_tea/Generate()
	reagents.add_reagent(/reagent/nutrition/soda/iced_tea,reagents.volume_max)
	open = FALSE
	return ..()

/obj/item/container/simple/can/grey_bull/
	name = "灰牛"
	icon_state = "grey_bull"
	reagents = /reagent_container/beaker/

	rarity = RARITY_RARE

	value = 1

/obj/item/container/simple/can/grey_bull/Generate()
	reagents.add_reagent(/reagent/nutrition/energy/grey_bull,reagents.volume_max)
	open = FALSE
	return ..()

/obj/item/container/simple/can/mountain_wind/
	name = "太空山风"
	icon_state = "mountain_wind"
	value = 1

/obj/item/container/simple/can/mountain_wind/Generate()
	reagents.add_reagent(/reagent/nutrition/soda/mountain_wind,reagents.volume_max)
	open = FALSE
	return ..()

/obj/item/container/simple/can/dr_gibb
	name = "吉布博士"
	icon_state = "dr_gibb"
	value = 1

/obj/item/container/simple/can/dr_gibb/Generate()
	reagents.add_reagent(/reagent/nutrition/soda/dr_gibb,reagents.volume_max)
	open = FALSE
	return ..()

/obj/item/container/simple/can/dr_gibb/explosive
	name = "吉布斯博士"
	var/explosive = TRUE
	value = 300

	rarity = RARITY_RARE

/obj/item/container/simple/can/dr_gibb/explosive/get_examine_list(var/mob/examiner)

	. = ..()

	if(explosive)
		. += div("danger","等等，什么鬼？拉环上连着炸药！")


/obj/item/container/simple/can/dr_gibb/explosive/click_self(var/mob/activator,location,control,params)

	. = ..()

	if(. && explosive && open && is_living(activator))
		var/turf/T = get_turf(src)
		if(T)
			T.visible_message(span("danger","拉开拉环时，你听到一声机械轻响……哦，操——"))
			var/mob/living/L = activator
			explode(T,3,activator,src,L.loyalty_tag)
			explosive = FALSE


/obj/item/container/simple/can/dr_gibb/explosive/save_item_data(var/mob/living/advanced/player/P,var/save_inventory = TRUE,var/died=FALSE,var/loadout=FALSE)
	RUN_PARENT_SAFE
	SAVEVAR("explosive")

/obj/item/container/simple/can/dr_gibb/explosive/load_item_data_pre(var/mob/living/advanced/player/P,var/list/object_data,var/loadout=FALSE)
	RUN_PARENT_SAFE
	LOADVAR("explosive")

/obj/item/container/simple/can/space_up/
	name = "太空七喜！"
	icon_state = "space_up"
	value = 1

/obj/item/container/simple/can/space_up/Generate()
	reagents.add_reagent(/reagent/nutrition/soda/space_up,reagents.volume_max)
	open = FALSE
	return ..()
