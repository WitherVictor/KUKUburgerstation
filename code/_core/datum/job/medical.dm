/job/medical
	name = "医生"
	desc = "医生专精于医疗及各种治疗方法，医疗技能和相关属性均有加成。"

	passive_income = 0
	passive_income_bonus = 200

	bonus_skills = list(
		SKILL_MELEE = 5,
		SKILL_PRECISION = 5,
		SKILL_SURVIVAL = 5,
		SKILL_MEDICINE = 5,
	)

	bonus_attributes = list(
		ATTRIBUTE_VITALITY = 5,
		ATTRIBUTE_INTELLIGENCE = 5,
		ATTRIBUTE_WISDOM = 5,
		ATTRIBUTE_DEXTERITY = 5,
	)

	ranks = list(
		"实习医生",
		"医生",
		"资深医生",
		"医疗主管"
	)

	job_flags = FLAG_JOB_HEALING
