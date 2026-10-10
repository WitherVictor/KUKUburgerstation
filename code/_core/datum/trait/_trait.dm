#define TRAIT_POSITIVE "positive"
#define TRAIT_NEGATIVE "negative"
#define TRAIT_NEUTRAL "neutral"

/trait/
	var/name
	var/desc
	var/category
	var/add_message
	var/remove_message

	var/trait_tag = TRAIT_NEUTRAL

/trait/proc/on_add(var/mob/living/L,var/messages=TRUE)

	if(messages)
		if(add_message)
			L.to_chat(span("notice [trait_tag]",add_message))

		L.to_chat(span("notice [trait_tag]","<b>获得新特质：</b>[name]！"))
		L.to_chat(span("notice","[desc]"))

	return TRUE

/trait/proc/on_remove(var/mob/living/L,var/messages=TRUE)


	if(messages)
		var/inverse = TRAIT_NEUTRAL
		if(trait_tag == TRAIT_POSITIVE)
			inverse = TRAIT_NEGATIVE
		else if(trait_tag == TRAIT_NEGATIVE)
			inverse = TRAIT_POSITIVE

		if(remove_message)
			L.to_chat(span("notice [inverse]",remove_message))

		L.to_chat(span("notice [inverse]","<b>失去特质：</b>[name]！"))

	return TRUE

/trait/unarmed/
	category = /trait/unarmed/ //TODO: Make this just add damage to all unarmed attacks.
	var/damagetype/damage_type

/trait/unarmed/shocking_touch
	name = "电击之触"
	desc = "基础徒手伤害攻击造成纯电击伤害，并有机会击晕目标。"

	add_message = "电流在你双手间流动。"
	remove_message = "你的双手不再涌动着能量……"

	damage_type = /damagetype/unarmed/fists/shock_touch

	trait_tag = TRAIT_POSITIVE

/trait/metabolism/
	category = /trait/metabolism/
	var/metabolism_multiplier = 1
	var/hunger_multiplier = 1
	var/thirst_multiplier = 1

/trait/metabolism/fast
	name = "快速代谢"
	desc = "血液中的试剂代谢速度变为两倍，但你更容易饥饿。"

	add_message = "你感觉新陈代谢变快了。"
	remove_message = "你的新陈代谢不再那么活跃……"

	metabolism_multiplier = 2
	hunger_multiplier = 1.5
	trait_tag = TRAIT_NEUTRAL

/trait/metabolism/none
	name = "无代谢"
	desc = "你没有新陈代谢，不会饥饿，试剂也不会在你体内代谢。"

	add_message = "不知为何，你感觉自己没有新陈代谢了……"
	remove_message = "你现在又有新陈代谢了。"

	metabolism_multiplier = 0
	hunger_multiplier = 0
	thirst_multiplier = 0
	trait_tag = TRAIT_NEUTRAL

/trait/metabolism/slow
	name = "缓慢代谢"
	desc = "血液中的试剂代谢速度减半，但你更不容易饥饿。"

	add_message = "你感觉新陈代谢变慢了。"
	remove_message = "你的新陈代谢不再那么缓慢……"

	metabolism_multiplier = 0.5
	hunger_multiplier = 0.75
	trait_tag = TRAIT_NEUTRAL

/trait/pain_tolerant/
	name = "耐痛"
	desc = "你不会因疼痛而尖叫。"

	add_message = "你觉得疼痛时也不必尖叫。"
	remove_message = "你觉得疼痛时还是需要尖叫……"

	trait_tag = TRAIT_POSITIVE

/trait/block_runner/
	name = "奔跑格挡"
	desc = "你能在奔跑时格挡，但站着不动时无法格挡。"
	trait_tag = TRAIT_NEUTRAL

	add_message = "等等……要是我跑步时举着盾呢？"
	remove_message = "你忘了自己可以举着盾跑步。"

/trait/flamability/
	category = /trait/flamability
	var/fire_stack_multiplier = 1

/trait/flamability/fire_retardant
	name = "阻燃"
	desc = "你似乎比一般人更不容易燃烧。"
	fire_stack_multiplier = 0.75
	trait_tag = TRAIT_POSITIVE

	add_message = "你的皮肤变得有些湿润。万一着火，这应该能派上用场……"
	remove_message = "你的皮肤不再那么湿润。"

/trait/flamability/flammable
	name = "易燃"
	desc = "你似乎很容易被点燃。"

	add_message = "你的皮肤感觉非常干燥，似乎一点就着……"
	remove_message = "你的皮肤不再那么干燥。"

	fire_stack_multiplier = 1.25
	trait_tag = TRAIT_NEGATIVE

/trait/death_check
	category = /trait/death_check
	var/extra_health = 0

/trait/death_check/tenacious
	name = "顽强"
	desc = "即使濒临死亡，你也从不轻易放弃。"

	add_message = "你充满了决心。"
	remove_message = "你不再像以前那样坚定。"


	extra_health = 50
	trait_tag = TRAIT_POSITIVE

/trait/death_check/quitter
	name = "轻言放弃"
	desc = "你似乎很容易放弃，尤其是快死的时候。"

	add_message = "你觉得快死时硬撑着也没什么意义，反正还能克隆什么的……"
	remove_message = "你不再像以前那样轻易放弃生命。"

	extra_health = -50
	trait_tag = TRAIT_NEGATIVE

/trait/bleed_multiplier
	category = /trait/bleed_multiplier
	var/bleed_multiplier

/trait/bleed_multiplier/paper_skin
	name = "纸薄皮肤"
	desc = "你似乎比大多数人更容易流血。"

	add_message = "你的皮肤感觉像纸一样脆弱……"
	remove_message = "你的皮肤不再那么脆弱。"

	bleed_multiplier = 1.5
	trait_tag = TRAIT_NEGATIVE

/trait/bleed_multiplier/hard_skin
	name = "坚韧皮肤"
	desc = "你的皮肤似乎比大多数人更不容易流血。"

	add_message = "你的皮肤明显变得更加坚韧。"
	remove_message = "你的皮肤不再那么坚韧。"

	bleed_multiplier = 0.75
	trait_tag = TRAIT_POSITIVE

/trait/blood_regen/
	category = /trait/blood_regen/
	var/regen_multiplier = 1

/trait/blood_regen/none
	name = "造血衰退"
	desc = "你的身体完全无法生成血液。"
	add_message = "你感觉自己贫血了……"
	remove_message = "你不再感到贫血。"
	regen_multiplier = 0
	trait_tag = TRAIT_NEGATIVE


/trait/blood_regen/blood_degen
	name = "贫血"
	desc = "你的造血速度大幅降低，血量不足时消耗的营养也更少。"
	add_message = "你感觉自己贫血了……"
	remove_message = "你不再感到贫血。"
	regen_multiplier = 0.25
	trait_tag = TRAIT_NEGATIVE

/trait/blood_regen/blood_regen
	name = "真性红细胞增多症"
	add_message = "你的静脉变粗，心脏怦怦直跳……看来身体现在能造出更多血了。"
	remove_message = "你不再感觉自己的身体能生成更多血液。"
	desc = "你的造血速度提高，血量不足时消耗的营养也更多。"
	regen_multiplier = 1.5
	trait_tag = TRAIT_POSITIVE

/trait/intoxication_regen/
	category = /trait/intoxication_regen/
	var/alcohol_threshold_multiplier = 1
	var/intoxication_removal_multiplier = 1
	var/should_apply_drunk_status_effects = TRUE
	var/reverse_intoxication = FALSE

/trait/intoxication_regen/reverse
	name = "反向醉酒"
	desc = "你需要酒精来维持状态。不知为何，缺少酒精反而让你醉得更厉害。"
	add_message = "你感觉自己离不开酒精。"
	remove_message = "你不再觉得自己依赖酒精。"
	alcohol_threshold_multiplier = 2
	should_apply_drunk_status_effects = TRUE
	reverse_intoxication = TRUE
	trait_tag = TRAIT_NEGATIVE


/trait/intoxication_regen/light_drinker
	name = "不胜酒力"
	desc = "你的酒量很小，醒酒也比较慢。"
	add_message = "你感觉自己不太能喝酒了……"
	remove_message = "你感觉自己的酒量恢复正常了。"
	alcohol_threshold_multiplier = 0.75
	intoxication_removal_multiplier = 0.5
	should_apply_drunk_status_effects = TRUE
	trait_tag = TRAIT_NEGATIVE

/trait/intoxication_regen/seasoned_drinker
	name = "老酒鬼"
	desc = "你的酒量很好，但醒酒比较慢。"
	add_message = "你感觉自己特别能喝。"
	remove_message = "你感觉自己的酒量恢复正常了。"
	alcohol_threshold_multiplier = 2
	intoxication_removal_multiplier = 0.5
	should_apply_drunk_status_effects = FALSE
	trait_tag = TRAIT_POSITIVE

/trait/general_regen/
	category = /trait/general_regen/
	var/health_regen_mul = 1
	var/stamina_regen_mul = 1
	var/mana_regen_mul = 1

/trait/general_regen/mind_over_matter
	name = "精神至上"
	desc = "你的法力恢复量变为两倍，但生命恢复量减半。"
	add_message = "你的大脑感觉很专注，但心脏……就不太行了。"
	remove_message = "你的身心重新协调起来。"
	health_regen_mul = 0.5
	mana_regen_mul = 2
	trait_tag = TRAIT_NEUTRAL

/trait/general_regen/jock
	name = "专注体能"
	desc = "你的体力恢复量变为两倍，但法力恢复量减半。"
	add_message = "你的体力更充沛了，但脑子……呃……那个词怎么说来着……嗯……"
	remove_message = "你的身心重新协调起来。"
	stamina_regen_mul = 2
	mana_regen_mul = 0.5
	trait_tag = TRAIT_NEUTRAL

/trait/general_regen/nerd
	name = "专注精神"
	desc = "你的法力恢复量变为两倍，但体力恢复量减半。"
	add_message = "你的大脑感觉很专注，但身体……就不太行了。"
	remove_message = "你的身心重新协调起来。"
	stamina_regen_mul = 0.5
	mana_regen_mul = 2
	trait_tag = TRAIT_NEUTRAL

/trait/speed/
	category = /trait/speed/
	var/move_delay_mul = 1

/trait/speed/slow
	name = "迟缓"
	desc = "你更喜欢慢慢来。"
	add_message = "你觉得一切都太快了……偶尔慢慢走不好吗？"
	remove_message = "你感觉按正常速度移动挺舒服。"
	move_delay_mul = 1.1
	trait_tag = TRAIT_NEGATIVE

/trait/speed/quick
	name = "迅捷"
	desc = "你身手矫健、行动迅速，移动速度获得加成。"
	add_message = "你渴望速度。"
	remove_message = "你不再觉得速度是件好事。"
	move_delay_mul = 0.9
	trait_tag = TRAIT_POSITIVE

/trait/nutrition/
	category = /trait/nutrition/
	var/nutrition_multiplier = 1

/trait/nutrition/malnutrition
	name = "营养不良"
	desc = "你的饮食很差，营养质量受到减益。"
	add_message = "你感觉虚弱又疲惫……"
	remove_message = "你现在感觉好多了。"
	nutrition_multiplier = 0.9
	trait_tag = TRAIT_NEGATIVE

/trait/nutrition/vigorous
	name = "精力充沛"
	desc = "你的饮食良好，营养质量获得加成。"
	add_message = "你感觉身体充满了生机与活力。"
	remove_message = "嗯，你现在感觉普普通通。"
	nutrition_multiplier = 1.1
	trait_tag = TRAIT_POSITIVE


/trait/handcuffs/
	category = /trait/handcuffs
	var/handcuff_escape_multiplier = 1

/trait/handcuffs/escape_artist
	name = "脱逃大师"
	desc = "你能更快、更轻松地挣脱手铐。"
	add_message = "我能挣脱这副手铐。"
	remove_message = "你无法轻松挣脱那副手铐了。"
	handcuff_escape_multiplier = 2
	trait_tag = TRAIT_POSITIVE


/trait/vitality
	category = /trait/vitality
	var/health_add = 0
	var/health_mul = 1

/trait/vitality/strong
	name = "健壮"
	desc = "你的生命值增加20，并提高5%。"
	add_message = "你感觉更强壮了。"
	remove_message = "你感觉恢复了平常的状态。"
	health_add = 20
	health_mul = 1.05
	trait_tag = TRAIT_POSITIVE

/trait/vitality/fragile
	name = "脆弱"
	desc = "你的生命值减少20，并降低5%。"
	add_message = "你感觉更虚弱了。"
	remove_message = "你感觉恢复了平常的状态。"
	health_add = 20
	health_mul = 1.05
	trait_tag = TRAIT_NEGATIVE
