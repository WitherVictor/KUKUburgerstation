/obj/item/fishing/line
	name = "鱼线"
	icon = 'icons/obj/item/fishing/line.dmi'
	drop_sound = 'sound/items/drop/scrap.ogg'
	size = SIZE_0
	weight = 0.5
	var/lavaproof = FALSE
	var/break_on_failure = 0
	var/break_on_success = 0
	color = "#FFFFFF"

/obj/item/fishing/line/t1
	name = "基础鱼线"
	desc = "没错，最基础的线。"
	desc_extended = "非常脆弱的基础鱼线，一信用点商店就能买到。真的很脆弱。"
	value = 40
	break_on_failure = 20
	break_on_success = 10
	color = "#7F3300"

	rarity = RARITY_COMMON

/obj/item/fishing/line/t2
	name = "商业级鱼线"
	desc = "适合认真的钓鱼人。"
	desc_extended = "名牌鱼线，还算可靠，不会经常断。"
	value = 250
	break_on_failure = 8
	break_on_success = 4
	color = "#C0C0C0"

	rarity = RARITY_COMMON

/obj/item/fishing/line/t3
	name = "高耐久鱼线"
	desc = "极限钓鱼专用。"
	desc_extended = "结实的鱼线。保证不会断，除非你钓鱼太菜。"
	value = 1000
	break_on_failure = 5
	break_on_success = 0
	color = "#404040"

	rarity = RARITY_UNCOMMON

/obj/item/fishing/line/t4
	name = "结实的“鱼线”"
	desc = "灰潮赞助。"
	desc_extended = "极其结实的鱼线，绝对不会断。"
	value = 2000
	icon = 'icons/obj/item/cable.dmi'
	color = "#FF0000"

	rarity = RARITY_RARE

/obj/item/fishing/line/t5
	name = "耐岩浆鱼线"
	desc = "可没《泰拉瑞亚》里那么难找！"
	desc_extended = "稀有、结实的耐岩浆鱼线，可在岩浆中钓鱼，而且不会断。"
	value = 4000
	color = "#FF6A00"
	lavaproof = TRUE

	rarity = RARITY_MYTHICAL
