/dialogue/npc/wizard_ambassador/

/dialogue/npc/wizard_ambassador/get_dialogue_options(var/mob/living/advanced/player/P,var/list/known_options)

	. = list()

	.["hello"] = list(
		"向你致意！我是#1，#2的大使。你来这里是寻求#3，还是向#2表达敬意？",
		"Bandalf the Right",
		"Wizard Federation",
		"magic"
	)

	.["Bandalf the Right"] = list(
		"没错，我靠着始终实事求是，躲过了这个宇宙中无数次#2，理所当然地赢得了#1这个称号。\
		如果你也像我一样，花这么长时间守护自己的身份与灵魂，也许有一天也能赢得类似的称号。",
		"Bandalf the Right",
		"ban"
	)

	.["ban"] = list(
		"有时，一股超脱此世的宇宙力量会盯上你的灵魂，试图将它从你的凡俗躯壳中扯出，据为己有。\
		无数受害者败在这股邪恶力量之下，但当它点到你的名字时，只要完全据实作答，就能抵御它。#1正在与\
		纳米传讯的一些顶尖#2科学家合作，努力彻底消除这个威胁……",
		"Wizard Federation",
		"Simpleton"
	)

	.["Wizard Federation"] = list(
		"我代表#1，致力于向所有尊重强大#1之威能的人传播#2知识。近年来，纳米传讯分享了如何避免可怕的#3的研究，\
		也因此成为尊重我们威能的伙伴之一。",
		"Wizard Federation",
		"magic",
		"ban"
	)

	.["magic"] = list(
		"嚯嚯嚯，#1正是我们的专长。我们要把这些古老奥术的知识传授给尽可能多的#2。\
		我们发现，只要把魔法送给所有人，就能散播混乱——呃，我是说增加企业利润。\
		你可以在这里方便的售货机里购买魔法。我们只收#3！不收支票，也不收信用点！",
		"magic",
		"Simpleton",
		"gold"
	)

	.["Simpleton"] = list(
		"哦，那只是我们对非天生#1使用者起的一个绝对没有冒犯意味的称呼。虽然你们确实通过这些宝石引导#1，\
		但我们#2认为，真正的#1来自灵魂，而非肉体，所以你们用的算不上真正的魔法。为了让你们好受些，我们还是管它叫#1！",
		"magic",
		"Wizard Federation"
	)

	.["gold"] = list(
		"酒吧正北方的地精商人可以用物品或其他货币换取#1。他们什么都收，连垃圾也不例外！",
		"gold"
	)
