/reagent_recipe/food/
	category = "Food"
	results = list()

/reagent_recipe/food/dough/

	name = "麦粒面团"
	desc = "小麦面团！可以往里面添加试剂！"

	required_reagents = list(
		/reagent/nutrition/wheat_grain = 3,
		/reagent/nutrition/water = 2,
	)

	results = list(
		/reagent/nutrition/dough = 5
	)

	result = /obj/item/container/edible/dynamic/bread

/reagent_recipe/food/dough/flour

	name = "全麦面团"
	desc = "比普通面团更健康。"

	required_reagents = list(
		/reagent/nutrition/wheat_grain/flour = 3,
		/reagent/nutrition/water = 2,
	)

	results = list(
		/reagent/nutrition/dough/flour = 5
	)

	result = /obj/item/container/edible/dynamic/bread

/reagent_recipe/food/dough/flour/processed

	name = "精制面粉面团"
	desc = "面团。"

	required_reagents = list(
		/reagent/nutrition/wheat_grain/flour/processed = 3,
		/reagent/nutrition/water = 2,
	)

	results = list(
		/reagent/nutrition/dough/flour/processed = 5
	)

	result = /obj/item/container/edible/dynamic/bread

/reagent_recipe/food/dough/corn
	name = "玉米面团"
	desc = "用玉米粉制成的面团。"

	required_reagents = list(

		/reagent/nutrition/corn_flour = 3,
		/reagent/nutrition/water = 2,
	)

	results = list(
		/reagent/nutrition/dough/corn = 5
	)

	result = /obj/item/container/edible/dynamic/bread



/reagent_recipe/food/bread/

	name = "麦粒面包"
	desc = "用麦粒制成的面包，由面团烤制而成。"

	required_reagents = list(
		/reagent/nutrition/dough = 1
	)

	required_temperature_min = list(
		/reagent/nutrition/dough = 475
	)

	results = list(
		/reagent/nutrition/bread = 1
	)

/reagent_recipe/food/bread/flour

	name = "全麦面包"
	desc = "用全麦面粉制成的面包，由面团烤制而成。"

	required_reagents = list(
		/reagent/nutrition/dough/flour = 1
	)

	required_temperature_min = list(
		/reagent/nutrition/dough/flour = 475
	)

	results = list(
		/reagent/nutrition/bread/flour = 1
	)

/reagent_recipe/food/bread/flour/processed

	name = "白面包"
	desc = "用精制面粉制成的面包，由面团烤制而成。"

	required_reagents = list(
		/reagent/nutrition/dough/flour/processed = 1,
	)

	required_temperature_min = list(
		/reagent/nutrition/dough/flour/processed = 475
	)

	results = list(
		/reagent/nutrition/bread/flour/processed = 1
	)


/reagent_recipe/food/bread/corn

	name = "玉米面包"
	desc = "用玉米粉制成的面包，由面团烤制而成。"

	required_reagents = list(
		/reagent/nutrition/dough/corn = 1
	)

	required_temperature_min = list(
		/reagent/nutrition/dough/corn = 475
	)

	results = list(
		/reagent/nutrition/bread/corn = 1
	)

/reagent_recipe/food/cake_batter/

	name = "蛋糕面糊"
	desc = "蛋糕是个谎言。"

	required_reagents = list(
		/reagent/nutrition/wheat_grain/flour/processed = 15,
		/reagent/nutrition/sugar = 5,
		/reagent/nutrition/egg_white = 5,
		/reagent/nutrition/egg_yellow = 5,
	)

	results = list(
		/reagent/nutrition/cake_batter = 30
	)

	result = /obj/item/container/edible/dynamic/cake

/reagent_recipe/food/icing_sugar
	name = "糖粉"
	desc = "用来制作糖霜的糖粉，比奶油霜强。"

	required_reagents = list(
		/reagent/nutrition/corn_flour = 1,
		/reagent/nutrition/sugar = 1
	)

	results = list(
		/reagent/nutrition/sugar/icing = 1
	)

/reagent_recipe/food/icing
	name = "白色糖霜"
	desc = "用糖粉做的糖霜，有点奇怪。大概就是奶油霜吧，比较差的那种。"

	required_reagents = list(
		/reagent/nutrition/sugar/icing = 1,
		/reagent/nutrition/water = 1
	)

	results = list(
		/reagent/nutrition/icing = 1
	)
