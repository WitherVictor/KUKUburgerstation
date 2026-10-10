//Ideal format:
//NameOfTopic_"Dialogue #1 #2 #3"_Link1Topic_Link2Topic_Link3Topic

/dialogue/
	var/list/topic_display_names = list(
		"hello" = "你好",
		"job" = "岗位",
		"assistant" = "助理",
		"promotion" = "晋升",
		"retirement" = "退休",
		"engineer" = "工程师",
		"medical doctor" = "医生",
		"security officer" = "安保员",
		"clown" = "小丑",
		"purchase materials" = "购买材料",
		"purchase firearms" = "购买枪械",
		"vending machines" = "自动售货机",
		"firing range" = "射击场",
		"Her" = "祂",
		"wisdom" = "智慧",
		"*Yes, become an assistant." = "是，成为助理。",
		"*No, do not become an assitant." = "否，不成为助理。",
		"*Yes, become an engineer." = "是，成为工程师。",
		"*No, do not become an engineer." = "否，不成为工程师。",
		"*Yes, become a medical doctor." = "是，成为医生。",
		"*No, do not become a medical doctor." = "否，不成为医生。",
		"*Yes, become a security officer." = "是，成为安保员。",
		"*No, do not become a security officer." = "否，不成为安保员。",
		"*Yes, become a clown." = "是，成为小丑。",
		"*No, do not become a clown." = "否，不成为小丑。",
		"*Yes, retire and spend out the rest of your days being miserable over the fact that you don't have a job." = "是，退休，在失业的苦闷中度过余生。",
		"*No, do not retire and continue to be happy that NanoTrasen provides." = "否，继续享受纳米传讯给予的幸福。",
		"Bandalf the Right" = "永远正确的班达尔夫",
		"Wizard Federation" = "巫师联邦",
		"magic" = "魔法",
		"ban" = "封禁",
		"Simpleton" = "愚人",
		"gold" = "金币",
		"*learn about taxes" = "了解税务",
		"*pay your taxes" = "缴税",
		"pay your taxes" = "缴税",
		"*Yes, pay taxes." = "是，缴税。",
		"*No, do not pay taxes." = "否，不缴税。",
		"*stop following me" = "停止跟随我",
		"*follow me" = "跟我来",
		"*Stop following me." = "停止跟随我。",
		"*Follow me." = "跟我来。",
		"*handcuffs" = "手铐",
		"*supply crates" = "补给箱",
		"*deathbox services" = "死亡遗物箱服务",
		"*reclaim deathbox" = "取回死亡遗物箱",
		"*access your bank" = "访问银行",
		"*sell items" = "出售物品",
		"*create new mech" = "创建新机甲",
		"*load existing mech" = "取出已存放的机甲",
		"*about" = "关于",
		"*main menu" = "主菜单",
		"*Yes, make new mech." = "是，创建新机甲。",
		"*No, I do not want a new mech." = "否，不创建新机甲。",
		"*Yes, load my mech." = "是，取出我的机甲。",
		"*No, do not load my mech." = "否，不取出我的机甲。",
		"*Recruitment Office" = "招募办公室",
		"*Prestige Program" = "转生计划",
		"*Reward Redemption" = "奖励兑换",
		"*Experience Redemption" = "经验兑换",
		"*Yes, enter the prestige program" = "是，参加转生计划",
		"*No, do not enter the prestige program" = "否，不参加转生计划",
		"*rewardfail" = "兑换失败",
		"*rewardsuccess" = "兑换成功",
		"blood contracts" = "血契",
		"purchase a blood contract" = "购买血契",
		"turn in a blood contract" = "交付血契",
		"*success" = "成功",
		"*failure" = "失败",
		"*fail" = "失败",
		"email messages" = "电子邮件",
		"*login name" = "登录名",
		"*Aurora Station" = "极光站",
		"*Citadel Station" = "堡垒站",
		"*TG Station" = "TG站",
		"*Colonial Marines" = "殖民地陆战队",
		"*Paradise Station" = "天堂站",
		"*AuStation 13" = "澳洲站13",
		"*Goonstation" = "Goon站",
		"*Baystation" = "海湾站",
		"*Burgerstation" = "汉堡站",
		"*purchase requisition sheet" = "购买采购申请单",
		"*purchase catalogue" = "购买货运目录",
		"*Yes, purchase a requisition sheet." = "是，购买采购申请单。",
		"*No, do not purchase a requisition sheet." = "否，不购买采购申请单。",
		"*Yes, purchase a catalogue." = "是，购买货运目录。",
		"*No, do not purchase a catalogue." = "否，不购买货运目录。",
		"*challenge" = "挑战",
		"*burger challenge" = "汉堡挑战",
		"take the burger challenge" = "接受汉堡挑战",
		"employment" = "工作",
		"NanoTrasen" = "纳米传讯",
		"Burgerstation" = "汉堡站",
		"get to work" = "开始工作",
		"Corporate Mercenary" = "企业雇佣兵",
		"Syndicate" = "辛迪加",
		"credits" = "信用点",
		"bonuses" = "奖金",
		"shuttle" = "穿梭机",
		"Arrivals Shuttle" = "抵达穿梭机",
		"Hanger Shuttles" = "机库穿梭机",
		"armory" = "军械库",
		"planetside" = "行星地表",
		"Central Command" = "中央指挥部"
	)

/dialogue/proc/get_dialogue_options(var/mob/living/advanced/player/P,var/list/known_options)
	return list()

/dialogue/proc/set_topic(var/mob/living/advanced/player/P,var/topic) //When you click on a dialogue option. topic var should be unsanitized

	if(!topic)
		CRASH("No topic arg presented!")

	var/savedata/client/mob/mobdata = MOBDATA(P.ckey_last)
	var/menu/M = get_menu(/menu/dialogue/)

	var/list/known_options = mobdata.loaded_data["known_topics"] //Optional

	var/list/dialogue_options = get_dialogue_options(P,known_options)
	if(!length(dialogue_options))
		log_error("Dialogue Error: [P.get_debug_name()] found no dialogue options for dialogue [type]:[topic]!")
		return FALSE

	var/list/chosen_dialogue = dialogue_options[topic]
	if(!length(chosen_dialogue))
		log_error("Dialogue Error: [P.get_debug_name()] cannot access [type]:[topic]!")
		return FALSE

	var/dialogue = chosen_dialogue[1]

	var/final_topic = "[topic]_[dialogue]"

	for(var/i=2,i<=length(chosen_dialogue),i++)

		final_topic += "_[chosen_dialogue[i]]"

		var/first_letter = copytext(chosen_dialogue[i],1,2)

		if(first_letter != "*")
			mobdata.loaded_data["known_topics"] |= chosen_dialogue[i]

	if(topic == "hello")
		for(var/k in dialogue_options & known_options)
			final_topic += "_[k]"

	M.run_function(P,"set_topic_labels",json_encode(topic_display_names))
	M.run_function(P,"set_topic","\"[url_encode(final_topic)]\"")

	return TRUE
