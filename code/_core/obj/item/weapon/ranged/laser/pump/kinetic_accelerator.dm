/obj/item/weapon/ranged/energy/pump/kinetic_accelerator
	name = "动能加速器"
	desc = "泵动充能！"
	desc_extended = "先进采矿工具，利用磁力驱动的动能粉碎岩石和其他敌人。对较小物体的效果不太好。"
	icon = 'icons/obj/item/weapons/ranged/laser/kinetic_accelerator.dmi'

	company_type = "NanoTrasen"

	value = 800

	shoot_sounds = list('sound/weapons/ranged/energy/kinetic/shoot.ogg')
	pump_sound = 'sound/weapons/ranged/energy/kinetic/reload.ogg'

	projectile = /obj/projectile/bullet/laser/kinetic
	ranged_damage_type = /damagetype/ranged/laser/kinetic

	pump_delay = 5
	shoot_delay = 8

	projectile_speed = TILE_SIZE*0.75

	bullet_color = "#FFFFFF"

	rarity = RARITY_COMMON

/obj/item/weapon/ranged/energy/pump/kinetic_accelerator/update_icon()

	. = ..()

	icon_state = initial(icon_state)

	if(get_ammo_count() < 1)
		icon_state = "[icon_state]_empty"
