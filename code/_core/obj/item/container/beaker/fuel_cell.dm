/obj/item/container/simple/beaker/fuel_cell
	name = "燃料电池"
	desc = "请勿饮用。"
	desc_extended = "一种特殊的超冷液体燃料电池，技术较落后的文明用它为机器供能。可用扳手打开，取出里面的物质。"
	icon = 'icons/obj/item/container/fuel_cell.dmi'
	icon_state = "cell"

	icon_count = 6

	allow_reagent_transfer_to = FALSE
	allow_reagent_transfer_from = FALSE

	value = 20

	var/stripe_color = "#FFFFFF"

	reagents = /reagent_container/fuel_cell

	size = SIZE_1

/obj/item/container/simple/beaker/fuel_cell/save_item_data(var/mob/living/advanced/player/P,var/save_inventory = TRUE,var/died=FALSE,var/loadout=FALSE)
	RUN_PARENT_SAFE
	SAVEVAR("allow_reagent_transfer_to")

/obj/item/container/simple/beaker/fuel_cell/load_item_data_post(var/mob/living/advanced/player/P,var/list/object_data,var/loadout=FALSE)
	RUN_PARENT_SAFE
	LOADVAR("allow_reagent_transfer_to")

/obj/item/container/simple/beaker/fuel_cell/Finalize()
	. = ..()
	if(allow_reagent_transfer_to || allow_reagent_transfer_from)
		allow_reagent_transfer_to = TRUE
		allow_reagent_transfer_from = TRUE
		reagents.temperature_change_mul = 1
		SSreagent.all_temperature_reagent_containers += reagents

/obj/item/container/simple/beaker/fuel_cell/click_self(var/mob/activator)

	if(!(allow_reagent_transfer_to || allow_reagent_transfer_from))
		activator.to_chat(span("notice","你需要扳手才能打开[src.name]！"))
		return TRUE

	. = ..()

/obj/item/container/simple/beaker/fuel_cell/clicked_on_by_object(var/mob/activator,var/atom/object,location,control,params)

	if(is_item(object))
		var/obj/item/I = object
		if(I.flags_tool & FLAG_TOOL_WRENCH)
			if(!(allow_reagent_transfer_to || allow_reagent_transfer_from))
				activator.visible_message(span("notice","[activator.name]用[I.name]打开了[src.name]。"),span("notice","你用[I.name]打开了[src.name]。"))
				allow_reagent_transfer_to = TRUE
				allow_reagent_transfer_from = TRUE
				reagents.temperature_change_mul = 1
				SSreagent.all_temperature_reagent_containers += reagents
			else
				activator.to_chat(span("warning","[src.name]已经打开了！"))
			return TRUE

	. = ..()

/obj/item/container/simple/beaker/fuel_cell/update_overlays()
	. = ..()
	var/image/I = new/image(initial(icon),"markings")
	I.appearance_flags = src.appearance_flags
	I.color = stripe_color
	add_overlay(I)

/obj/item/container/simple/beaker/fuel_cell/oxygen
	name = "液氧燃料电池"
	stripe_color = COLOR_CYAN

/obj/item/container/simple/beaker/fuel_cell/oxygen/Generate()
	. = ..()
	reagents.add_reagent(/reagent/fuel/oxygen,reagents.volume_max,T0C - 200)

/obj/item/container/simple/beaker/fuel_cell/hydrogen
	name = "液氢燃料电池"
	stripe_color = COLOR_RED

/obj/item/container/simple/beaker/fuel_cell/hydrogen/Generate()
	. = ..()
	reagents.add_reagent(/reagent/fuel/hydrogen,reagents.volume_max,T0C - 200)

/obj/item/container/simple/beaker/fuel_cell/phoron
	name = "液态佛隆燃料电池"
	stripe_color = COLOR_PURPLE

/obj/item/container/simple/beaker/fuel_cell/phoron/Generate()
	. = ..()
	reagents.add_reagent(/reagent/fuel/phoron,reagents.volume_max,T0C - 200)

/obj/item/container/simple/beaker/fuel_cell/nitrogen
	name = "液氮燃料电池"
	stripe_color = COLOR_WHITE

/obj/item/container/simple/beaker/fuel_cell/nitrogen/Generate()
	. = ..()
	reagents.add_reagent(/reagent/nitrogen,reagents.volume_max,T0C - 200)
