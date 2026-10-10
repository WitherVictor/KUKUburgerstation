//Dough
/reagent/nutrition/dough
	name = "麦粒面团"
	desc = "粗略搅拌制成的小麦面团。"
	color = "#AA9970"

	nutrition_fast_amount = 3
	nutrition_normal_amount = 4
	nutrition_quality_amount = 1

	flavor = "带燕麦味的生面团"

	liquid = 0.25
	particle_size = 1

	flags_reagent = FLAG_REAGENT_RAW

	heated_reagent = /reagent/nutrition/bread
	heated_reagent_temp = 370
	heated_reagent_amount = 1
	heated_reagent_mul = 0.02

	flavor_strength = 4

	flags_flavor = FLAG_FLAVOR_GROSS | FLAG_FLAVOR_GRAIN | FLAG_FLAVOR_RAW

/reagent/nutrition/dough/flour
	name = "全麦面团"
	desc = "用全麦面粉与水制成的普通面团。"
	color = "#D8BD6C"

	nutrition_fast_amount = 3
	nutrition_normal_amount = 2
	nutrition_quality_amount = 3

	flavor = "带燕麦味的生面团"

	liquid = 0.25

	heated_reagent = /reagent/nutrition/bread/flour

	flavor_strength = 3

/reagent/nutrition/dough/flour/processed
	name = "精制面粉面团"
	desc = "用精制面粉与水制成的普通面团。"
	color = "#E5D4A2"

	nutrition_fast_amount = 7
	nutrition_normal_amount = 1
	nutrition_quality_amount = 0

	flavor = "生面团"

	liquid = 0.25

	heated_reagent = /reagent/nutrition/bread/flour/processed

	flavor_strength = 2

/reagent/nutrition/dough/corn
	name = "玉米面团"
	desc = "看似健康，实际却并不健康的面团。"
	color = "#eccf78"

	nutrition_fast_amount = 6
	nutrition_normal_amount = 2
	nutrition_quality_amount = 0

	flavor = "生面团"

	liquid = 0.25

	heated_reagent = /reagent/nutrition/bread/corn

	flavor_strength = 2

//Bread
/reagent/nutrition/bread
	name = "麦粒面包"
	desc = "粗略搅拌制成的小麦面包。"
	color = "#A09170"

	nutrition_fast_amount = 3
	nutrition_normal_amount = 4
	nutrition_quality_amount = 1

	flavor = "硬面包"

	liquid = -0.25

	flags_reagent = FLAG_REAGENT_COOKED

	heated_reagent_temp = 370
	heated_reagent_mul = 0.003

	flavor_strength = 1

	flags_flavor = FLAG_FLAVOR_GRAIN | FLAG_FLAVOR_LOVE

/reagent/nutrition/bread/flour
	name = "全麦面包"
	desc = "用全麦面粉与水制成的普通面包。"
	color = "#A8784D"

	nutrition_fast_amount = 3
	nutrition_normal_amount = 1
	nutrition_quality_amount = 4

	flavor = "全麦面包"

	liquid = -0.25

	flavor_strength = 0.5

/reagent/nutrition/bread/flour/processed
	name = "白面包"
	desc = "用面粉与水制成的普通面包。"
	color = "#E0AC33"

	nutrition_fast_amount = 7
	nutrition_normal_amount = 1
	nutrition_quality_amount = 0

	flavor = "白面包"

	liquid = -0.25

	flavor_strength = 0.25

/reagent/nutrition/bread/corn
	name = "玉米面包"
	desc = "和鸡肉是绝配。"
	color = "#eccf78"

	nutrition_fast_amount = 6
	nutrition_normal_amount = 2
	nutrition_quality_amount = 0

	flavor = "白面包"

	liquid = -0.25

	flavor_strength = 0.3
//Cake
/reagent/nutrition/cake_batter
	name = "蛋糕面糊"
	desc = "普通的蛋糕面糊。"
	color = "#DDBE8F"

	nutrition_fast_amount = 8
	nutrition_normal_amount = 1
	nutrition_quality_amount = 1

	flavor = "生面团"

	liquid = 0.25

	flags_reagent = FLAG_REAGENT_RAW

	heated_reagent = /reagent/nutrition/cake
	heated_reagent_temp = 370
	heated_reagent_amount = 0.03
	heated_reagent_mul = 0.05

	flags_flavor = FLAG_FLAVOR_GRAIN | FLAG_FLAVOR_RAW

/reagent/nutrition/cake
	name = "蛋糕"
	desc = "烤熟的蛋糕。"
	color = "#BC9253"

	nutrition_fast_amount = 8
	nutrition_normal_amount = 1
	nutrition_quality_amount = 1

	flavor = "蛋糕"

	flags_flavor = FLAG_FLAVOR_GRAIN | FLAG_FLAVOR_LOVE

	liquid = -0.125

	flags_reagent = FLAG_REAGENT_COOKED

