/gamemode/endless
	name = "无尽模式"
	desc = "目前没有任务。想做什么就做什么。"
	hidden = FALSE

	var/last_vote = 0
	var/vote_delay = SECONDS_TO_DECISECONDS(60*60)

	round_time_next = 0

	var/stage = 0
	//0 = starting
	//1 = gearing
	//2 = prepping
	//3 = allowed to launch
	//4 = enemies are spawning
	//5 = evac time
	//6 = pvp
	//7 = victory

	var/status_display_text
	var/status_display_time

	var/pvp_start_time = -1
	var/boredom_warning = FALSE

/gamemode/endless/New()
	. = ..()
	round_time_next = 30

/gamemode/endless/on_life()

	. = ..()

	if(round_time_next > 0 && round_time >= round_time_next)
		round_time = 0
		stage++
		switch(stage)
			if(1)
				status_display_text = "整备"
				round_time_next = 6*60
				announce(
					"中央指挥部任务通告",
					"准备登陆",
					"所有登陆人员立即整备，准备地面作战。穿梭机预计6分钟后启用。",
					sound_to_play = 'sound/voice/announcement/landfall_crew_6_minutes_shuttle.ogg'
				)
			if(2)
				status_display_text = "准备"
				round_time_next = 1*60
				announce(
					"中央指挥部任务通告",
					"登上空降舱",
					"所有登陆人员立即前往机库，准备空降。空降舱将在1分钟后获准发射。",
					sound_to_play = 'sound/voice/announcement/landfall_crew_1_minute_shuttle.ogg'
				)
			if(3)
				status_display_text = "就绪"
				round_time_next = 3*60
				allow_launch = TRUE
				SShorde.enable = TRUE
				SSevents.enable = TRUE
				announce(
					"中央指挥部任务通告",
					"任务开始",
					"穿梭机整备完毕，可以前往作战区域。全体人员获准出发。",
					sound_to_play = 'sound/voice/announcement/landfall_crew_0_minutes_shuttle.ogg'
				)
			if(4)
				status_display_text = "战斗"
				round_time_next = 40*60
				/*
				announce(
					"Central Command Mission Update",
					"Threat Detected",
					"Unusual enemy combatants detected in the Area of Operations. All crew are instructed to remove the threat as needed.",
					sound_to_play = 'sound/voice/announcement/landfall_crew_enemy_detected.ogg'
				)
				*/
			if(5)
				status_display_text = "撤离"
				round_time_next = 5*60
				announce(
					"中央指挥部任务通告",
					"撤离命令",
					"检测到离子风暴即将来袭。建议全体人员撤离该区域。未能撤离可能导致——\n%@&^#*#^&信号中断%&#(&#",
					sound_to_play = 'sound/voice/announcement/landfall_crew_evac_notice.ogg'
				)
				broadcast_to_clients(span("danger","玩家对战将在5分钟后启用！"))
			if(6)
				SShorde.enable = FALSE
				SSevents.enable = FALSE
				allow_launch = FALSE
				status_display_text = "危险"
				var/number_of_players = 0
				for(var/k in all_players)
					var/mob/living/advanced/player/P = k
					if(P.dead)
						continue
					if(P.loyalty_tag != "NanoTrasen")
						continue
					var/area/A = get_area(P)
					if(A.area_identifier != "Mission")
						continue
					var/turf/T = get_turf(P)
					if(!T)
						continue
					number_of_players++

				if(number_of_players <= 1 && world.port != 0)
					broadcast_to_clients(span("danger","玩家对战人数不足。正在结束本轮……"))
					round_time_next = 0
					world.end(WORLD_END_NANOTRASEN_VICTORY)
				else
					broadcast_to_clients(span("danger","玩家对战已启用！"))
					set_friendly_fire(TRUE)
					round_time_next = 10*60
					pvp_start_time = world.time
					for(var/k in all_players)
						var/mob/living/advanced/player/P = k
						if(P.dead)
							continue
						if(P.loyalty_tag != "NanoTrasen")
							continue
						var/area/A = get_area(P)
						if(A.area_identifier != "Mission")
							continue
						var/turf/T = get_turf(P)
						if(!T)
							continue
						var/obj/structure/interactive/crate/closet/supply_pod/syndicate/S = new(T)
						INITIALIZE(S)
						GENERATE(S)
						CREATE(/obj/item/pinpointer/deathmatch,S)
						FINALIZE(S)


			if(7) //7 is the checking stage.
				status_display_text = "危险"
				var/number_of_players = 0
				var/mob/living/advanced/player/last_person
				for(var/k in all_players)
					var/mob/living/advanced/player/P = k
					if(P.dead)
						continue
					if(P.loyalty_tag != "NanoTrasen")
						continue
					var/area/A = get_area(P)
					if(A.area_identifier != "Mission")
						continue
					number_of_players++
					last_person = P
				if(number_of_players <= 1) //Last person standing.
					if(number_of_players <= 0 || !last_person)
						broadcast_to_clients(span("danger","所有玩家均已离开该区域，玩家对战结束。本次没有获胜者。"))
						world.end(WORLD_END_NANOTRASEN_VICTORY)
					else
						broadcast_to_clients(span("danger","仅剩一人存活，玩家对战结束。[last_person.real_name]获得80,000信用点奖励。"))
						world.end(WORLD_END_NANOTRASEN_VICTORY)
						last_person.adjust_currency(80000)
						var/turf/T = get_turf(last_person)
						var/obj/item/clothing/head/hat/crown/C = new(T)
						C.winner_name = lowertext(last_person.real_name)
						INITIALIZE(C)
						GENERATE(C)
						FINALIZE(C)
						C.quick_equip(last_person)
					world.end(WORLD_END_NANOTRASEN_VICTORY)
					round_time_next = 0
				else
					stage = 6 //Go back to stage 6 by default
					round_time_next = 30 //Check every half-minute.


		if(stage == 6 && pvp_start_time > 0 && world.time >= pvp_start_time + SECONDS_TO_DECISECONDS(600))
			if(!boredom_warning)
				broadcast_to_clients(span("danger","玩家对战已持续超过10分钟，正在派遣辛迪加敢死队。"))
			else
				for(var/k in all_players)
					var/mob/living/advanced/player/P = k
					if(P.dead)
						continue
					if(P.loyalty_tag != "NanoTrasen")
						continue
					var/area/A = get_area(P)
					if(A.area_identifier != "Mission")
						continue
					var/turf/T = get_turf(P)
					CREATE(/obj/structure/interactive/crate/closet/supply_pod/syndicate/ultra/occupied,T)



	var/time_left = round_time_next - round_time
	if(time_left >= 0)
		status_display_time = get_clock_time(FLOOR(time_left,1))
	else
		status_display_time = null


	if(status_display_text && status_display_time)
		set_status_display("mission","[status_display_text ? status_display_text : "你好"]\n[status_display_time ? status_display_time : "欢迎"]")
