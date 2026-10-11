/obj/item/mech_delivery
	name = "机甲底盘配送终端"
	desc = "还能当信标用。"
	desc_extended = "用于管理你的机甲收藏并随地召唤机甲的平板终端。注意：对于先进精确投送式机甲储存舱造成的任何人身伤害，纳米传讯概不负责。"
	icon = 'icons/obj/item/supply_remote_mech.dmi'
	icon_state = "inventory"
	value = 1000

	weight = 4


/obj/item/mech_delivery/click_self(var/mob/caller)

	if(!is_player(caller))
		return ..()

	INTERACT_CHECK
	INTERACT_DELAY(1)

	var/mob/living/advanced/player/P = caller

	if(!P.allow_save)
		P.to_chat(span("warning","你似乎不知道这东西该怎么用……"))
		return FALSE

	var/list/menu_labels = list("创建新机甲（1000信用点）"="Create New Mech (1000 credits)","调取已有机甲（500信用点）"="Loading Existing Mech (500 credits)","取消"="Cancel")
	var/menu_choice = input("你想进行哪项操作？","机甲配送终端","取消") as null|anything in menu_labels
	menu_choice = menu_labels[menu_choice]

	INTERACT_CHECK_OTHER(src) //Hacky

	switch(menu_choice)
		if("Cancel")
			return TRUE
		if("Create New Mech (1000 credits)")
			var/savedata/client/mob/M = MOBDATA(P.ckey)
			var/existing_mechs = M.loaded_data["stored_mechs"]
			if(length(existing_mechs) >= 5)
				caller.to_chat(span("warning","错误：你已达到5台机甲的持有上限！请调取已有机甲！"))
				return TRUE
			var/list/confirmation_labels = list("是"="Yes","否"="No","取消"="Cancel")
			var/confirmation = input("确定要创建新的机甲底盘吗？这将花费1000信用点，并占用剩余[5-length(existing_mechs)]个机甲名额中的1个。","创建机甲","取消") as null|anything in confirmation_labels
			confirmation = confirmation_labels[confirmation]
			if(confirmation != "Yes")
				return TRUE

			if(P.currency < 1000)
				P.to_chat(span("warning","你的信用点不足，无法购买机甲！"))
				return TRUE

			P.to_chat(span("notice","一台机甲正被投送到你所在的位置！请清空周围区域！"))

			var/turf/caller_turf = get_turf(src)

			var/mob/living/vehicle/mech/modular/V = new(caller_turf)
			V.owner_ckey = P.ckey
			V.generate_id()
			V.generate_name()
			INITIALIZE(V)
			GENERATE(V)
			FINALIZE(V)
			if(!M.loaded_data["stored_mechs"])
				M.loaded_data["stored_mechs"] = list()
			M.loaded_data["stored_mechs"][V.mech_id] = V.save_mech_data()

			var/obj/structure/interactive/crate/closet/supply_pod/centcomm/SP = new(caller_turf)
			SP.add_to_crate(V)
			INITIALIZE(SP)
			FINALIZE(SP)

			P.adjust_currency(-1000)

		if("Loading Existing Mech (500 credits)")
			var/savedata/client/mob/M = MOBDATA(P.ckey)
			var/existing_mechs = M.loaded_data["stored_mechs"]

			if(length(existing_mechs) <= 0)
				P.to_chat(span("notice","你没有可调取的机甲！请返回主菜单创建一台！"))
				return TRUE

			var/list/mech_choices = list()

			var/i=1
			for(var/md5_id in existing_mechs)
				var/mech_data = existing_mechs[md5_id]
				var/mech_name = mech_data["name"]
				mech_choices["[i]: [mech_name]"] = md5_id
				i++

			mech_choices["取消"] = "Cancel"

			var/mech_choice = input("你想调取哪台机甲？","选择机甲","取消") as null|anything in mech_choices
			if(!mech_choice || mech_choices[mech_choice] == "Cancel")
				return TRUE

			var/md5_id = mech_choices[mech_choice]

			if(stored_mechs_by_ckey[P.ckey] && length(stored_mechs_by_ckey[P.ckey]))
				for(var/mob/living/vehicle/mech/modular/V in stored_mechs_by_ckey[P.ckey])
					if(V.mech_id == md5_id)
						P.to_chat(span("warning","错误：那台机甲已经配送过了！"))
						return TRUE

			var/turf/caller_turf = get_turf(src)

			var/mob/living/vehicle/mech/modular/V = new(caller_turf)
			V.owner_ckey = P.ckey
			INITIALIZE(V)
			FINALIZE(V)


			var/mech_data = existing_mechs[md5_id]
			V.load_mech_data(P,mech_data)

			var/obj/structure/interactive/crate/closet/supply_pod/centcomm/SP = new(caller_turf)
			SP.add_to_crate(V)
			INITIALIZE(SP)
			FINALIZE(SP)

			P.adjust_currency(-500)

			return TRUE
