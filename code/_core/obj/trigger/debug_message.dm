/mob/living/advanced/player/
	var/list/known_debug_messages = list()


/obj/trigger/debug_message
	name = "提示信息标记"
	id = null

	icon = 'icons/obj/markers/markers.dmi'
	icon_state = "dev"

	var/message = "你好。这是一个调试信息触发标记。"

	invisibility = 0
	mouse_opacity = 1

/obj/trigger/debug_message/clicked_on_by_object(var/mob/caller,object,location,control,params)
	if(is_player(caller))
		talk_to(caller)
	return TRUE

/obj/trigger/debug_message/proc/talk_to(var/mob/living/advanced/player/P)
	P.known_debug_messages[id] = TRUE
	return P.to_chat(span("debug_message",message))

/obj/trigger/debug_message/Crossed(var/atom/movable/O,var/atom/new_loc,var/atom/old_loc)
	if(is_player(O) && id)
		var/mob/living/advanced/player/P = O
		if(!P.known_debug_messages[id])
			talk_to(P)

	return ..()

/obj/trigger/debug_message/greeting
	id = "greeting"
	message = "你好，欢迎来到汉堡站。这是一个从零打造、尚在开发中的空间站13服务器。你今天看到的许多功能可能有错误，甚至完全无法使用。\
	为了帮助你了解玩法，首次经过这些标记时会触发相应提示。想再次查看，只需点击图标。"

/obj/trigger/debug_message/starting_area
	id = "starting_area"
	message = "这里是起始区，不属于主要游戏区域。将来这里会有介绍各种玩法的教程，不过你也猜到了，现在还没做。\
	目前请前往画面东北方向，登上穿梭机前往主要区域。"

/obj/trigger/debug_message/bar
	id = "bar"
	message = "这里是酒吧。柜台后有一个演示NPC，你可以通过角色扮演游戏式的对话选项与其交谈。\
	目前与其交谈没有奖励或其他好处，仅用于展示对话功能。"

/obj/trigger/debug_message/lore
	id = "lore"
	message = "你可能想知道汉堡站到底是什么。事实上，连开发者也不知道。也许自己探索更好？\
	如果你还是好奇，最准确的描述是：以纳米传讯对抗辛迪加为背景，结合团队合作、基地建造和探索的开放世界多人角色扮演游戏，主要对抗电脑敌人。\
	你不必做任何指定的事，也不必组队，完全可以降落到星球上自娱自乐。哦，我提过有颗可以降落的星球吗？没错，有颗星球。\
	如果你需要目标，就乘机库里的穿梭机下到星球，探索并消灭一些辛迪加士兵。\
	还要注意，角色会跨回合保存：上一回合的经历会延续到下一回合，依此类推。无论何时死亡，想重生时都会获得一个克隆身体，\
	但你会失去所有物品。"

/obj/trigger/debug_message/shuttle
	id = "shuttle"
	message = "没看到穿梭机？它可能正在运送其他玩家。先逛一逛，等穿梭机再次降落。你可以查看起始区附近的显示屏，\
	确认它是否已经着陆。等不及的话，也可以使用东边的传送机。"

/obj/trigger/debug_message/station
	id = "station"
	message = "欢迎来到空间站。请在前台为自己植入敌我识别芯片，获得这种特殊植入体并保存角色。这样可以避免其他玩家的友军误伤，\
	然后开始冒险。在这个世界里，敌我识别植入体是安保机构和私人军事公司的标准配置。其强大的纳米机器人可阻止具有相同敌我识别标记的枪械瞄准你，\
	兼作集成的身份门禁卡，并把你的生命体征、位置、DNA与脑部数据传送到最近的纳米传讯卫星。拥有敌我识别植入体后，你就接入了这套系统。"

/obj/trigger/debug_message/science
	id = "science"
	message = "这里是科研部大厅。进入部门后，你可以通过小游戏赚取信用点，用于购买装备。目前只有一种小游戏，\
	建议你至少玩一次。"

/obj/trigger/debug_message/medical
	id = "medical"
	message = "这里是医疗部大厅。你来这里是购买治疗自己和他人的用品，而非接受治疗。\
	建议先去军械库购买护甲与装备，再购买医疗用品。"

/obj/trigger/debug_message/armory
	id = "armory"
	message = "这里是军械库。你可以购买武器、弹药和护甲，抵御辛迪加。除非你非常清楚自己在做什么，否则强烈建议先在这里购置装备，\
	再去其他部门购物。军械库还设有射击场，你可以对着练习靶人试用枪械。"


/obj/trigger/debug_message/cryo
	id = "cryo"
	message = "这里是冷冻休眠室。船员可以在此进入静滞休眠，安全保存装备、DNA和脑波模式。\
	如果死亡，你也会根据最近的DNA备份克隆出新身体，回到这里，但不会带回丢失的物品。"


/obj/trigger/debug_message/engineering
	id = "engineering"
	message = "这里是工程部。科研尚未完成，而工程部的开发进度更早，因为建造功能也还没做完。\
	你虽然可以买工具和其他装备，但大多还没什么用。购买前请留意！工程部还容纳了货运部，多余物资和珍贵遗物会送到这里，\
	供出售或交给真正聪明的科学家研究。以这种方式送往中央指挥部的物品，会为全体船员带来奖金。"


/obj/trigger/debug_message/station_bar
	id = "station_bar"
	message = "觉得眼熟？这里的设计大量参考了/tg/的帕比站地图，因为我觉得它是目前最好看的地图。\
	虽然这间酒吧的功能不多，无聊时来这里闲逛仍然不错。"


/obj/trigger/debug_message/hanger
	id = "hanger"
	message = "这里是机库，也是往返目标星球的唯一通道。你将在星球上探索，并抵御辛迪加。\
	这里有四艘穿梭机，在任务中各有用途。"


/obj/trigger/debug_message/alpha
	id = "alpha"
	message = "这是阿尔法穿梭机，适合想与辛迪加特工战斗的玩家。它专注于战斗，没有复杂的机制或功能，\
	最适合推荐给新玩家。它会降落在主登陆区，位于布拉沃穿梭机旁边。"


/obj/trigger/debug_message/bravo
	id = "bravo"
	message = "这是布拉沃穿梭机，适合想要建造、学习资源与货运管理的玩家。\
	如果你只想建造，或想帮助大家提高薪酬，建议乘坐它。它会降落在主登陆区，位于阿尔法穿梭机旁边。"

/obj/trigger/debug_message/charlie
	id = "charlie"
	message = "这是查理穿梭机，适合想一边开采资源、一边抵御辛迪加的玩家。\
	这项工作通常报酬丰厚，但要做好它，需要不少装备。穿梭机会降落在主登陆区以东很远的地方，越过洞穴，\
	深入未探索区域。"

/obj/trigger/debug_message/delta
	id = "delta"
	message = "这是德尔塔穿梭机，号称精英中的精英专用，不过大家都知道不总是如此。它供特战人员使用，\
	前往环境恶劣的北方地区探索，寻找遗物和其他研究对象。德尔塔穿梭机会降落在北方的\
	山脉中。"


/obj/trigger/debug_message/dyes
	id = "dyes"
	message = "在未来，所有金融交易都使用由人脸识别、指纹哈希和DNA哈希组成的三重认证系统。\
	这更加安全，也无需携带可能丢失或被盗的实体凭证。货币按角色保存，可跨班次保留。\
	你可以在起始区的这些商贩处购买服装或染料，自定义角色外观。注意，信用点不是无限的，请合理购物！"


/obj/trigger/debug_message/giftshop
	id = "giftshop"
	message = "这里是礼品店。目前出售一些实用物品，可以帮助新玩家在空间站内寻找方向。\
	强烈建议初来乍到的玩家进去买几个定位器。"
