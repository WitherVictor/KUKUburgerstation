/dialogue/npc/hop/


/dialogue/npc/hop/get_dialogue_options(var/mob/living/advanced/player/P,var/list/known_options)

	. = list()

	.["hello"] = list(
		"你好，[P.real_name]。来找#1吗？我可以正式任命你为#2。这个岗位没有#3的机会，不过能帮你起步，以后再转去那些可以#3的岗位。如果你觉得在这个星区赚的信用点已经够了，我也办理#4。",
		"job",
		"assistant",
		"promotion",
		"retirement"
	)

	.["retirement"] = list(
		"很遗憾，这个星区严格的劳动法允许员工随时以任何理由辞职，因此我们依法必须提供退休选项，让你终止合同。\
		你有兴趣吗？NEWLINENEWLINE#1NEWLINE#2NEWLINENEWLINE（退休会<b>永久</b>删除你的角色，并将其全部经验转入经验兑换系统。此外，角色退休时携带的所有物品都会被出售。）",
		"*Yes, retire and spend out the rest of your days being miserable over the fact that you don't have a job.",
		"*No, do not retire and continue to be happy that NanoTrasen provides."
	)

	.["job"] = list(
		"为纳米传讯工作已经能让你定期获得一些收入，但正式任职能让你赚得更多。在职期间，岗位还会提高你的部分属性和技能。\
		我这里提供#1岗位，所有技能都有少量加成，但没有#2机会。别担心，你随时都能更换岗位。",
		"assistant",
		"promotion"
	)

	.["promotion"] = list(
		"在一个#1上工作满一周后，你就能晋升，提高薪水和技能加成。#2无法晋升，但其他岗位都可以。",
		"job",
		"assistant"
	)

	if(P.job == /job/assistant)
		.["assistant"] = list(
			"你现在是助理。如果想更换#1，可以找站内其他部门主管申请新的#1。",
			"job"
		)
	else
		.["assistant"] = list(
			"我可以给你助理这个#1，所有技能都有加成，但无法#2。这会替换你原来的岗位。你接受吗？NEWLINE#3NEWLINE#4",
			"job",
			"promotion",
			"*Yes, become an assistant.",
			"*No, do not become an assitant."
		)

	.["*Yes, become an assistant."] = list(
		"很好。根据授予我的职权，我现在任命你为#1。你获得了一些被动技能加成，薪水也略有增加。",
		"assistant"
	)

	.["*No, do not become an assitant."] = list(
		"唉，这个岗位确实不适合所有人。改变主意了就告诉我。"
	)

	.["*Yes, retire and spend out the rest of your days being miserable over the fact that you don't have a job."] = list(
		"该死的工会。"
	)

	.["*No, do not retire and continue to be happy that NanoTrasen provides."] = list(
		"明智的选择。按照法律，我必须告诉你：退休选项仍然有效。"
	)


/dialogue/npc/hop/set_topic(var/mob/living/advanced/player/P,var/topic)

	if(topic == "*Yes, retire and spend out the rest of your days being miserable over the fact that you don't have a job.")
		var/menu/M = get_menu(/menu/dialogue/)
		M.close(P)
		spawn
			var/list/retirement_choices = list("是" = "Yes","否" = "No","取消" = "Cancel")
			var/desired_choice = input(P,"你确定要退休吗？角色将被永久删除，此操作无法撤销！","退休计划","取消") as null|anything in retirement_choices
			if(desired_choice && retirement_choices[desired_choice] == "Yes")
				var/savedata/client/mob/D = MOBDATA(P.ckey)
				if(D) D.delete_character(P)
		return TRUE

	. = ..()

	if(topic == "*Yes, become an assistant." && P.job != /job/assistant )
		P.set_job(/job/assistant)
