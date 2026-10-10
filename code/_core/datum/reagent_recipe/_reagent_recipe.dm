//Recipe reactions are handled in _reagent_container

/reagent_recipe/
	var/name = "试剂配方"
	var/desc = "一种试剂的配方。"
	var/category = "None" //For books

	var/list/required_reagents = list()

	var/required_container //The type of container that is required for this reaction to occur.

	var/list/results = null

	var/atom/result

	var/list/required_temperature_min = list()

	var/list/required_temperature_max = list()

	var/secret = FALSE //This just means its unlisted in the recipe book.

	var/priority = 0 //Higher numbers means higher priority.

/reagent_recipe/proc/on_react(var/mob/activator,var/reagent_container/container,var/magnitude)
	return TRUE
