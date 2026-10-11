/obj/item/weapon/ranged/bullet/pump/rifle/hunting
	name = "\improper 7.62mm猎枪"
	desc = "同志！"
	desc_extended = "源自俄罗斯，如今被辛迪加拿来用于太空狩猎和太空解放事业。"
	icon = 'icons/obj/items/weapons/ranged/rifle/hunting.dmi'
	icon_state = "inventory"
	value = 40

	shoot_delay = 2

	automatic = FALSE

	bullet_count_max = 5



	shoot_sounds = list('sounds/weapons/rifle_heavy/shoot.ogg')

	can_wield = TRUE

	view_punch = 12

	pump_sound = 'sounds/weapons/gun_slide3.ogg'

	slowdown_mul_held = HELD_SLOWDOWN_RIFLE

	size = SIZE_5
	weight = WEIGHT_4

/obj/item/weapon/ranged/bullet/pump/rifle/hunting/get_static_spread() //Base spread
	if(!wielded)
		return 0.01
	return 0

/obj/item/weapon/ranged/bullet/pump/rifle/hunting/get_skill_spread(var/mob/living/L) //Base spread
	return 0.01 - (0.01 * L.get_skill_power(SKILL_RANGED))
