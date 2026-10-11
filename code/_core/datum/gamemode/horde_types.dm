/gamemode/horde/rev
	name = "围攻模式（革命军）"
	desc = "在抵御无穷无尽的俄罗斯革命军攻势的同时，完成任务目标。"
	enemy_types_to_spawn = list(
		/mob/living/advanced/npc/rev = 5,
		/mob/living/simple/bear/armored/revolutionary = 1
	)
	hidden = FALSE

/gamemode/horde/xeno
	name = "围攻模式（异形）"
	desc = "在抵御无穷无尽、会喷酸和跳扑的异形攻势的同时，完成任务目标。"
	enemy_types_to_spawn = list(
		/mob/living/simple/xeno/drone = 2,
		/mob/living/simple/xeno/hunter = 4,
		/mob/living/simple/xeno/sentinel = 3,
		/mob/living/simple/xeno/predatorian = 1
	)
	hidden = FALSE

	enemies_to_spawn_base = 10
	enemies_to_spawn_per_player = 2
	enemies_to_spawn_per_minute = 0.15

/gamemode/horde/xeno/get_enemy_types_to_spawn()
	if(!tracked_xeno_queen && prob(1))
		return list(/mob/living/simple/xeno/queen)
	return ..()


/gamemode/horde/zombie
	name = "围攻模式（僵尸）"
	desc = "在抵御无穷无尽、不具传染性的僵尸攻势的同时，完成任务目标。注意：僵尸的出现速度每分钟都会显著提高！"
	enemy_types_to_spawn = list(
		/mob/living/advanced/npc/zombie/greytide = 50,
		/mob/living/advanced/npc/zombie/botanist = 10,
		/mob/living/advanced/npc/zombie/chaplain = 5,
		/mob/living/advanced/npc/zombie/security = 10,
		/mob/living/advanced/npc/zombie/scientist = 5,
		/mob/living/advanced/npc/zombie/librarian = 5,
		/mob/living/advanced/npc/zombie/clown = 2,
		/mob/living/advanced/npc/zombie/medical = 3,
		/mob/living/advanced/npc/zombie/chemist = 2,
		/mob/living/advanced/npc/zombie/bartender = 2,
		/mob/living/advanced/npc/zombie/chef = 2

	)
	hidden = FALSE


/gamemode/horde/syndicate
	name = "围攻模式（辛迪加）"
	desc = "在抵御无穷无尽的辛迪加叛徒士兵攻势的同时，完成任务目标。有些辛迪加士兵会使用法术！"
	enemy_types_to_spawn = list(
		/mob/living/advanced/npc/syndicate = 10,
		/mob/living/advanced/npc/sorcerer = 4,
		/mob/living/simple/silicon/syndieborg = 1
	)
	hidden = FALSE

/gamemode/horde/beefmen
	name = "围攻模式（血肉人）"
	enemy_types_to_spawn = list(
		/mob/living/advanced/npc/beefman = 1
	)
	hidden = TRUE

/gamemode/horde/death_squad
	name = "围攻模式（敢死队）"
	desc = "在这场极度致命的训练演习中，一边抵御无穷无尽的纳米传讯敢死队，一边完成任务目标！"
	enemy_types_to_spawn = list(
		/mob/living/advanced/npc/deathsquad/light = 8,
		/mob/living/advanced/npc/deathsquad/medium = 4,
		/mob/living/advanced/npc/deathsquad/heavy = 1
	)
	hidden = TRUE

	enemies_to_spawn_base = 3
	enemies_to_spawn_per_player = 0.25
	enemies_to_spawn_per_minute = 0.05

/gamemode/horde/ashwalkers
	name = "围攻模式（灰烬行者）"
	desc = "在抵御无穷无尽的敌对灰烬行者攻势的同时，完成任务目标。"
	enemy_types_to_spawn = list(
		/mob/living/advanced/npc/ashwalker/assassin = 1,
		/mob/living/advanced/npc/ashwalker/hunter = 2,
		/mob/living/advanced/npc/ashwalker/warrior = 3
	)
	hidden = TRUE

/gamemode/horde/pirates
	name = "围攻模式（海盗）"
	desc = "在抵御无穷无尽的骷髅海盗攻势的同时，完成任务目标。"
	enemy_types_to_spawn = list(
		/mob/living/advanced/npc/pirate_crew/magic = 2,
		/mob/living/advanced/npc/pirate_crew/melee = 3,
		/mob/living/advanced/npc/pirate_crew/ninja = 1,
		/mob/living/advanced/npc/pirate_crew/ranged = 4
	)
	hidden = TRUE

/gamemode/horde/cultists
	name = "围攻模式（邪教徒）"
	desc = "在抵御无穷无尽的邪教徒攻势的同时，完成任务目标。"
	enemy_types_to_spawn = list(
		/mob/living/simple/cult/construct/artificer = 10,
		/mob/living/simple/cult/construct/behemoth = 10,
		/mob/living/simple/cult/construct/chosen = 1,
		/mob/living/simple/cult/construct/floating = 25,
		/mob/living/advanced/npc/cultist = 70,
		/mob/living/advanced/npc/cultist/hard = 30,
		/mob/living/simple/cult/construct/proteon = 10
	)
	hidden = FALSE
/*
/gamemode/horde/space_goblins
	name = "Horde Mode (Space Goblins)"
	desc = "Fight off an endless wave of Space Goblins while attempting to complete objectives."
	enemy_types_to_spawn = list(
		/mob/living/simple/goblin = 100,
		/mob/living/advanced/npc/goblin/warrior = 20,
		/mob/living/advanced/npc/goblin/mage = 10
	)
	hidden = FALSE

	enemies_to_spawn_base = 10
	enemies_to_spawn_per_player = 1.5
*/
/gamemode/horde/boss_rush
	name = "围攻模式（首领连战）"
	desc = "天啊，卧槽。"
	enemy_types_to_spawn = list(
		/mob/living/simple/can_man = 1,
		/mob/living/simple/ash_drake = 4,
		/mob/living/simple/bubblegum = 3,
		/mob/living/simple/colossus = 3,
		/mob/living/simple/herald = 1,
		/mob/living/simple/goliath/broodmother = 1
	)
	hidden = TRUE

	spawn_on_markers = FALSE

	enemies_to_spawn_base = 4
	enemies_to_spawn_per_player = 0
	enemies_to_spawn_per_minute = 0

/gamemode/horde/boss_rush/get_wave_size()
	return 1

/gamemode/horde/boss_rush/create_horde_mob(var/desired_loc)
	var/mob/living/L = ..()
	L.set_loyalty_tag("Boss")
	L.set_iff_tag("Boss")
	return L
