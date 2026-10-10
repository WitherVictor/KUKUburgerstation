/obj/item/crafting_bench/pill_press
	name = "便携压片机"
	icon = 'icons/obj/item/ore.dmi'
	icon_state = "pill_press"
	desc = "一台压片机。"
	desc_extended = "将试剂容器中的试剂制成药片。"

	inventories = list(

		/obj/hud/inventory/crafting/slotB1,
		/obj/hud/inventory/crafting/slotB3,

		/obj/hud/inventory/crafting/result
	)

	crafting_id = "pill_press"

	crafting_type = null //This actually doesn't make anything.

	value = 40

	size = SIZE_4

	value_burgerbux = 1

/obj/item/crafting_bench/pill_press/attempt_to_craft(var/mob/living/advanced/activator)

	var/obj/hud/inventory/crafting/result/product_slot
	var/obj/item/product_container

	for(var/obj/hud/inventory/crafting/result/R in src.inventories)
		var/obj/item/I = R.get_top_object()
		if(I)
			if(I.is_container)
				product_container = I
			else
				activator.to_chat(span("warning","请先取出成品槽中已经完成的物品！"))
				return FALSE
		else
			product_slot = R

	var/list/item_table = generate_crafting_table(activator,src)

	if(!item_table["b1"] || !item_table["b1"].allow_reagent_transfer_from || !item_table["b1"].reagents)
		activator.to_chat(span("warning","制作药片需要在最左侧槽位放入可用的试剂容器！"))
		return FALSE

	if(item_table["b3"] && (!item_table["b3"].allow_reagent_transfer_from || !item_table["b3"].reagents)) //Yes, this needs to be an && operation. I got confused too.
		activator.to_chat(span("warning","制作双料药片需要在最右侧槽位放入可用的试剂容器！"))
		return FALSE

	var/obj/item/container/simple/beaker/I1 = item_table["b1"]
	var/obj/item/container/simple/beaker/I2 = item_table["b3"]

	if(I1 && (!I1.reagents || !I1.reagents.volume_current))
		activator.to_chat(span("warning","左侧槽位的容器中没有可用于制作药片的材料！"))
		return FALSE

	if(I2 && (!I2.reagents || !I2.reagents.volume_current))
		activator.to_chat(span("warning","右侧槽位的容器中没有可用于制作双料药片的材料！"))
		return FALSE

	var/obj/item/container/edible/pill/P = new(get_turf(src))
	INITIALIZE(P)
	GENERATE(P)

	I1.reagents.transfer_reagents_to(P.reagents,I1.transfer_amount, activator = activator)
	if(I2) I2.reagents.transfer_reagents_to(P.reagents,I2.transfer_amount, activator = activator)

	FINALIZE(P)

	if(product_container)
		product_container.add_object_to_src_inventory(activator,P,TRUE)
	else
		product_slot.add_object(P)



	return TRUE




