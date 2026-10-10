/reagent/toxin/
	name = "毒素"
	desc = "一种几乎随处可见的常见毒素。"
	color = "#FF8411"
	alpha = 200

	var/damage_per_unit = 1

	lethal = TRUE

	liquid = 0.5

	particle_size = 0.6

	flags_metabolism = REAGENT_METABOLISM_STOMACH | REAGENT_METABOLISM_BLOOD | REAGENT_METABOLISM_PLANT

/reagent/toxin/New(var/desired_loc)
	blood_toxicity_multiplier = damage_per_unit*5
	value *= 1+(damage_per_unit*3)
	return ..()

/reagent/toxin/on_metabolize_plant(var/obj/structure/interactive/plant/plant,var/reagent_container/container,var/amount_to_metabolize=0,var/starting_volume=0,var/multiplier=1)
	. = ..()
	plant?.health?.adjust_loss_smart(tox=-.*damage_per_unit*2*multiplier)

/reagent/toxin/on_metabolize_stomach(var/mob/living/owner,var/reagent_container/container,var/amount_to_metabolize=0,var/starting_volume=0,var/multiplier=1)
	. = ..()
	owner.tox_regen_buffer -= .*damage_per_unit*0.75*multiplier

/reagent/toxin/on_metabolize_blood(var/mob/living/owner,var/reagent_container/container,var/amount_to_metabolize=0,var/starting_volume=0,var/multiplier=1)
	. = ..()
	owner.tox_regen_buffer -= .*damage_per_unit*multiplier

/reagent/toxin/angel_toxin
	name = "天使毒素"
	desc = "一种致命性极高的毒素。注射后，你就能见到天使了。"

	damage_per_unit = 15

	flavor = "蘑菇"

	particle_size = 0.4


/reagent/toxin/fly_amanita_toxin
	name = "毒蝇伞毒素"
	desc = "一种致命性中等的毒素。"

	damage_per_unit = 4

	flavor = "蘑菇"

	particle_size = 0.5

/reagent/toxin/polypnium_toxin
	name = "剧毒蕈素"
	desc = "一种致命性很高的毒素。"

	damage_per_unit = 10

	flavor = "蘑菇"

	particle_size = 0.3

/reagent/toxin/xeno_acid
	name = "异形酸液"
	desc = "这他妈就是酸。"

	damage_per_unit = 2

	flavor = "痛苦"

	particle_size = 0.3

/reagent/toxin/spider_toxin
	name = "蜘蛛毒素"
	desc = "毒素可不是好东西。"

	damage_per_unit = 3

	flavor = "蜘蛛恐惧症"

	particle_size = 0.2

/reagent/toxin/sulfur_dioxide
	name = "二氧化硫"
	desc = "硫与煤一同燃烧时产生的有毒烟气。"

	damage_per_unit = 1

	heated_reagent = /reagent/acid/sulphuric
	heated_reagent_temp = 600
	heated_reagent_amount = 1
	heated_reagent_mul = 0.01

	particle_size = 0.7

/reagent/toxin/mercury
	name = "汞"
	desc = "毒素可不是好东西。"

	color = "#808080"
	alpha = 255

	damage_per_unit = 5

	flavor = "金星"

	particle_size = 1


/reagent/toxin/blob_spore
	name = "异形菌毯孢子"
	desc = "别吸入这东西。"

	damage_per_unit = 2

	particle_size = 0.8

	color = "#A06300"
