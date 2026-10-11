/obj/structure/totem
	name = "图腾"
	desc = "无。"
	desc_extended = "为施法者及其友军提供增益的图腾。"
	icon = 'icons/obj/structure/totem.dmi'

	health_base = 200

	var/next_fire = 0
	var/cooldown_fire = SECONDS_TO_DECISECONDS(1)

	var/mob/living/owner //the object's owner
	var/totem_remove_time = 0

	var/leveled_effect = 0

	var/affecting_faction //which faction it should affect

	var/ranged_limited = TRUE //if a totem isn't too strong, be nice and don't limit the totem to only work within a range
	var/required_range = 11

/obj/structure/totem/Finalize()
	. = ..()
	flick("appear", src)
	START_THINKING(src)

/obj/structure/totem/Destroy()
	if(owner)
		owner.totem = null
		owner = null
	return ..()

/obj/structure/totem/think()
	if(owner?.dead)
		qdel(src)
		return FALSE
	if(world.time >= totem_remove_time)
		qdel(src)
		return FALSE
	if(world.time <= next_fire)
		return TRUE
	next_fire = world.time + cooldown_fire
	if(get_dist(owner.loc, loc) > required_range && ranged_limited)
		return TRUE
	totemic_effect()
	return TRUE

/obj/structure/totem/proc/totemic_effect()
	return

/*******************
*******TOTEMS*******
*******************/

/obj/structure/totem/health_heal
	name = "生命再生图腾"
	desc = "他们说，快治好他们。他们说，别让我哭。"
	desc_extended = "恢复施法者及其友军生命值的图腾。"
	icon_state = "health"

/obj/structure/totem/health_heal/totemic_effect() //copy paste from staff of healing's think, with slight modifications
	var/turf/T = get_turf(src)
	for(var/mob/living/L in viewers(4,T))
		if(L.dead)
			continue
		if(!allow_helpful_action(affecting_faction,L))
			continue
		if(!istype(L.health))
			continue
		if(L.health.health_current >= L.health.health_max)
			continue
		if(L.health.damage[BRUTE])
			L.brute_regen_buffer += (3 + (3 * leveled_effect))
		if(L.health.damage[BURN])
			L.burn_regen_buffer += (3 + (3 * leveled_effect))
		if(L.health.damage[TOX])
			L.tox_regen_buffer += (3 + (3 * leveled_effect))
		CREATE(/obj/effect/temp/healing,L.loc)

/obj/structure/totem/health_deal
	name = "生命侵蚀图腾"
	desc = "痛楚与苦难，我最爱的两件玩具！"
	desc_extended = "损耗施法者敌人生命值的图腾。"
	icon_state = "healthloss"

/obj/structure/totem/health_deal/totemic_effect() //copy paste from staff of healing's think, with slight modifications
	var/turf/T = get_turf(src)
	for(var/mob/living/L in viewers(4,T))
		if(L.dead)
			continue
		if(!allow_hostile_action(affecting_faction,L))
			continue
		if(!istype(L.health))
			continue
		L.brute_regen_buffer -= (3 + (3 * leveled_effect))
		L.burn_regen_buffer -= (3 + (3 * leveled_effect))
		L.tox_regen_buffer -= (3 + (3 * leveled_effect))
		CREATE(/obj/effect/temp/electricity,L.loc)

/obj/structure/totem/stamina_heal
	name = "体力再生图腾"
	desc = "有人不肯锻炼，宁愿靠药物撑着……"
	desc_extended = "恢复施法者及其友军体力的图腾。"
	icon_state = "stamina"

/obj/structure/totem/stamina_heal/totemic_effect() //will need testing and help to balance this
	var/turf/T = get_turf(src)
	for(var/mob/living/L in viewers(4,T))
		if(L.dead)
			continue
		if(!allow_helpful_action(affecting_faction,L))
			continue
		if(!istype(L.health))
			continue
		if(L.health.stamina_current >= L.health.stamina_max)
			continue
		L.stamina_regen_buffer += (3 + (3 * leveled_effect))
		CREATE(/obj/effect/temp/healing,L.loc)

/obj/structure/totem/stamina_deal
	name = "体力消耗图腾"
	desc = "速效麻痹剂，让他们彻底没了用武之地！"
	desc_extended = "损耗施法者敌人体力的图腾。"
	icon_state = "staminaloss"

/obj/structure/totem/stamina_deal/totemic_effect() //will need testing and help to balance this
	var/turf/T = get_turf(src)
	for(var/mob/living/L in viewers(4,T))
		if(L.dead)
			continue
		if(!allow_hostile_action(affecting_faction,L))
			continue
		if(!istype(L.health))
			continue
		L.stamina_regen_buffer -= (3 + (3 * leveled_effect))
		CREATE(/obj/effect/temp/electricity,L.loc)

/obj/structure/totem/mana_heal
	name = "法力再生图腾"
	desc = "别问我练到这等魔法境界花了多少年。"
	desc_extended = "恢复施法者及其友军法力的图腾。"
	icon_state = "mana"

/obj/structure/totem/mana_heal/totemic_effect() //will need testing and help to balance this
	var/turf/T = get_turf(src)
	for(var/mob/living/L in viewers(4,T))
		if(L.dead)
			continue
		if(!allow_helpful_action(affecting_faction,L))
			continue
		if(!istype(L.health))
			continue
		if(L.health.mana_current >= L.health.mana_max)
			continue
		L.mana_regen_buffer += (3 + (3 * leveled_effect))
		CREATE(/obj/effect/temp/healing,L.loc)

/obj/structure/totem/mana_deal
	name = "法力消耗图腾"
	desc = "我要融化了，我要融化了！"
	desc_extended = "损耗施法者敌人法力的图腾。"
	icon_state = "manaloss"

/obj/structure/totem/mana_deal/totemic_effect() //will need testing and help to balance this
	var/turf/T = get_turf(src)
	for(var/mob/living/L in viewers(4,T))
		if(L.dead)
			continue
		if(!allow_hostile_action(affecting_faction,L))
			continue
		if(!istype(L.health))
			continue
		L.mana_regen_buffer -= (3 + (3 * leveled_effect))
		CREATE(/obj/effect/temp/electricity,L.loc)

/obj/structure/totem/sacred_flame
	name = "圣焰图腾"
	desc = "你能从这燃烧的灌木中听见神谕吗？"
	desc = "有人想出了把一本书塞进图腾的点子。"
	desc_extended = "点燃施法者敌人的图腾。"
	icon_state = "sacred_flame"

/obj/structure/totem/sacred_flame/totemic_effect() //will need testing and help to balance this
	var/turf/T = get_turf(src)
	for(var/mob/living/L in viewers(4,T))
		if(L.dead)
			continue
		if(!allow_hostile_action(affecting_faction,L))
			continue
		if(!istype(L.health))
			continue
		L.ignite(SECONDS_TO_DECISECONDS(1.5),src)
		L.health.adjust_loss_smart(burn = 5 * leveled_effect)
		CREATE(/obj/effect/temp/electricity,L.loc)

/obj/structure/totem/repelling
	name = "排斥图腾"
	desc = "他们以为这是拉仇恨用的，真是傻瓜。"
	desc_extended = "推开施法者敌人的图腾，对首领无效。"
	icon_state = "magnet"

/obj/structure/totem/repelling/totemic_effect() //will need testing and help to balance this
	var/turf/T = get_turf(src)
	for(var/mob/living/L in viewers(4*leveled_effect,T))
		if(L.dead)
			continue
		if(L.boss) //yea, no repelling bosses, sorry
			continue
		if(!allow_hostile_action(affecting_faction,L))
			continue
		if(!istype(L.health))
			continue
		if(!L.z) //if a living thing is somewhere that isnt in a turf, skip them
			continue
		if(L.loc == loc) //if they are on the same turf, skip them
			continue
		L.Move(get_step(L.loc,get_dir(src,L)))
		CREATE(/obj/effect/temp/electricity,L.loc)

/obj/structure/totem/attracting
	name = "吸引图腾"
	desc = "他们以为这是拉仇恨用的，真是傻瓜。"
	desc_extended = "拉近施法者敌人的图腾，对首领无效。"
	icon_state = "magnet"

/obj/structure/totem/attracting/totemic_effect() //will need testing and help to balance this
	var/turf/T = get_turf(src)
	for(var/mob/living/L in viewers(4*leveled_effect,T))
		if(L.dead)
			continue
		if(L.boss) //yea, no attracting bosses, sorry
			continue
		if(!allow_hostile_action(affecting_faction,L))
			continue
		if(!istype(L.health))
			continue
		if(!L.z)
			continue
		if(L.loc == loc) //if they are on the same turf, skip them
			continue
		L.Move(get_step(L.loc,get_dir(L,src)))
		CREATE(/obj/effect/temp/electricity,L.loc)

/obj/structure/totem/projectile
	name = "弹体图腾"
	desc = "无。"
	desc_extended = "向施法者的敌人发射弹体的图腾。"
	var/chosenProjectile
	var/chosenDamageType

/obj/structure/totem/projectile/totemic_effect() //will need testing and help to balance this
	var/turf/T = get_turf(src)
	var/list/chooseEnemies = list()
	for(var/mob/living/L in viewers(4,T))
		if(L.dead)
			continue
		if(!allow_hostile_action(affecting_faction,L))
			continue
		if(!istype(L.health))
			continue
		chooseEnemies += L
	if(!length(chooseEnemies))
		return
	for(var/i in 1 to leveled_effect)
		shoot_projectile(
			src,
			pick(chooseEnemies),
			null,
			null,
			chosenProjectile,
			chosenDamageType,
			16,
			16,
			0,
			TILE_SIZE*0.5,
			1,
			"#FFFFFF",
			0,
			1,
			affecting_faction,
			affecting_faction
		)

/obj/structure/totem/projectile/frost_spray
	name = "寒霜喷射图腾"
	desc = "外面天寒地冻，炉火却暖意融融。"
	desc_extended = "向施法者的敌人喷射寒霜的图腾。"
	icon_state = "frost"
	chosenProjectile = /obj/projectile/magic/frost
	chosenDamageType = /damagetype/ranged/magic/frost

/obj/structure/totem/projectile/flame_spray
	name = "火焰喷射图腾"
	desc = "外面天寒地冻，炉火却暖意融融。"
	desc_extended = "向施法者的敌人喷射火焰的图腾。"
	icon_state = "flame"
	chosenProjectile = /obj/projectile/magic/lesser_fire
	chosenDamageType = /damagetype/ranged/magic/flame

/obj/structure/totem/projectile/shock_spray
	name = "电击喷射图腾"
	desc = "听我说，宝贝，你得明白，闪电又劈下来了！"
	desc_extended = "向施法者的敌人释放电击的图腾。"
	icon_state = "shock"
	chosenProjectile = /obj/projectile/magic/lightning
	chosenDamageType = /damagetype/ranged/magic/shock

/obj/structure/totem/projectile/ice_crystal
	name = "冰晶图腾"
	desc = "外面天寒地冻，炉火却暖意融融。"
	desc_extended = "向施法者的敌人发射冰晶的图腾。"
	icon_state = "frost"
	chosenProjectile = /obj/projectile/magic/crystal/ice
	chosenDamageType = /damagetype/ranged/magic/ice

/obj/structure/totem/projectile/fireball
	name = "火球图腾"
	desc = "外面天寒地冻，炉火却暖意融融。"
	desc_extended = "向施法者的敌人发射火球的图腾。"
	icon_state = "flame"
	chosenProjectile = /obj/projectile/magic/fireball
	chosenDamageType = /damagetype/ranged/magic/fireball

/obj/structure/totem/projectile/lightning_bolt
	name = "闪电图腾"
	desc = "听我说，宝贝，你得明白，闪电又劈下来了！"
	desc_extended = "向施法者的敌人发射闪电的图腾。"
	icon_state = "shock"
	chosenProjectile = /obj/projectile/magic/lightning_bolt
	chosenDamageType = /damagetype/ranged/magic/lightning

/obj/structure/totem/blood_heal
	name = "血液再生图腾"
	desc = "就像御水术，只不过操纵的是血。"
	desc_extended = "补充施法者及其友军血量的图腾。"
	icon_state = "blood"

/obj/structure/totem/blood_heal/totemic_effect() //will need testing and help to balance this
	var/turf/T = get_turf(src)
	for(var/mob/living/L in viewers(4,T))
		if(L.dead)
			continue
		if(!allow_helpful_action(affecting_faction,L))
			continue
		if(!istype(L.health))
			continue
		if(L.blood_volume >= L.blood_volume_max)
			continue
		L.blood_volume += min(L.blood_volume_max - L.blood_volume,leveled_effect*5)
		CREATE(/obj/effect/temp/healing,L.loc)

/obj/structure/totem/blood_deal
	name = "血液流失图腾"
	desc = "就像御水术，只不过操纵的是血。"
	desc_extended = "使施法者敌人失血的图腾。"
	icon_state = "bloodloss"

/obj/structure/totem/blood_deal/totemic_effect() //will need testing and help to balance this
	var/turf/T = get_turf(src)
	for(var/mob/living/L in viewers(4,T))
		if(L.dead)
			continue
		if(!allow_hostile_action(affecting_faction,L))
			continue
		if(!istype(L.health))
			continue
		if(L.blood_volume <= 0)
			continue
		L.blood_volume -= min(L.blood_volume,leveled_effect*5)
		CREATE(/obj/effect/temp/electricity,L.loc)
