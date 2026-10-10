/job/security
	name = "安保员"
	desc = "安保员负责保护纳米传讯及其资产和人员，攻击技能以及攻防属性均有加成。"
	passive_income = 400
	passive_income_bonus = 100

	bonus_skills = list(
		SKILL_MELEE = 5,
		SKILL_ARMOR = 5,
		SKILL_RANGED = 5,
		SKILL_SURVIVAL = 5,
	)

	bonus_attributes = list(
		ATTRIBUTE_STRENGTH = 5,
		ATTRIBUTE_FORTITUDE = 5,
		ATTRIBUTE_CONSTITUTION = 5,
		ATTRIBUTE_ENDURANCE = 5,
	)

	ranks = list(
		"安保新兵",
		"初级安保员",
		"安保员",
		"资深安保员"
	)

	job_flags = FLAG_JOB_KILLING
