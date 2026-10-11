/obj/item/armor_plate
	name = "装甲板"
	desc = "不是用来盛饭的。"
	desc_extended = "用于装入插板背心的防护装甲板。"
	icon = 'icons/obj/item/armor_plate.dmi'
	icon_state = "light"

	var/list/armor_base = list()

	size = SIZE_2

/obj/item/armor_plate/New(var/desired_loc)
	weight = calculate_weight()
	return ..()

/obj/item/armor_plate/proc/calculate_weight()

	var/init_weight = initial(weight)

	if(init_weight != 0)
		return init_weight

	. = 1

	for(var/k in armor_base)
		if(IS_INFINITY(armor_base[k]))
			continue
		. += armor_base[k] * armor_slowdown_values[k]


/obj/item/armor_plate/get_examine_list(var/mob/examiner)
	. = ..()
	var/list/armor_list = list()
	var/list/damage_display_names = list(BLADE = "切割",BLUNT = "钝击",PIERCE = "穿刺",LASER = "激光",ARCANE = "奥术",HEAT = "高温",COLD = "寒冷",SHOCK = "电击",ACID = "酸蚀",BOMB = "爆炸",BIO = "生物武器",RAD = "辐射",HOLY = "神圣",DARK = "黑暗",FATIGUE = "疲劳",PAIN = "疼痛",ION = "离子",SANITY = "理智",MENTAL = "精神")
	for(var/damagetype in armor_base)
		var/damage_rating = armor_base[damagetype]
		if(damage_rating)
			var/damage_display_name = damage_display_names[damagetype] ? damage_display_names[damagetype] : damagetype
			armor_list += "[damage_display_name]：[damage_rating]"
	. += div("notice","<b>护甲：</b>[jointext(armor_list,"、")]。")
	. += div("notice","<b>装入插板背心后才会提供这些防护值。叠加多块装甲板时，正面防护收益会递减。</b>")

/obj/item/armor_plate/light
	name = "轻型装甲板"
	icon_state = "light"

	armor_base = list(
		BLADE = 15,
		BLUNT = 15,
		PIERCE = 15,
		LASER = 10
	)


	value = 90



/obj/item/armor_plate/medium
	name = "中型装甲板"
	icon_state = "medium"

	armor_base = list(
		BLADE = 15,
		BLUNT = 30,
		PIERCE = 30,
		LASER = 10,
		ARCANE = -25
	)


	value = 190




/obj/item/armor_plate/heavy
	name = "重型装甲板"
	icon_state = "heavy"

	armor_base = list(
		BLADE = 15,
		BLUNT = 45,
		PIERCE = 45,
		LASER = 25,
		ARCANE = -50
	)





	value = 275

/obj/item/armor_plate/super
	name = "超级装甲板"
	icon_state = "super"

	armor_base = list(
		BLADE = 25,
		BLUNT = 65,
		PIERCE = 65,
		LASER = 25,
		ARCANE = -75
	)



	value = 500

/obj/item/armor_plate/ultra
	name = "终极装甲板"
	icon_state = "super"

	armor_base = list(
		BLADE = 50,
		BLUNT = 75,
		PIERCE = 75,
		LASER = 50,
		ARCANE = -75
	)



	value = 1000
