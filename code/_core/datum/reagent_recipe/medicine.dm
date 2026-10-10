/reagent_recipe/medicine/
	category = "Chemistry"
	results = list()


//Start of approved recipes.


/reagent_recipe/medicine/inaprovaline

	name = "伊纳普罗林"
	desc = "由基础元素与化合物合成的常见生命体征稳定剂。仅注射有效，过量阈值较高。提供不死效果。"

	required_reagents = list(
		/reagent/carbon = 1,
		/reagent/fuel/oxygen = 1,
		/reagent/nutrition/sugar/glucose = 1
	)

	results = list(
		/reagent/medicine/inaprovaline = 3
	)

/reagent_recipe/medicine/bicaridine

	name = "比卡利定"
	desc = "红色治物理伤害。"

	required_reagents = list(
		/reagent/carbon = 1,
		/reagent/medicine/inaprovaline = 1
	)

	results = list(
		/reagent/medicine/bicaridine = 2
	)

/reagent_recipe/medicine/dylovene

	name = "地洛文"
	desc = "绿色治毒素伤害。"

	required_reagents = list(
		/reagent/nitrogen = 1,
		/reagent/potassium = 1,
		/reagent/silicon = 1
	)

	results = list(
		/reagent/medicine/dylovene = 3
	)

/reagent_recipe/medicine/tricordrazine

	name = "三科达嗪"
	desc = "治疗除缺氧以外的各种伤害。"

	required_reagents = list(
		/reagent/medicine/inaprovaline = 1,
		/reagent/medicine/dylovene = 1
	)

	results = list(
		/reagent/medicine/tricordrazine = 2
	)


/reagent_recipe/medicine/synthflesh

	name = "合成血肉"
	desc = "实验性合成血肉，能立即大幅治疗作用肢体的物理与灼烧伤害。警告：不要用于开放性伤口。"

	required_reagents = list(
		/reagent/medicine/bicaridine = 1,
		/reagent/medicine/synthblood = 1,
		/reagent/carbon = 1
	)

	results = list(
		/reagent/medicine/synthflesh = 3
	)

/reagent_recipe/medicine/dexalin

	name = "右旋林"
	desc = "蓝色治缺氧。"

	required_reagents = list(
		/reagent/fuel/acetone = 1,
		/reagent/fuel/phoron = 1
	)

	results = list(
		/reagent/medicine/dexalin = 1
	)


/reagent_recipe/medicine/kelotane

	name = "克罗烷"
	desc = "黄色治灼烧伤害。"

	required_reagents = list(
		/reagent/carbon = 1,
		/reagent/silicon = 1,
	)

	results = list(
		/reagent/medicine/kelotane = 2
	)

/reagent_recipe/medicine/charcoal

	name = "活性炭"
	desc = "清除体内毒物，并治疗少量毒素伤害。口服同样有效。"

	required_reagents = list(
		/reagent/ash = 1,
		/reagent/salt/sodium_chloride = 1
	)

	results = list(
		/reagent/medicine/charcoal = 2
	)

	required_temperature_min = list(
		/reagent/ash = 380,
		/reagent/salt/sodium_chloride = 380
	)


/reagent_recipe/medicine/silver_sulfadiazine

	name = "磺胺嘧啶银"
	desc = "治疗灼烧伤害。仅涂抹皮肤有效。"

	required_reagents = list(
		/reagent/ammonia = 1,
		/reagent/silver = 1,
		/reagent/sulfur = 1,
		/reagent/fuel/oxygen = 1,
		/reagent/chlorine = 1
	)

	results = list(
		/reagent/medicine/silver_sulfadiazine = 1
	)

/reagent_recipe/medicine/styptic_powder

	name = "止血粉"
	desc = "治疗物理伤害。仅涂抹皮肤有效。"

	required_reagents = list(
		/reagent/aluminium = 1,
		/reagent/fuel/welding = 1,
		/reagent/acid/sulphuric = 1
	)

	results = list(
		/reagent/medicine/styptic_powder = 1
	)


/reagent_recipe/medicine/epinephrine

	name = "急救肾上腺素"
	desc = "用于复苏濒死患者，短时间提供肾上腺素效果。"

	required_reagents = list(
		/reagent/fuel/acetone = 1,
		/reagent/fuel/diethylamine = 1,
		/reagent/phenol = 1,
		/reagent/chlorine = 1,
		/reagent/fuel/welding = 1
	)

	results = list(
		 /reagent/medicine/adrenaline/epinephrine = 1
	)


/reagent_recipe/medicine/antihol

	name = "解酒剂"
	desc = "快速清除体内酒精。"

	required_reagents = list(
		/reagent/medicine/charcoal = 1,
		/reagent/copper = 1,
		/reagent/nutrition/ethanol = 1
	)

	results = list(
		 /reagent/medicine/antihol = 1
	)

/reagent_recipe/medicine/synthblood

	name = "合成血液"
	desc = "一种特殊合成血液，注射后能适配任何有机生物的血型。通常比直接使用真实血液更昂贵，但也有一些化学用途。"

	required_reagents = list(
		/reagent/medicine/inaprovaline = 1,
		/reagent/iron = 1,
		/reagent/sodium = 1
	)

	results = list(
		 /reagent/medicine/synthblood = 1
	)





//End of approved recipes


//Odd specific recipes that are mostly corporate owned and thus aren't listed.

/reagent_recipe/medicine/caridone

	name = "卡利酮"

	required_reagents = list(
		/reagent/medicine/bicaridine = 1,
		/reagent/fuel/acetone = 1,
		/reagent/enzymes = 1
	)

	results = list(
		/reagent/medicine/caridone = 1
	)

	secret = TRUE

/reagent_recipe/medicine/percardone

	name = "培卡酮"

	required_reagents = list(
		/reagent/medicine/bicaridine = 1,
		/reagent/medicine/adrenaline/epinephrine = 1,
		/reagent/enzymes = 1,
		/reagent/phenol = 1
	)

	results = list(
		/reagent/medicine/percardone = 1
	)

	secret = TRUE

/reagent_recipe/medicine/carotane

	name = "卡洛烷"

	required_reagents = list(
		/reagent/medicine/kelotane = 1,
		/reagent/medicine/bicaridine = 1,
		/reagent/enzymes = 1
	)

	results = list(
		/reagent/medicine/carotane = 1
	)

	secret = TRUE

/reagent_recipe/medicine/dicarditane

	name = "双卡利烷"

	required_reagents = list(
		/reagent/medicine/carotane = 1,
		/reagent/fuel/diethylamine = 1
	)

	results = list(
		/reagent/medicine/dicarditane = 1
	)

	secret = TRUE

/reagent_recipe/medicine/arentane

	name = "阿伦烷"

	required_reagents = list(
		/reagent/medicine/kelotane = 1,
		/reagent/fuel/acetone = 1,
		/reagent/enzymes = 1
	)

	results = list(
		/reagent/medicine/arentane = 1
	)

	secret = TRUE

/reagent_recipe/medicine/kenotone

	name = "克诺酮"

	required_reagents = list(
		/reagent/medicine/kelotane = 2,
		/reagent/fuel/phoron = 1
	)

	results = list(
		/reagent/medicine/arentane = 1
	)

	secret = TRUE

/reagent_recipe/medicine/extinatane

	name = "熄焰烷"

	required_reagents = list(
		/reagent/medicine/kelotane = 1,
		/reagent/medicine/silver_sulfadiazine = 1,
		/reagent/fuel/diethylamine = 1,
		/reagent/nitrogen = 1
	)

	results = list(
		/reagent/medicine/extinatane = 1
	)

	secret = TRUE
