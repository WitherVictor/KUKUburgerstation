/reagent_recipe/chemistry/oil/

	name = "原油"
	desc = "用于化学反应的原油。"

	required_reagents = list(
		/reagent/fuel/welding = 1,
		/reagent/fuel/hydrogen = 1
	)

	results = list(
		/reagent/fuel/oil/crude = 2
	)

/reagent_recipe/chemistry/carbonized_oil

	name = "碳化油"
	desc = "用于机械和化学反应的精炼油。"

	required_reagents = list(
		/reagent/fuel/oil/crude = 2,
		/reagent/carbon = 1,
	)

	results = list(
		/reagent/fuel/oil/carbon = 3
	)

/reagent_recipe/chemistry/welding_fuel

	name = "焊接燃料"
	desc = "用作焊接工具的燃料，还有……其他用途。"

	required_reagents = list(
		/reagent/fuel/hydrogen = 1,
		/reagent/fuel/oxygen = 1
	)

	results = list(
		/reagent/fuel/welding = 2
	)
