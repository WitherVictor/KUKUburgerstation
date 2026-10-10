/dialogue/npc/chargen_computer/

/dialogue/npc/chargen_computer/get_dialogue_options(var/mob/living/advanced/player/P,var/list/known_options)

	var/list/dialogue_options = list()


	if(known_options["email messages"])
		dialogue_options["hello"] = list(
			"你已成功以[P.real_name]的身份登录。你有九封新#1。",
			"email messages"
		)
	else
		dialogue_options["hello"] = list(
			"欢迎使用 IMB v0.6.3 家庭版。请输入#1以继续。",
			"*login name"
		)

	dialogue_options["*login name"] = list(
		"处理中……"
	)

	dialogue_options["*fail"] = list(
		"登录失败。请输入#1。",
		"*login name"
	)

	dialogue_options["*success"] = list(
		"你已成功以[P.real_name]的身份登录。你有九封新#1。",
		"email messages"
	)

	dialogue_options["email messages"] = list(
		"你收到了以下各站发来的邮件：#1、#2、#3、#4、#5、#6、#7、#8、#9",
		"*Aurora Station",
		"*Citadel Station",
		"*TG Station",
		"*Colonial Marines",
		"*Paradise Station",
		"*AuStation 13",
		"*Goonstation",
		"*Baystation",
		"*Burgerstation"
	)

	dialogue_options["*Aurora Station"] = list(
		"邮件内容如下：NEWLINE\
		[P.real_name]，你好：NEWLINE\
		很遗憾，你向极光站提交的求职申请已被拒绝。NEWLINE\
		原因：称一名塔亚拉为纳粹。下次请尊重极光站的背景设定，并理解塔亚拉不是纳粹，而是自豪的共产主义者。NEWLINE\
		邮件结束。"
	)

	dialogue_options["*Citadel Station"] = list(
		"邮件内容如下：NEWLINE\
		[P.real_name]，你好：NEWLINE\
		很遗憾，你向堡垒站提交的求职申请已被拒绝。NEWLINE\
		原因：举报了一名试图操伊恩的船员。这里不允许羞辱他人的性癖，尤其不允许针对堡垒站管理人员。NEWLINE\
		邮件结束。"
	)

	dialogue_options["*TG Station"] = list(
		"邮件内容如下：NEWLINE\
		[P.real_name]，你好：NEWLINE\
		很遗憾，你向 TG站提交的求职申请已被拒绝。NEWLINE\
		原因：拿工具箱砸我的猫娘女友。被问话时，你说所有猫娘其实都是男的。这根本不可能，因为我不是同性恋，所以她不可能是男的。NEWLINE\
		邮件结束。"
	)

	dialogue_options["*Colonial Marines"] = list(
		"邮件内容如下：NEWLINE\
		[P.real_name]，你好：NEWLINE\
		很遗憾，你向殖民地陆战队提交的求职申请已被拒绝。NEWLINE\
		原因：异形入侵期间，你独自闯入主巢，击败了异形女王及其手下。这种行为完全不可接受，因为它不符合角色扮演冲突应逐步升级的规则。NEWLINE\
		邮件结束。"
	)

	dialogue_options["*Paradise Station"] = list(
		"邮件内容如下：NEWLINE\
		[P.real_name]，你好：NEWLINE\
		很遗憾，你向天堂站提交的求职申请已被拒绝。NEWLINE\
		原因：当被问到最想操《星际火狐》里的哪个角色时，你说自己对《星际火狐》没那么感兴趣。这显然是在攻击兽迷，这里绝不容忍这种态度。NEWLINE\
		邮件结束。"
	)

	dialogue_options["*AuStation 13"] = list(
		"邮件内容如下：NEWLINE\
		[P.real_name]，你好：NEWLINE\
		很遗憾，你向澳洲站13提交的求职申请已被拒绝。NEWLINE\
		原因：狗东西NEWLINE\
		邮件结束。"
	)

	dialogue_options["*Goonstation"] = list(
		"邮件内容如下：NEWLINE\
		[P.real_name]，你好：NEWLINE\
		很遗憾，你向 Goon站提交的求职申请已被拒绝。NEWLINE\
		原因：未提供。NEWLINE\
		附件：#1。NEWLINE\
		邮件结束。",
		"*fart.ogg"
	)

	dialogue_options["*Baystation"] = list(
		"邮件内容如下：NEWLINE\
		[P.real_name]，你好：NEWLINE\
		很遗憾，你向海湾站提交的求职申请已被拒绝。NEWLINE\
		原因：只写了两段角色描述。角色描述至少要有十一段。下次请先读规则。NEWLINE\
		邮件结束。"
	)

	dialogue_options["*Burgerstation"] = list(
		"邮件内容如下：NEWLINE\
		[P.real_name]，你好：NEWLINE\
		很高兴通知你，你向汉堡站提交的求职申请已获批准！NEWLINE\
		你的下一班将在一小时后开始。请穿着标准灰色制服准时到岗。NEWLINE\
		邮件结束。"
	)

	dialogue_options["*fart.ogg"] = list(
		"正在播放：fart.ogg……"
	)

	return dialogue_options

/dialogue/npc/chargen_computer/set_topic(var/mob/living/advanced/player/P,var/topic)

	. = ..()

	switch(topic)
		if("*login name")
			var/desired_name = input("请输入你的法定姓名，并确认拼写正确。","登录名") as text|null
			if(!desired_name)
				return
			if(P.client)
				desired_name = police_input(P.client,desired_name, max_length = 32, capitalize = TRUE)
			if(!desired_name)
				return
			var/list/login_confirmation01 = list("等等，不对。" = "Wait, no.","是的。" = "Yes.")
			var/confirm01 = input("你的姓名是“[desired_name]”。正确吗？","登录名") in login_confirmation01
			if(!confirm01 || login_confirmation01[confirm01] == "Wait, no.")
				set_topic(P,"*fail")
				return .
			var/list/login_confirmation02 = list("等一下。" = "Hold up.","对，我说过了。" = "Yes, I said.")
			var/confirm02 = input("确定你的姓名是“[desired_name]”吗？","登录名") in login_confirmation02
			if(!confirm02 || login_confirmation02[confirm02] == "Hold up.")
				set_topic(P,"*fail")
				return .
			var/list/login_confirmation03 = list("哦，等等。" = "Oh.","对，你这破烂 IMB。" = "Yes, you IMB piece of shit.")
			var/confirm03 = input("你输入的登录名是“[desired_name]”。确定没有错吗？","登录名") in login_confirmation03

			if(!confirm03 || login_confirmation03[confirm03] == "Oh.")
				set_topic(P,"*fail")
				return .

			P.real_name = desired_name
			P.setup_name()
			set_topic(P,"*success")

		if("*fart.ogg")
			play('sounds/ui/rasp.ogg',P, sound_setting = SOUND_SETTING_UI)

		if("*skill-sheet-forum.pdf")
			for(var/obj/structure/interactive/localmachine/snowflake/paper/O in range(3,P))
				O.set_icon_state_mob(P,"paper_normal")

		if("*Burgerstation")
			var/savedata/client/mob/mobdata = MOBDATA(P.ckey_last)
			mobdata.loaded_data["known_topics"] += "Burgerstation"
			P.to_chat(span("thought","我的班次一小时后开始！得检查一下准备好了没有，然后赶下一班穿梭机！"))
