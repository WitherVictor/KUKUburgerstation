/obj/item/diy_construction_kit
	name = "自助建造工具箱"
	desc = "这里需要一台补给器！"
	desc_extended = "通过放置框架，快速建造多种结构。还能存放不少材料。"
	icon = 'icons/obj/item/diy_construction_kit.dmi'

	is_container = TRUE
	container_whitelist = list(/obj/item/material/)
	size = SIZE_4
	dynamic_inventory_count = MAX_INVENTORY_X
	weight = 10
	can_rename = TRUE
	var/build_type = "grilles"
	value = 1000

/obj/item/diy_construction_kit/attack(atom/attacker, atom/victim, list/params, atom/blamed, ignore_distance, precise, damage_multiplier, damagetype/damage_type_override)
	return FALSE //no

/obj/item/diy_construction_kit/click_on_object(mob/activator, atom/object, location, control, params)
	if(!is_advanced(activator))
		activator.to_chat(span("notice","你还不具备建造所需的智能！"))
		return ..()
	if(!get_turf(object))
		activator.to_chat(span("notice","这里没有地面！"))
		return ..()
	var/mob/living/advanced/C = activator
	var/turf/simulated/floor/F = get_turf(object)
	if(C.intent == INTENT_DISARM)
		var/list/build_choices = list("格栅" = "grilles", "梁架／墙壁／门" = "girders/wall/door", "加固梁架／墙壁" = "reinforced girders/wall", "支撑网格／地板" = "lattices/floor", "机器框架" = "machine frame")
		var/build_choice = input(C,"请选择要建造的结构。","建造选择","格栅") as null|anything in build_choices
		if(!build_choice)
			return ..()
		build_type = build_choices[build_choice]
		C.to_chat(span("notice","你决定开始建造[build_choice]。"))
		return ..()
	var/other_hand
	if(istype(C.get_held_left(),/obj/item/diy_construction_kit))
		other_hand = BODY_HAND_RIGHT_HELD
	else
		other_hand = BODY_HAND_LEFT_HELD
	var/obj/item/I = C.inventories_by_id[other_hand].get_top_object()
	if(!I || !istype(I,/obj/item/material))
		for(var/obj/hud/slot in contents)
			var/obj/item/mayberod = slot.get_top_object()
			if(istype(mayberod,/obj/item/material/rod))
				var/obj/item/material/rod/foundrod = mayberod
				I = foundrod
				break
	if(!I)
		C.to_chat(span("notice","你的物品栏和工具箱中都没有棒材！"))
		return ..()
	var/obj/structure/interactive/construction/O
	switch(build_type)
		if("grilles")
			if(!F.can_construct_on(C,/obj/structure/interactive/construction/grille))
				return ..()
			if(!istype(I,/obj/item/material/rod))
				activator.to_chat(span("notice","建造格栅需要在另一只手或工具箱中准备2根棒材！"))
				return ..()
			var/obj/item/material/R = I
			if(R.amount < 2)
				C.to_chat(span("notice","棒材不足，无法建造格栅！"))
			O = new /obj/structure/interactive/construction/grille(F)
			O.color = R.color
			O.material_id = R.material_id
			INITIALIZE(O)
			GENERATE(O)
			FINALIZE(O)
			R.add_item_count(-2)
			C.visible_message(span("notice","[C.name]建造了[O.name]。"),span("notice","你建造了[O.name]。"))
			INTERACT_DELAY(2.5)
			return TRUE
		if("girders/wall/door")
			if(!F.can_construct_on(C,/obj/structure/interactive/construction/girder))
				return ..()
			if(!istype(I,/obj/item/material/rod))
				activator.to_chat(span("notice","建造梁架需要在另一只手或工具箱中准备1根棒材！"))
			var/obj/item/material/R = I
			if(R.amount < 1)
				C.to_chat(span("notice","棒材不足，无法建造梁架！"))
				return ..()
			O = new /obj/structure/interactive/construction/girder(F)
			O.color = R.color
			O.material_id = R.material_id
			INITIALIZE(O)
			GENERATE(O)
			FINALIZE(O)
			R.add_item_count(-1)
			C.visible_message(span("notice","[C.name]建造了[O.name]。"),span("notice","你建造了[O.name]。"))
			INTERACT_DELAY(2.5)
			return TRUE
		if("reinforced girders/wall")
			if(!F.can_construct_on(C,/obj/structure/interactive/construction/reinf_girder))
				return ..()
			if(!istype(I,/obj/item/material/rod))
				activator.to_chat(span("notice","建造加固梁架需要在另一只手或工具箱中准备2根棒材！"))
			var/obj/item/material/R = I
			if(R.amount < 2)
				C.to_chat(span("notice","棒材不足，无法建造加固梁架！"))
				return ..()
			O = new /obj/structure/interactive/construction/reinf_girder(F)
			O.color = R.color
			O.material_id = R.material_id
			INITIALIZE(O)
			GENERATE(O)
			FINALIZE(O)
			R.add_item_count(-2)
			C.visible_message(span("notice","[C.name]建造了[O.name]。"),span("notice","你建造了[O.name]。"))
			INTERACT_DELAY(2.5)
			return TRUE
		if("lattices/floor")
			if(!F.can_construct_on(C,/obj/structure/interactive/construction/lattice))
				return ..()
			if(!istype(I,/obj/item/material/rod))
				activator.to_chat(span("notice","建造支撑网格需要在另一只手或工具箱中准备1根棒材！"))
			var/obj/item/material/R = I
			if(R.amount < 1)
				C.to_chat(span("notice","棒材不足，无法建造支撑网格！"))
				return ..()
			O = new /obj/structure/interactive/construction/lattice(F)
			O.color = R.color
			O.material_id = R.material_id
			INITIALIZE(O)
			GENERATE(O)
			FINALIZE(O)
			R.add_item_count(-1)
			C.visible_message(span("notice","[C.name]建造了[O.name]。"),span("notice","你建造了[O.name]。"))
			INTERACT_DELAY(2.5)
			return TRUE
		if("machine frame")
			if(!F.can_construct_on(C,/obj/structure/interactive/construction/machine_frame))
				return ..()
			if(!istype(I,/obj/item/material/rod))
				activator.to_chat(span("notice","建造机器框架需要在另一只手或工具箱中准备1根棒材！"))
				return ..()
			var/obj/item/material/R = I
			if(R.amount < 1)
				C.to_chat(span("notice","棒材不足，无法建造机器框架！"))
			O = new /obj/structure/interactive/construction/machine_frame(F)
			O.color = R.color
			O.material_id = R.material_id
			INITIALIZE(O)
			GENERATE(O)
			FINALIZE(O)
			R.add_item_count(-1)
			C.visible_message(span("notice","[C.name]建造了[O.name]。"),span("notice","你建造了[O.name]。"))
			INTERACT_DELAY(2.5)
			return TRUE
	. = ..()
