/obj/item/container/edible/supermatter_cheese
	name = "超物质薄片"
	desc = "嗯，看着有点像一片奶酪……"
	desc_extended = "一片薄薄的超物质晶体。纳米传讯建议你不要食用。"

	icon = 'icons/obj/item/consumable/food/cheese.dmi'
	icon_state = "supermatter"

	allow_reagent_transfer_to = FALSE
	allow_reagent_transfer_from = FALSE

	value = 0

	value_burgerbux = 1

	rarity = RARITY_RARE

/obj/item/container/edible/supermatter_cheese/Generate()
	. = ..()
	reagents.add_reagent(/reagent/drug/supermatter,10)
	reagents.add_reagent(pick(SSreagent.valid_random_reagents),10)
