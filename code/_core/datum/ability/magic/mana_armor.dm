/ability/magic/mana_armor
	name = "开关法力护甲"
	desc = "可开关的能力。法力高于上限的一半时，将总奥术护甲值的 25% 加到总钝击、切割和穿刺护甲值上。受到钝击、切割或穿刺伤害时，会消耗与伤害量相等的法力。"
	icon_state = "mana_armor"
	cost = 25
	cooldown = SECONDS_TO_DECISECONDS(3)

	toggle = TRUE

/ability/magic/mana_armor/is_active(var/mob/activator)

	if(is_living(activator))
		var/mob/living/L = activator
		return L.has_status_effect(MANA_ARMOR)

	return FALSE

/ability/magic/mana_armor/on_cast(var/mob/activator,var/atom/target,location,params)
	. = ..()
	if(. && is_living(activator))
		var/mob/living/L = activator
		if(L.has_status_effect(MANA_ARMOR))
			L.remove_status_effect(MANA_ARMOR)
		else
			L.add_status_effect(MANA_ARMOR,25,-1,L,TRUE,FALSE,TRUE)
