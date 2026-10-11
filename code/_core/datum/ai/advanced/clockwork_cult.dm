/ai/advanced/clockwork_cult


/ai/advanced/clockwork_cult/on_damage_received(var/atom/atom_damaged,var/atom/attacker,var/atom/weapon,var/damagetype/DT,var/list/damage_table,var/damage_amount,var/critical_hit_multiplier,var/stealthy=FALSE)

	. = ..()

	if(damage_amount >= 10 && . && prob(25))
		var/list/responses = list(
			"拉特瓦尔会庇护我！",
			"你的灵魂将与拉特瓦尔融为一体！",
			"我们很快就会为拉特瓦尔复仇！",
			"把你扔进齿轮里！"
		)
		owner.do_say(pick(responses),language_to_use = LANGUAGE_CLOCKWORK)

/ai/advanced/clockwork_cult/on_alert_level_changed(var/old_alert_level,var/new_alert_level,var/atom/alert_source)

	. = ..()

	if(. && prob(25))
		var/list/responses = list()
		if(old_alert_level == ALERT_LEVEL_COMBAT && new_alert_level == ALERT_LEVEL_CAUTION)
			responses = list(
				"他们躲避着光明。",
				"我们必须把他们拖入光明……",
				"光明很快就会带走你……",
				"他们藏在哪里？"
			)
		else if(old_alert_level == ALERT_LEVEL_COMBAT && new_alert_level == ALERT_LEVEL_NONE)
			responses = list(
				"你的灵魂还算有价值。",
				"拉特瓦尔自会用上你。",
				"你很快就会加入我们。",
				"献给拉特瓦尔的祭品。"
			)
		else if(old_alert_level == ALERT_LEVEL_CAUTION && new_alert_level == ALERT_LEVEL_COMBAT)
			responses = list(
				"投入光明吧！",
				"你将侍奉拉特瓦尔！",
				"献给他的祭品！",
				"必要时，我会把你拖进齿轮里！"
			)
		else if(old_alert_level == ALERT_LEVEL_NONE && new_alert_level == ALERT_LEVEL_NOISE)
			responses = list(
				"附近有一个灵魂。",
				"我听见了灵魂的声音……",
				"那是灵魂吗？",
				"那是什么？灵魂？"
			)
		else if(new_alert_level == ALERT_LEVEL_NOISE)
			responses = list(
				"他们逃跑了吗？他们退缩了吗？",
				"声音是从哪里传来的？",
				"走进光明吧……",
				"光明很快就会带走你……"
			)
		else if(new_alert_level == ALERT_LEVEL_NONE)
			responses = list(
				"什么也没有。",
				"这里没有灵魂。"
			)

		if(length(responses))
			owner.do_say(pick(responses),language_to_use = LANGUAGE_CLOCKWORK)

