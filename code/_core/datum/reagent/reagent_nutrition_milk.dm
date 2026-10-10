//Milk
/reagent/nutrition/milk/
	name = "牛奶"
	desc = "牛奶提供的营养与风味。"
	color = "#FFFFFF"
	alpha = 255

	nutrition_fast_amount = 2
	nutrition_normal_amount = 4
	nutrition_quality_amount = 2
	hydration_amount = 4


	flavor = "牛奶"

	liquid = 0.5

	flags_flavor = FLAG_FLAVOR_DAIRY

	particle_size = 0.2

/reagent/nutrition/cream
	name = "奶油"
	desc = "奶油提供的营养与风味。"
	color = "#EEEED9"

	nutrition_fast_amount = 10
	nutrition_normal_amount = 5
	nutrition_quality_amount = 0

	hydration_amount = 3

	flavor = "奶油"

	liquid = 0.5

	processed_reagent = /reagent/nutrition/butter

	particle_size = 0.3

//Cheese
/reagent/nutrition/cheese/
	name = "加工奶酪"
	desc = "加工奶酪提供的营养与风味。"
	color = "#FFC237"

	nutrition_fast_amount = 20
	nutrition_normal_amount = 0
	nutrition_quality_amount = 0

	flavor = "加工奶酪"

	liquid = 0.2

	flavor_strength = 3

	flags_flavor = FLAG_FLAVOR_DAIRY | FLAG_FLAVOR_FAT

	particle_size = 0.8

/reagent/nutrition/cheese/kadchgall
	name = "卡奇格尔沙漠奶酪"
	desc = "卡奇格尔奶酪提供的营养与风味。"
	color = "#FFE8AA"

	nutrition_fast_amount = 5
	nutrition_normal_amount = 10
	nutrition_quality_amount = 10

	flavor = "加工奶酪"

	liquid = 0.2

	flags_flavor = FLAG_FLAVOR_DAIRY | FLAG_FLAVOR_LOVE | FLAG_FLAVOR_FAT

/reagent/nutrition/cheese/cheddar
	name = "切达奶酪"
	desc = "切达奶酪提供的营养与风味。"
	color = "#FF9F00"

	nutrition_fast_amount = 10
	nutrition_normal_amount = 5
	nutrition_quality_amount = 10

	flavor = "浓郁的切达奶酪"

	liquid = 0.2

	flags_flavor = FLAG_FLAVOR_DAIRY | FLAG_FLAVOR_LOVE | FLAG_FLAVOR_FAT


/reagent/nutrition/cheese/brabander
	name = "陈年布拉班德丛林奶酪"
	desc = "陈年布拉班德丛林奶酪提供的营养与风味。"
	color = "#FFFCE8"

	nutrition_fast_amount = 5
	nutrition_normal_amount = 5
	nutrition_quality_amount = 15


	flavor = "香甜顺滑的焦糖奶酪"

	liquid = 0.2

	flags_flavor = FLAG_FLAVOR_DAIRY | FLAG_FLAVOR_LOVE | FLAG_FLAVOR_FAT



/reagent/nutrition/cheese/raclette
	name = "阿尔卑斯拉克莱特奶酪"
	desc = "阿尔卑斯拉克莱特奶酪提供的营养与风味。"
	color = "#FFF09F"

	nutrition_fast_amount = 5
	nutrition_normal_amount = 0
	nutrition_quality_amount = 20

	flavor = "带坚果香的甜奶酪"

	liquid = 0.2

	flags_flavor = FLAG_FLAVOR_DAIRY | FLAG_FLAVOR_LOVE | FLAG_FLAVOR_FAT


/reagent/nutrition/cheese/gruyere
	name = "洞穴熟成格鲁耶尔奶酪"
	desc = "洞穴熟成格鲁耶尔奶酪提供的营养与风味。"
	color = "#E4A300"

	nutrition_fast_amount = 5
	nutrition_normal_amount = 10
	nutrition_quality_amount = 10

	flavor = "咸甜交织、带坚果香的奶油奶酪"

	liquid = 0.2

	flags_flavor = FLAG_FLAVOR_DAIRY | FLAG_FLAVOR_LOVE | FLAG_FLAVOR_FAT


/reagent/nutrition/cheese/guava
	name = "烟熏番石榴奶酪"
	desc = "烟熏番石榴奶酪提供的营养与风味。"
	color = "#704226"

	nutrition_fast_amount = 5
	nutrition_normal_amount = 5
	nutrition_quality_amount = 15

	flavor = "香甜的软糖奶酪"

	liquid = 0.2

	flags_flavor = FLAG_FLAVOR_DAIRY | FLAG_FLAVOR_LOVE | FLAG_FLAVOR_FAT


/reagent/nutrition/cheese/bluespace
	name = "蓝空间奶酪"
	desc = "蓝空间奶酪提供的营养与风味。"
	color = "#78A093"

	nutrition_fast_amount = 20
	nutrition_normal_amount = 0
	nutrition_quality_amount = 5

	flavor = "蓝空间奶酪"

	liquid = 0.2

	flags_flavor = FLAG_FLAVOR_DAIRY | FLAG_FLAVOR_LOVE | FLAG_FLAVOR_FAT


/reagent/nutrition/cheese/oasis
	name = "格拉丁绿洲奶酪"
	desc = "格拉丁绿洲奶酪提供的营养与风味。"
	color = "#3D62C3"

	nutrition_fast_amount = 10
	nutrition_normal_amount = 10
	nutrition_quality_amount = 5

	hydration_amount = 5

	flavor = "湿漉漉的咸奶酪"

	liquid = 0.2

	flags_flavor = FLAG_FLAVOR_DAIRY | FLAG_FLAVOR_LOVE | FLAG_FLAVOR_FAT

/reagent/nutrition/cheese/blackash
	name = "黑灰奶酪"
	desc = "黑灰奶酪提供的营养与风味。"
	color = "#3f3f3f"

	nutrition_fast_amount = 0
	nutrition_normal_amount = 25
	nutrition_quality_amount = 0

	flavor = "焦石与烟灰味的奶酪"

	liquid = 0.2

	flags_flavor = FLAG_FLAVOR_DAIRY | FLAG_FLAVOR_LOVE | FLAG_FLAVOR_FAT


/reagent/nutrition/butter
	name = "黄油"
	desc = "黄油提供的营养与风味。"
	color = "#FFD865"

	nutrition_fast_amount = 15
	nutrition_normal_amount = 10
	nutrition_quality_amount = 5

	flavor = "黄油"

	value = 2

	flags_flavor = FLAG_FLAVOR_LOVE | FLAG_FLAVOR_FAT
