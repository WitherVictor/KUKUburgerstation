/dialogue/npc/cargo_computer/

/dialogue/npc/cargo_computer/get_dialogue_options(var/mob/living/advanced/player/P,var/list/known_options)

	. = list()

	.["hello"] = list(
		"欢迎使用纳米传讯货运订购系统 v0.1 Alpha。已自动识别你的身份：[P.real_name]。请选择以下操作：NEWLINE\
		#1NEWLINE\
		#2NEWLINE\
		#3",
		"*purchase requisition sheet",
		"*purchase catalogue",
		"*about"

	)

	.["*about"] = list(
		"纳米传讯货运订购系统 v0.1 Alpha 会帮助你购买在当前任务区域完成任务所需的物品。\
		若要订货，请先购买采购申请单，再根据货运目录填写所需物品的信息。\
		填好后，使用货运部外的传真机提交申请。订单随即生效，你可以在第二艘货运穿梭机上取货。NEWLINE\
		购买采购申请单模板，请选择“#1”。NEWLINE\
		购买最新版目录，请选择“#2”。NEWLINE\
		再次查看本说明，请选择“#3”。",
		"*purchase requisition sheet",
		"*purchase catalogue",
		"*about"
	)

	.["*main menu"] = .["hello"]

	.["*purchase requisition sheet"] = list(
		"确定要购买采购申请单模板吗？此操作需要50信用点。NEWLINE\
		#1NEWLINE\
		#2",
		"*Yes, purchase a requisition sheet.",
		"*No, do not purchase a requisition sheet."
	)

	.["*purchase catalogue"] = list(
		"确定要购买最新版货运目录吗？此操作需要200信用点。NEWLINE\
		#1NEWLINE\
		#2",
		"*Yes, purchase a catalogue.",
		"*No, do not purchase a catalogue."
	)


	.["*Yes, purchase a requisition sheet."] = list(
		"你已选择购买采购申请单。请返回#1。",
		"*main menu"
	)

	.["*Yes, purchase a catalogue."] = list(
		"你已选择购买货运目录。请返回#1。",
		"*main menu"
	)

	.["*No, do not purchase a requisition sheet."] = list(
		"你已选择不购买采购申请单。请返回#1。",
		"*main menu"
	)

	.["*No, do not purchase a catalogue."] = list(
		"你已选择不购买货运目录。请返回#1。",
		"*main menu"
	)

/dialogue/npc/cargo_computer/set_topic(var/mob/living/advanced/player/P,var/topic)

	. = ..()

	switch(topic)
		if("*Yes, purchase a requisition sheet.")
			if(P.currency >= 50 && P.adjust_currency(-50))
				var/obj/item/paper/cargo/C = new(get_turf(P))
				INITIALIZE(C)
				GENERATE(C)
				FINALIZE(C)
				P.put_in_hands(C)
			else
				P.to_chat(span("warning","你的信用点不够！"))
		if("*Yes, purchase a catalogue.")
			if(P.currency >= 200 && P.adjust_currency(-200))
				var/obj/item/paper/book/cargo_catalog/C = new(get_turf(P))
				INITIALIZE(C)
				GENERATE(C)
				FINALIZE(C)
				P.put_in_hands(C)
			else
				P.to_chat(span("warning","你的信用点不够！"))

