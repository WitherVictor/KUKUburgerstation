/obj/item/weapon/ranged/magic

	var/cost_mana = 0
	var/cooldown = 60 //In deciseconds. Only used for artifacts.

	var/current_cooldown = 0

	automatic = FALSE

	dan_mode = FALSE

	use_iff_tag = FALSE
	use_loyalty_tag = TRUE
	firing_pin = null

	var/obj/item/powergem/stored_powergem

	inaccuracy_modifier = 0.5
	movement_inaccuracy_modifier = 0.5
	movement_spread_base = 0.05

	company_type = "Wizard Federation"

/obj/item/weapon/ranged/magic/PreDestroy()
	QDEL_NULL(stored_powergem)
	. = ..()


/obj/item/weapon/ranged/magic/get_examine_list(var/mob/examiner)

	. = ..()

	if(stored_powergem)
		. += div("notice","宝石槽中装有[stored_powergem.name]。")
	else
		. += div("notice","宝石槽为空。")


/obj/item/weapon/ranged/magic/clicked_on_by_object(var/mob/activator,var/atom/object,location,control,params)

	if(is_item(object))
		var/obj/item/I = object
		if(I.flags_tool & FLAG_TOOL_CROWBAR)
			if(stored_powergem)
				activator.to_chat(span("notice","你从[src.name]中取出了[stored_powergem.name]。"))
				stored_powergem.drop_item(get_turf(activator))
				if(is_advanced(activator))
					var/mob/living/advanced/A = activator
					A.put_in_hands(stored_powergem,params,silent=TRUE)
				stored_powergem = null
			else
				activator.to_chat(span("warning","[src.name]里没有可取出的东西！"))
			return TRUE
		if(istype(object,/obj/item/powergem/))
			INTERACT_CHECK
			INTERACT_CHECK_OBJECT
			if(stored_powergem)
				activator.to_chat(span("warning","已经装有[stored_powergem.name]！"))
				return TRUE
			var/list/powergem_choices = list("是"="Yes","否"="No","取消"="Cancel")
			var/desired_input = input("确定要将[object.name]装入[src.name]吗？可用撬棍取出已安装的宝石。","安装能量宝石","取消") as null|anything in powergem_choices
			if(powergem_choices[desired_input] == "Yes")
				INTERACT_CHECK
				INTERACT_CHECK_OBJECT
				var/obj/item/powergem/P = object
				P.drop_item(src)
				stored_powergem = P
				activator.to_chat(span("notice","你将[P.name]装入了[src.name]。"))
			return TRUE

	return ..()


/obj/item/weapon/ranged/magic/save_item_data(var/mob/living/advanced/player/P,var/save_inventory = TRUE,var/died=FALSE,var/loadout=FALSE)
	RUN_PARENT_SAFE
	SAVEATOM("stored_powergem")

/obj/item/weapon/ranged/magic/load_item_data_pre(var/mob/living/advanced/player/P,var/list/object_data,var/loadout=FALSE)
	RUN_PARENT_SAFE
	LOADATOM("stored_powergem")

/obj/item/weapon/ranged/magic/get_static_spread()
	return 0

/obj/item/weapon/ranged/magic/get_skill_spread(var/mob/living/L)
	return 0.05 - (0.1 * L.get_skill_power(SKILL_MAGIC))

/obj/item/weapon/ranged/magic/get_base_spread()
	return 0.02
