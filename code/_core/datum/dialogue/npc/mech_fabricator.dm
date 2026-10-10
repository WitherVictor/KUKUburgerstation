/dialogue/npc/mech_fabricator/

/dialogue/npc/mech_fabricator/get_dialogue_options(var/mob/living/advanced/player/P,var/list/known_options)

	var/list/dialogue_options = list()


	dialogue_options["hello"] = list(
		"欢迎使用纳米传讯自动机甲制造系统 v0.1 Alpha。已自动识别你的身份：[P.real_name]。请选择以下操作：NEWLINE\
		#1NEWLINE\
		#2NEWLINE\
		#3",
		"*create new mech",
		"*load existing mech",
		"*about"

	)

	dialogue_options["*about"] = list(
		"纳米传讯自动机甲制造系统 v0.1 Alpha 会为你的多用途机甲办理所需的许可与保险手续！NEWLINE\
		请回到#1，选择#2，开始办理许可和保险。创建自己的机甲需要5000信用点。如果你在上个班次已有机甲，\
		可以花费1000信用点从系统中#3。请注意，每个班次只能取出一次机甲，\
		在班次结束、由我们的先进回收队收回之前，无法再次取出或存放。",
		"*main menu",
		"*create new mech",
		"*load existing mech"
	)

	dialogue_options["*main menu"] = dialogue_options["hello"]

	dialogue_options["*create new mech"] = list(
		"确定要登记一台新机甲吗？此操作需要5000信用点。NEWLINE\
		#1NEWLINE\
		#2",
		"*Yes, make new mech.",
		"*No, I do not want a new mech."
	)

	dialogue_options["*load existing mech"] = list(
		"确定要取出之前存放的机甲吗？此操作需要1000信用点。NEWLINE\
		#1NEWLINE\
		#2",
		"*Yes, load my mech.",
		"*No, do not load my mech."
	)

	dialogue_options["*Yes, load my mech."] = list(
		"你的机甲已从站内仓库取出。请到传送带领取！"
	)

	dialogue_options["*Yes, make new mech."] = list(
		"你的机甲已制造完成，并登记到系统中。请到传送带领取！"
	)


	return dialogue_options
