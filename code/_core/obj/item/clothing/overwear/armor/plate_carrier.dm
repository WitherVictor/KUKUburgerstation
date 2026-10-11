/obj/item/clothing/overwear/armor/plate_carrier
	name = "插板背心"
	desc = "当兵打仗的标准护甲。"
	desc_extended = "单独使用时防护有限，装入装甲板后才能充分发挥作用。按住Alt点击可拆卸装甲板。"
	icon = 'icons/obj/item/clothing/suit/plate_carrier.dmi'

	protected_limbs = list(BODY_TORSO)

	dyeable = TRUE

	armor = /armor/cloth/hard

	value = 50

	var/list/obj/item/armor_plate/installed_plate_carriers = list()

	size = SIZE_3

/obj/item/clothing/overwear/armor/plate_carrier/save_item_data(var/mob/living/advanced/player/P,var/save_inventory = TRUE,var/died=FALSE)
	. = ..()
	SAVELISTATOM("installed_plate_carriers")

/obj/item/clothing/overwear/armor/plate_carrier/load_item_data_pre(var/mob/living/advanced/player/P,var/list/object_data)
	. = ..()
	LOADLISTATOM("installed_plate_carriers")

/obj/item/clothing/overwear/armor/plate_carrier/get_defense_rating()

	. = ..()

	var/power_mul = length(installed_plate_carriers) > 1 ? 0.25 + ((1/length(installed_plate_carriers))*0.75) : 1

	for(var/k in installed_plate_carriers)
		var/obj/item/armor_plate/P = k
		for(var/damagetype in P.armor_base)
			.[damagetype] += P.armor_base[damagetype] > 0 ? P.armor_base[damagetype] * power_mul : P.armor_base[damagetype]


/obj/item/clothing/overwear/armor/plate_carrier/clicked_on_by_object(var/mob/caller,var/atom/object,location,control,params)

	if(istype(object,/obj/item/armor_plate/))
		INTERACT_CHECK
		INTERACT_CHECK_OBJECT
		INTERACT_DELAY(5)
		if(length(installed_plate_carriers) >= 2)
			if(ismob(caller))
				var/mob/M = caller
				M.to_chat(span("notice","[src.name]里装不下更多装甲板了！"))
			return TRUE
		var/obj/item/armor_plate/P = object
		P.drop_item(src)
		installed_plate_carriers += P
		if(is_advanced(caller))
			var/mob/living/advanced/A = caller
			A.update_items()
		return TRUE

	return ..()

/obj/item/clothing/overwear/armor/plate_carrier/click_self(var/mob/caller)

	if(is_advanced(caller) && length(installed_plate_carriers) && caller.attack_flags & CONTROL_MOD_DISARM)
		INTERACT_CHECK
		INTERACT_DELAY(1)
		var/mob/living/advanced/A = caller
		var/obj/item/armor_plate/P = input(A,"你想拆下哪块装甲板？","拆卸装甲板") as null|anything in installed_plate_carriers
		if(P && (P in installed_plate_carriers))
			A.visible_message(span("notice","[caller.name]从[src.name]中拆下了[P.name]。"),span("notice","你从[src.name]中拆下了[P.name]。"))
			P.drop_item(get_turf(src))
			installed_plate_carriers -= P
			A.put_in_hands(P) //This calls update_move_delay_multiplier
			//A.update_move_delay_multiplier()
		return TRUE

	return ..()

/obj/item/clothing/overwear/armor/plate_carrier/black
	color = COLOR_BLACK

/obj/item/clothing/overwear/armor/plate_carrier/pocket
	name = "战术插板背心"
	desc = "叉子、勺子和刀子也能装。"
	desc_extended = "带有储物袋的插板背心，需要装入装甲板才能充分发挥防护作用。可以携带多件物品。按住Alt点击可拆卸装甲板。"
	icon = 'icons/obj/item/clothing/suit/plate_carrier_pouched.dmi'

	dyeable = TRUE

	value = 70

	is_container = TRUE

	dynamic_inventory_count = 4
	container_max_size = SIZE_2

/obj/item/clothing/overwear/armor/plate_carrier/pocket/black
	color = COLOR_BLACK

/obj/item/clothing/overwear/armor/plate_carrier/pocket/black/medium/Generate()
	var/obj/item/armor_plate/medium/M = new(src)
	INITIALIZE(M)
	GENERATE(M)
	FINALIZE(M)
	installed_plate_carriers += M
	return ..()
