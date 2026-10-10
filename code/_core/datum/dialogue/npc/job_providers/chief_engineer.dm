/dialogue/npc/chief_engineer/


/dialogue/npc/chief_engineer/get_dialogue_options(var/mob/living/advanced/player/P,var/list/known_options)

	. = list()

	.["hello"] = list(
		"这里是工程部。随便看，但严禁触碰超物质。你可以在这里#1；觉得自己够格的话，也能应聘#3这个#2。",
		"purchase materials",
		"job",
		"engineer"

	)

	.["purchase materials"] = list(
		"纳米传讯把采矿站开采的材料运到这里，放进精致的#1，供你以优惠价购买。",
		"vending machines"
	)

	.["purchase firearms"] = list(
		"没错，我们的#1里卖一些特别的枪械，也有安保部那边的同款售货机。别告诉安保部我们有特殊装备，否则他们可能又来搜查。",
		"vending machines"
	)

	.["vending machines"] = list(
		"按下机器上的按钮，付钱就能拿到东西。在这里#1就是这么简单。别告诉安保部，你也能在这里#2。",
		"purchase materials",
		"purchase firearms"
	)

	.["job"] = list(
		"说实话，当#1很简单：只要人还在，就能领工资。你甚至什么都不用做就能#2。",
		"engineer",
		"promotion"
	)

	.["promotion"] = list(
		"担任#2这个#1满一周，就能获得一次特别的#3，工资也会提高。",
		"job",
		"engineer",
		"promotion"
	)


	if(P.job == /job/engineer)
		.["engineer"] = list(
			"我有时候也会忘，不过你已经是#1了。",
			"engineer"
		)
	else
		.["engineer"] = list(
			"只要你愿意，我就能让你成为#1，没有最低要求。你什么都不做就能领工资，而且这个岗位可以晋升，助理可没这待遇。如果你已有岗位，这会替换原来的岗位。要来吗？NEWLINE#2NEWLINE#3",
			"engineer",
			"*Yes, become an engineer.",
			"*No, do not become an engineer."
		)

	.["*Yes, become an engineer."] = list(
		"我宣布，你正式成为#1了。恭喜，现在去无所事事吧。",
		"engineer"
	)

	.["*No, do not become an engineer."] = list(
		"那是你的损失。这个#1仍为你敞开。",
		"job"
	)

/dialogue/npc/chief_engineer/set_topic(var/mob/living/advanced/player/P,var/topic)

	. = ..()

	if(topic == "*Yes, become an engineer." && P.job != /job/engineer)
		P.set_job(/job/engineer)
