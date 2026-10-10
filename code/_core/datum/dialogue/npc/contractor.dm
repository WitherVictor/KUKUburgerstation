/dialogue/npc/contractor/

	var/static/list/valid_contract_locations = list("contract",BODY_HAND_LEFT_HELD,BODY_HAND_RIGHT_HELD)

/dialogue/npc/contractor/get_dialogue_options(var/mob/living/advanced/player/P,var/list/known_options)

	. = list()

	.["hello"] = list(
		"啊，你好，[P.real_name]，久闻大名。想在这里工作时多赚点信用点吗？我提供#1……只要你有胆量接。",
		"blood contracts"
	)

	if("purchase a blood contract" in known_options)
		.["hello"] += "purchase a blood contract"
		.["hello"] += "turn in a blood contract"


	.["blood contracts"] = list(
		"很简单：向我#1，然后出去完成它。之后回来向我#2，我就会支付契约上写明的奖励，并退还购买血契的费用。\
		任务失败没有额外损失……但如果把契约弄丢了……那你的本金也就没了。",
		"purchase a blood contract",
		"turn in a blood contract"
	)

	.["purchase a blood contract"] = list(
		"希望你会喜欢这些……"
	)

	.["turn in a blood contract"] = list(
		"……"
	)

	.["*success"] = list(
		"干得漂亮。好好享用你的奖励……"
	)

	.["*failure"] = list(
		"你手里没有已完成的契约。请别浪费我的时间。"
	)

/dialogue/npc/contractor/set_topic(var/mob/living/advanced/player/P,var/topic)

	if(topic == "purchase a blood contract")
		if(istype(P.dialogue_target,/mob/living/advanced/npc/unique/contractor))
			var/mob/living/advanced/npc/unique/contractor/C = P.dialogue_target
			if(C.stored_vendor)
				var/obj/structure/interactive/vending/V = C.stored_vendor
				if(P.active_structure == V)
					P.set_structure_unactive()
				else
					P.set_structure_active(V)

		P.dialogue_target_id = null
		close_menu(P,/menu/dialogue/)
		return TRUE

	else if(topic == "turn in a blood contract")
		var/obj/item/contract/found_contract
		for(var/k in valid_contract_locations)
			var/obj/hud/inventory/I = P.inventories_by_id[k]
			var/obj/item/contract/C = I.get_top_object()
			if(C && C.amount >= C.amount_max && istype(C))
				found_contract = C
				break
		if(found_contract && found_contract.turn_in(P))
			. = ..(P,"*success")
		else
			. = ..(P,"*failure")
		return .

	. = ..()
