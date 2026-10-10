/reagent/nutrition/wheat_grain
	name = "小麦碎粒"
	desc = "磨碎的小麦。加工后可得到面粉。"
	color = "#AD9300"
	alpha = 255

	nutrition_fast_amount = 0
	nutrition_normal_amount = 4
	nutrition_quality_amount = 1

	flavor = "难吃的燕麦"

	processed_reagent = /reagent/nutrition/wheat_grain/flour

	liquid = -0.75

	flavor_strength = 4

	flags_flavor = FLAG_FLAVOR_GROSS | FLAG_FLAVOR_GRAIN

	particle_size = 0.8

/reagent/nutrition/wheat_grain/flour
	name = "全麦面粉"
	desc = "加工后用于烘焙的小麦粉。进一步加工可得到精制面粉。"
	color = "#A5771C"

	nutrition_fast_amount = 0
	nutrition_normal_amount = 2
	nutrition_quality_amount = 3

	flavor = "难吃又干燥的燕麦粉"

	processed_reagent = /reagent/nutrition/wheat_grain/flour/processed

	liquid = -0.75

	flavor_strength = 3

	flags_flavor = FLAG_FLAVOR_GROSS | FLAG_FLAVOR_GRAIN

	particle_size = 0.6

/reagent/nutrition/wheat_grain/flour/processed
	name = "精制面粉"
	desc = "经过精细加工、用于烘焙的白面粉。"
	color = "#FFF8ED"

	nutrition_fast_amount = 4
	nutrition_normal_amount = 1
	nutrition_quality_amount = 0

	flavor = "难吃又干燥的面粉"

	liquid = -0.75

	flavor_strength = 2

	flags_flavor = FLAG_FLAVOR_GROSS | FLAG_FLAVOR_GRAIN

	particle_size = 0.3

/reagent/nutrition/corn
	name = "生玉米粒"
	desc = "从玉米棒上剥下的玉米粒。加工后可得到玉米粉。"
	color = "#FCFC00"
	alpha = 255

	nutrition_fast_amount = 2
	nutrition_normal_amount = 3
	nutrition_quality_amount = 2


	flavor = "硬玉米"

	processed_reagent = /reagent/nutrition/corn_flour

	liquid = -0.75

	flavor_strength = 4

	flags_flavor = FLAG_FLAVOR_GRAIN

	particle_size = 0.9


/reagent/nutrition/corn_flour
	name = "玉米粉"
	desc = "也称玉米淀粉，是加工玉米得到的副产品之一。"
	color = "#E0AC33"

	nutrition_fast_amount = 5
	nutrition_normal_amount = 1
	nutrition_quality_amount = 0

	flavor = "玉米淀粉"

	liquid = -1

	flavor_strength = 4

	flags_flavor = FLAG_FLAVOR_GROSS | FLAG_FLAVOR_GRAIN

	particle_size = 0.25
