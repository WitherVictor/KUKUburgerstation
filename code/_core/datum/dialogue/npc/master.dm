/dialogue/npc/master/

/dialogue/npc/master/get_dialogue_options(var/mob/living/advanced/player/P,var/list/known_options)

	. = list()

	.["hello"] = list(
		"欢迎来到#1。你是来参加我们的#2，还是来办理#3或#4？",
		"*Recruitment Office",
		"*Prestige Program",
		"*Reward Redemption",
		"*Experience Redemption"
	)

	.["*Recruitment Office"] = list(
		"这里是招募办公室，专门招募优秀的纳米传讯特工，参加#1等特别项目。你有兴趣吗？",
		"*Prestige Program"
	)

	.["*Prestige Program"] = list(
		"转生计划（简称 PP）是一项合法性存疑的实验性脑部手术。它会压缩大脑的某些区域，\
		让你能够对某项技能有更深入的理解。代价是你必须重新学习这项技能，但学成之后，你就能掌握得更好！NEWLINENEWLINE\
		那么，准备好参加转生计划了吗？只有精通某项技能的人才有资格！NEWLINENEWLINE\
		#1 NEWLINE\
		#2",
		"*Yes, enter the prestige program",
		"*No, do not enter the prestige program"
	)

	.["*No, do not enter the prestige program"] = list("真遗憾。你随时都可以来参加。")

	.["*Yes, enter the prestige program"] = list("……")

	.["*Reward Redemption"] = list(
		"请悄悄告诉我暗号，领取你的奖励。"
	)
	.["*Experience Redemption"] = list(
		"请选择要兑换的经验。"
	)

	.["*rewardfail"] = list(
		"你输入的奖励码似乎无效。",
	)

	.["*rewardsuccess"] = list(
		"好好享用你的奖励！",
	)

/dialogue/npc/master/set_topic(var/mob/living/advanced/player/P,var/topic)

	. = ..()

	switch(topic)
		if("*Yes, enter the prestige program")
			P.dialogue_target_id = null
			close_menu(P,/menu/dialogue/)
			try_prestige(P)
		if("*Reward Redemption")
			var/desired_input = input("请输入奖励码。奖励码区分大小写。","奖励码") as text
			desired_input = sanitize(desired_input)
			if(desired_input && SSreward.check_code(P.client,desired_input))
				set_topic(P,"*rewardsuccess")
			else
				set_topic(P,"*rewardfail")
		if("*Experience Redemption")
			var/savedata/client/globals/G = GLOBALDATA(P.ckey)
			if(!G)
				P.to_chat(span("danger","你的全局数据似乎出了问题！请在 Discord 上向 burger 报告！"))
				return FALSE
			var/list/data_to_use = G.loaded_data["stored_experience"]
			if(length(data_to_use))
				var/list/choice_list = list()
				for(var/k in data_to_use)
					var/v = data_to_use[k]
					var/experience/E = SSexperience.all_attributes[k] ? SSexperience.all_attributes[k] : SSexperience.all_skills[k]
					choice_list["[E ? E.name : k]：[v]点经验"] = k
				var/desired_experience = input("你想兑换哪种经验？","经验兑换") as null|anything in choice_list
				if(desired_experience)
					desired_experience = choice_list[desired_experience]
					var/experience/selected_experience = SSexperience.all_attributes[desired_experience] ? SSexperience.all_attributes[desired_experience] : SSexperience.all_skills[desired_experience]
					var/experience_name = selected_experience ? selected_experience.name : desired_experience
					var/desired_redeem_amount = input("你想兑换多少[experience_name]经验？（最多：[data_to_use[desired_experience]]）","[experience_name]经验兑换") as num
					if(desired_redeem_amount && desired_redeem_amount > 0)
						desired_redeem_amount = min(desired_redeem_amount,data_to_use[desired_experience])
						if(P.attributes[desired_experience])
							desired_redeem_amount = P.add_attribute_xp(desired_experience,desired_redeem_amount,FALSE)
							G.loaded_data["stored_experience"][desired_experience] -= desired_redeem_amount
							P.to_chat(span("notice","你兑换了[desired_redeem_amount]点[experience_name]属性经验，现存经验为[G.loaded_data["stored_experience"][desired_experience]]点。"))
						else if(P.skills[desired_experience])
							desired_redeem_amount = P.add_skill_xp(desired_experience,desired_redeem_amount,FALSE)
							G.loaded_data["stored_experience"][desired_experience] -= desired_redeem_amount
							P.to_chat(span("notice","你兑换了[desired_redeem_amount]点[experience_name]技能经验，现存经验为[G.loaded_data["stored_experience"][desired_experience]]点。"))

						else
							P.to_chat(span("notice","出了点问题。请在 Discord 上向 burger 报告，并附上错误码：1.[desired_experience].[desired_redeem_amount]。"))
					else
						P.to_chat(span("notice","你决定暂不兑换。"))
				else
					P.to_chat(span("notice","你决定暂不兑换。"))
				set_topic(P,"*rewardsuccess")
			else
				P.to_chat(span("notice","你可以在这里将扮演对抗角色获得的经验兑换给任意角色。扮演过对抗角色后再来吧！"))



/dialogue/npc/master/proc/try_prestige(mob/living/advanced/player/prestiger)

	var/list/valid_skills = list()
	var/experience/skill_to_prestige

	for(var/k in prestiger.skills)
		skill_to_prestige = prestiger.skills[k]
		if(skill_to_prestige.get_max_level() > skill_to_prestige.get_current_level())
			continue
		valid_skills += skill_to_prestige

	if(!length(valid_skills))
		prestiger.to_chat(span("warning","你没有符合转生条件的技能！等某项技能达到转生要求后再来吧。"))
		return FALSE

	valid_skills += "取消"

	var/desired_choice = input("确定要参加转生计划吗？所选技能的等级将重置为本次转生后的转生次数乘以5，等级上限提高5级。","转生计划","取消") as null|anything in valid_skills
	if(!desired_choice || desired_choice == "取消")
		prestiger.to_chat(span("notice","你决定暂不转生。"))
		return FALSE

	skill_to_prestige = desired_choice
	if(skill_to_prestige.get_max_level() <= skill_to_prestige.get_current_level())
		prestiger.prestige(skill_to_prestige.id)
		return TRUE
