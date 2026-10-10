/reagent/nutrition/water
	name = "水"
	desc = "大多数生物喝的东西。"
	color = "#99D5FF"
	alpha = 150

	flavor = "水"
	flavor_strength = 0.1

	particle_size = 0
	liquid = 1

	hydration_amount = 25
	heal_amount = 0

	cooled_reagent_temp = T0C - 1
	cooled_reagent_amount = 0
	cooled_reagent_mul = 1
	cooled_reagent = /reagent/nutrition/ice

	value = 0.75

/reagent/nutrition/water/on_splash(var/reagent_container/container,var/mob/activator,var/atom/target,var/volume_to_splash,var/strength_mod=1)

	. = ..()

	if(.)
		if(is_turf(target))
			var/turf/T = target
			var/cleaning_power = volume_to_splash*5*strength_mod
			for(var/obj/effect/cleanable/C in T.contents)
				if(cleaning_power <= 0)
					break
				qdel(C)
				cleaning_power -= 10
			for(var/obj/fire_process/FP in T.contents)
				FP.fire_power -= volume_to_splash*strength_mod*10
			if(is_simulated(target))
				var/turf/simulated/S = target
				S.add_wet(volume_to_splash*10*strength_mod)
		else if(is_advanced(target))
			var/cleaning_power = volume_to_splash*strength_mod*0.2
			var/mob/living/advanced/A = target
			A.make_clean(clean_strength=cleaning_power)


/reagent/nutrition/water/holy
	name = "圣水"
	desc = "大多数生物用来祝圣的东西。"
	color = "#99D5FF"
	alpha = 100

	flavor = "圣水"
	flavor_strength = 0.5

	particle_size = 0
	liquid = 1

	hydration_amount = 25

	heal_amount = 2

	value = 3

/reagent/nutrition/ice
	name = "冰"
	desc = "大多数生物用来冰镇饮料的东西。"
	color = "#E5FFFF"
	alpha = 200

	flavor = "冰"
	flavor_strength = 0.1

	liquid = -0.5

	hydration_amount = 25
	heal_amount = 0

	heated_reagent_temp = T0C + 1
	heated_reagent_amount = REAGENT_ROUNDING
	heated_reagent_mul = 0
	heated_reagent = /reagent/nutrition/water

	temperature_mod = 50
	particle_size = 0.9

/reagent/nutrition/soda
	name = "碳酸水"
	desc = "充满气泡的水。"
	color = "#DDFFFF"
	alpha = 225

	hydration_amount = 15

	flavor = "白噪声"

	heal_amount = 0

	liquid = 0.7
	particle_size = 0.2

/reagent/nutrition/soda/cola
	name = "太空可乐"
	desc = "来喝太空可乐！"
	color = "#5D2500"

	flavor = "可乐"

	nutrition_fast_amount = 10
	nutrition_normal_amount = 0
	nutrition_quality_amount = 0

/reagent/nutrition/soda/grape
	name = "星吻葡萄汽水"
	desc = "向着群星出发！"
	color = "#57007F"

	flavor = "葡萄汽水"

	nutrition_fast_amount = 10
	nutrition_normal_amount = 0
	nutrition_quality_amount = 0

/reagent/nutrition/soda/orange
	name = "星吻橙味汽水"
	desc = "向着群星出发！"
	color = "#590000"

	flavor = "橙味汽水"

	nutrition_fast_amount = 10
	nutrition_normal_amount = 0
	nutrition_quality_amount = 0

/reagent/nutrition/soda/iced_tea
	name = "磁盘！冰茶"
	desc = "守住这份清爽滋味！"
	color = "#A55C2B"

	nutrition_fast_amount = 5
	nutrition_normal_amount = 0
	nutrition_quality_amount = 0

	flavor = "冰茶"

/reagent/nutrition/soda/mountain_wind
	name = "太空山风"
	desc = "畅饮山风！"
	color = "#B6FF00"

	flavor = "柑橘汽水"

	nutrition_fast_amount = 10
	nutrition_normal_amount = 0
	nutrition_quality_amount = 0


/reagent/nutrition/soda/dr_gibb
	name = "吉布博士"
	desc = "42种风味！"
	color = "#590000"

	flavor = "樱桃可乐"

	nutrition_fast_amount = 10
	nutrition_normal_amount = 0
	nutrition_quality_amount = 0

/reagent/nutrition/soda/space_up
	name = "太空七喜！"
	desc = "喝太空七喜，一起飞上太空！"
	color = "#590000"

	flavor = "柠檬青柠汽水"

	nutrition_fast_amount = 10
	nutrition_normal_amount = 0
	nutrition_quality_amount = 0
