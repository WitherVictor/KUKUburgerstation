/dialogue/npc/chief_medical_officer


/dialogue/npc/chief_medical_officer/get_dialogue_options(var/mob/living/advanced/player/P,var/list/known_options)

	. = list()

	.["hello"] = list(
		"欢迎来到医疗部。由于人手不足，这里基本上有百分之九十九的事情需要自助。只要有资格当#2，我们就愿意提供#1。",
		"job",
		"medical doctor"
	)

	.["job"] = list(
		"现在没人想当#1，人人都只想着杀人放火、炸个稀巴烂。内部研究认为，当#1的门槛太多，比如要有高中毕业证，所以我们干脆把要求全取消了。今天就来入职吧！",
		"medical doctor"
	)

	if(P.job == /job/medical)
		.["medical doctor"] = list(
			"我有时候也会忘，不过你已经是#1了。",
			"medical doctor"
		)
	else
		.["medical doctor"] = list(
			"成为#1的唯一要求就是你本人同意。你愿意当#1吗？简单说，给人治病就能赚钱，挺不错的。NEWLINE#2NEWLINE#3",
			"medical doctor",
			"*Yes, become a medical doctor.",
			"*No, do not become a medical doctor."
		)

	.["*Yes, become a medical doctor."] = list(
		"根据授予我的职权，你现在正式成为#1了。恭喜，去治病救人吧。",
		"medical doctor"
	)

	.["*No, do not become a medical doctor."] = list(
		"随你。这个#1仍为你敞开。",
		"job"
	)

/dialogue/npc/chief_medical_officer/set_topic(var/mob/living/advanced/player/P,var/topic)

	. = ..()

	if(topic == "*Yes, become a medical doctor." && P.job != /job/medical)
		P.set_job(/job/medical)
