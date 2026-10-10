/reagent/nutrition/flavor //TODO: Give buffs.
	name = "鲜味"
	desc = "纯粹的鲜味。"
	color = "#EAD5A4"
	alpha = 255

	nutrition_fast_amount = 0
	nutrition_normal_amount = 0
	nutrition_quality_amount = 20

	flavor = "鲜味"
	flavor_strength = 10

	liquid = 0.3

	heal_amount = 10

	flags_reagent = FLAG_REAGENT_FAT

	flags_flavor = FLAG_FLAVOR_FAT | FLAG_FLAVOR_LOVE

	value = 2

	particle_size = 0.7

/reagent/nutrition/fat/
	name = "脂肪"
	desc = "脂肪提供的营养与风味。"
	color = "#EAD5A4"
	alpha = 255

	nutrition_fast_amount = 10
	nutrition_normal_amount = 5
	nutrition_quality_amount = 5

	flavor = "脂肪"

	liquid = 0.1

	flags_reagent = FLAG_REAGENT_FAT

	heated_reagent = /reagent/nutrition/flavor/
	heated_reagent_temp = 328
	heated_reagent_mul = 0.01

	flags_flavor = FLAG_FLAVOR_FAT

	particle_size = 0.8

/reagent/nutrition/fat/cow
	name = "牛脂肪"
	desc = "牛脂肪提供的营养与风味。"
	color = "#EAD5A4"

	nutrition_fast_amount = 10
	nutrition_normal_amount = 5
	nutrition_quality_amount = 5

	flavor = "脂肪"

/reagent/nutrition/fat/monkey
	name = "猴脂肪"
	desc = "猴脂肪提供的营养与风味。"
	color = "#EAD5A4"

	nutrition_fast_amount = 10
	nutrition_normal_amount = 5
	nutrition_quality_amount = 5

	flavor = "脂肪"

/reagent/nutrition/fat/bear
	name = "熊脂肪"
	desc = "熊脂肪提供的营养与风味。"
	color = "#EAD5A4"

	nutrition_fast_amount = 10
	nutrition_normal_amount = 5
	nutrition_quality_amount = 10

	flavor = "脂肪"

/reagent/nutrition/fat/chicken
	name = "鸡脂肪"
	desc = "鸡脂肪提供的营养与风味。"
	color = "#EAD5A4"

	nutrition_fast_amount = 15
	nutrition_normal_amount = 5
	nutrition_quality_amount = 0

	flavor = "脂肪"

/reagent/nutrition/fat/ancient
	name = "远古脂肪"
	desc = "远古脂肪提供的营养与风味。"
	color = "#BAAD8D"

	nutrition_fast_amount = 5
	nutrition_normal_amount = 5
	nutrition_quality_amount = 10

	flavor = "脂肪"

/reagent/nutrition/fat/penguin
	name = "企鹅脂肪"
	desc = "企鹅脂肪提供的营养与风味。"
	color = "#EAD5A4"

	nutrition_fast_amount = 10
	nutrition_normal_amount = 10
	nutrition_quality_amount = 0

	flavor = "脂肪"

/reagent/nutrition/fat/fish
	name = "鱼脂肪"
	desc = "鱼脂肪提供的营养与风味。"
	color = "#EAD5A4"

	nutrition_fast_amount = 5
	nutrition_normal_amount = 0
	nutrition_quality_amount = 15

	flavor = "脂肪"

/reagent/nutrition/fat/xeno
	name = "异形脂肪"
	desc = "异形脂肪提供的营养与风味。"
	color = "#EAD5A4"

	nutrition_fast_amount = 15
	nutrition_normal_amount = 0
	nutrition_quality_amount = 5

	flavor = "脂肪"

/reagent/nutrition/fat/crab
	name = "蟹脂肪"
	desc = "蟹脂肪提供的营养与风味。"
	color = "#EAD5A4"

	nutrition_fast_amount = 10
	nutrition_normal_amount = 10
	nutrition_quality_amount = 0
	flavor = "脂肪"

/reagent/nutrition/fat/lobster
	name = "龙虾脂肪"
	desc = "龙虾脂肪提供的营养与风味。"
	color = "#EAD5A4"

	nutrition_fast_amount = 5
	nutrition_normal_amount = 15
	nutrition_quality_amount = 0

	flavor = "脂肪"

/reagent/nutrition/fat/arachnid
	name = "蛛形生物脂肪"
	desc = "蛛形生物脂肪提供的营养与风味。"
	color = "#B2D5A4"

	nutrition_fast_amount = 10
	nutrition_normal_amount = 10
	nutrition_quality_amount = 0

	flavor = "脂肪"

/reagent/nutrition/fat/goliath
	name = "歌利亚脂肪"
	desc = "歌利亚脂肪提供的营养与风味。"
	color = "#EAD5A4"

	nutrition_fast_amount = 5
	nutrition_normal_amount = 10
	nutrition_quality_amount = 5

	flavor = "脂肪"



//Meat
/reagent/nutrition/meat/
	name = "神秘生肉"
	desc = "生肉提供的营养与风味。"
	color = "#EA4147"


	nutrition_fast_amount = 10
	nutrition_normal_amount = 10
	nutrition_quality_amount = 0

	heal_amount = 5

	flavor = "生肉"

	flags_flavor = FLAG_FLAVOR_MEAT | FLAG_FLAVOR_RAW

	liquid = 0.2

	flags_reagent = FLAG_REAGENT_RAW

	heated_reagent_temp = 335
	heated_reagent_mul = 0.01
	heated_reagent_amount = 1

	attribute_experience_per_nutrition = list(
		ATTRIBUTE_STRENGTH = 0.5
	)

/reagent/nutrition/meat/cooked
	name = "神秘熟肉"
	desc = "熟肉提供的营养与风味。"
	color = "#6B3731"

	flags_flavor = FLAG_FLAVOR_MEAT | FLAG_FLAVOR_COOKED

	flavor = "肉"

	flags_reagent = FLAG_REAGENT_COOKED
	heated_reagent = /reagent/carbon
	heated_reagent_mul = 0.01
	heated_reagent_amount = 0

/reagent/nutrition/meat/cow
	name = "生牛肉"
	desc = "生牛肉提供的营养与风味。"
	color = "#BF0000"

	nutrition_fast_amount = 5
	nutrition_normal_amount = 15
	nutrition_quality_amount = 0


	heal_amount = 5

	flavor = "生肉"

	heated_reagent = /reagent/nutrition/meat/cow/cooked

/reagent/nutrition/meat/cow/cooked
	name = "熟牛肉"
	desc = "熟牛肉提供的营养与风味。"
	color = "#6B3731"

	flags_flavor = FLAG_FLAVOR_MEAT | FLAG_FLAVOR_COOKED

	flavor = "牛肉"

	flags_reagent = FLAG_REAGENT_COOKED
	heated_reagent = /reagent/carbon
	heated_reagent_mul = 0.01
	heated_reagent_amount = 0


/reagent/nutrition/meat/monkey
	name = "生猴肉"
	desc = "生猴肉提供的营养与风味。"
	color = "#BF0000"

	nutrition_fast_amount = 5
	nutrition_normal_amount = 15
	nutrition_quality_amount = 0
	heal_amount = 5

	flavor = "味道冲鼻的生肉"

	heated_reagent = /reagent/nutrition/meat/monkey/cooked

/reagent/nutrition/meat/monkey/cooked
	name = "熟猴肉"
	desc = "熟猴肉提供的营养与风味。"
	color = "#6B3731"

	flags_flavor = FLAG_FLAVOR_MEAT | FLAG_FLAVOR_COOKED

	flavor = "味道冲鼻的牛肉"

	flags_reagent = FLAG_REAGENT_COOKED
	heated_reagent = /reagent/carbon
	heated_reagent_mul = 0.01
	heated_reagent_amount = 0

/reagent/nutrition/meat/chicken
	name = "生鸡肉"
	desc = "生鸡肉提供的营养与风味。"
	color = "#E2A5BB"

	flags_flavor = FLAG_FLAVOR_CHICKEN | FLAG_FLAVOR_RAW

	nutrition_fast_amount = 5
	nutrition_normal_amount = 10
	nutrition_quality_amount = 5
	heal_amount = 2

	flavor = "生鸡肉"

	heated_reagent = /reagent/nutrition/meat/chicken/cooked

/reagent/nutrition/meat/chicken/cooked
	name = "熟鸡肉"
	desc = "熟鸡肉提供的营养与风味。"
	color = "#F2DCD1"

	flags_flavor = FLAG_FLAVOR_CHICKEN | FLAG_FLAVOR_COOKED

	flavor = "鸡肉"

	flags_reagent = FLAG_REAGENT_COOKED
	heated_reagent = /reagent/carbon
	heated_reagent_mul = 0.01
	heated_reagent_amount = 0

/reagent/nutrition/meat/xeno
	name = "生异形肉"
	desc = "生异形肉提供的营养与风味。"
	color = "#336B42"

	flags_flavor = FLAG_FLAVOR_CHICKEN | FLAG_FLAVOR_RAW | FLAG_FLAVOR_GROSS

	nutrition_fast_amount = 0
	nutrition_normal_amount = 20
	nutrition_quality_amount = 0
	heal_amount = 5

	flavor = "错误"

	heated_reagent = /reagent/nutrition/meat/xeno/cooked

/reagent/nutrition/meat/xeno/cooked
	name = "熟异形肉"
	desc = "熟异形肉提供的营养与风味。"
	color = "#293D2E"

	flavor = "太空外星人"

	flags_flavor = FLAG_FLAVOR_CHICKEN | FLAG_FLAVOR_COOKED

	flags_reagent = FLAG_REAGENT_COOKED
	heated_reagent = /reagent/carbon
	heated_reagent_mul = 0.01
	heated_reagent_amount = 0



/reagent/nutrition/meat/arachnid
	name = "生蛛形生物肉"
	desc = "生蛛形生物肉提供的营养与风味。"
	color = "#80BA2B"

	flags_flavor = FLAG_FLAVOR_CHICKEN | FLAG_FLAVOR_RAW | FLAG_FLAVOR_GROSS

	nutrition_fast_amount = 0
	nutrition_normal_amount = 15
	nutrition_quality_amount = 5
	heal_amount = 10

	flavor = "酸泥土"

	heated_reagent = /reagent/nutrition/meat/arachnid/cooked

/reagent/nutrition/meat/arachnid/cooked
	name = "熟蛛形生物肉"
	desc = "熟蛛形生物肉提供的营养与风味。"
	color = "#9E782D"

	flags_flavor = FLAG_FLAVOR_CHICKEN | FLAG_FLAVOR_COOKED

	flavor = "鸡肉"

	flags_reagent = FLAG_REAGENT_COOKED
	heated_reagent = /reagent/carbon
	heated_reagent_mul = 0.01
	heated_reagent_amount = 0

/reagent/nutrition/meat/ash_drake
	name = "生灰烬飞龙肉"
	desc = "生灰烬飞龙肉提供的营养与风味。"
	color = "#C44E55"

	flags_flavor = FLAG_FLAVOR_CHICKEN | FLAG_FLAVOR_RAW | FLAG_FLAVOR_GROSS | FLAG_FLAVOR_NECRO

	heated_reagent_temp = 750
	heated_reagent_mul = 0.01
	heated_reagent_amount = 1

	nutrition_fast_amount = 5
	nutrition_normal_amount = 0
	nutrition_quality_amount = 15
	heal_amount = 10

	flavor = "酸泥土"

	heated_reagent = /reagent/nutrition/meat/ash_drake/cooked

/reagent/nutrition/meat/ash_drake/cooked
	name = "熟灰烬飞龙肉"
	desc = "熟灰烬飞龙肉提供的营养与风味。"
	color = "#8E5627"

	flags_flavor = FLAG_FLAVOR_CHICKEN | FLAG_FLAVOR_COOKED | FLAG_FLAVOR_GROSS | FLAG_FLAVOR_NECRO

	flavor = "鸡肉"

	flags_reagent = FLAG_REAGENT_COOKED
	heated_reagent_temp = 1000
	heated_reagent = /reagent/ash
	heated_reagent_mul = 0.01
	heated_reagent_amount = 0


/reagent/nutrition/meat/bubblegum
	name = "生泡泡糖肉"
	desc = "生泡泡糖肉提供的营养与风味。"
	color = "#C44E55"

	flags_flavor = FLAG_FLAVOR_CHICKEN | FLAG_FLAVOR_RAW | FLAG_FLAVOR_GROSS

	heated_reagent_temp = 750
	heated_reagent_mul = 0.01
	heated_reagent_amount = 1

	nutrition_fast_amount = 5
	nutrition_normal_amount = 0
	nutrition_quality_amount = 20
	heal_amount = 10

	flavor = "脑子"

	heated_reagent = /reagent/nutrition/meat/bubblegum/cooked

/reagent/nutrition/meat/bubblegum/cooked
	name = "熟泡泡糖肉"
	desc = "熟泡泡糖肉提供的营养与风味。"
	color = "#8E5627"

	flags_flavor = FLAG_FLAVOR_CHICKEN | FLAG_FLAVOR_COOKED | FLAG_FLAVOR_GROSS

	flavor = "熟脑子"

	flags_reagent = FLAG_REAGENT_COOKED
	heated_reagent_temp = 1100
	heated_reagent = /reagent/ash
	heated_reagent_mul = 0.01
	heated_reagent_amount = 0

/reagent/nutrition/meat/colossus
	name = "生巨像肉"
	desc = "生巨像肉提供的营养与风味。"
	color = "#AD0000"

	flags_flavor = FLAG_FLAVOR_CHICKEN | FLAG_FLAVOR_RAW | FLAG_FLAVOR_GROSS

	heated_reagent_temp = 750
	heated_reagent_mul = 0.01
	heated_reagent_amount = 1

	nutrition_fast_amount = 0
	nutrition_normal_amount = 5
	nutrition_quality_amount = 15
	heal_amount = 5

	flavor = "硬生肉干"

	heated_reagent = /reagent/nutrition/meat/colossus/cooked

/reagent/nutrition/meat/colossus/cooked
	name = "熟巨像肉"
	desc = "熟巨像肉提供的营养与风味。"
	color = "#633700"

	flags_flavor = FLAG_FLAVOR_CHICKEN | FLAG_FLAVOR_COOKED

	flavor = "硬肉干"

	flags_reagent = FLAG_REAGENT_COOKED
	heated_reagent_temp = 1100
	heated_reagent = /reagent/ash
	heated_reagent_mul = 0.01
	heated_reagent_amount = 0



/reagent/nutrition/meat/goliath
	name = "生歌利亚肉"
	desc = "生歌利亚肉提供的营养与风味。"
	color = "#A54343"

	flags_flavor = FLAG_FLAVOR_CHICKEN | FLAG_FLAVOR_RAW | FLAG_FLAVOR_GROSS

	heated_reagent_temp = 750
	heated_reagent_mul = 0.01
	heated_reagent_amount = 1

	nutrition_fast_amount = 0
	nutrition_normal_amount = 0
	nutrition_quality_amount = 0
	heal_amount = 0

	flavor = "岩石"

	heated_reagent = /reagent/nutrition/meat/goliath/cooked

/reagent/nutrition/meat/goliath/cooked
	name = "熟歌利亚肉"
	desc = "熟歌利亚肉提供的营养与风味。"
	color = "#823613"

	flags_flavor = FLAG_FLAVOR_CHICKEN | FLAG_FLAVOR_COOKED

	nutrition_fast_amount = 5
	nutrition_normal_amount = 15
	nutrition_quality_amount = 0
	heal_amount = 10

	flavor = "菲力牛排"

	flags_reagent = FLAG_REAGENT_COOKED
	heated_reagent_temp = 1100
	heated_reagent = /reagent/ash
	heated_reagent_mul = 0.01
	heated_reagent_amount = 0






/reagent/nutrition/meat/spider
	name = "生蜘蛛肉"
	desc = "生蜘蛛肉提供的营养与风味。"
	color = "#19B03E"

	flags_flavor = FLAG_FLAVOR_CHICKEN | FLAG_FLAVOR_RAW | FLAG_FLAVOR_GROSS

	nutrition_fast_amount = 10
	nutrition_normal_amount = 10
	nutrition_quality_amount = 0

	heal_amount = 5

	flavor = "毛发"

	heated_reagent = /reagent/nutrition/meat/spider/cooked

/reagent/nutrition/meat/spider/cooked
	name = "熟蜘蛛肉"
	desc = "熟蜘蛛肉提供的营养与风味。"
	color = "#A0DBAF"

	flags_flavor = FLAG_FLAVOR_CHICKEN | FLAG_FLAVOR_COOKED | FLAG_FLAVOR_GROSS

	flavor = "蛛网"

	flags_reagent = FLAG_REAGENT_COOKED
	heated_reagent = /reagent/carbon
	heated_reagent_mul = 0.01
	heated_reagent_amount = 0

/reagent/nutrition/meat/bear
	name = "生熊肉"
	desc = "生熊肉提供的营养与风味。"
	color = "#BA0214"

	flags_flavor = FLAG_FLAVOR_MEAT | FLAG_FLAVOR_RAW

	nutrition_fast_amount = 5
	nutrition_normal_amount = 0
	nutrition_quality_amount = 15

	heal_amount = 20

	flavor = "令人难以忍受的熊肉"

	heated_reagent = /reagent/nutrition/meat/bear/cooked

/reagent/nutrition/meat/bear/cooked
	name = "熟熊肉"
	desc = "熟熊肉提供的营养与风味。"
	color = "#57040D"

	flags_flavor = FLAG_FLAVOR_MEAT | FLAG_FLAVOR_COOKED | FLAG_FLAVOR_LOVE

	flavor = "斯拉夫料理"

	flags_reagent = FLAG_REAGENT_COOKED
	heated_reagent = /reagent/carbon
	heated_reagent_mul = 0.01
	heated_reagent_amount = 0

/reagent/nutrition/meat/penguin
	name = "生企鹅肉"
	desc = "生企鹅肉提供的营养与风味。"
	color = "#B39497"

	flags_flavor = FLAG_FLAVOR_CHICKEN | FLAG_FLAVOR_FISH | FLAG_FLAVOR_RAW

	nutrition_fast_amount = 5
	nutrition_normal_amount = 10
	nutrition_quality_amount = 5
	heal_amount = 5

	flavor = "冰"

	heated_reagent = /reagent/nutrition/meat/penguin/cooked

/reagent/nutrition/meat/penguin/cooked
	name = "熟企鹅肉"
	desc = "熟企鹅肉提供的营养与风味。"
	color = "#756A63"

	flags_flavor = FLAG_FLAVOR_CHICKEN | FLAG_FLAVOR_FISH | FLAG_FLAVOR_COOKED

	flavor = "冰屋"

	flags_reagent = FLAG_REAGENT_COOKED
	heated_reagent = /reagent/carbon
	heated_reagent_mul = 0.01
	heated_reagent_amount = 0

/reagent/nutrition/meat/fish
	name = "生鱼肉"
	desc = "生鱼肉提供的营养与风味。"
	color = "#F0D8E0"

	flags_flavor = FLAG_FLAVOR_FISH | FLAG_FLAVOR_RAW

	nutrition_fast_amount = 5
	nutrition_normal_amount = 5
	nutrition_quality_amount = 10

	heal_amount = 5

	heated_reagent = /reagent/nutrition/meat/fish/cooked

	flavor = "生鱼肉"

/reagent/nutrition/meat/fish/cooked
	name = "熟鱼肉"
	desc = "熟鱼肉提供的营养与风味。"
	color = "#CFBE91"

	flags_flavor = FLAG_FLAVOR_FISH | FLAG_FLAVOR_COOKED

	flavor = "熟鱼肉"

	flags_reagent = FLAG_REAGENT_COOKED
	heated_reagent = /reagent/carbon
	heated_reagent_mul = 0.01
	heated_reagent_amount = 0

/reagent/nutrition/meat/fish/quality
	name = "优质生鱼肉"
	desc = "优质生鱼肉提供的营养与风味。"
	color = "#F0D8E0"

	nutrition_fast_amount = 0
	nutrition_normal_amount = 5
	nutrition_quality_amount = 15

	heal_amount = 10

	heated_reagent = /reagent/nutrition/meat/fish/quality/cooked

	flavor = "优质生鱼肉"

/reagent/nutrition/meat/fish/quality/cooked
	name = "优质熟鱼肉"
	desc = "优质熟鱼肉提供的营养与风味。"
	color = "#CFBE91"

	flags_flavor = FLAG_FLAVOR_FISH | FLAG_FLAVOR_COOKED

	flavor = "优质鱼肉"

	flags_reagent = FLAG_REAGENT_COOKED
	heated_reagent = /reagent/carbon
	heated_reagent_mul = 0.01
	heated_reagent_amount = 0

/reagent/nutrition/meat/crab
	name = "生蟹肉"
	desc = "生蟹肉提供的营养与风味。"
	color = "#EB8046"

	flags_flavor = FLAG_FLAVOR_FISH | FLAG_FLAVOR_RAW

	nutrition_fast_amount = 5
	nutrition_normal_amount = 10
	nutrition_quality_amount = 5

	heal_amount = 5

	flavor = "贝壳"

	heated_reagent = /reagent/nutrition/meat/crab/cooked

/reagent/nutrition/meat/crab/cooked
	name = "熟蟹肉"
	desc = "熟蟹肉提供的营养与风味。"
	color = "#D45B19"

	flags_flavor = FLAG_FLAVOR_FISH | FLAG_FLAVOR_COOKED

	flavor = "海洋"

	flags_reagent = FLAG_REAGENT_COOKED
	heated_reagent = /reagent/carbon
	heated_reagent_mul = 0.01
	heated_reagent_amount = 0


/reagent/nutrition/meat/lobster
	name = "生龙虾肉"
	desc = "生龙虾肉提供的营养与风味。"
	color = "#EAD8CE"

	flags_flavor = FLAG_FLAVOR_FISH | FLAG_FLAVOR_RAW

	nutrition_fast_amount = 5
	nutrition_normal_amount = 5
	nutrition_quality_amount = 10

	heal_amount = 5

	flavor = "贝壳"

	heated_reagent = /reagent/nutrition/meat/lobster/cooked

/reagent/nutrition/meat/lobster/cooked
	name = "熟龙虾肉"
	desc = "熟龙虾肉提供的营养与风味。"
	color = "#E8BAA2"

	flags_flavor = FLAG_FLAVOR_FISH | FLAG_FLAVOR_COOKED

	flavor = "海洋"

	flags_reagent = FLAG_REAGENT_COOKED
	heated_reagent = /reagent/carbon
	heated_reagent_mul = 0.01
	heated_reagent_amount = 0

/reagent/nutrition/egg_white
	name = "蛋白"
	desc = "蛋白提供的营养与风味。"
	color = "#FFD865"

	nutrition_fast_amount = 0
	nutrition_normal_amount = 10
	nutrition_quality_amount = 5

	heal_amount = 1

	flavor = "蛋白"

/reagent/nutrition/egg_yellow
	name = "蛋黄"
	desc = "蛋黄提供的营养与风味。"
	color = "#FFFFE4"

	nutrition_fast_amount = 10
	nutrition_normal_amount = 10
	nutrition_quality_amount = 10

	heal_amount = 10

	flavor = "蛋黄"
