/reagent/nutrition/chanterelle
	name = "鸡油菌"
	desc = "鸡油菌提供的营养与风味。"
	color = "#FFDD8F"

	nutrition_fast_amount = 1
	nutrition_normal_amount = 4
	nutrition_quality_amount = 5

	flavor = "蘑菇"

	liquid = -0.2

	particle_size = 0.6

/reagent/nutrition/porcini
	name = "牛肝菌"
	desc = "牛肝菌提供的营养与风味。"
	color = "#68593E"

	nutrition_fast_amount = 1
	nutrition_normal_amount = 3
	nutrition_quality_amount = 6

	flavor = "烤蘑菇"

	liquid = -0.4

	particle_size = 0.4

/reagent/nutrition/tomato
	name = "番茄酱"
	desc = "番茄提供的营养与风味。"
	color = "#C90000"

	nutrition_fast_amount = 0
	nutrition_normal_amount = 5
	nutrition_quality_amount = 5

	flavor = "番茄"

	liquid = 0.3

	particle_size = 0.4

/reagent/nutrition/mustard
	name = "芥末酱"
	desc = "芥末籽提供的营养与风味。"
	color = "#EAC300"

	nutrition_fast_amount = 1
	nutrition_normal_amount = 3
	nutrition_quality_amount = 6

	flavor = "芥末"

	liquid = 0.1

	particle_size = 0.4

/reagent/nutrition/pineapple
	name = "菠萝"
	desc = "菠萝提供的营养与风味。"
	color = "#C90000"

	nutrition_fast_amount = 2
	nutrition_normal_amount = 5
	nutrition_quality_amount = 3

	flavor = "菠萝"

	liquid = 0.5

	particle_size = 0.6

/reagent/nutrition/cabbage
	name = "卷心菜"
	desc = "卷心菜提供的营养与风味。"
	color = "#658268"

	nutrition_fast_amount = 0
	nutrition_normal_amount = 3
	nutrition_quality_amount = 7

	flavor = "卷心菜"

	liquid = 0

	particle_size = 0.7

/reagent/nutrition/lettuce
	name = "生菜"
	desc = "生菜提供的营养与风味。"
	color = "#5AAF36"

	nutrition_fast_amount = 0
	nutrition_normal_amount = 4
	nutrition_quality_amount = 6

	flavor = "生菜"

	liquid = 0

	particle_size = 0.7

/reagent/nutrition/coconut
	name = "椰子"
	desc = "椰子提供的营养与风味。"
	color = "#658268"

	nutrition_fast_amount = 3
	nutrition_normal_amount = 4
	nutrition_quality_amount = 3

	flavor = "椰子"

	liquid = -0.25

	particle_size = 0.6


/reagent/nutrition/nut
	name = "树坚果"
	desc = "树坚果提供的营养与风味。"
	color = "#658268"

	nutrition_fast_amount = 4
	nutrition_normal_amount = 3
	nutrition_quality_amount = 3

	flavor = "坚果"

	liquid = -0.5

	particle_size = 0.8

/reagent/nutrition/nut/butter
	name = "坚果酱"
	desc = "坚果酱提供的营养与风味。"
	color = "#658268"

	nutrition_fast_amount = 7
	nutrition_normal_amount = 0
	nutrition_quality_amount = 3

	flavor = "坚果酱"

	liquid = 0.25

	particle_size = 0.4


/reagent/nutrition/flower_petal
	name = "花瓣"
	desc = "花瓣提供的营养与风味。"
	color = "#965A33"

	nutrition_fast_amount = 1
	nutrition_normal_amount = 1
	nutrition_quality_amount = 1

	flags_flavor = FLAG_FLAVOR_GROSS

	flavor = "泥土"

	liquid = 0

	particle_size = 0.7

/reagent/nutrition/poppy_seed
	name = "罂粟籽"
	desc = "清洗过、不含鸦片的罂粟籽。"
	color = "#511500"

	nutrition_fast_amount = 2
	nutrition_normal_amount = 2
	nutrition_quality_amount = 5

	flavor = "罂粟籽"

	liquid = 0

	particle_size = 0.3

/reagent/nutrition/poppy_seed/raw
	name = "未处理罂粟籽"
	desc = "未经提炼的天然罂粟籽。未清洗，含有微量鸦片。"

	processed_reagent = /reagent/medicine/painkiller/opium

	particle_size = 0.4

	lethal = TRUE


/reagent/nutrition/poppy_seed/raw/on_metabolize_stomach(var/mob/living/owner,var/reagent_container/container,var/amount_to_metabolize=0,var/starting_volume=0,var/multiplier=1)

	. = ..()

	if(prob(10))
		. *= 0.5
		container.add_reagent(processed_reagent,.)

/reagent/nutrition/poppy_seed/raw/on_metabolize_blood(var/mob/living/owner,var/reagent_container/container,var/amount_to_metabolize=0,var/starting_volume=0,var/multiplier=1)

	. = ..()

	if(prob(10))
		. *= 0.5
		container.add_reagent(processed_reagent,.)

/reagent/nutrition/lipolicide
	name = "消脂菌"
	desc = "来源于植物、会吞噬营养的微生物。"
	color = "#511500"

	nutrition_fast_amount = -5
	nutrition_normal_amount = -10
	nutrition_quality_amount = -15

	flavor = "饥饿"

	liquid = -0.1

	particle_size = 0.1

/reagent/nutrition/potato
	name = "土豆"
	desc = "土豆提供的营养与风味。"
	color = "#FFFFEA"

	nutrition_fast_amount = 3
	nutrition_normal_amount = 6
	nutrition_quality_amount = 1

	flavor = "地里的苹果"

	liquid = 0

	particle_size = 0.8


/reagent/nutrition/cactus
	name = "仙人掌"
	desc = "仙人掌提供的营养与风味。"
	color = "#5AFF36"

	nutrition_fast_amount = 0
	nutrition_normal_amount = 4
	nutrition_quality_amount = 1
	hydration_amount = 10

	flavor = "脆脆的水"

	liquid = 0

	particle_size = 0.1


/reagent/nutrition/capsaicin
	name = "辣椒素"
	desc = "痛苦汁液。"
	color = "#EF3232"

	nutrition_fast_amount = 1
	nutrition_normal_amount = 6
	nutrition_quality_amount = 3
	hydration_amount = -5

	flavor = "疼痛"

	liquid = 0

	particle_size = 0.2

	lethal = TRUE

	metabolism_skin = 10

/reagent/nutrition/capsaicin/on_metabolize_stomach(var/mob/living/owner,var/reagent_container/container,var/amount_to_metabolize=0,var/starting_volume=0,var/multiplier=1)
	. = ..()
	owner.pain_regen_buffer += -.*multiplier
	owner.send_pain_response(.*multiplier)


/reagent/nutrition/capsaicin/on_metabolize_blood(var/mob/living/owner,var/reagent_container/container,var/amount_to_metabolize=0,var/starting_volume=0,var/multiplier=1)

	. = ..()
	owner.pain_regen_buffer += -. * 0.5*multiplier
	owner.send_pain_response(. * 0.5*multiplier)

/reagent/nutrition/capsaicin/on_metabolize_skin(var/mob/living/owner,var/reagent_container/container,var/amount_to_metabolize=0,var/starting_volume=0,var/multiplier=1)

	. = ..()
	owner.pain_regen_buffer += -.*multiplier
	owner.send_pain_response(.*multiplier)
