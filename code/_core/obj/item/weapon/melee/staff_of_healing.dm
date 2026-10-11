/obj/item/weapon/melee/staff_of_healing
	name = "治疗法杖"
	desc = "有了被动奥术，还要什么药？"
	desc_extended = "发光的魔法法杖，激活后会被动治疗附近的生物，施法者除外。也是不错的钝击武器。"


	icon = 'icons/obj/item/weapons/melee/clubs/staff_of_healing.dmi'

	damage_type = /damagetype/melee/club/mace/

	size = SIZE_4

	weight = 15

	value = 1700

	var/next_heal= 0

	value_burgerbux = 1

	rarity = RARITY_LEGENDARY

/obj/item/weapon/melee/staff_of_healing/click_self(var/mob/activator,location,control,params)

	INTERACT_CHECK
	INTERACT_DELAY(1)

	if(!SSthinking.all_thinkers[src])
		START_THINKING(src)
		activator.to_chat(span("notice","你开启了[src.name]的被动治疗效果。"))
	else
		activator.to_chat(span("notice","你关闭了[src.name]的被动治疗效果。"))
		STOP_THINKING(src)

	return TRUE


/obj/item/weapon/melee/staff_of_healing/think()

	if(next_heal > world.time)
		return TRUE

	if(!istype(loc,/obj/hud/inventory))
		return FALSE

	var/obj/hud/inventory/I = loc

	if(!I.click_flags)
		return FALSE

	var/turf/T = get_turf(src)

	for(var/mob/living/L in oview(T,4))
		if(L.dead)
			continue
		if(!istype(L.health))
			continue
		if(L.health.health_current >= L.health.health_max)
			continue
		if(L.health.damage[BRUTE])
			L.brute_regen_buffer += 3
		if(L.health.damage[BURN])
			L.burn_regen_buffer += 3
		if(L.health.damage[TOX])
			L.tox_regen_buffer += 3
		var/obj/effect/temp/healing/H = new(L.loc,10,COLOR_MEDICAL)
		INITIALIZE(H)
		GENERATE(H)
		FINALIZE(H)

	next_heal = world.time + SECONDS_TO_DECISECONDS(1)

	return TRUE
