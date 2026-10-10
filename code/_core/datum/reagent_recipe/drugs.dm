/reagent_recipe/drugs/
	category = "Chemistry"
	results = list()

/reagent_recipe/drugs/space_drugs

	name = "太空迷幻药"
	desc = "老兄……太空迷幻药。"

	required_reagents = list(
		/reagent/drug/lithium = 1,
		/reagent/toxin/mercury = 1,
		/reagent/nutrition/sugar/glucose = 1
	)

	results = list(
		/reagent/drug/space = 1
	)


/reagent_recipe/drugs/space_dust

	name = "太空粉尘"
	desc = "类似太空迷幻药，不过更贵。"

	required_reagents = list(
		/reagent/fuel/acetone = 1,
		/reagent/drug/space = 1,
		/reagent/medicine/dexalin = 1
	)

	results = list(
		/reagent/drug/dust = 1
	)
