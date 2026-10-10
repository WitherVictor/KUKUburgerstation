/experience/attribute/
	experience_power = 1
	experience_multiplier = 1
	chargen_min_level = 5
	chargen_max_level = 20

//Warrior
/experience/attribute/strength/ //100% complete
	name = "力量"
	desc = "衡量你有多强壮。"
	skill_for_examine = 5
	desc_vague = "会影响你的伤害，并提高抵抗抓取的能力。"
	desc_extended = "影响大多数近战武器和部分远程武器的伤害，以及你挣脱抓取的能力。\n使用依赖力量的武器造成伤害可以提升此属性。"
	id = ATTRIBUTE_STRENGTH
	flags = ATTRIBUTE_DAMAGE
	experience_power = 1.9
	experience_multiplier = 10.4

/experience/attribute/constitution/ //100% complete
	name = "体质"
	desc = "衡量你的身体素质。"
	skill_for_examine = 3
	desc_vague = "会影响你的抗性。"
	desc_extended = "影响你对物理伤害的天然抗性。\n承受非魔法攻击的伤害可以提升此属性。"
	id = ATTRIBUTE_CONSTITUTION
	flags = ATTRIBUTE_RESISTANCE
	experience_power = 1.9
	experience_multiplier = 10.4

/experience/attribute/fortitude/ //100% complete
	name = "坚韧"
	desc = "衡量你的身体应对逆境的能力。"
	skill_for_examine = 4
	desc_vague = "会影响你的生命值。"
	desc_extended = "影响生命值的自然恢复速度。\n自然恢复生命值可以提升此属性。"
	id = ATTRIBUTE_FORTITUDE
	flags = ATTRIBUTE_REGEN
	experience_power = 1.9
	experience_multiplier = 10.4

/experience/attribute/vitality/ //100% complete
	name = "活力"
	desc = "衡量你的生命力。"
	skill_for_examine = 4
	desc_vague = "会影响你的生命值。"
	desc_extended = "影响生命值上限。\n提升力量、体质或坚韧的等级可以提升此属性。"
	id = ATTRIBUTE_VITALITY
	flags = ATTRIBUTE_STAT | ATTRIBUTE_NO_DIFFICULTY_XP_MUL
	experience_power = 1
	experience_multiplier = 2

/experience/attribute/vitality/on_level_up(var/old_level,var/new_level)
	if(owner && owner.health)
		owner.health.update_health_stats()
	return ..()

//Rogue
/experience/attribute/dexterity/ //100% complete
	name = "灵巧"
	desc = "衡量你的综合动作技巧。"
	skill_for_examine = 5
	desc_vague = "会影响你的伤害。"
	desc_extended = "影响大多数近战武器和部分远程武器的伤害及攻击速度。\n使用依赖灵巧的武器造成伤害可以提升此属性。"
	id = ATTRIBUTE_DEXTERITY
	flags = ATTRIBUTE_DAMAGE
	experience_power = 1.9
	experience_multiplier = 10.4

/experience/attribute/agility //0% complete
	name = "敏捷"
	desc = "衡量你的身体能移动多快。"
	skill_for_examine = 2
	desc_vague = "会影响你的速度。"
	desc_extended = "影响移动速度上限，以及抵消减速效果的能力。\n冲刺可以提升此属性。"
	id = ATTRIBUTE_AGILITY
	flags = ATTRIBUTE_RESISTANCE
	experience_power = 1.9
	experience_multiplier = 5.2

/experience/attribute/resilience/ //100% complete
	name = "韧性"
	desc = "衡量你的身体应对体力消耗的能力。"
	skill_for_examine = 2
	desc_vague = "会影响你的体力。"
	desc_extended = "影响体力的自然恢复速度。\n自然恢复体力可以提升此属性。"
	id = ATTRIBUTE_RESILIENCE
	flags = ATTRIBUTE_REGEN
	experience_power = 1.9
	experience_multiplier = 10.4

/experience/attribute/endurance/ //100% complete
	name = "耐力"
	desc = "衡量你的身体能坚持多久。"
	skill_for_examine = 3
	desc_vague = "会影响你的体力。"
	desc_extended = "影响体力上限。\n提升灵巧、敏捷或韧性的等级可以提升此属性。"
	id = ATTRIBUTE_ENDURANCE
	flags = ATTRIBUTE_STAT | ATTRIBUTE_NO_DIFFICULTY_XP_MUL
	experience_power = 1
	experience_multiplier = 2

/experience/attribute/endurance/on_level_up(var/old_level,var/new_level)
	if(owner && owner.health)
		owner.health.update_health_stats()
	return ..()


//Wizard
/experience/attribute/intelligence/ //100% complete
	name = "智力"
	desc = "衡量你运用知识的速度与准确程度。"
	skill_for_examine = 6
	desc_vague = "会影响你的伤害。"
	desc_extended = "影响大多数魔法法术、力量和能力的伤害。\n使用法术类武器造成伤害可以提升此属性。"
	id = ATTRIBUTE_INTELLIGENCE
	flags = ATTRIBUTE_DAMAGE
	experience_power = 1.9
	experience_multiplier = 10.4

/experience/attribute/willpower/ //100% complete
	name = "意志"
	desc = "衡量你控制心智的能力。"
	skill_for_examine = 6
	desc_vague = "会影响你的法力。"
	desc_extended = "影响法力的自然恢复速度。\n自然恢复法力可以提升此属性。"
	id = ATTRIBUTE_WILLPOWER
	flags = ATTRIBUTE_REGEN
	experience_power = 1.9
	experience_multiplier = 10.4

/experience/attribute/soul //100% complete
	name = "灵魂"
	desc = "衡量你的灵魂有多强大。"
	skill_for_examine = 7
	desc_vague = "会影响你的抗性。"
	desc_extended = "影响你对魔法的天然抗性。\n承受魔法攻击的伤害可以提升此属性。"
	id = ATTRIBUTE_SOUL
	flags = ATTRIBUTE_RESISTANCE
	experience_power = 1.9
	experience_multiplier = 10.4

/experience/attribute/wisdom/ //100% complete
	name = "智慧"
	desc = "衡量你掌握的知识有多丰富。"
	skill_for_examine = 7
	desc_vague = "会影响你的法力。"
	desc_extended = "影响法力上限。\n提升意志、灵魂和智力的等级可以提升此属性。"
	id = ATTRIBUTE_WISDOM
	flags = ATTRIBUTE_STAT | ATTRIBUTE_NO_DIFFICULTY_XP_MUL
	experience_power = 1
	experience_multiplier = 2

/experience/attribute/wisdom/on_level_up(var/old_level,var/new_level)
	if(owner && owner.health)
		owner.health.update_health_stats()
	return ..()










//None. Everyone starts with 50.
/experience/attribute/luck/ //50% complete.
	name = "幸运"
	id = ATTRIBUTE_LUCK
	flags = ATTRIBUTE_STAT | ATTRIBUTE_NO_DIFFICULTY_XP_MUL
	chargen_min_level = 40
	chargen_max_level = 50
	default_level = 50
	counts_towards_level = FALSE

/experience/attribute/luck/set_level(var/level)
	. = ..()
	if(.)
		owner.luck = clamp(level,1,src.get_max_level())

