/obj/item/container/edible/fishing
	name = "鱼"
	desc = "早啊！！要真是个美好的早晨，我现在就该在钓鱼。"
	desc_extended = "新鲜的渔获。"
	icon = 'icons/obj/item/consumable/food/fish.dmi'
	icon_state = "fish"
	value = 100
	health = /health/obj/item/misc/
	scale_sprite = FALSE

/obj/item/container/edible/fishing/can_be_attacked(var/atom/attacker,var/atom/weapon,var/params,var/damagetype/damage_type)
	return TRUE

/obj/item/container/edible/fishing/on_damage_received(var/atom/atom_damaged,var/atom/attacker,var/atom/weapon,var/damagetype/DT,var/list/damage_table,var/damage_amount,var/critical_hit_multiplier,var/stealthy=FALSE)

	if( (damage_table[BLADE] && !damage_table[BLUNT]) || damage_table[BLADE] > damage_table[BLUNT]) //Cut
		var/original_volume = reagents.volume_current
		var/turf/T = get_turf(src)
		var/obj/item/container/edible/dynamic/fish/S = new(T)
		INITIALIZE(S)
		if(S.reagents) src.reagents.transfer_reagents_to(S.reagents,original_volume)
		FINALIZE(S)
		animate(S,pixel_x=rand(-8,8),pixel_y=rand(-8,8),time=5)
		attacker.visible_message(span("notice","[attacker.name]处理好了[src.name]。"),span("notice","你处理好了[src.name]。"))
		if(icon_state == "goldfish")
			var/obj/item/currency/telecrystals/C = new(get_turf(src))
			FINALIZE(C)
		qdel(src)

	return ..()

/obj/item/container/edible/fishing/generic
	name = "酷鱼"
	icon_state = "fish"

/obj/item/container/edible/fishing/generic/Generate()
	reagents.add_reagent(/reagent/nutrition/meat/fish/quality,10)
	reagents.add_reagent(/reagent/nutrition/fat/fish,5)
	return ..()

/obj/item/container/edible/fishing/salmon
	name = "鲑鱼"
	icon_state = "salmon"

/obj/item/container/edible/fishing/salmon/Generate()
	reagents.add_reagent(/reagent/nutrition/meat/fish/quality,15)
	reagents.add_reagent(/reagent/nutrition/fat/fish,5)
	return ..()

/obj/item/container/edible/fishing/catfish
	name = "鲶鱼"
	icon_state = "catfish"

/obj/item/container/edible/fishing/catfish/Generate()
	reagents.add_reagent(/reagent/nutrition/meat/fish/quality,20)
	reagents.add_reagent(/reagent/nutrition/fat/fish,10)
	return ..()

/obj/item/container/edible/fishing/babycarp
	name = "鲤鱼苗"
	icon_state = "babycarp"

/obj/item/container/edible/fishing/babycarp/Generate()
	reagents.add_reagent(/reagent/nutrition/fat/fish,5)
	reagents.add_reagent(/reagent/medicine/health_potion,5)
	return ..()

/obj/item/container/edible/fishing/clownfish
	name = "小丑鱼"
	icon_state = "clownfish"

/obj/item/container/edible/fishing/clownfish/Generate()
	reagents.add_reagent(/reagent/drug/space,5)
	reagents.add_reagent(/reagent/drug/dust,5)
	reagents.add_reagent(/reagent/nutrition/fat/fish,10)
	return ..()

/obj/item/container/edible/fishing/eel
	name = "鳗鱼"
	icon_state = "electric_eel"

/obj/item/container/edible/fishing/eel/Generate()
	reagents.add_reagent(/reagent/nutrition/meat/fish/quality,10)
	reagents.add_reagent(/reagent/medicine/stamina_potion,5)
	reagents.add_reagent(/reagent/radioactive/radium,5)
	return ..()

/obj/item/container/edible/fishing/glofish
	name = "荧光鱼"
	icon_state = "glofish"

/obj/item/container/edible/fishing/glofish/Generate()
	reagents.add_reagent(/reagent/nutrition/meat/fish/quality,10)
	reagents.add_reagent(/reagent/medicine/mana_potion,5)
	reagents.add_reagent(/reagent/radioactive/,5)
	return ..()

/obj/item/container/edible/fishing/goldfish
	name = "金鱼"
	icon_state = "goldfish"

/obj/item/container/edible/fishing/goldfish/Generate()
	reagents.add_reagent(/reagent/nutrition/meat/fish/quality,10)
	reagents.add_reagent(/reagent/nutrition/fat/fish,5)
	return ..()

/obj/item/container/edible/fishing/shark
	name = "鲨鱼"
	desc = "什么玩意？"
	icon_state = "shark"

/obj/item/container/edible/fishing/shark/Generate()
	reagents.add_reagent(/reagent/nutrition/meat/fish/quality,15)
	reagents.add_reagent(/reagent/nutrition/fat/fish,10)
	return ..()
