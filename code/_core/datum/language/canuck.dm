//TODO: Convert to accent.

/language/canuck
	name = "加拿大口音"
	id = LANGUAGE_CANUCK

	var/regex/regex_eh
	var/regex/regex_end
	var/regex/regex_all

	var/regex/regex_ue
	var/regex/regex_ou

	var/regex/regex_fuck

	var/list/possible_chirps = list(
		"喝汽水去吧" = 100,
		"他妈的废物" = 100,
		"菜鸟们" = 100,
		"自己想办法" = 100,
		"拽拽你的蛋吧，你这乳交狂" = 25,
		"乳交狂，拽拽你的蛋吧" = 25,
		"乳交狂" = 25,
		"拽拽你的蛋吧" = 25,
		"接下来会发生三件事：我打你，你撞地，救护车飙到60" = 5,
		"你妈刚点赞了我两年前在纳米书海滩传送门里发的帖子，告诉她，只要她想，我随时能为她穿上泳裤" = 5,
		"让你妈给她送我的个人数据终端充点话费，这样我半夜才能给她发消息" = 5,
		"告诉你妈，她给我开的银行账户已经被我花光了，充点钱，我还要买 NT汉堡" = 5,
		"我把你妈弄得太湿了，约翰·特拉森都派了一支全天待命的步兵队来我床边堆沙袋" = 5,
		"你的人生太可悲了，我办了场慈善活动让大家关注这事，筹了15000" = 5,
		"你的声音简直是存在危机，听得我他妈开始怀疑整个人生" = 5,
		"你妈前两个班次摸我，赶紧闭嘴，不然我就发到纳米书上" = 5,
		"让你妈别缠着我，她从劳动节起就赖在我那张破水床上没走" = 5,
		"你的人生太悲惨了，光是跟你待在一起，我就能拿到慈善减税" = 5,
		"你真该听听你妈昨晚的叫声，跟窗户夹住猫娘尾巴似的：啊啊啊啊啊" = 5,
		"你真该听听你妈昨晚的叫声，跟我突然登门时我姨婆的反应似的：哦哦哦哦哦" = 5,
		"你妈昨晚忘了打开摄像机镜头盖，哭得可难看了，那边简直是一群他妈的业余选手" = 5
	)

/language/canuck/New()

	regex_eh = regex("\\?+")
	regex_end = regex("\[.\]$")
	regex_all = regex("all","i")

	regex_ue = regex("ue")
	regex_ou = regex("ou")

	regex_fuck = regex("fuck you","i")

	. = ..()

/language/canuck/process_text(var/speaker,var/text)

	text = periodize(text) //Always add punctuation.

	if(regex_eh.Find(text)) //Is a question.
		if(prob(80))
			text = regex_eh.Replace(text,"，嗯？")
		else
			text = regex_eh.Replace(text,"，哥们？")
	else
		if(regex_fuck.Find(text))
			regex_end.Replace("，[pickweight(possible_chirps)]。")
		else if(prob(80))
			if(regex_all.Find(text))
				text = regex_end.Replace(text,"，伙计们。")
			else
				if(prob(80))
					text = regex_end.Replace(text,"，哥们。")
				else
					text = regex_end.Replace(text,"，老兄。")
		else
			text = regex_end.Replace(text,"，好吗？")

	text = regex_ue.Replace(text,"oe")
	text = regex_ou.Replace(text,"oo")

	return text

