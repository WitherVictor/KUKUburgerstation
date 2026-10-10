/reagent/fuel
	name = "通用燃料"
	color = "#7F3300"
	alpha = 255

	particle_size = 0.5

	var/explosion_strength_per_unit = 0
	var/flash_strength_per_unit = 0
	var/bang_strength_per_unit = 0
	var/fire_strength_per_unit = 0

	blood_toxicity_multiplier = 5

	value = 1

	var/ignition_temperature = TNULL

/reagent/fuel/get_flammability()
	return fire_strength_per_unit

/reagent/fuel/on_temperature_change(var/reagent_container/container)

	. = ..()

	if(!container.owner || ignition_temperature == TNULL || container.average_temperature < ignition_temperature || !is_item(container.owner))
		return .

	var/turf/T = get_turf(container.owner)
	if(!T)
		return .

	var/obj/item/I = container.owner

	var/volume_amount = container.stored_reagents[src.type]
	container.add_reagent(src.type,-volume_amount,should_update = FALSE, check_recipes = FALSE)

	var/loyalty_tag
	if(I.last_interacted && is_living(I.last_interacted))
		var/mob/living/L = I.last_interacted
		loyalty_tag = L.loyalty_tag

	//Special snowflake code that makes it so that explosives don't trigger.
	if(fire_strength_per_unit > 0)
		var/firebomb_power = volume_amount*fire_strength_per_unit
		if(firebomb_power < 1)
			return .
		firebomb(T,firebomb_power,I.last_interacted,container.owner,loyalty_tag)
	else
		src.act_explode(container,I.last_interacted,container.owner,T,1,loyalty_tag)


/reagent/fuel/New(var/desired_loc)
	//Automatically set value.
	value = (explosion_strength_per_unit + flash_strength_per_unit*0.1 + bang_strength_per_unit*0.1 + fire_strength_per_unit*0.5)*0.3
	. = ..()
	value = CEILING(value,0.01)


/reagent/fuel/act_explode(var/reagent_container/container,var/atom/owner,var/atom/source,var/atom/epicenter,var/magnitude,var/desired_loyalty_tag) //What happens when this reagent is hit by an explosive.

	var/turf/T = get_turf(container.owner)

	var/volume_amount = -container.add_reagent(src.type,-container.volume_current,activator = owner) //Can't be bothered to get the exact amount needed to be removed as it is handled in the proc anyways.

	if(flash_strength_per_unit > 0)
		var/flash_range = min(VIEW_RANGE*2,volume_amount*flash_strength_per_unit)
		if(flash_range >= 2)
			for(var/mob/living/L in viewers(flash_range,T))
				var/strength_mod = 0.25 + (1 - (get_dist(L,T)/VIEW_RANGE))*0.75
				var/duration = SECONDS_TO_DECISECONDS(10)*strength_mod
				L.flash(duration)

	if(bang_strength_per_unit > 0)
		var/bang_range = min(VIEW_RANGE*2,volume_amount*bang_strength_per_unit)
		if(bang_range >= 2)
			for(var/mob/living/L in hearers(bang_range,T))
				var/strength_mod = 0.25 + (1 - (get_dist(L,T)/VIEW_RANGE))*0.75
				var/duration = SECONDS_TO_DECISECONDS(10)*strength_mod*2
				L.bang(duration)
			play_sound('sound/effects/flashbang.ogg',T,volume=75,range_min=bang_range*0.5,range_max=bang_range*2,channel=SOUND_CHANNEL_FLASHBANG)

	if(fire_strength_per_unit > 0)
		var/fire_range = volume_amount*fire_strength_per_unit
		if(fire_range >= 2)
			firebomb(T,fire_range,owner,source,desired_loyalty_tag)

	if(explosion_strength_per_unit > 0)
		smoke(
			epicenter,
			volume_amount*explosion_strength_per_unit*0.8,
			SECONDS_TO_DECISECONDS(20*explosion_strength_per_unit),
			null,
			owner,
			alpha=100
		)
		explode(epicenter,volume_amount*explosion_strength_per_unit,owner,source,desired_loyalty_tag)


	. = ..()

/reagent/fuel/oxygen //Found in the snow biome as a magic plant
	name = "液氧"
	desc = "大多数生物呼吸所需的物质，不过这是液态的。"
	color = "#E6F2F2"
	alpha = 200

	flavor = "氧气"
	value = 2

	liquid = 0.25

	explosion_strength_per_unit = 0.005
	fire_strength_per_unit = 0.16

	heated_reagent = null //Nothing.
	heated_reagent_temp = 330

/reagent/fuel/oil
	name = "精炼油"
	color = "#131616"
	alpha = 255

	particle_size = 0.25

	explosion_strength_per_unit = 0.015
	fire_strength_per_unit = 0.06

	ignition_temperature = 450

/reagent/fuel/oil/crude
	name = "原油"
	color = "#0F0F0F"
	alpha = 255

	particle_size = 0.5

	heated_reagent = /reagent/fuel/oil
	heated_reagent_temp = 800
	heated_reagent_amount = 0
	heated_reagent_mul = 0.01

	explosion_strength_per_unit = 0.01
	fire_strength_per_unit = 0.04

	ignition_temperature = 500

/reagent/fuel/oil/carbon
	name = "碳化油"
	color = "#000000"
	alpha = 255

	particle_size = 0.75

	heated_reagent = /reagent/ash
	heated_reagent_temp = 480
	heated_reagent_amount = 0
	heated_reagent_mul = 0.01

	explosion_strength_per_unit = 0.005
	fire_strength_per_unit = 0.02

	ignition_temperature = 550

/reagent/fuel/welding
	name = "焊接燃料"
	color = "#7F3300"
	alpha = 255

	particle_size = 0.3

	explosion_strength_per_unit = 0.03
	fire_strength_per_unit = 0.1

	ignition_temperature = 475

/reagent/fuel/hydrogen
	name = "液氢"
	color = "#7F0000"
	alpha = 255

	value = 2

	particle_size = 0.75

	explosion_strength_per_unit = 0.05
	fire_strength_per_unit = 0.08

	ignition_temperature = 860

/reagent/fuel/hydrogen_peroxide
	name = "过氧化氢"
	color = "#FFEFEF"
	alpha = 100

	value = 2

	particle_size = 0.8

	explosion_strength_per_unit = 0.1
	fire_strength_per_unit = 0.1

	ignition_temperature = 420

/reagent/fuel/phoron
	name = "液态佛隆"
	color = "#FF00DC"
	alpha = 255

	particle_size = 1

	explosion_strength_per_unit = 0.15
	fire_strength_per_unit = 0.6

	ignition_temperature = 300

/reagent/fuel/acetone
	name = "丙酮"
	desc = "一种用作溶剂的无色液体，具有腐蚀性且易燃。"
	alpha = 100

	particle_size = 0.1

	explosion_strength_per_unit = 0.01
	fire_strength_per_unit = 0.01

	ignition_temperature = 310

/reagent/fuel/diethylamine
	name = "二乙胺"
	alpha = 255

	particle_size = 0.75

	explosion_strength_per_unit = 0.06
	fire_strength_per_unit = 0.03

	ignition_temperature = 600

/reagent/fuel/tnt
	name = "三硝基甲苯"
	desc = "又称TNT，是一种威力很大的炸药。"

	particle_size = 0.75

	ignition_temperature = 370

	explosion_strength_per_unit = 0.1

/reagent/fuel/potassium_perchlorate
	name = "高氯酸钾"
	desc = "闪光震撼弹中产生巨响的成分。"

	liquid = -0.5
	particle_size = 0.2

	explosion_strength_per_unit = 0.002
	bang_strength_per_unit = 30/VIEW_RANGE

	ignition_temperature = 370

/reagent/fuel/flash_powder
	name = "闪光粉混合物"
	desc = "闪光震撼弹中产生闪光和巨响的成分。"

	liquid = -0.5
	particle_size = 0.3

	explosion_strength_per_unit = 0.001
	flash_strength_per_unit = 20/VIEW_RANGE
	bang_strength_per_unit = 40/VIEW_RANGE

	ignition_temperature = 370
