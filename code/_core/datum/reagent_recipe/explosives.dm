/reagent_recipe/explosion/
	category = "Explosives"
	results = list()

/reagent_recipe/explosion/emp
	name = "电磁脉冲"
	desc = "使电子设备失效。"

	required_reagents = list(
		/reagent/iron = 1,
		/reagent/radioactive/uranium = 1
	)

	results = list()

/reagent_recipe/explosion/emp/on_react(var/mob/activator,var/reagent_container/container,var/magnitude)

	var/tag_to_use
	if(is_living(activator))
		var/mob/living/L = activator
		tag_to_use = L.loyalty_tag

	emp(get_turf(container.owner),magnitude/20,activator,container.owner,tag_to_use)

	return TRUE


/reagent_recipe/explosion/holy_water_potassium
	name = "圣水与钾爆炸"
	desc = "哈利路亚！"

	required_reagents = list(
		/reagent/nutrition/water/holy = 1,
		/reagent/potassium = 1
	)

	results = list()

	secret = TRUE

/reagent_recipe/explosion/holy_water_potassium/on_react(var/mob/activator,var/reagent_container/container,var/magnitude)

	var/turf/explosion_location = get_turf(container.owner)

	if(is_item(container.owner))
		var/obj/item/I = container.owner
		I.drop_item(explosion_location)

	var/explosion_power = round( ((magnitude ** 0.3) * 0.5) + magnitude*0.025, 0.01)

	var/tag_to_use
	if(is_living(activator))
		var/mob/living/L = activator
		tag_to_use = L.loyalty_tag

	explode(explosion_location,explosion_power,activator,container.owner,tag_to_use)
	smoke(
		explosion_location,
		magnitude*0.05*2,
		40,
		container,
		activator
	)

	return TRUE




/reagent_recipe/explosion/water_potassium
	name = "水与钾爆炸"
	desc = "灰衣助理最喜欢的配方。"

	required_reagents = list(
		/reagent/nutrition/water = 1,
		/reagent/potassium = 1
	)

	results = list()

/reagent_recipe/explosion/water_potassium/on_react(var/mob/activator,var/reagent_container/container,var/magnitude)

	var/turf/explosion_location = get_turf(container.owner)

	if(is_item(container.owner))
		var/obj/item/I = container.owner
		I.drop_item(explosion_location)

	var/explosion_power = round( ((magnitude ** 0.3) * 0.5) + magnitude*0.025, 0.01)

	var/tag_to_use
	if(is_living(activator))
		var/mob/living/L = activator
		tag_to_use = L.loyalty_tag

	explode(explosion_location,explosion_power,activator,container.owner,tag_to_use)
	smoke(
		explosion_location,
		magnitude*0.05,
		40,
		container,
		activator
	)

	return TRUE

/reagent_recipe/explosion/smoke
	name = "糖、磷与钾烟雾"
	desc = "这大概算战争罪吧！"

	required_reagents = list(
		/reagent/nutrition/sugar = 1,
		/reagent/phosphorous = 1,
		/reagent/potassium = 1
	)
	results = list()

/reagent_recipe/explosion/smoke/on_react(var/mob/activator,var/reagent_container/container,var/magnitude)
	var/turf/T = get_turf(container.owner)
	smoke(
		T,
		magnitude*0.4,
		40 + magnitude*1.5,
		container,
		activator
	)
	return TRUE

/reagent_recipe/explosion/potassium_perchlorate
	name = "高氯酸钾"
	desc = "千万。别。吸入。"

	required_reagents = list(
		/reagent/potassium = 1,
		/reagent/chlorine = 1,
		/reagent/fuel/oxygen = 1
	)

	results = list(
		/reagent/fuel/potassium_perchlorate = 3,
	)

/reagent_recipe/explosion/flash_powder
	name = "铝制闪光粉混合物"
	desc = "拿它闪瞎朋友的眼睛。"

	required_reagents = list(
		/reagent/fuel/potassium_perchlorate = 1,
		/reagent/aluminium = 1
	)
	results = list(
		/reagent/fuel/flash_powder = 3,
	)

/reagent_recipe/explosion/oxygen_phoron_reaction
	name = "氧与佛隆反应"
	desc = "液氧与液态佛隆会剧烈反应，视温度不同，可能起火或爆炸。"

	required_reagents = list(
		/reagent/fuel/oxygen = 0,
		/reagent/fuel/phoron = 0
	)
	results = list()

/reagent_recipe/explosion/oxygen_phoron_reaction/on_react(var/mob/activator,var/reagent_container/container,var/magnitude)
	container.average_temperature += 1000 //1000 regardless.
	container.process_temperature() //Will turn it into a fireball.
	return TRUE

