/obj/item/experience_scroll/skill
	overlay_icon_state = "gem"

/obj/item/experience_scroll/skill/get_base_value()
	if(!type_to_give)
		return 0
	return 750 * level_to_give

/obj/item/experience_scroll/skill/get_examine_list()
	. = ..()
	var/list/skill_names = list(SKILL_MELEE="近战",SKILL_UNARMED="徒手",SKILL_PRAYER="祈祷",SKILL_RANGED="远程",SKILL_PRECISION="精准",SKILL_SURVIVAL="生存",SKILL_MAGIC="魔法",SKILL_SUMMONING="召唤",SKILL_MEDICINE="医疗")
	var/skill_name = skill_names[type_to_give] ? skill_names[type_to_give] : type_to_give
	. += div("notice","阅读[src.name]可获得[skill_name]经验。")

/obj/item/experience_scroll/skill/gain_knowledge(var/mob/living/advanced/A)

	if(!type_to_give)
		return FALSE

	var/experience/E = A.get_skill(type_to_give)
	var/experience_to_add = E.level_to_xp(level_to_give) - E.level_to_xp(level_to_give-1)
	A.add_skill_xp(type_to_give,experience_to_add,FALSE)

	return ..()

/obj/item/experience_scroll/skill/melee
	name = "近战卷轴"
	type_to_give = SKILL_MELEE
	value = 2000

	overlay_color = COLOR_RED

/obj/item/experience_scroll/skill/unarmed
	name = "徒手卷轴"
	type_to_give = SKILL_UNARMED
	value = 2000

	overlay_color = COLOR_RED

/obj/item/experience_scroll/skill/prayer
	name = "祈祷卷轴"
	type_to_give = SKILL_PRAYER
	value = 2000

	overlay_color = COLOR_RED


/obj/item/experience_scroll/skill/ranged
	name = "远程卷轴"
	type_to_give = SKILL_RANGED
	value = 2000

	overlay_color = COLOR_GREEN

/obj/item/experience_scroll/skill/precision
	name = "精准卷轴"
	type_to_give = SKILL_PRECISION
	value = 2000

	overlay_color = COLOR_GREEN

/obj/item/experience_scroll/skill/survival
	name = "生存卷轴"
	type_to_give = SKILL_SURVIVAL
	value = 2000

	overlay_color = COLOR_GREEN


/obj/item/experience_scroll/skill/magic
	name = "魔法卷轴"
	type_to_give = SKILL_MAGIC
	value = 2000

	overlay_color = COLOR_BLUE

/obj/item/experience_scroll/skill/summoning
	name = "召唤卷轴"
	type_to_give = SKILL_SUMMONING
	value = 2000

	overlay_color = COLOR_BLUE

/obj/item/experience_scroll/skill/medicine
	name = "医疗卷轴"
	type_to_give = SKILL_MEDICINE
	value = 2000

	overlay_color = COLOR_BLUE
