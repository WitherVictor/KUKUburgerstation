/mob/living/proc/get_damage_description(var/mob/examiner)

	if(!health || health.health_max <= 0)
		return null

	var/list/damage_description = list()

	var/tox_mod = health.damage[TOX]/health.health_max
	if(tox_mod > 0.05)
		var/tox_description
		switch(tox_mod)
			if(0.05 to 0.25)
				tox_description = "<i>气色不佳</i>"
			if(0.25 to 0.5)
				tox_description = "病恹恹的"
			if(0.5 to 0.75)
				tox_description = "<b>病得不轻</b>"
			if(0.75 to 1)
				tox_description = "<b>病重虚弱</b>"
			if(1 to INFINITY)
				tox_description = "<u><b>病入膏肓</b></u>"
		damage_description += "<font color='green'>[tox_description]</font>"

	var/rad_mod = health.damage[RAD]/health.health_max
	if(rad_mod > 0.25)
		var/rad_description
		switch(rad_mod)
			if(0.25 to 0.5)
				rad_description = "受到辐射污染"
			if(0.5 to 0.75)
				rad_description = "<b>受到严重辐照</b>"
			if(0.75 to 1)
				rad_description = "<b>浑身带着放射性</b>"
			if(1 to INFINITY)
				rad_description = "<u><b>正在变异</b></u>"
		damage_description += "<font color='greenyellow'>[rad_description]</font>"

	if(!length(damage_description))
		return null

	var/prefix = "对方看起来"
	if(examiner == src)
		prefix = "你看起来"
	else
		switch(gender)
			if(MALE)
				prefix = "他看起来"
			if(FEMALE)
				prefix = "她看起来"

	var/div_class = "notice"
	switch(health.health_current/health.health_max)
		if(-INFINITY to 0.25)
			div_class = "danger"
		if(0.25 to 0.75)
			div_class = "warning"
		if(0.75 to INFINITY)
			div_class = "notice"

	return div(div_class,"[prefix][english_list(damage_description,"状态正常","、","，而且")]。")


/mob/living/get_examine_list(var/mob/examiner)

	var/object_icon = ICON_TO_HTML(icon,icon_state,32,32)
	. = list(
		div("examine_title","[object_icon][src.name]"),
		div("center bold","[level]级 [initial(src.name)]"),
		div("examine_description_long",src.desc_extended)
	)

	var/activity_text = get_activity_text()
	if(activity_text)
		. += activity_text

	var/damage_description = get_damage_description(examiner)
	if(damage_description)
		. += damage_description

/mob/living/proc/get_activity_text()

	if(dead)
		if(is_player_controlled())
			return div("danger","对方已经死亡，但或许还有一线生机。")
		else
			return div("warning","对方已经死亡，毫无生气，灵魂也已离去……")
	else if(!ai)
		if(ckey_last && !client)
			return div("warning","对方似乎患上了太空嗜睡症，或许很快就会恢复。")
		else if(client && client.inactivity >= SECONDS_TO_TICKS(60))
			return div("warning","对方似乎已经发呆了[TICKS_TO_SECONDS(client.inactivity)]秒，或许很快就会回过神来。")

	return null

/mob/living/get_examine_details_list(var/mob/examiner)

	. = ..()

	var/pronoun = get_pronoun_he_she_it(src)

	if(ai && ai.use_alerts)
		switch(ai.alert_level)
			if(ALERT_LEVEL_NOISE)
				. += div("warning","[pronoun]似乎正在寻找噪声的来源。")
			if(ALERT_LEVEL_CAUTION)
				. += div("warning","[pronoun]似乎正在寻找某个人。")
			if(ALERT_LEVEL_COMBAT)
				if(ai.objective_attack)
					. += div("danger","[pronoun]摆出了战斗姿态，似乎打算攻击[ai.objective_attack]！")
				else
					. += div("danger","[pronoun]摆出了战斗姿态！")

