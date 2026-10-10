/reagent_recipe/drink
    name = "饮料配方"
    desc = "一种饮料的配方。"
    category = "drinks"
    results = list()

/reagent_recipe/drink/hearty_punch
    name = "暖心潘趣酒"
    desc = "坚忍的玩家有福了。"
    category = "drinks"

    required_reagents = list(
		/reagent/nutrition/ethanol = 2,
		/reagent/medicine/health_potion = 1,
		/reagent/nutrition/sugar  = 1
	)

    results = list(
        /reagent/nutrition/ethanol/hearty_punch = 3
    )



