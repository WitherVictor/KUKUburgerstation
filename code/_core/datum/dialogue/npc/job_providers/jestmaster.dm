/dialogue/npc/jestmaster

/dialogue/npc/jestmaster/get_dialogue_options(var/mob/living/advanced/player/P,var/list/known_options)

	. = list()

	.["hello"] = list(
		"你是来寻求#1的指引，想成为#2加入我们，还是只想盯着看？",
		"Her",
		"clown"
	)

	.["Her"] = list(
		"我们的守护女神。无人知晓#1的真身，但只要留心，就能发现祂的影响。你想寻求祂的#2吗？",
		"Her",
		"wisdom"
	)

	.["wisdom"] = list(
		"真正的#1不会追寻欢乐，而是让自己成为欢乐本身。",
		"clown"
	)

	if(P.job == /job/clown)
		.["clown"] = list(
			"#1或许会遗忘，但终究会想起来。",
			"clown"
		)

	else
		.["clown"] = list(
			"任何人都能成为#1。在#2眼中，一切都能得到宽恕，但你必须舍弃过去的自己。不过我得警告你：如果还不够强就加入我们，你可能会发现自己虚弱得什么都做不了。NEWLINE#3NEWLINE#4",
			"clown",
			"Her",
			"*Yes, become a clown.",
			"*No, do not become a clown."
		)

	.["*Yes, become a clown."] = list(
		"根据授予我的职权，你现在是#2的马戏团中的一名#1了。",
		"clown",
		"Her"
	)

	.["*No, do not become a clown."] = list(
		"如果你改变主意，#1的慷慨始终如一。",
		"Her"
	)

/dialogue/npc/jestmaster/set_topic(var/mob/living/advanced/player/P,var/topic)

	. = ..()

	if(topic == "*Yes, become a clown." && P.job != /job/clown)
		P.set_job(/job/clown)
