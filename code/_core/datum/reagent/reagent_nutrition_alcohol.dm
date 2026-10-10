// https://en.wikipedia.org/wiki/Alcohol_by_volume#Typical_levels

/reagent/nutrition/ethanol //Found through organic things
	name = "乙醇"
	desc = "大多数生物喝的东西。"
	color = "#778877"
	alpha = 225

	flavor = "酒精"
	flavor_strength = 3

	liquid = 0.75

	//Hydration, nutrition, and nutrition_quality are generated in new.

	var/power = 100 //Also known as alcohol by volume.

	heal_amount = 0

	value = 3

	lethal = TRUE

	blood_toxicity_multiplier = 3

/reagent/nutrition/ethanol/New(var/desired_loc)
	var/power_mod = power*0.01
	hydration_amount = max(0,(1-power_mod)*5)
	nutrition_fast_amount = power_mod*10
	particle_size = 0.1 + min(power_mod,1)*0.2
	liquid = 1 - min(power_mod,1)*0.5
	. = ..()

/reagent/nutrition/ethanol/get_flammability()
	return power*0.001 //100 means it would be 0.1

/reagent/nutrition/ethanol/on_metabolize_blood(var/mob/living/owner,var/reagent_container/container,var/amount_to_metabolize=0,var/starting_volume=0,var/multiplier=1)

	. = ..()

	if(owner.health)
		owner.intoxication += power*.
		owner.sanity_regen_buffer += power*.

/reagent/nutrition/ethanol/on_metabolize_stomach(var/mob/living/owner,var/reagent_container/container,var/amount_to_metabolize=0,var/starting_volume=0,var/multiplier=1)

	. = ..()

	if(owner.health)
		owner.intoxication += power*.*0.5*multiplier
		owner.sanity_regen_buffer += power*.*multiplier

/reagent/nutrition/ethanol/fernet
	name = "菲奈特苦酒"
	color = "#370000"

	flavor = "菲奈特苦酒"
	flavor_strength = 4

	power = 45


/reagent/nutrition/ethanol/beer
	name = "啤酒"
	color = "#CCAE57"

	flavor = "啤酒"
	flavor_strength = 2

	power = 5

/reagent/nutrition/ethanol/ale
	name = "艾尔啤酒"
	color = "#C67217"

	flavor = "艾尔啤酒"
	flavor_strength = 2

	power = 25

/reagent/nutrition/ethanol/cider
	name = "苹果酒"
	color = "#FFBE3D"

	flavor = "苹果酒"
	flavor_strength = 3

	power = 6

/reagent/nutrition/ethanol/rum
	name = "朗姆酒"
	color = "#D37D43"

	flavor = "朗姆酒"
	flavor_strength = 2

	power = 40

/reagent/nutrition/ethanol/whiskey
	name = "威士忌"
	color = "#CD6500"

	flavor = "威士忌"
	flavor_strength = 3

	power = 43

/reagent/nutrition/ethanol/vodka
	name = "伏特加"
	color = "#F4FFFF"

	flavor = "伏特加"
	flavor_strength = 4

	power = 40

/reagent/nutrition/ethanol/vodka/premium
	name = "高级伏特加"
	color = "#FFFFFF"

	flavor = "高级伏特加"
	flavor_strength = 3

	power = 95

/reagent/nutrition/ethanol/gin
	name = "金酒"
	color = "#FFFFFF"

	flavor = "金酒"
	flavor_strength = 4

	power = 45

/reagent/nutrition/ethanol/brandy
	name = "白兰地"
	color = "#CE4A1E"

	flavor = "白兰地"
	flavor_strength = 6

	power = 45

/reagent/nutrition/ethanol/schnapps/gold
	name = "金箔烈酒"
	color = "#FFF6CC"

	flavor = "黄金"
	flavor_strength = 2

	power = 40

/reagent/nutrition/ethanol/nothing
	name = "虚无"
	color = "#FFFFFF"

	flavor = "无味"
	flavor_strength = 1

	power = 0

/reagent/nutrition/ethanol/coffee_liqueur
	name = "咖啡利口酒"
	color = "#A85721"

	flavor = "咖啡利口酒"
	flavor_strength = 2

	power = 20

/reagent/nutrition/ethanol/tequila
	name = "龙舌兰酒"
	color = "#CC9B4E"

	flavor = "龙舌兰酒"
	flavor_strength = 4

	power = 40

/reagent/nutrition/ethanol/tequila/premium
	name = "高级龙舌兰酒"
	color = "#CC9B4E"

	flavor = "高级龙舌兰酒"
	flavor_strength = 5

	power = 60

/reagent/nutrition/ethanol/wine
	name = "红葡萄酒"
	color = "#7F0000"

	flavor = "红葡萄酒"
	flavor_strength = 3

	power = 12.5

/reagent/nutrition/ethanol/wine/vermouth
	name = "味美思"
	color = "#F3FFD6"

	flavor = "味美思"
	flavor_strength = 4

	power = 14.5

/reagent/nutrition/ethanol/wine/lizard
	name = "蜥蜴酒"
	color = "#2EC17A"

	flavor = "蜥蜴酒"
	flavor_strength = 5

	power = 16


/reagent/nutrition/ethanol/hearty_punch
	name = "暖心潘趣酒"
	color = "#E06967"

	flavor = "暖心潘趣酒"
	flavor_strength = 3
	heal_amount = 4

	power = 30

/reagent/nutrition/ethanol/absinthe
	name = "苦艾酒"
	color = "#26A300"

	flavor = "苦艾酒"
	flavor_strength = 6

	power = 45

/reagent/nutrition/ethanol/absinthe/premium
	name = "高级苦艾酒"
	color = "#2DC400"

	flavor = "苦艾酒"
	flavor_strength = 8

	power = 89.9

/reagent/nutrition/ethanol/grappa
	name = "格拉帕果渣白兰地"
	color = "#FFF9C9"

	flavor = "格拉帕果渣白兰地"
	flavor_strength = 3

	power = 50
