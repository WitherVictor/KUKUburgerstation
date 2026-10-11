/obj/item/bullet_cartridge/flintlock
	name = "\improper .62火药包与铁弹丸"
	desc = "唔，要是能把弹丸和火药合在一起，运输和装填就方便了……比如做成一发完整的子弹。"
	desc_extended = "供那些非得用这破玩意儿的古董武器装填。"
	icon = 'icons/obj/item/bullet/flintlock.dmi'

	bullet_length = 15.7
	bullet_diameter = 15.7

	amount_max = 3
	amount_max_icon = 3

	projectile = /obj/projectile/bullet/flintlock
	damage_type_bullet = /damagetype/ranged/bullet/flintlock

	projectile_speed = BULLET_SPEED_PISTOL_HEAVY

	size = 0.1
	value = 1 //Dummy value.

	caseless = TRUE

/obj/item/bullet_cartridge/flintlock/premium
	name = "\improper 优质.62火药包与铁弹丸"
	desc = "哇，瞧瞧科技进步得多快。"
	desc = "其实还是铁弹丸和火药，只是用纸包在一起，装填稍微方便了一点。"
	icon = 'icons/obj/item/bullet/flintlock_premium.dmi'

	damage_type_bullet = /damagetype/ranged/bullet/flintlock/premium
