/mob/living/advanced/npc/arena_guard
	name = "竞技场守卫"
	ai = /ai/ranged/immobile/

/mob/living/advanced/npc/arena_guard/Initialize()
	. = ..()
	var/obj/item/weapon/W1 = new /obj/item/weapon/ranged/energy/unlimited(src.loc)
	pickup(W1)

/mob/living/advanced/npc/arena_guard/red
	name = "红队守卫"
	starting_factions = list("arena_red")

/mob/living/advanced/npc/arena_guard/blue
	name = "蓝队守卫"
	starting_factions = list("arena_blue")

/mob/living/advanced/npc/arena_guard/green
	name = "绿队守卫"
	starting_factions = list("arena_green")

/mob/living/advanced/npc/arena_guard/yellow
	name = "黄队守卫"
	starting_factions = list("arena_yellow")
