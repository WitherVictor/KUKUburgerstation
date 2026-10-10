/reagent/drug/ //Found in the snow biome as a magic plant
	name = "迷幻药"
	desc = "这他妈是什么东西？"
	color = "#FFFFFF"
	alpha = 255
	metabolism_stomach = 1
	metabolism_blood = 2

	var/strength = 50
	var/duration_mod = 10

	liquid = -0.4

	var/status_effect = DRUGGY

	blood_toxicity_multiplier = 5

	flags_metabolism = REAGENT_METABOLISM_STOMACH | REAGENT_METABOLISM_BLOOD

/reagent/drug/on_metabolize_stomach(var/mob/living/owner,var/reagent_container/container,var/amount_to_metabolize=0,var/starting_volume=0,var/multiplier=1)

	. = ..()

	owner.add_status_effect(
		status_effect,
		magnitude = strength,
		duration = . * duration_mod*multiplier //Every 20 units should last 5 minutes.
	)

/reagent/drug/on_metabolize_blood(var/mob/living/owner,var/reagent_container/container,var/amount_to_metabolize=0,var/starting_volume=0,var/multiplier=1)

	. = ..()

	owner.add_status_effect(
		status_effect,
		magnitude = strength*2,
		duration = . * duration_mod*multiplier //Every 20 units should last 5 minutes.
	)

/reagent/drug/liberty_dust
	name = "太空自由之尘"
	desc = "自由！无拘无束的自由！"
	color = "#FFFFFF"
	alpha = 255

	flavor = "自由"

	strength = 75
	duration_mod = 10

	value = 7.5

	liquid = -0.6

	particle_size = 0.4

/reagent/drug/space
	name = "太空迷幻药"
	desc = "类似太空大麻。"
	color = "#FFFFFF"
	alpha = 255

	flavor = "哥们儿，来口大麻"

	strength = 25
	duration_mod = 15

	value = 4.5

	particle_size = 0.6


/reagent/drug/dust
	name = "太空粉尘"
	desc = "类似太空大麻，不过劲儿更大。"
	color = "#7A9BFF"
	alpha = 255

	flavor = "后悔"

	strength = 200
	duration_mod = 15

	value = 12

	liquid = -0.6

	particle_size = 0.4

/reagent/drug/supermatter
	name = "超物质粉尘"
	desc = "直接从超物质上采集的粉尘。真不错。"
	color = "#FFFA7C"
	alpha = 255

	flavor = "奶酪"

	strength = 500
	duration_mod = 15

	value = 12

	liquid = -0.6

	particle_size = 0.4


/reagent/drug/lithium
	name = "锂"
	desc = "电池！"
	color = "#B6D8D8"
	alpha = 255

	flavor = "电池"

	strength = 100
	duration_mod = 10

	value = 4

	liquid = -0.8

	particle_size = 0.7

	status_effect = CONFUSED


/reagent/drug/armotol
	name = "坚甲醇"
	desc = "一种让你更加坚韧的奇特化学物质。"
	color = "#2600ff"
	alpha = 200

	flavor = "钢铁"

	strength = 25
	duration_mod = 15

	value = 10

	status_effect = TEMP_ARMOR

	lethal = FALSE

	liquid = 0.6
