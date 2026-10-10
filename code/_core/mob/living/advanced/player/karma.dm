/proc/punish_player(var/mob/living/advanced/player/P)

	var/karma_difference = abs(P.karma - initial(P.karma))

	var/punishment_level = clamp(CEILING(karma_difference/1000, 1),3,50)

	var/list/turf/valid_turfs = list()

	for(var/turf/simulated/floor/F in range(5,P))
		valid_turfs += F

	for(var/i=1,i<=min(punishment_level,10),i++)
		var/mob/living/simple/npc/silicon/squats/S = new(pick(valid_turfs),null,punishment_level)
		S.Initialize()
		if(S.ai)
			var/ai/simple/karma_borg/KB_AI = S.ai
			KB_AI.true_target = P

	return TRUE

/proc/do_karma_event(var/mob/living/advanced/player/attacker,var/mob/living/advanced/player/victim,var/karma_gain = 0)

	var/old_victim_justice_broken = victim.mobdata.loaded_data["justice_broken"]
	victim.mobdata.loaded_data["justice_broken"] = 0

	attacker.karma += karma_gain

	//The player killed someone evil
	if(karma_gain > 0)

		attacker.mobdata.loaded_data["justice_served"] += 1
		var/attacker_justice_served = attacker.mobdata.loaded_data["justice_served"]
		var/attacker_justice_reward = attacker.mobdata.loaded_data["justice_reward_claimed"]

		attacker.to_chat(span("notice","你的脑海中响起一个声音……"))

		var/bonus_text = "继续诛杀违逆自然秩序之人，你将得到奖赏。"

		if(attacker_justice_served == 5 && attacker_justice_reward < 5)
			bonus_text = "你做得不错。去找那个自称巴尔-沙利兹的人领取奖赏……"
		else if(attacker_justice_served == 10 && attacker_justice_reward < 10)
			bonus_text = "以凡人而言，你执行我的意志颇有效率。巴尔-沙利兹会为你准备奖赏。"
		else if(attacker_justice_served == 15 && attacker_justice_reward < 15)
			bonus_text = "你胜过了我麾下的一些杰出信徒。去找巴尔-沙利兹，领取与你功绩相称的奖赏。"
		else if(attacker_justice_served == 25 && attacker_justice_reward < 25)
			bonus_text = "你胜过了我麾下的一些杰出信徒。去找巴尔-沙利兹，领取与你功绩相称的奖赏。"

		if(old_victim_justice_broken)
			attacker.to_chat(span("karma","[victim.real_name]因杀害[old_victim_justice_broken]名无辜者的罪行受到了审判。[bonus_text]"))
		else
			attacker.to_chat(span("karma","[victim.real_name]因前世的罪行受到了审判。[bonus_text]"))

		if(old_victim_justice_broken > 0)
			victim.to_chat(span("notice","你的脑海中响起一个声音……"))
			victim.to_chat(span("karma","愚蠢。我早已命你悔罪。你已失去我的眷顾。"))
			victim.mobdata.loaded_data["justice_served"] = 0

		return FALSE

	//The player killed someone nice
	if(karma_gain < 0)

		attacker.mobdata.loaded_data["justice_broken"] += 1

		attacker.to_chat(span("notice","你的脑海中响起一个声音……"))

		if(attacker.mobdata.loaded_data["justice_served"] >= 1 || attacker.mobdata.loaded_data["justice_broken"] == 1)
			attacker.to_chat(span("karma","你竟敢违逆我？这一次，我姑且当作你是无心之失。立刻为你的罪行忏悔，否则等待你的唯有苦难。"))
			return FALSE

		switch(attacker.mobdata.loaded_data["justice_broken"])
			if(1)
				attacker.to_chat(span("karma","愚蠢。你会为此付出代价！"))
				return TRUE
			if(2)
				attacker.to_chat(span("karma","愚蠢。你会为此付出代价……"))
				return TRUE
			if(3)
				attacker.to_chat(span("karma","你还想再受惩罚？那就如你所愿。继续走下去，等待你的唯有黑暗。"))
				return TRUE
			if(4)
				attacker.to_chat(span("karma","你已与我为敌。忏悔以重获我的眷顾，否则我只会为你送来更多死亡。"))
				attacker.mobdata.loaded_data["justice_served"] = 0
				return TRUE
			else
				attacker.to_chat(span("karma","凡人，好好领教我仆从的怒火吧。"))
				return TRUE

	if(attacker.mobdata.loaded_data["justice_served"] > 1)
		attacker.to_chat(span("notice","你的脑海中响起一个声音……"))
		attacker.to_chat(span("karma","[victim.real_name]的罪行尚不足以让你赢得我的赞许……去寻找更合适的猎物。"))

	return FALSE

/proc/calculate_karma_gain_for_attacker(var/mob/living/advanced/player/attacker,var/mob/living/advanced/player/victim)

	if(!attacker.mobdata || !victim.mobdata)
		return 0

	var/attacker_karma = attacker.karma
	var/victim_karma = victim.karma
	var/gained_karma = 0

	if(victim_karma <= 0 && attacker_karma <= 0) //We're both shit.
		gained_karma = clamp(-victim_karma*0.5 + attacker_karma,0,1000)
	else if(victim_karma > 0 && attacker_karma <= 0) //The victim is good but the attacker is shit.
		gained_karma = min(-1000,-victim_karma*0.25)
	else if (victim_karma <= 0 && attacker_karma > 0) //The victim is shit but the attacker is good.
		gained_karma = min(10000,-attacker_karma*0.25)
	else if (victim_karma > 0 && attacker_karma > 0) //We're both good.
		gained_karma = max(-1000.-attacker_karma*0.5,-victim_karma*0.5)

	return round(gained_karma,1)
