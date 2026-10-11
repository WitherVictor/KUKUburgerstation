/obj/item/fishing/tacklebox
	name = "渔具箱"
	desc = "又回到了秘密钓点。"
	desc_extended = "能装下许多渔具的箱子，比如浮漂和鱼饵。"
	icon = 'icons/obj/item/fishing/tackle.dmi'
	color = "#808080"

	size = SIZE_3
	weight = 4

	is_container = TRUE
	container_max_size = SIZE_2
	dynamic_inventory_count = 16

	container_whitelist = list(
		/obj/item/fishing/line/,
		/obj/item/fishing/lure/,
		/obj/item/fishing/bait/,
		/obj/item/fishing/rod/telescopic
	)

	value = 100

/obj/item/fishing/tacklebox/red
	color = "#DE5743"

/obj/item/fishing/tacklebox/green
	color = "#8DD99A"

/obj/item/fishing/tacklebox/blue
	color = "#7BCEDB"
