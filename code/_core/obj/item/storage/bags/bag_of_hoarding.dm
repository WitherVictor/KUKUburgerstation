//Doesn't work.

/obj/item/storage/bagofhoarding
	name = "远古聚宝袋"
	desc = "这下成《星际战甲》了。"
	desc_extended = "一个奇特的袋子，可以存放无限数量的某种稀有货币。可以染色。"
	icon = 'icons/obj/item/storage/boxes.dmi'
	icon_state = "moneybag"
	value = 10000
	var/hoard = 0				// how many inside
	var/targetitem				// this one is used for the base item roots, look further down for comments
	var/obj/item/goods			// targeted goods
	container_whitelist = list(
		/obj/item/currency/telecrystals,
		/obj/item/currency/magic_token,
		/obj/item/currency/gold_coin,
		/obj/item/currency/prize_ticket,
		/obj/item/currency/dosh,
		/obj/item/coin/antag_token
	)
	dynamic_inventory_count = 0
	is_container = FALSE
	dyeable = TRUE
	color = "#D8C1B0"
	value_burgerbux = 1

/obj/item/storage/bagofhoarding/get_value()
	. = ..()
	if(goods && hoard > 0)
		. += goods.get_value()*hoard

/obj/item/storage/bagofhoarding/save_item_data(var/mob/living/advanced/player/P,var/save_inventory = TRUE,var/died=FALSE,var/loadout=FALSE)
	RUN_PARENT_SAFE
	SAVEVAR("hoard")
	SAVEPATH("targetitem")
	SAVEATOM("goods")

/obj/item/storage/bagofhoarding/load_item_data_pre(var/mob/living/advanced/player/P,var/list/object_data,var/loadout=FALSE)
	RUN_PARENT_SAFE
	LOADVAR("hoard")
	LOADPATH("targetitem")
	LOADATOM("goods")
	if(!goods  || !targetitem)
		targetitem = null
		goods = null
		hoard = 0


/obj/item/storage/bagofhoarding/get_examine_details_list(var/mob/examiner)
	. = ..()
	if(goods && hoard > 0)
		. += span("notice","当前存有[hoard]个[initial(goods.name)]。")
	else
		. += span("notice","当前没有存放任何东西。")

/obj/item/storage/bagofhoarding/clicked_on_by_object(var/mob/caller,var/atom/object,location,control,params)

	if(hoard)
		if(istype(object,/obj/hud/inventory))
			var/mob/living/advanced/C = caller
			var/maxstack = goods.amount_max
			if(hoard <= maxstack)
				maxstack = hoard
			if((goods.amount_max == 1) || (hoard == 1))
				var/obj/item/M = new goods.type
				M.drop_item(get_turf(caller))
				C.put_in_hands(M,params)
				C.to_chat(span("notice","你取出了一个[M.name]。"))
				hoard--
				INTERACT_DELAY(1)
				if (!hoard)
					caller.to_chat(span("notice","[src.name]现在空了。"))
					goods = null
					return TRUE
				return TRUE
			var/choice = input("要取出多少？","总量：[hoard]；最多可取：[maxstack]") as null|num
			INTERACT_CHECK
			if(!choice) return TRUE
			if(choice >= maxstack)
				var/obj/item/M = new goods.type
				M.amount = maxstack
				M.update_sprite()
				hoard -= maxstack
				M.drop_item(get_turf(caller))
				C.put_in_hands(M,params)
			else if(choice < maxstack)
				var/obj/item/M = new goods.type
				M.amount = choice
				M.update_sprite()
				hoard -= choice
				M.drop_item(get_turf(caller))
				C.put_in_hands(M,params)
			if (!hoard)
				caller.to_chat(span("notice","[src.name]现在空了。"))
				goods = null
			return TRUE
		var/obj/item/I = object
		if(ispath(I.type,targetitem))
			INTERACT_CHECK
			INTERACT_CHECK_OBJECT
			hoard += I.amount
			if(length(inventory_sounds))
				play_sound(pick(inventory_sounds),get_turf(src),range_max=VIEW_RANGE*0.2)
			qdel(I)
			return TRUE

	if(!hoard)
		var/obj/item/I = object
		var/obj/O
		for(var/allofem in container_whitelist)
			O = allofem
			if(ispath(I.type,O))
				INTERACT_CHECK
				INTERACT_CHECK_OBJECT
				var/list/deposit_choices = list("是" = "Yes", "否" = "No")
				var/choice = input("要把[I.name]存进[src.name]吗？","存入聚宝袋") as null|anything in deposit_choices
				if(choice && deposit_choices[choice] == "Yes")
					INTERACT_CHECK
					INTERACT_CHECK_OBJECT
					if(ispath(I.type,/obj/item/currency/telecrystals))	//i dont know how else to do this because like "goods" doesnt work here
						targetitem = /obj/item/currency/telecrystals	//otherwise things like obj/.../telecrystals/goblins and /treasure break
					if(ispath(I.type,/obj/item/currency/magic_token))	//cuz it needs to be shortened back to telecrystals/
						targetitem = /obj/item/currency/magic_token		//keeping the targetitem var is also important for some shit like the desc
					if(ispath(I.type,/obj/item/currency/gold_coin))			//works around it so eh good enough absolute shitcode but smiling imp emoji
						targetitem = /obj/item/currency/gold_coin
					if(ispath(I.type,/obj/item/currency/prize_ticket))
						targetitem = /obj/item/currency/prize_ticket
					if(ispath(I.type,/obj/item/currency/dosh))
						targetitem = /obj/item/currency/dosh
					if(ispath(I.type,/obj/item/coin/antag_token))
						targetitem = /obj/item/coin/antag_token
					goods = I
					hoard = I.amount
					I.amount = 1
					if(length(inventory_sounds))
						play_sound(pick(inventory_sounds),get_turf(src),range_max=VIEW_RANGE*0.2)
					caller.to_chat(span("notice","[src.name]现在收纳[I.name]。"))
					qdel(I)
					return TRUE
	return ..()
