/job/janitor
	name = "保洁员"
	desc = "岗位说明。"

	passive_income = 0
	passive_income_bonus = 200 //Per rank

	bonus_skills = list(
		SKILL_MELEE = 5,
		SKILL_RANGED = 5,
		SKILL_SURVIVAL = 5,
		SKILL_EVASION = 5,
	)

	bonus_attributes = list(
		ATTRIBUTE_STRENGTH = 5,
		ATTRIBUTE_CONSTITUTION = 5,
		ATTRIBUTE_RESILIENCE = 5,
		ATTRIBUTE_AGILITY = 5
	)

	ranks = list(
		"见习保洁员",
		"保洁员",
		"资深保洁员",
		"保洁主管"
	)

	job_flags = FLAG_JOB_CLEANING
