/reagent/lube //Found through organic things
	name = "太空润滑剂"
	desc = "太空中的润滑剂！"
	color = "#B6F0FF"
	alpha = 150

	flavor = "樱桃"
	flavor_strength = 2

	liquid = 2

	value = 2

	particle_size = 0.1


/reagent/lube/on_splash(var/reagent_container/container,var/mob/activator,var/atom/target,var/volume_to_splash,var/strength_mod=1)

	. = ..()

	if(. && is_simulated(target))
		var/turf/simulated/S = target
		S.add_wet(volume_to_splash*100*strength_mod)

/reagent/carbon //Found while mining carbon ore deposits. Or burning food.
	name = "碳"
	desc = "构成大多数生命的元素。"
	color = "#000000"
	alpha = 255

	flavor = "焦糊食物"

	liquid = -0.75

	heated_reagent = /reagent/ash
	heated_reagent_temp = 700
	heated_reagent_amount = 0
	heated_reagent_mul = 0.01

/reagent/wood
	name = "木材"
	desc = "大多数木制品的原料。"
	color = "#6B5546"
	alpha = 255

	flavor = "锯末"

	liquid = -0.25

	heated_reagent = /reagent/carbon
	heated_reagent_temp = 600
	heated_reagent_amount = 0
	heated_reagent_mul = 0.01


/reagent/iron //Found while mining iron ore deposits
	name = "铁"
	desc = "大多数生物用来制造武器的材料。"
	color = COLOR_IRON
	alpha = 255

	flavor = "铁"

	liquid = -0.25

	overdose_threshold = 40

	flags_metabolism = REAGENT_METABOLISM_STOMACH | REAGENT_METABOLISM_BLOOD

/reagent/iron/act_explode(var/reagent_container/container,var/atom/owner,var/atom/source,var/atom/epicenter,var/magnitude,var/desired_loyalty_tag) //What happens when this reagent is hit by an explosive.
	var/volume_amount = -container.add_reagent(src.type,-container.volume_current,activator = owner) //Can't be bothered to get the exact amount needed to be removed as it is handled in the proc anyways.
	var/shrapnel_amount = min(20,CEILING(volume_amount/3,1))
	container.owner.shoot_projectile(
		owner,
		epicenter,
		null,
		null,
		/obj/projectile/bullet/firearm/shotgun_pellet,
		/damagetype/ranged/shrapnel,
		16,
		16,
		4,
		TILE_SIZE*0.5,
		shrapnel_amount,
		"#FFFFFF",
		0,
		1,
		null,
		desired_loyalty_tag,
		0,
		1
	)


/reagent/iron/on_metabolize_blood(var/mob/living/owner,var/reagent_container/container,var/amount_to_metabolize=0,var/starting_volume=0,var/multiplier=1)

	. = ..()

	if(owner.blood_type)
		owner.blood_volume += .*4*multiplier
		owner.tox_regen_buffer -= . * 0.5
		QUEUE_HEALTH_UPDATE(owner)

/reagent/iron/on_metabolize_stomach(var/mob/living/owner,var/reagent_container/container,var/amount_to_metabolize=0,var/starting_volume=0,var/multiplier=1)

	. = ..()

	if(owner.blood_type)
		owner.blood_volume += .*2*multiplier
		QUEUE_HEALTH_UPDATE(owner)

/reagent/steel
	name = "钢"
	desc = "大多数生物用来制造武器的材料。"
	color = COLOR_STEEL
	alpha = 255

	flavor = "金属"

	liquid = -0.25

/reagent/plasteel
	name = "塑钢"
	desc = "大多数生物用来制造高级武器的材料。"
	color = COLOR_PLASTEEL
	alpha = 255

	flavor = "塑料"

	liquid = -0.25

/reagent/copper
	name = "铜"
	desc = "大多数生物用来铸造小面额货币的材料。"
	color = "#DD842F"
	alpha = 255

	flavor = "铜"

	liquid = -0.25

/reagent/diamond
	name = "钻石"
	desc = "大多数生物用来制造高面额货币的材料。"
	color = "#D9FFFF"
	alpha = 255

	flavor = "昂贵"

	liquid = -0.25

/reagent/silver
	name = "银"
	desc = "大多数生物用来制造武器的材料。"
	color = COLOR_SILVER
	alpha = 255

	flavor = "金属"

	liquid = -0.25

/reagent/platinum
	name = "铂"
	desc = "大多数生物用来铸造高面额货币的材料。"
	color = COLOR_PLATINUM
	alpha = 255

	flavor = "金属"

	liquid = -0.25

/reagent/gold
	name = "金"
	desc = "大多数生物用来铸造高面额货币的材料。"
	color = COLOR_GOLD
	alpha = 255

	flavor = "金属"

	liquid = -0.25

/reagent/brass
	name = "黄铜"
	desc = "大多数生物用来制造管道的材料。"
	color = "#e7a831"
	alpha = 255

	flavor = "金属"

	liquid = -0.25

/reagent/titanium
	name = "钛"
	desc = "大多数生物用来制造武器的材料。"
	color = COLOR_TITANIUM
	alpha = 255

	flavor = "金属"

	liquid = -0.25


/reagent/aluminium
	name = "铝"
	desc = "大多数生物用来制造武器的材料。"
	color = COLOR_SILVER
	alpha = 255

	flavor = "金属"

	liquid = -0.25

/reagent/nitrogen //Found in the snow biome as a magic plant
	name = "液氮"
	desc = "大多数生物呼吸时也会吸入，却基本用不上的物质。"
	color = "#D9E2E2"
	alpha = 200
	value = 3
	flavor = "冰冷"

	liquid = 0.25

/reagent/silicon //Found while mining silicon ore deposits
	name = "硅"
	desc = "大多数生物用来制作各种东西的材料。"
	color = COLOR_BLACK
	alpha = 225
	value = 2
	flavor = "假阳具"

	liquid = -0.25

/reagent/potassium //Found through potash
	name = "钾"
	desc = "大多数生物用来制作各种东西的材料。"
	color = "#ADADAD"
	alpha = 255
	value = 2
	flavor = "香蕉"

	flavor_strength = 6

	liquid = -0.25

	value = 2

/reagent/salt
	name = "离子化食盐"
	desc = "在这儿，一切皆是盐。"
	color = "#FFFFF4"
	alpha = 235
	value = 1.5
	flavor = "盐"
	flavor_strength = 4

	liquid = -0.9

	flags_metabolism = REAGENT_METABOLISM_STOMACH

/reagent/salt/on_metabolize_stomach(var/mob/living/owner,var/reagent_container/container,var/amount_to_metabolize=0,var/starting_volume=0,var/multiplier=1)
	. = ..()
	owner.add_hydration(.*-5*multiplier)

/reagent/salt/sodium_chloride
	name = "氯化钠"
	desc = "最纯粹的盐。只从汉堡站最咸、最爱破防的玩家身上提取。"
	color = "#FFFFFF"
	alpha = 255
	value = 2
	flavor = "令人作呕的咸味"
	flavor_strength = 10

	liquid = -1


/reagent/ash
	name = "灰烬"
	desc = "有机物燃烧后留下的灰烬。"
	color = "#A0A0A0"
	alpha = 255
	value = 2
	flavor = "灰烬"
	flavor_strength = 3

	liquid = -0.9

/reagent/ammonia
	name = "液氨"
	desc = "来自生物的氨。"
	alpha = 200
	value = 2
	color = "#EFEFEF"

	flavor = "氨"
	flavor_strength = 2

	liquid = 0.9

/reagent/sulfur
	name = "硫"
	desc = "来自地狱的硫。"
	alpha = 200
	value = 2
	color = "#FFD800"

	flavor = "下水道"
	flavor_strength = 8

	liquid = -0.75

/reagent/chlorine
	name = "氯"
	desc = "来自行星的氯。"
	alpha = 200

	color = "#C1D689"
	value = 2.5

	flavor = "氯"
	flavor_strength = 8

	liquid = 0



/reagent/space_cleaner
	name = "太空清洁剂"
	desc = "清洁速度是普通水的10倍！砰！太空清洁剂！"
	color = "#66E1FF"
	alpha = 150

	flavor = "漂白剂"
	flavor_strength = 5

	liquid = 0.4

	blood_toxicity_multiplier = -0.5 //A meme, but whatever.

	lethal = TRUE

	flags_metabolism = REAGENT_METABOLISM_STOMACH | REAGENT_METABOLISM_BLOOD | REAGENT_METABOLISM_SKIN

/reagent/space_cleaner/on_metabolize_stomach(var/mob/living/owner,var/reagent_container/container,var/amount_to_metabolize=0,var/starting_volume=0,var/multiplier=1)

	. = ..()

	owner.tox_regen_buffer -= .*2*multiplier

/reagent/space_cleaner/on_metabolize_blood(var/mob/living/owner,var/reagent_container/container,var/amount_to_metabolize=0,var/starting_volume=0,var/multiplier=1)

	. = ..()

	owner.tox_regen_buffer -= .*4*multiplier

/reagent/space_cleaner/on_splash(var/reagent_container/container,var/mob/activator,var/atom/target,var/volume_to_splash,var/strength_mod=1)

	. = ..()

	if(.)
		if(is_turf(target))
			var/turf/T = target
			var/cleaning_power = volume_to_splash*10*strength_mod
			for(var/obj/effect/cleanable/C in T.contents)
				if(cleaning_power <= 0)
					break
				qdel(C)
				cleaning_power -= 10
		else if(is_advanced(target))
			var/cleaning_power = volume_to_splash*strength_mod
			var/mob/living/advanced/A = target
			A.make_clean(clean_strength=cleaning_power)

/reagent/phenol
	name = "苯酚"
	desc = "一种有腐蚀性、易燃的固体，是许多配方的成分，也是一种有效的消毒剂。"
	color = "#FFFFFF"
	alpha = 200

	flavor = "酸"
	flavor_strength = 5

	liquid = -0.5

/reagent/saltpetre
	name = "硝石"
	desc = ""
	color = "#FFFFFF"
	alpha = 200

	flavor = "酸"
	flavor_strength = 5

	liquid = -0.5

/reagent/lye
	name = "碱液"
	desc = ""
	color = "#FFFFFF"
	alpha = 200

	flavor = "酸"
	flavor_strength = 5

	liquid = -0.5

/reagent/sodium
	name = "钠"
	desc = ""
	color = "#FFFFFF"
	alpha = 200

	flavor = "酸"
	flavor_strength = 5

	liquid = -0.5

/reagent/phosphorous
	name = "磷"
	desc = ""
	color = "#FFFFFF"
	alpha = 250
	value = 2.5
	flavor = "苦涩"
	flavor_strength = 5

	liquid = -0.5

