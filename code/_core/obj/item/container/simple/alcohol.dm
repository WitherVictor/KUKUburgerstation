/obj/item/container/simple/alcohol/
	icon = 'icons/obj/item/container/alcohol.dmi'
	reagents = /reagent_container/beaker/large
	size = SIZE_2

	allow_reagent_transfer_to = TRUE
	allow_reagent_transfer_from = TRUE

/obj/item/container/simple/alcohol/fernet
	name = "意大利菲奈特苦酒"
	icon_state = "fernet"
	initial_reagent = /reagent/nutrition/ethanol/fernet
	value = 0

/obj/item/container/simple/alcohol/beer
	name = "太空啤酒"
	icon_state = "beer"
	reagents = /reagent_container/beaker
	initial_reagent = /reagent/nutrition/ethanol/beer
	value = 0

/obj/item/container/simple/alcohol/ale
	name = "乌瑞斯特艾尔啤酒"
	icon_state = "ale"
	reagents = /reagent_container/beaker
	initial_reagent = /reagent/nutrition/ethanol/ale
	value = 0

/obj/item/container/simple/alcohol/cider
	name = "工具箱烈性苹果酒"
	icon_state = "cider"
	reagents = /reagent_container/beaker
	initial_reagent = /reagent/nutrition/ethanol/cider
	value = 0

/obj/item/container/simple/alcohol/rum
	name = "皮特船长香料朗姆酒"
	icon_state = "rum"
	initial_reagent = /reagent/nutrition/ethanol/rum
	value = 0

/obj/item/container/simple/alcohol/whiskey
	name = "吉特叔叔特藏威士忌"
	icon_state = "whiskey"
	initial_reagent = /reagent/nutrition/ethanol/whiskey
	value = 0

/obj/item/container/simple/alcohol/vodka
	name = "弗拉基米尔伏特加"
	icon_state = "vodka"
	initial_reagent = /reagent/nutrition/ethanol/vodka
	value = 0

/obj/item/container/simple/alcohol/vodka/premium
	name = "巴德明卡伏特加"
	icon_state = "badminka"
	initial_reagent = /reagent/nutrition/ethanol/vodka/premium
	value = 0

	rarity = RARITY_RARE

/obj/item/container/simple/alcohol/gin
	name = "吞狮鹫金酒"
	icon_state = "gin"
	initial_reagent = /reagent/nutrition/ethanol/gin
	value = 0

/obj/item/container/simple/alcohol/brandy
	name = "胡迪与安迪白兰地"
	icon_state = "brandy"
	initial_reagent = /reagent/nutrition/ethanol/brandy
	value = 0

/obj/item/container/simple/alcohol/schnapps/gold
	name = "金光闪闪金箔烈酒"
	icon_state = "schnapps_gold"
	initial_reagent = /reagent/nutrition/ethanol/schnapps/gold
	value = 0

	rarity = RARITY_RARE

/obj/item/container/simple/alcohol/nothing
	name = "虚无"
	icon_state = "nothing"
	initial_reagent = /reagent/nutrition/ethanol/nothing
	value = 0

	rarity = RARITY_RARE

/obj/item/container/simple/alcohol/coffee_liqueur
	name = "硬派咖啡利口酒"
	icon_state = "coffee_liqueur"
	value = 0
	initial_reagent = null

/obj/item/container/simple/alcohol/coffee_liqueur/Generate()
	reagents.add_reagent(/reagent/nutrition/ethanol/coffee_liqueur,reagents.volume_max*0.5)
	reagents.add_reagent(/reagent/nutrition/energy/coffee,reagents.volume_max*0.5)
	return ..()

/obj/item/container/simple/alcohol/tequila
	name = "太空虫龙舌兰酒"
	icon_state = "tequila"
	initial_reagent = /reagent/nutrition/ethanol/tequila
	value = 0

/obj/item/container/simple/alcohol/tequila/premium
	name = "星辰高级龙舌兰酒"
	icon_state = "tequila_premium"
	initial_reagent = /reagent/nutrition/ethanol/tequila/premium
	value = 0

	rarity = RARITY_RARE

/obj/item/container/simple/alcohol/wine
	name = "双胡子红葡萄酒"
	icon_state = "wine"
	initial_reagent = /reagent/nutrition/ethanol/wine
	value = 0

/obj/item/container/simple/alcohol/wine/vermouth
	name = "伯尼·桑德斯味美思"
	icon_state = "vermouth"
	initial_reagent = /reagent/nutrition/ethanol/wine/vermouth
	value = 0

/obj/item/container/simple/alcohol/wine/lizard
	name = "蜥蜴酒"
	icon_state = "lizardwine"
	initial_reagent = /reagent/nutrition/ethanol/wine/lizard
	value = 0

	rarity = RARITY_RARE

/obj/item/container/simple/alcohol/hearty_punch
	name = "暖心潘趣酒"
	icon_state = "hearty_punch"
	initial_reagent = /reagent/nutrition/ethanol/hearty_punch
	value = 0

	rarity = RARITY_RARE

/obj/item/container/simple/alcohol/absinthe
	name = "苦艾酒"
	icon_state = "absinthe"
	initial_reagent = /reagent/nutrition/ethanol/absinthe
	value = 0

/obj/item/container/simple/alcohol/absinthe/New(var/desired_loc)

	var/list/possible_names = list(
		"\[已屏蔽]烈苦艾酒",
		"超烈苦艾酒",
		"猛得离谱苦艾酒"
	)

	name = pick(possible_names)

	return ..()

/obj/item/container/simple/alcohol/absinthe/premium
	name = "黄肝高级苦艾酒"
	icon_state = "absinthepremium"
	initial_reagent = /reagent/nutrition/ethanol/absinthe/premium
	value = 0

	rarity = RARITY_RARE

/obj/item/container/simple/alcohol/grappa
	name = "爷爷的格拉帕果渣白兰地"
	icon_state = "grappa"
	initial_reagent = /reagent/nutrition/ethanol/grappa
	value = 0

/obj/item/container/simple/alcohol/ethanol
	name = "折扣丹纯乙醇"
	icon_state = "ethanol"
	initial_reagent = /reagent/nutrition/ethanol
	value = 0
