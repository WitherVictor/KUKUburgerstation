//swarmerfile

/mob/living/simple/swarmer
	name = "蜂群机器人"

	icon = 'icons/mob/living/simple/swarmer.dmi'
	icon_state = "swarmer_unactivated"
	blood_type = null
	damage_type = /damagetype/npc/swarmer

	size = SIZE_CRITTER

	iff_tag = "Swarmer"
	loyalty_tag = "Swarmer"
	movement_delay = 3

	level = 4

	armor = /armor/borg

	var/ranged = FALSE
	var/mob/living/simple/swarmer/console/parent_console

	health_base = 200
	delete_on_death = TRUE
	has_footsteps = FALSE
	collision_flags = FLAG_COLLISION_FLYING

	default_language = LANGUAGE_BINARY

/mob/living/simple/swarmer/death_message()
	return FALSE

/mob/living/simple/swarmer/PreDestroy()
	. = ..()
	if(parent_console)
		parent_console.swarmercount -= src
		parent_console = null

//builder
/mob/living/simple/swarmer/builder
	name = "建造型蜂群机器人"

	icon = 'icons/mob/living/simple/swarmer.dmi'
	icon_state = "swarmer"
	var/trap_cooldown = 15//45s cooldown
	var/wall_cooldown = 30//60s cooldown
	ai = /ai/swarmer/builder
	var/mob/living/simple/swarmer/builder/V

/mob/living/simple/swarmer/builder/proc/buildtrap()

	if(trap_cooldown > world.time)
		return FALSE

	if(dead)
		return FALSE

	V = new /obj/structure/interactive/swarmer/trap(get_turf(src))
	V = src
	INITIALIZE(V)
	GENERATE(V)
	FINALIZE(V)

	trap_cooldown = world.time + 45

	return TRUE

/mob/living/simple/swarmer/builder/proc/buildwall()

	if(wall_cooldown > world.time)
		return FALSE

	if(dead)
		return FALSE

	V = new /obj/structure/interactive/swarmer/wall(get_turf(src))
	V = src

	wall_cooldown = world.time + 60

	return TRUE
//melee
/mob/living/simple/swarmer/melee
	name = "近战型蜂群机器人"

	icon = 'icons/mob/living/simple/swarmer.dmi'
	icon_state = "swarmer_melee"

//ranged
/mob/living/simple/swarmer/ranged
	name = "远程型蜂群机器人"

	icon = 'icons/mob/living/simple/swarmer.dmi'
	icon_state = "swarmer_ranged"

	ranged = TRUE
	ai = /ai/swarmer/ranged

//swarmer structures. Yes I made them mobs and not strucutres, I think that's smarter.
/mob/living/simple/swarmer/console
	name = "蜂群控制台"

	icon = 'icons/mob/living/simple/swarmer.dmi'
	icon_state = "swarmer_console"
	health_base = 2000

	level = 8

	damage_type = /damagetype/unarmed/

	anchored = TRUE

	size = SIZE_GIANT

	collision_flags = FLAG_COLLISION_WALL //YOU'RE UP AGAINST THE WALL AND I AM THE FUCKING WALL

	ai = /ai/swarmer/console

	var/mob/living/simple/swarmer/swarmertype = /mob/living/simple/swarmer/builder //builder is default, /mob/living/simple/swarmer/melee, /mob/living/simple/swarmer/ranged)

	var/list/mob/living/simple/swarmer/swarmercount = list()

	var/swarmer_limit = 10
	var/next_spawn = 0

/mob/living/simple/swarmer/console/PreDestroy()

	for(var/k in swarmercount)
		var/mob/living/simple/swarmer/L = k
		L.death()
	swarmercount?.Cut()

	return ..()


/mob/living/simple/swarmer/console/proc/spawn_swarmer()

	if(next_spawn > world.time)
		return FALSE

	if(length(swarmercount) >= swarmer_limit)
		return FALSE

	if(dead)
		return FALSE

	if(length(swarmercount) > 3)
		swarmertype = /mob/living/simple/swarmer/melee
	if(length(swarmercount) > 6)
		swarmertype = /mob/living/simple/swarmer/ranged

	var/mob/living/simple/swarmer/console/L = new swarmertype(get_turf(src))
	L.parent_console = src
	INITIALIZE(L)
	GENERATE(L)
	FINALIZE(L)

	if(L.ai)
		if(ai && ai.objective_attack)
			L.ai.set_objective(ai.objective_attack)
		else
			L.ai.set_active(TRUE)

	swarmercount += L

	next_spawn = world.time + 15

	return TRUE

/obj/structure/interactive/swarmer/
	name = "蜂群构筑物！"
	desc_extended = "我是占位物！"
	icon = 'icons/mob/living/simple/swarmer.dmi'
	icon_state = "swarmer_unactivated"
	density = TRUE
	anchored = TRUE
	can_rotate = FALSE
	health = /health/construction
	collision_bullet_flags = FLAG_COLLISION_BULLET_INORGANIC

/obj/structure/interactive/swarmer/on_destruction(var/damage = TRUE)
    . = ..()
    qdel(src)

/obj/structure/interactive/swarmer/wall
	name = "全息路障"
	desc_extended = "建造型蜂群机器人部署的全息屏障。"
	icon_state = "barricade"
	bullet_block_chance = 90
	collision_flags = FLAG_COLLISION_BARICADE
	health_base = 300

/obj/structure/interactive/swarmer/trap
	name = "全息陷阱"
	desc_extended = "一团纯能量。别碰它。"
	icon_state = "trap"
	health_base = 50

/obj/structure/interactive/swarmer/trap/Crossed(mob/living/O)

	. = ..()
	if(is_living(O))
		O.to_chat(span("danger","<h1>陷阱让你一阵剧痛！！</h1>"))
		O.send_pain_response(50)
		return TRUE
	qdel(src)
