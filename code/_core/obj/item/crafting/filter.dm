/obj/item/crafting_bench/filter
	name = "便携过滤器"
	icon = 'icons/obj/item/ore.dmi'
	icon_state = "filter"
	desc= "又是个得看说明书的东西。"
	desc_extended = "将物品中的化学试剂过滤到另一个容器中！按住Alt键点击可设置过滤孔径！"

	inventories = list(
		/obj/hud/inventory/crafting/slotB1,
		/obj/hud/inventory/crafting/slotB2,
		/obj/hud/inventory/crafting/slotB3,

		/obj/hud/inventory/crafting/result
	)

	crafting_id = "filter"

	crafting_type = "filter"

	value = 25

	size = SIZE_4

	var/filter_setting = 0

	var/precision = 0.1

	value_burgerbux = 1

/obj/item/crafting_bench/filter/click_self(var/mob/activator,location,control,params)

	if(activator.attack_flags & CONTROL_MOD_DISARM)
		var/current_setting
		var/possible_inputs = list()
		for(var/i=0,i<=1,i=FLOOR(i+precision,0.1))
			var/input_name = "[i]"
			switch(i)
				if(0)
					input_name = "[input_name]（细滤）"
				if(1)
					input_name = "[input_name]（粗滤）"
			if(filter_setting == i)
				current_setting = input_name
			possible_inputs[input_name] = i
		possible_inputs["取消"] = "Cancel"
		var/desired_input = input("请选择过滤孔径。","过滤设置",current_setting) as null|anything in possible_inputs
		if(!desired_input || possible_inputs[desired_input] == "Cancel")
			return TRUE
		filter_setting = possible_inputs[desired_input]
		activator.to_chat(span("notice","你将过滤孔径设为[desired_input]。"))
		return TRUE

	. = ..()

/obj/item/crafting_bench/filter/attempt_to_craft(var/mob/living/advanced/activator)

	var/obj/item/container/C //Final slot container.

	for(var/obj/hud/inventory/crafting/result/R in src.inventories)
		var/obj/item/top_object = R.get_top_object()
		if(top_object.reagents && top_object.allow_reagent_transfer_to)
			C = top_object
			break

	if(!C)
		activator.to_chat(span("warning","请在成品槽放入可用的收集容器！"))
		return FALSE

	var/list/item_table = generate_crafting_table(activator,src)

	var/success = FALSE

	for(var/i=1,i<=3,i++)

		var/obj/item/I = item_table["b[i]"]

		if(!I || !I.reagents || !length(I.reagents.stored_reagents))
			continue

		var/transfered = FALSE

		for(var/k in I.reagents.stored_reagents)
			var/reagent/R = REAGENT(k)
			var/volume = I.reagents.stored_reagents[k]
			if(R.particle_size < filter_setting)
				var/temperature = I.reagents.stored_reagents_temperature[k]
				var/amount_removed = -I.reagents.add_reagent(k,-volume,should_update=FALSE,check_recipes=FALSE,activator=activator)
				C.reagents.add_reagent(k,amount_removed,temperature,should_update=FALSE,check_recipes=FALSE,activator=activator)
				transfered = TRUE
				success = TRUE

		if(transfered)
			I.reagents.update_container(activator)
			I.reagents.process_recipes(activator)

	if(success)
		C.reagents.update_container(activator)
		C.reagents.process_recipes(activator)
	else
		activator.to_chat(span("warning","[src.name]没能滤出任何东西！"))

	return TRUE




