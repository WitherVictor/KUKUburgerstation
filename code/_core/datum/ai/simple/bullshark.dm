/ai/bullshark

	aggression = 3
	assistance = 1
	retaliate = TRUE

/ai/bullshark/handle_attacking()

	if(objective_attack && next_talk <= world.time)
		var/message_to_say = list(
			"你的服务器即将达到本月使用上限！",
			"很高兴看到你的Discord服务器使用牛鲨，保护成员免受不良内容侵扰。",
			"牛鲨的人工智能、文件扫描和链接截图预览等智能功能，有助于保障成员安全。",
			"你的服务器即将用完本月免费额度。请在控制面板查看详细用量，以免服务中断，让服务器失去保护。",
			"牛鲨的全部功能都可通过网页控制面板配置，无须记忆指令！",
			"检测到疑似色情内容。匹配度[rand(1,100)]%。",
			"检测到疑似血腥内容。匹配度[rand(1,100)]%。",
			"检测到疑似梗图。匹配度[rand(1,100)]%。",
			"检测到疑似暴力内容。匹配度[rand(1,100)]%。"
		)
		owner.do_say(pick(message_to_say),FALSE)

		next_talk = world.time + SECONDS_TO_DECISECONDS(6)

	return ..()
