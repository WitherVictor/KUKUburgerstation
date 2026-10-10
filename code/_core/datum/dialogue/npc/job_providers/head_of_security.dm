/dialogue/npc/head_of_security/


/dialogue/npc/head_of_security/get_dialogue_options(var/mob/living/advanced/player/P,var/list/known_options)

	. = list()

	.["hello"] = list(
		"欢迎来到军械库。任何人都可以在这里#1，我身后还有个#2，可以试试装备。如果你愿意，我也有权提供#4这个#3。",
		"purchase firearms",
		"firing range",
		"job",
		"security officer"
	)

	.["purchase firearms"] = list(
		"纳米传讯发现，货运技师要么懒得要命，要么动不动就宣布独立，所以干脆全开除了，换成售货机和半机械人。\
		想#1的话，用这里的#2给自己挑点好东西就行。这里也卖护甲和通用装备，记得都看看。",
		"purchase firearms",
		"vending machines"
	)

	.["vending machines"] = list(
		"很简单。点击想买的物品对应的按钮，机器就会自动售货并从你的账户扣款。不需要填表，也不用许可证。别忘了买弹药。"
	)

	.["job"] = list(
		"纳米传讯希望这场狗屁行动多少能有点组织，所以鼓励大家找个#1。我这里提供#2的职位。如果你对杀戮没那么感兴趣，其他主管也许有别的岗位。",
		"job",
		"security officer"
	)

	if(P.job == /job/security)
		.["security officer"] = list(
			"我有时候也会忘，不过你已经是#1了。",
			"security officer"
		)
	else
		.["security officer"] = list(
			"只要你愿意，我就能任命你为#1，没有最低要求。待遇不错，杀光这颗星球上的一切就能领工资。这个岗位可以晋升，助理可没这待遇。如果你已有岗位，这会替换原来的岗位。要来吗？NEWLINE#2NEWLINE#3",
			"security officer",
			"*Yes, become a security officer.",
			"*No, do not become a security officer."
		)

	.["*Yes, become a security officer."] = list(
		"根据授予我的职权，你现在正式成为#1了。恭喜，去大开杀戒吧。",
		"security officer"
	)

	.["*No, do not become a security officer."] = list(
		"随你。这个#1仍为你敞开。",
		"job"
	)

/dialogue/npc/head_of_security/set_topic(var/mob/living/advanced/player/P,var/topic)

	. = ..()

	if(topic == "*Yes, become a security officer." && P.job != /job/security)
		P.set_job(/job/security)
