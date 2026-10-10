/obj/item/crafting_bench/smelter
	name = "便携熔炉"
	desc = "车里放个炉子，开车也能熔矿！"
	desc_extended = "熔炼矿石，并快速加热放入其中的物品。应急时也能用来做饭。"
	icon = 'icons/obj/item/ore.dmi'
	icon_state = "smelter"

	container_temperature = 800 - (T0C + 20)
	container_temperature_mod = 2

	inventories = list(
		/obj/hud/inventory/crafting/slotB1,
		/obj/hud/inventory/crafting/slotB2,
		/obj/hud/inventory/crafting/slotB3,

		/obj/hud/inventory/crafting/result
	)

	crafting_id = "smelter"

	crafting_type = "smelter"

	value = 25

	size = SIZE_4

	value_burgerbux = 1
