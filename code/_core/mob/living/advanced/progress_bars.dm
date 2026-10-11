/mob/living/advanced/on_progress_bar_completed(var/id,var/list/callback_list)

	switch(id)
		if("enter_vehicle")
			var/mob/living/vehicle/V = callback_list["vehicle"]
			src.Move(V)
			return TRUE
		if("loot_object")
			var/obj/structure/interactive/lootable/L = callback_list["object"]
			L.give_items(src,callback_list["left"])
			return TRUE
		if("teleport")
			var/atom/A = callback_list["end_turf"]
			src.force_move(A)
			src.set_dir(SOUTH)
			src.pixel_y = TILE_SIZE
			animate(src,pixel_y = 0,time=10)
			return TRUE
		if("feed_self")
			var/obj/item/container/food/F = callback_list["object"]
			F.consume(src)
			return TRUE
		if("feed_other")
			var/obj/item/container/food/F = callback_list["object"]
			var/mob/living/advanced/A = callback_list["target"]
			src.to_chat(span("notice","你把[F]强喂给了[A]。"))
			A.to_chat(span("warning","[src]把[F]强喂给你！"))
			F.consume(A)
			return TRUE
		if("inject")
			var/obj/item/organ/O = callback_list["target"]
			var/obj/item/container/syringe/S = callback_list["object"]
			var/is_injecting = callback_list["injecting"]
			var/verb_to_use = is_injecting ? "注射" : "抽血"
			var/mob/living/L = O.loc
			if(!L || !istype(L) || !L.reagents)
				src.to_chat(span("notice","没有可供注射或抽血的目标！"))
				return TRUE

			if(is_injecting)
				S.reagents.transfer_reagents_to(L.reagents,S.inject_amount)
			else
				L.reagents.transfer_reagents_to(S.reagents,S.draw_amount)

			src.to_chat(span("notice","你使用[S.name]为[L.name][verb_to_use]。"))

			S.update_icon()

			return TRUE
		if("mine_ore")
			var/obj/structure/interactive/ore_deposit/OD = callback_list["ore"]
			OD.mine(src)
			return TRUE
		if("medicine")
			var/obj/item/container/medicine/M = callback_list["object"]
			var/obj/item/organ/O = callback_list["target"]
			M.treat_organ(src,O)
			return TRUE


	..()

/mob/living/advanced/on_progress_bar_failed(var/id,var/list/callback_list)

	switch(id)
		if("enter_vehicle")
			to_chat(span("notice","进入载具时必须保持不动！"))
			return TRUE
		if("loot_object")
			to_chat(span("notice","搜寻物品时必须保持不动！"))
			return TRUE
		if("teleport")
			to_chat(span("notice","传送时必须保持不动！"))
			return TRUE
		if("feed_self") //TODO: Debate whether or not you should be standing still in order to eat food.
			to_chat(span("notice","进食时必须保持不动！"))
			return TRUE
		if("feed_other")
			to_chat(span("notice","喂食时，你和目标都必须保持不动！"))
			return TRUE
		if("mine_ore")
			to_chat(span("notice","采矿时必须保持不动！"))
			return TRUE

	..()
