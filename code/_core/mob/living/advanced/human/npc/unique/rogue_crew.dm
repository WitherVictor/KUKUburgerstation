/mob/living/advanced/npc/unique/rogue_crew
	name = "叛变船员"
	desc = "曾效力于纳米传讯，如今在这一带游荡，眼里只剩嗜血欲望。"

	iff_tag = "Rogue"
	loyalty_tag = "Rogue"

	health_base = 100
	stamina_base = 100
	mana_base = 100

	has_hard_crit = TRUE

	death_threshold = -100

	level = 50

/mob/living/advanced/npc/unique/rogue_crew/Finalize()
	. = ..()
	filters += filter("drop_shadow",x=0,y=0,size=-5,offset=0,color=COLOR_BLOOD)

/mob/living/advanced/npc/unique/rogue_crew/get_base_transform()
	. = ..()
	var/matrix/M = .
	M.Scale(1.1,1.1)
