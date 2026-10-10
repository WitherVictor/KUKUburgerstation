/enchantment/fire
	name = "烈焰"
	desc = "点燃目标。"
	enchanting_phrase = "Woah Momma, Thats a spicy meatball!"
	enchanting_phrase_meaning = "我的妈呀，这肉丸真辣！"
	cost = 75

/enchantment/fire/on_hit(var/atom/attacker,var/atom/victim,var/obj/item/weapon/weapon,var/atom/hit_object,var/atom/blamed,var/total_damage_dealt=0)
	if(is_living(victim))
		var/mob/living/L = victim
		L.ignite(strength*5*(total_damage_dealt/80),attacker)
	return ..()


/enchantment/stagger
	name = "硬直"
	desc = "有概率使对手陷入硬直。"
	enchanting_phrase = "Oh fuck I slipped! Fucking nerf soap!"
	enchanting_phrase_meaning = "操，我滑倒了！快他妈削弱肥皂！"
	cost = 100

/enchantment/stagger/on_hit(var/atom/attacker,var/atom/victim,var/obj/item/weapon/weapon,var/atom/hit_object,var/atom/blamed,var/total_damage_dealt=0)
	if(is_living(victim) && prob(strength*5*min(1,total_damage_dealt/100)))
		var/mob/living/L = victim
		L.add_status_effect(STAGGER,3,3)
	return ..()


/enchantment/stun
	name = "眩晕"
	desc = "有概率使对手眩晕。"
	enchanting_phrase = "Fucking stunlockers are fucking noobs, Im tired of this shit!"
	enchanting_phrase_meaning = "只会连晕人的都是他妈的菜鸟，老子受够了！"
	cost = 200

/enchantment/stun/on_hit(var/atom/attacker,var/atom/victim,var/obj/item/weapon/weapon,var/atom/hit_object,var/atom/blamed,var/total_damage_dealt=0)
	if(is_living(victim) && prob(strength*2.5*(total_damage_dealt/100)))
		var/mob/living/L = victim
		L.add_status_effect(STUN,10,10)
	return ..()


/enchantment/disarm
	name = "缴械"
	desc = "有概率使对手被缴械。"
	enchanting_phrase = "Why are my fucking hands made of butter?"
	enchanting_phrase_meaning = "老子的手怎么他妈跟抹了黄油似的？"
	cost = 150

/enchantment/disarm/on_hit(var/atom/attacker,var/atom/victim,var/obj/item/weapon/weapon,var/atom/hit_object,var/atom/blamed,var/total_damage_dealt=0)
	if(is_advanced(victim) && prob(strength*5*(total_damage_dealt/50)))
		var/mob/living/advanced/L = victim
		L.add_status_effect(DISARM,50,50)
	return ..()

/enchantment/blood_leech
	name = "吸血"
	desc = "根据造成的伤害恢复血量。仅对活着的目标有效。"
	enchanting_phrase = "Blood for the blood god!"
	enchanting_phrase_meaning = "血祭血神！"
	cost = 125

/enchantment/blood_leech/on_hit(var/atom/attacker,var/atom/victim,var/obj/item/weapon/weapon,var/atom/hit_object,var/atom/blamed,var/total_damage_dealt=0)
	if(is_living(attacker) && is_living(victim))
		var/mob/living/V = victim
		var/mob/living/A = attacker
		if(!A.dead && !V.dead && V.blood_type && V.blood_volume_max)
			var/blood_to_steal = min(total_damage_dealt*0.1*strength,V.blood_volume,A.blood_volume_max - A.blood_volume)
			if(blood_to_steal > 0)
				V.blood_volume -= blood_to_steal
				A.blood_volume = clamp(A.blood_volume+blood_to_steal,0,A.blood_volume_max)

	return ..()

/enchantment/soul_trap
	name = "灵魂捕获"
	desc = "捕获大多数生物的灵魂。"
	enchanting_phrase = "Gingers have souls!"
	enchanting_phrase_meaning = "红头发的人也有灵魂！"
	cost = 50

/enchantment/soul_trap/on_hit(var/atom/attacker,var/atom/victim,var/obj/item/weapon/weapon,var/atom/hit_object,var/atom/blamed,var/total_damage_dealt=0)
	if(is_living(victim))
		var/mob/living/L = victim
		L.add_status_effect(SOULTRAP,10 + strength*30,10 + strength*30)
	return ..()
