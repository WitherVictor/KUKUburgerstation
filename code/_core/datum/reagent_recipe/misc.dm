/reagent_recipe/chemistry/
	category = "Chemistry"
	name = "化学配方"
	desc = "一种化学配方。"
	results = list()

/reagent_recipe/chemistry/sodium_chloride

	name = "氯化钠"
	desc = "不，老兄，那是加碘食盐，除了氯化钠，还含有抗结剂和用来预防缺碘的碘化钾。所以你坚持用科学术语称呼日常用品，不只是装腔作势，而且事实也说错了。你的傲慢终将害了你。"

	required_reagents = list(
		/reagent/sodium = 1,
		/reagent/chlorine = 1,
		/reagent/nutrition/water = 1
	)

	results = list(
		/reagent/salt/sodium_chloride = 1
	)

/reagent_recipe/chemistry/ammonia

	name = "氨"
	desc = "来自生物的氨。"

	required_reagents = list(
		/reagent/fuel/hydrogen = 3,
		/reagent/nitrogen = 1
	)

	results = list(
		/reagent/ammonia = 1
	)

/reagent_recipe/chemistry/sulfur_dioxide

	name = "二氧化硫"
	desc = "硫与煤一同燃烧产生的有毒烟气。"

	required_reagents = list(
		/reagent/sulfur = 1,
		/reagent/carbon = 1
	)

	results = list(
		/reagent/toxin/sulfur_dioxide = 1
	)

	required_temperature_min = list(
		/reagent/carbon = 480
	)

/reagent_recipe/chemistry/space_cleaner

	name = "太空清洁剂"
	desc = "太空里用的清洁剂。"

	required_reagents = list(
		/reagent/ammonia = 1,
		/reagent/nutrition/water = 1
	)

	results = list(
		/reagent/space_cleaner = 2
	)

/reagent_recipe/chemistry/space_lube

	name = "太空润滑剂"
	desc = "要是有人向管理员求助，说谁把装了这玩意儿的烟雾弹扔得全站都是，我就把它从代码里删掉。——V"

	required_reagents = list(
		/reagent/fuel/oxygen = 1,
		/reagent/silicon = 1,
		/reagent/potassium = 1,
	)

	results = list(
		/reagent/lube = 1
	)

/reagent_recipe/chemistry/acetone

	name = "丙酮"
	desc = "一种用作溶剂的无色液体，具有腐蚀性且易燃。"

	required_reagents = list(
		/reagent/fuel/oil = 1,
		/reagent/fuel/welding = 1,
		/reagent/fuel/oxygen = 1
	)

	results = list(
		/reagent/fuel/acetone = 3
	)


/reagent_recipe/chemistry/diethylamine

	name = "二乙胺"
	desc = "某种溶剂。"

	required_reagents = list(
		/reagent/ammonia = 1,
		/reagent/nutrition/ethanol = 1
	)

	results = list(
		/reagent/fuel/diethylamine  = 2
	)

/reagent_recipe/chemistry/phenol

	name = "苯酚"
	desc = "一种有腐蚀性、易燃的固体，是许多配方的原料，也是一种有效的消毒剂。"

	required_reagents = list(
		/reagent/fuel/oil = 1,
		/reagent/chlorine = 1,
		/reagent/nutrition/water = 1
	)

	results = list(
		/reagent/phenol  = 3
	)

/reagent_recipe/chemistry/saltpetre

	name = "硝石"
	desc = "一种矿物。"

	required_reagents = list(
		/reagent/fuel/oxygen = 3,
		/reagent/potassium = 1,
		/reagent/nitrogen = 1
	)

	results = list(
		/reagent/saltpetre  = 3
	)


/reagent_recipe/chemistry/lye

	name = "碱液"
	desc = "WKYK的《绝不之歌》。"

	required_reagents = list(
		/reagent/sodium = 1,
		/reagent/fuel/welding = 1
	)

	results = list(
		/reagent/lye  = 3
	)



/reagent_recipe/chemistry/hydrogen_peroxide

	name = "过氧化氢"
	desc = "一种消毒剂。"

	required_reagents = list(
		/reagent/chlorine = 1,
		/reagent/fuel/oxygen = 1,
		/reagent/nutrition/water = 1
	)

	results = list(
		/reagent/fuel/hydrogen_peroxide = 3
	)


/reagent_recipe/chemistry/sugar_breakdown_01

	name = "糖转化为葡萄糖"
	desc = "将糖转化为葡萄糖。"

	required_reagents = list(
		/reagent/nutrition/sugar = 1,
		/reagent/enzymes = 1
	)

	results = list(
		/reagent/nutrition/sugar/glucose = 1
	)

/reagent_recipe/chemistry/sugar_breakdown_02

	name = "蔗糖转化为葡萄糖"
	desc = "将蔗糖转化为葡萄糖。"

	required_reagents = list(
		/reagent/nutrition/sugar/cane = 1,
		/reagent/enzymes = 1
	)

	results = list(
		/reagent/nutrition/sugar/glucose = 1
	)

	secret = TRUE
