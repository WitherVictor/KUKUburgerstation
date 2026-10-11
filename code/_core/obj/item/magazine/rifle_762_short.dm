/obj/item/magazine/rifle_762_short
	name = "\improper 7.62x39mm苏式弹匣"
	desc = "这是弹匣，不是弹夹！"
	desc_extended = "装有远程武器弹药，使用时请确认口径匹配。"
	icon = 'icons/obj/item/magazine/762_short_rifle.dmi'
	icon_state = "762"
	bullet_count_max = 30

	weapon_whitelist = list(
		/obj/item/weapon/ranged/bullet/magazine/rifle/ak47 = TRUE,
		/obj/item/weapon/ranged/bullet/magazine/rifle/ak47/mod = TRUE
	)

	ammo = /obj/item/bullet_cartridge/rifle_308/short
	ammo_surplus = /obj/item/bullet_cartridge/rifle_308/short/surplus

	bullet_length_min = 38
	bullet_length_best = 39
	bullet_length_max = 40

	bullet_diameter_min = 7.6
	bullet_diameter_best = 7.62
	bullet_diameter_max = 7.7

	size = SIZE_2

	icon_states = 1

	value = 10
