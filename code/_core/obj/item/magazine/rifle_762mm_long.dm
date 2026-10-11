/obj/item/magazine/rifle_762_long
	name = "\improper 7.62x54mmR步枪弹匣"
	desc = "这是弹匣，不是弹夹！"
	desc_extended = "装有远程武器弹药，使用时请确认口径匹配。"
	icon = 'icons/obj/item/magazine/762_rifle_long.dmi'
	icon_state = "762l"
	bullet_count_max = 10

	weapon_whitelist = list(
		/obj/item/weapon/ranged/bullet/magazine/rifle/svt = TRUE
	)

	ammo = /obj/item/bullet_cartridge/rifle_308/long
	ammo_surplus = /obj/item/bullet_cartridge/rifle_308/long/surplus

	bullet_length_min = 46
	bullet_length_best = 54
	bullet_length_max = 58

	bullet_diameter_min = 7.6
	bullet_diameter_best = 7.62
	bullet_diameter_max = 7.7

	size = SIZE_2

	icon_states = 1

	value = 10
