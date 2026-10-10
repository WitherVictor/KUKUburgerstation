/vote/ //Vote instance
	var/name = "未知投票" //The name of the vote. Usually the question.
	var/list/options = list() //Just a list of possible choices.
	var/list/option_display_names = list()
	var/list/votes = list() //k = ckey, v = option, as a number

	var/time_limit = 60 //In seconds.

	var/time_to_end //Set automatically.

	var/weighted_mode = FALSE //Set to true if votes are made based on weight (random) rather than first past the post.

	//New is called when the vote is created.
	//Destroy is called when the vote is destroyed.

/vote/proc/get_option_display_name(var/option)
	return option_display_names[option] ? option_display_names[option] : option

/vote/proc/show(var/client/C)

	. = "<html><head><meta charset='utf-8'></head><body><h1>投票</h1><h2>[name]</h2>"

	for(var/i=1,i<=length(options),i++)
		var/option = options[i]
		if(votes[C.ckey] == i)
			. += "<p><b>[get_option_display_name(option)]（已选）</b></p>"
		else
			. += "<p><a href='?vote=\ref[src];vote_option=[i]'>[get_option_display_name(option)]</a></p>"
	. += "</body></html>"

	C << browse(.,"window=Voting;display=1;size=300x300;border=0;can_close=1;can_resize=1;can_minimize=1;titlebar=1")

	return TRUE

/vote/New()
	if(CONFIG("ENABLE_QUICKVOTE", FALSE))
		time_limit = 1

	for(var/k in SSclient.all_clients)
		var/client/C = SSclient.all_clients[k]
		if(!C)
			continue
		C.to_chat(div("vote","新投票已开始，将在[time_limit]秒后结束。"))
		if(weighted_mode) C.to_chat(div("vote","本次投票采用加权随机方式：各选项按票数计算抽中权重，得票最多的选项获得额外权重。"))
		C.to_chat(div("vote","<u>[name]</u>"))
		for(var/i=1,i<=length(options),i++)
			var/option = options[i]
			C.to_chat(div("vote","[i]. [get_option_display_name(option)]"))
		C.to_chat(div("vote","<a href='?vote=\ref[src]'>点击此处投票。</a>"))

	play_sound_global('sound/ui/start_vote.ogg',SSliving.all_mobs_with_clients)

	return ..()

/vote/proc/add_option(var/text)
	options += text
	return TRUE

/vote/proc/remove_option(var/text)
	options -= text
	return TRUE

/vote/proc/set_vote(var/ckey,var/number)
	votes[ckey] = number
	return TRUE

/vote/proc/unset_vote(var/ckey)
	votes -= ckey
	return TRUE

/vote/proc/on_result(var/winner,var/list/results)
	return TRUE

/vote/PreDestroy()

	var/results = get_results()

	var/message_to_send = list(div("vote","<u>投票结果：</u>[name]"))

	var/winner = null
	var/winner_votes = -1
	var/total_votes = 0
	var/total_weight = 0

	if(weighted_mode)
		var/list/weighted_results_list = list()
		var/highest = 0
		for(var/option in results) //Go through the results.
			var/list/voters = results[option] //Get the voters for this option.
			var/vote_count = length(voters)
			weighted_results_list[option] = vote_count
			total_votes += vote_count
			if(vote_count > highest)
				highest = vote_count

		for(var/option in weighted_results_list) //Go through all the list of possible options that were voted.
			var/list/voters = results[option]
			var/vote_count = length(voters)
			var/weight = 1
			if(vote_count == highest && highest != 0)
				weight = 2 * vote_count
			else if(highest)
				weight = vote_count/(highest*2)
			weighted_results_list[option] = weight
			total_weight += weight
			message_to_send += div("vote","[get_option_display_name(option)]：[vote_count]票（权重：[weight]）")

		if(length(weighted_results_list))
			winner = pickweight(weighted_results_list)
			winner_votes = weighted_results_list[winner]
		else
			winner = pick(options)
			winner_votes = 0
	else
		for(var/option in results)
			var/list/voters = results[option]
			var/vote_count = length(voters)
			if(vote_count > winner_votes)
				winner = option
				winner_votes = vote_count
			message_to_send += div("vote","[get_option_display_name(option)]：[vote_count]票")
			total_votes += vote_count

	if(!total_votes)
		winner = pick(options)
		message_to_send += div("vote","无人投票，随机选择一个选项……")
		message_to_send += div("vote","胜出选项：[get_option_display_name(winner)]。")
	else
		if(weighted_mode)
			message_to_send += div("vote","胜出选项（加权随机模式）：[get_option_display_name(winner)]（[CEILING( (winner_votes/total_weight) * 100, 1)]%）")
		else
			message_to_send += div("vote","胜出选项：[get_option_display_name(winner)]。")

	for(var/k in SSclient.all_clients)
		var/client/C = SSclient.all_clients[k]
		if(!C)
			continue
		for(var/m in message_to_send)
			C.to_chat(m)

	play_sound_global('sound/ui/end_vote.ogg',SSliving.all_mobs_with_clients)
	on_result(winner,results)

	return ..()


/vote/proc/get_results()

	. = list()

	for(var/k in options)
		.[k] = list()

	var/options_length = length(options)

	for(var/ckey in votes)
		var/option_num = votes[ckey]
		if(options_length < option_num)
			log_admin("[ckey] tried voting for an option that didn't exist ([option_num]).")
			continue
		var/real_option = options[option_num]
		.[real_option] += ckey

