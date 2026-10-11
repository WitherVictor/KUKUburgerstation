/mob/living/advanced/npc/unique/pirate_captain
	name = "套套船长"
	boss_icon_state = "captain"
	desc = "独一无二。"
	desc = "臭名昭著的套套船长，率领一群嗜杀的骷髅海盗，号称嗜杀骷髅团。凭着崇高地位，他似乎能免受一切影响，连太空法和眩晕都不例外。"
	species = "skeleton"
	sex = MALE
	gender = MALE
	boss_music = /track/skeletons
	boss = TRUE
	ai = /ai/advanced/skeleton

	health_base = 6000

	fatigue_mul = 0

	loyalty_tag = "Skeleton"
	iff_tag = "Skeleton"

	status_immune = list(
		STUN = TRUE,
		SLEEP = TRUE,
		PARALYZE = TRUE,
		STAMCRIT = TRUE,
		STAGGER = TRUE,
		CONFUSED = TRUE,
		DISARM = TRUE,
		GRAB = TRUE,
		PAINCRIT = TRUE
	)

	var/next_revive = 0

	blood_type = null

	level = 70

	loadout = /loadout/pirate/captain

/mob/living/advanced/npc/unique/pirate_captain/on_life_slow()

	. = ..()

	if(. && ai && ai.active && next_revive <= world.time)

		var/list/possible_targets = list()

		for(var/mob/living/advanced/L in view(VIEW_RANGE,src))
			if(!L.dead)
				continue
			if(L.loyalty_tag != src.loyalty_tag)
				continue
			possible_targets += src

		if(length(possible_targets))
			var/mob/living/advanced/A = pick(possible_targets)

			src.shoot_projectile(
				src,
				A,
				null,
				null,
				/obj/projectile/magic/rift/revive,
				/damagetype/ranged/magic/fireball,
				16,
				16,
				0,
				TILE_SIZE*0.25,
				1,
				"#FFFFFF",
				0,
				1,
				null,
				src.loyalty_tag
			)

			next_revive = world.time + SECONDS_TO_DECISECONDS(5)

/mob/living/advanced/npc/unique/pirate_mate
	name = "酷安主管"
	desc = "他妈的，酷毙了。"
	desc_extended = "套套船长的副手，不过谁都知道真正说了算的是他。"
	species = "skeleton"
	sex = MALE
	gender = MALE

	health_base = 1000

	loyalty_tag = "Skeleton"
	iff_tag = "Skeleton"
	ai = /ai/advanced/skeleton

	level = 60

	blood_type = null

	loadout = /loadout/pirate/mate

	status_immune = list(
		STUN = TRUE,
		SLEEP = TRUE,
		PARALYZE = TRUE,
		STAMCRIT = TRUE,
		STAGGER = TRUE,
		CONFUSED = TRUE,
		DISARM = TRUE,
		GRAB = TRUE,
		PAINCRIT = TRUE
	)

/mob/living/advanced/npc/pirate_crew
	name = "骷髅船员"
	desc = "我的骨头咔咔响。"
	desc = "套套船长麾下的一名骷髅海盗。"
	species = "skeleton"
	sex = MALE
	gender = MALE
	loadout = /loadout/pirate/crew


	loyalty_tag = "Skeleton"
	iff_tag = "Skeleton"
	ai = /ai/advanced/skeleton

	level = 10

	blood_type = null


/mob/living/advanced/npc/pirate_crew/ranged
	name = "骷髅船员射手"
	loadout = /loadout/pirate/crew/ranged

	level = 16

/mob/living/advanced/npc/pirate_crew/magic
	name = "骷髅船员法师"
	loadout = /loadout/pirate/crew/magic

	level = 18

/mob/living/advanced/npc/pirate_crew/melee
	name = "骷髅船员拳手"
	loadout = /loadout/pirate/crew/melee

	level = 12


/mob/living/advanced/npc/pirate_crew/ninja
	name = "骷髅船员忍者"
	loadout = /loadout/pirate/crew/ninja

	level = 30
