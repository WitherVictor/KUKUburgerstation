/obj/item/weapon/ranged/magic/tome/holy_warrior //TODO:FIX THIS
	name = "神圣战士法术典籍"
	desc = "给懒得亲自战斗的人。"
	desc_extended = "使用时消耗法力。"
	cost_mana = 100

	icon = 'icons/obj/items/weapons/ranged/magic/tomes/holy_summon.dmi'

	associated_skill = SKILL_PRAYER

	projectile = /obj/projectile/bullet/holy_summon

	shoot_sounds = list('sounds/weapons/magic/summon.ogg')

	projectile_speed = 3

/obj/item/weapon/ranged/magic/tome/holy_warrior/get_static_spread() //Base spread
	return 0

/obj/item/weapon/ranged/magic/tome/holy_warrior/get_skill_spread(var/mob/living/L) //Base spread
	return 0
