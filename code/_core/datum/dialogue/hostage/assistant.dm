/dialogue/npc/hostage/assistant

/dialogue/npc/hostage/assistant/get_dialogue_options(var/mob/living/advanced/player/P,var/list/known_options)

	var/mob/living/advanced/npc/unique/hostage/L = P.dialogue_target

	. = list()

	if(!L.hostage)
		.["hello"] = list(
			"哥们，我已经获救了，去忙别的吧"
		)
	else
		if(L.handcuffed)
			.["hello"] = list(
				pick("哥们，快把这该死的#1弄下来","兄弟，把这#1摘了","狗屁安保给我戴了#1，赶紧弄掉"),
				"*handcuffs"
			)
			.["*handcuffs"] = list(
				"兄弟，这都不会摘？查看我，然后点移除就行了啊"
			)
			return

		if(L.following) //If we're following someone
			if(L.following == P) //If we're following the person we're talking to.
				.["hello"] = list(
					pick("到了没有啊","兄弟，快点啊","别演角色扮演了，赶紧带我出去啊哥们"),
					"*stop following me"
				)
				.["*stop following me"] = list(
					pick("操，先想好你要干嘛","行吧哥们，麻烦快点","别把我扔这儿，蠢货")
				)
			else //If we're following someone else.
				.["hello"] = list(
					pick("啥","哥们，你想干嘛","什么事"),
					"*follow me"
				)
				.["*follow me"] = list(
					"哥们，[L.following.real_name]看着比你酷，所以我跟着那边走了"
				)
		else //We're not following someone.
			.["hello"] = list(
				pick("兄弟，赶紧他妈带我出去","我不认识这地图，快帮我出去啊"),
				"*follow me"
			)
			if(length(P.followers) < 2) //They have less than two followers
				.["*follow me"] = list(
					pick("行吧","哥们，你最好知道自己在干什么")
				)
			else
				.["*follow me"] = list(
					"兄弟，跟着你的人已经够多了，再凑一块怕不是要搞基"
				)

