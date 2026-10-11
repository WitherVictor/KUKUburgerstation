/obj/item/experience_scroll/attribute
	overlay_icon_state = "bauble"

/obj/item/experience_scroll/attribute/get_examine_list()

	. = ..()

	if(type_to_give)
		var/list/attribute_names = list(ATTRIBUTE_STRENGTH="力量",ATTRIBUTE_FORTITUDE="坚韧",ATTRIBUTE_VITALITY="活力",ATTRIBUTE_INTELLIGENCE="智力",ATTRIBUTE_WILLPOWER="意志",ATTRIBUTE_WISDOM="智慧",ATTRIBUTE_DEXTERITY="灵巧",ATTRIBUTE_RESILIENCE="韧性",ATTRIBUTE_ENDURANCE="耐力")
		var/attribute_name = attribute_names[type_to_give] ? attribute_names[type_to_give] : type_to_give
		. += div("notice","阅读[src.name]可获得[attribute_name]经验。")

/obj/item/experience_scroll/attribute/get_base_value()
	if(!type_to_give)
		return 0
	return 1500 * level_to_give

/obj/item/experience_scroll/attribute/gain_knowledge(var/mob/living/advanced/A)

	if(!type_to_give)
		return FALSE

	var/experience/E = A.get_attribute(type_to_give)
	var/experience_to_add = E.level_to_xp(level_to_give) - E.level_to_xp(level_to_give-1)
	A.add_attribute_xp(type_to_give,experience_to_add,FALSE)

	return ..()

/obj/item/experience_scroll/attribute/strength
	name = "力量卷轴"
	type_to_give = ATTRIBUTE_STRENGTH
	value = 2000

	overlay_color = COLOR_RED

/obj/item/experience_scroll/attribute/fortitude
	name = "坚韧卷轴"
	type_to_give = ATTRIBUTE_FORTITUDE
	value = 2000

	overlay_color = COLOR_RED

/obj/item/experience_scroll/attribute/vitality
	name = "活力卷轴"
	type_to_give = ATTRIBUTE_VITALITY
	value = 2000

	overlay_color = COLOR_RED


/obj/item/experience_scroll/attribute/intelligence
	name = "智力卷轴"
	type_to_give = ATTRIBUTE_INTELLIGENCE
	value = 2000

	overlay_color = COLOR_BLUE

/obj/item/experience_scroll/attribute/willpower
	name = "意志卷轴"
	type_to_give = ATTRIBUTE_WILLPOWER
	value = 2000

	overlay_color = COLOR_BLUE

/obj/item/experience_scroll/attribute/wisdom
	name = "智慧卷轴"
	type_to_give = ATTRIBUTE_WISDOM
	value = 2000

	overlay_color = COLOR_BLUE


/obj/item/experience_scroll/attribute/dexterity
	name = "灵巧卷轴"
	type_to_give = ATTRIBUTE_DEXTERITY
	value = 2000

	overlay_color = COLOR_GREEN

/obj/item/experience_scroll/attribute/resilience
	name = "韧性卷轴"
	type_to_give = ATTRIBUTE_RESILIENCE
	value = 2000

	overlay_color = COLOR_GREEN

/obj/item/experience_scroll/attribute/endurance
	name = "耐力卷轴"
	type_to_give = ATTRIBUTE_ENDURANCE
	value = 2000

	overlay_color = COLOR_GREEN
