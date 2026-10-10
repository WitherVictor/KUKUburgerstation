/experience/skill/
	experience_power = 1
	experience_multiplier = 1
	chargen_min_level = 5
	chargen_max_level = 25

//Warrior
/experience/skill/melee/ //ATTRIBUTE_STRENGTH
	//Each point of damage dealt = 1xp
	//Level 100 is 2 million xp.
	name = "近战"
	id = SKILL_MELEE
	desc = "成为你梦寐以求的忍者宅太空武士。"
	skill_for_examine = list(2, 15)
	desc_vague = "会影响你的伤害。"
	desc_extended = "你使用近战武器攻击的技巧。影响刀剑、棍棒，甚至工具箱造成的伤害。"
	tips = list(
		"按住 ALT 并点击敌人，可以使出重挥。\n重挥造成两倍伤害，但需要蓄力，并消耗一些体力。",
	)
	experience_power = 1.6
	experience_multiplier = 43

/experience/skill/prayer/ //ATTRIBUTE_CONSTITUTION
	//Each point of damage dealt or healed = 1xp
	name = "祈祷"
	id = SKILL_PRAYER
	desc = "对太空耶稣多一点信心。"
	skill_for_examine = 6
	desc_vague = "会影响你的部分法术。"
	desc_extended = "你向神明祈祷的技巧。影响祈祷类法术和能力的强度、施放速度及成功率。"
	experience_power = 1.6
	experience_multiplier = 43


/experience/skill/block/ //ATTRIBUTE_FORTITUDE
	//Each point of damage blocked = 1xp
	//Level 100 is 1 million xp.
	name = "格挡"
	id = SKILL_BLOCK
	desc = "你休想通过！"
	skill_for_examine = list(3, 7, 8)
	desc_vague = "会影响你的格挡。"
	desc_extended = "你使用武器或盾牌格挡攻击的技巧。影响用刀剑、小圆盾，甚至拳头成功格挡的概率。"
	tips = list(
		"进入格挡后的 1 秒内，若敌人攻击你，你会招架其攻击，免受所有伤害，并可能使对方昏迷。",
		"完美招架虽然能避免全部伤害，但不会提供格挡经验。",
	)
	experience_power = 1.6
	experience_multiplier = 28

/experience/skill/armor/ //ATTRIBUTE_FORTITUDE
	//Each point of damage blocked by armor = 1xp
	//Level 100 is 1 million xp.
	name = "护甲"
	id = SKILL_ARMOR
	desc = "尽你所能，接近不死之身。"
	skill_for_examine = 3
	desc_vague = "会影响你的护甲。"
	desc_extended = "你利用护甲抵挡攻击的技巧。"
	experience_power = 1.6
	experience_multiplier = 28

//Rogue 6

/experience/skill/ranged/ //ATTRIBUTE_DEXTERITY
	//Each point of damage dealt = 1xp
	//Level 100 is 2 million xp.
	name = "远程"
	id = SKILL_RANGED
	desc = "太空得克萨斯神枪手。"
	skill_for_examine = 4
	desc_vague = "会影响你的伤害。"
	desc_extended = "你使用远程武器攻击的技巧。影响弓、弩、枪械及投掷物的伤害和命中率。"
	experience_power = 1.6
	experience_multiplier = 43

/experience/skill/evasion/ //ATTRIBUTE_AGILITY
	//Each time you dodge = 1 xp
	name = "闪避"
	id = SKILL_EVASION
	desc = "“开启子弹时间，躲掉你的每一次攻击。”"
	skill_for_examine = 4
	desc_vague = "会影响你的闪避。"
	desc_extended = "你躲避来袭攻击的技巧。影响成功闪避近战武器、远程武器和魔法攻击的概率。"
	experience_power = 1.6
	experience_multiplier = 2.6

/experience/skill/unarmed/ //ATTRIBUTE_RESILIENCE
	//Each point of damage dealt = 1xp
	//Level 100 is 1 million xp.
	name = "徒手"
	id = SKILL_UNARMED
	desc = "砰————————！"
	skill_for_examine = 2
	desc_vague = "会影响你的伤害。"
	desc_extended = "你用拳头攻击的技巧。影响空手、指虎或动力拳套造成的伤害。"
	experience_power = 1.6
	experience_multiplier = 28

/experience/skill/survival //ATTRIBUTE_RESILIENCE
	name = "生存"
	id = SKILL_SURVIVAL
	desc = "可不会让你永生。"
	desc_extended = "你分析人物、物品或状况的技巧。影响发现陷阱和幻象的概率，以及查看事物时说明信息的详尽程度。"
	experience_power = 1.6
	experience_multiplier = 28


//Mage
/experience/skill/magic/ //ATTRIBUTE_INTELLIGENCE
	name = "魔法"
	id = SKILL_MAGIC
	desc = "别和巫术搞混了。"
	skill_for_examine = 6
	desc_vague = "会影响你的法术。"
	desc_extended = "你施放辅助和防御法术的技巧，例如召唤魔法。"
	experience_power = 1.6
	experience_multiplier = 43

/experience/skill/summoning //ATTRIBUTE_SOUL
	name = "召唤"
	id = SKILL_SUMMONING
	desc = "别和祈祷搞混了。"
	skill_for_examine = list(5, 30)
	desc_extended = "你施放召唤类魔法的技巧，例如召唤骷髅。"
	experience_power = 1.6
	experience_multiplier = 43

/experience/skill/summoning/get_examine_list(var/mob/living/examiner)
	tips = list("提升召唤等级可以增加召唤栏位。目前你能维持 [floor(max(1,1 + get_power(0,1,2)*3))] 个生物。")
	return ..()

/experience/skill/medicine/ //ATTRIBUTE_WILLPOWER
	name = "医疗"
	id = SKILL_MEDICINE
	desc = "外科手术还没实装呢！"
	skill_for_examine = 5
	desc_vague = "会影响你的治疗。"
	desc_extended = "你使用真正的药物治疗自己和他人的技巧。影响治疗耗时及绷带的治疗效果。"
	experience_power = 1.6
	experience_multiplier = 28

/experience/skill/precision/ //ATTRIBUTE_WILLPOWER
	//Each point of extra damage in a critical hit = 1xp
	//Level 100 is 1 million xp.
	name = "精准"
	id = SKILL_PRECISION
	desc = "精密度和准确度其实是两回事。"
	skill_for_examine = 7
	desc_vague = "会影响你的伤害。"
	desc_extended = "你击中生物和类人生物要害的技巧。影响暴击概率。"
	experience_power = 1.6
	experience_multiplier = 28
