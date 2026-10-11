/ai/dick_kickem/

	target_distribution_x = list(16)
	target_distribution_y = list(11)

/ai/dick_kickem/handle_attacking()

	if(objective_attack && next_talk <= world.time)
		var/message_to_say = list(
			"有人叫我屁眼。因为我的屁股上确实有个眼。",
			"对，你就继续拉在裤子里吧。",
			"在玩家的海洋里，我不过是又一个巨肥的婊子。",
			"哦，你觉得自己是坨热乎的牛逼？",
			"动漫？我看是尿漫，憋不住了。",
			"是时候脱光衣服去户外了。",
			"我是来踢人的。",
			"是时候动屁股了。",
			"我是迪克·踢爆。",
			"我要保持勃起。",
			"我要扯下你的脑袋，然后见血就晕。",
			"那些该死的外星杂种把我的车给操了。"
		)
		owner.do_say(pick(message_to_say),FALSE)

		next_talk = world.time + SECONDS_TO_DECISECONDS(6)

	return ..()
