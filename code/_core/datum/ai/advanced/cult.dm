/ai/advanced/cult


/ai/advanced/cult/on_damage_received(var/atom/atom_damaged,var/atom/attacker,var/atom/weapon,var/damagetype/DT,var/list/damage_table,var/damage_amount,var/critical_hit_multiplier,var/stealthy=FALSE)

	. = ..()

	if(damage_amount >= 10 && . && prob(25))
		var/list/responses = list(
			"你会付出代价的！",
			"血祭血神！",
			"去死吧！",
			"我的鲜血又回来了！"
		)
		owner.do_say(pick(responses),language_to_use = LANGUAGE_CULT)

/ai/advanced/cult/on_alert_level_changed(var/old_alert_level,var/new_alert_level,var/atom/alert_source)

	. = ..()

	if(. && prob(25))
		var/list/responses = list()
		if(old_alert_level == ALERT_LEVEL_COMBAT && new_alert_level == ALERT_LEVEL_CAUTION)
			responses = list(
				"他们藏在阴影中。",
				"他们究竟在哪里？",
				"我看不见……",
				"他们藏在哪里？"
			)
		else if(old_alert_level == ALERT_LEVEL_COMBAT && new_alert_level == ALERT_LEVEL_NONE)
			responses = list(
				"又一个献给血神的祭品。",
				"献祭完成！",
				"死亡与毁灭。",
				"上好的祭品。"
			)
		else if(old_alert_level == ALERT_LEVEL_CAUTION && new_alert_level == ALERT_LEVEL_COMBAT)
			responses = list(
				"你藏不住了！",
				"我看见了你的末日！",
				"值得献上的祭品！",
				"找到你了！"
			)
		else if(old_alert_level == ALERT_LEVEL_NONE && new_alert_level == ALERT_LEVEL_NOISE)
			responses = list(
				"附近有什么东西……",
				"你听见生命的声音了吗？",
				"有什么东西正在靠近。",
				"我听见了……"
			)
		else if(new_alert_level == ALERT_LEVEL_NOISE)
			responses = list(
				"我不会怀疑自己的耳目。",
				"死亡将至……",
				"速战速决……",
				"阴影不属于你……"
			)
		else if(new_alert_level == ALERT_LEVEL_NONE)
			responses = list(
				"什么也没有。白费力气。",
				"浪费时间。"
			)

		if(length(responses))
			owner.do_say(pick(responses),language_to_use = LANGUAGE_CULT)

