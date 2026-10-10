/dialogue/npc/taxman/

/dialogue/npc/taxman/get_dialogue_options(var/mob/living/advanced/player/P,var/list/known_options)

	. = list()

	var/next_pay = P.last_tax_payment + 604800*10
	var/next_due = P.last_tax_payment + 604800*10*2

	if(world.realtime < next_pay)
		.["hello"] = list(
			"你好，[P.real_name]。看来你已经缴清税款。下次缴税日期是[time2text(next_pay,"MM-DD")]。\
			你是来#1的吗？",
			"*learn about taxes"
		)
	else
		var/delinq = SStax.check_delinquent(P)
		delinq *= 1/(86400*10)
		.["hello"] = list(
			"你好，[P.real_name]。你是来#1，还是#2？你的税款[!delinq ? "本周到期" : "已逾期[CEILING(delinq,1)]天"]。",
			"*pay your taxes",
			"*learn about taxes"
		)

	var/tax_explain = SStax.get_explaination(P)
	tax_explain = replacetextEx(tax_explain,"\n","NEWLINE")
	tax_explain = "[tax_explain]NEWLINE你接受吗？NEWLINE#1NEWLINE#2"
	.["*pay your taxes"] = list(
		html_encode(tax_explain),
		"*Yes, pay taxes.",
		"*No, do not pay taxes."
	)

	.["*Yes, pay taxes."] = list("你本不该看到这条信息。")
	.["*No, do not pay taxes."] = list(
		"记住，如果超过缴税期限一周，也就是到了[time2text(next_due,"MM-DD")]，你还没有#1，就可能有些特殊人士来找你！",
		"pay your taxes"
	)

	.["*learn about taxes"] = list(
		"作为受太阳系政府雇用的私人雇佣兵，你必须遵守太阳系法律体系中的所有法律、法规以及税法。\
		根据《2104年地面自由法案》第24b款，踏上任何太阳系政府所属土地前，你必须缴纳每周税款，\
		否则在缴清欠款之前，你将放弃一切法律权利、生命、自由、财产与幸福。呃……换句话说，我们会派\
		赏金猎人追捕你，收走你的财物，直到债务清偿。万一你无力缴清税款，我们会先收取你能付的部分，\
		剩余部分等你付得起时再收。请注意，部分缴税并不会解除你的欠税状态，\
		但与完全不缴税相比，这或许能让你避免落入更高税档。"
	)

/dialogue/npc/taxman/set_topic(var/mob/living/advanced/player/P,var/topic)

	. = ..()

	if(topic == "*Yes, pay taxes.")
		if(SStax.can_pax_taxes(P))
			SStax.pay_taxes(P)
			P.dialogue_target_id = null
			close_menu(P,/menu/dialogue/)
		else
			P.to_chat(span("warning","现在还不能缴税，你来得太早了！"))

