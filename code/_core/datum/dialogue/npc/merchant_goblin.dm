/dialogue/npc/goblin_merchant/

/dialogue/npc/goblin_merchant/get_dialogue_options(var/mob/living/advanced/player/P,var/list/known_options)

	. = list()

	.["hello"] = list(
		"欢迎光临鲍斯战利品。我们其实不卖首领战利品，但我们卖#1！我们还提供#2，花点小钱就能#3。此外也有银行服务，你可以#4，或者#5换取金币。",
		"*supply crates",
		"*deathbox services",
		"*reclaim deathbox",
		"*access your bank",
		"*sell items"
	)

	.["*supply crates"] = list(
		"我们向自信运气好的人出售补给箱。说实话，我们讨厌被木刺扎到，干脆把箱子整个卖掉。\
		不用担心我们坑人，我们从没看过里面，也没动过内容物！"
	)

	.["*deathbox services"] = list(
		"我们完全合法的地精拾荒者，有时会捡到某些合法性存疑的纳米传讯特工遗失的装备。\
		这些死人装备怪恶心的，我们用不上，就收点象征性费用卖回纳米传讯！哦，我说的纳米传讯就是你。\
		注意，我们的呃……总部仓储空间不多，所以每人只保存五个箱子。"
	)

	.["*reclaim deathbox"] = list("……")

	.["*sell items"] = list("……")

	.["*access your bank"] = list("……")


/dialogue/npc/goblin_merchant/set_topic(var/mob/living/advanced/player/P,var/topic)

	. = ..()

	switch(topic)
		if("*reclaim deathbox")
			load_deathbox(P,P.dialogue_target)
			P.dialogue_target_id = null
			close_menu(P,/menu/dialogue/)
		if("*access your bank")
			P.access_bank()
			P.dialogue_target_id = null
			close_menu(P,/menu/dialogue/)
		if("*sell items")
			P.add_sell_buttons()
			P.dialogue_target_id = null
			close_menu(P,/menu/dialogue/)

