/dialogue/tutorial/front_desk

/dialogue/tutorial/front_desk/get_dialogue_options(var/mob/living/advanced/player/P,var/list/known_options)

	var/list/dialogue_options = list()

	var/area/A = get_area(P)

	var/is_on_burgerstation = istype(A,/area/burgerstation)

	if(is_on_burgerstation)
		dialogue_options["hello"] = list(
			"你好，我是半机械人助理 MK1。我会解答你在#2的#3从事#1时遇到的各种问题！\
			如果没有问题，请#4。",
			"employment",
			"NanoTrasen",
			"Burgerstation",
			"get to work",
			"*Reward Redemption",
			"*Experience Redemption"
		)
	else
		dialogue_options["hello"] = list(
			"你好，我是半机械人助理 MK1。有什么可以帮你？想了解你的#1、#2，还是#3？",
			"employment",
			"NanoTrasen",
			"Burgerstation"
		)

	dialogue_options["employment"] = list(
		"你目前受雇在#2担任#1。你的主要任务是向#3的敌人开火，目前的敌人就是#4。你大约每十分钟会收到一次#5工资，\
		并根据工作表现获得额外的#6。",
		"Corporate Mercenary",
		"Burgerstation",
		"NanoTrasen",
		"Syndicate",
		"credits",
		"bonuses"
	)

	dialogue_options["credits"] = list(
		"信用点是这个星区的通用货币，所有殖民地、舰船和太空站都用它购买商品和服务。\
		你应聘#1时，系统已用你的姓名与 DNA 哈希自动开立免费银行账户，不必操心任何法律手续！",
		"NanoTrasen"
	)

	dialogue_options["bonuses"] = list(
		"回收资产或在站内开展研究，都能获得奖金。在行星地表找到的资产应运回站内，交给货运系统，\
		以便转售、再利用或改作他用。研究可以在#1的科研区进行。完成这些工作能让你获得额外的#2。",
		"Burgerstation",
		"credits"
	)

	dialogue_options["NanoTrasen"] = list(
		"这是你我效力的公司。对#1来说，我们是全世界规模最大、最最棒的雇主！",
		"Corporate Mercenary"
	)

	dialogue_options["Syndicate"] = list(
		"辛迪加是一个邪恶、无耻、腐败的恐怖组织，由邪恶、无耻、腐败的恐怖分子组成。按照你的#1要求，\
		你必须使用致命武力消灭一切辛迪加活动。",
		"employment"
	)

	if(is_on_burgerstation)
		dialogue_options["Burgerstation"] = list(
			"汉堡站就是你现在所在的太空站。请尽快#1，支援下方的同伴！",
			"get to work"
		)
	else
		dialogue_options["Burgerstation"] = list(
			"汉堡站是本航站的目的地。请尽快登上#1，以便#2！",
			"shuttle",
			"get to work"
		)

	if(is_on_burgerstation)
		dialogue_options["shuttle"] = list(
			"你是指#1，还是#2？",
			"Arrivals Shuttle",
			"Hanger Shuttles"
		)

		dialogue_options["Hanger Shuttles"] = list(
			"机库穿梭机位于站内最西侧。前往#2之前，务必先到#1准备装备！",
			"armory",
			"planetside"
		)

		dialogue_options["Arrivals Shuttle"] = list(
			"抵达穿梭机就是你从#1来到本站时乘坐的那艘。它可以往返#2与#3，但程序规定它会停靠在#4，\
			直到有有机生命体登船才会出发。",
			"Central Command",
			"Burgerstation",
			"Central Command",
			"Burgerstation"
		)
		dialogue_options["Central Command"] = list(
			"中央指挥部是文明世界与#1之间的纽带。你目前在#2，受雇期间应当留在这里。",
			"Burgerstation",
			"Burgerstation"
		)
	else
		dialogue_options["shuttle"] = list(
			"穿梭机将新船员从#2送往#1。请现在登船，以便#3。",
			"Burgerstation",
			"Central Command",
			"get to work"
		)
		dialogue_options["Central Command"] = list(
			"中央指挥部是文明世界与#1之间的纽带。你现在就在中央指挥部！",
			"Burgerstation"
		)

	dialogue_options["Corporate Mercenary"] = list(
		"你的#1可以概括为：一个拿枪的有机生命体，以#2的名义射杀其他拿枪的有机生命体。法律上叫武装承包人员，不过我们觉得那名字不够霸气。",
		"employment",
		"NanoTrasen"
	)

	dialogue_options["get to work"] = list(
		"聪明的#1首先得是装备齐全的#2。你可以先四处看看，再前往#3。\
		在那里准备好装备，然后前往#4，协助清剿#5，控制这颗星球。",
		"Corporate Mercenary",
		"Corporate Mercenary",
		"armory",
		"planetside",
		"Syndicate"
	)

	dialogue_options["planetside"] = list(
		"没错，附近有一颗星球，上面到处都是#1的敌军。你作为#2的职责，就是消灭#3部队，为#4夺取这颗星球！",
		"Syndicate",
		"Corporate Mercenary",
		"Syndicate",
		"NanoTrasen"
	)

	dialogue_options["armory"] = list(
		"军械库位于#1内的东北方。",
		"Burgerstation"
	)


	return dialogue_options
