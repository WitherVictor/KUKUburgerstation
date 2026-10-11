/obj/item/magazine/honey
	name = "\improper .300 CCA弹匣"
	desc = "这是弹匣，不是弹夹！"
	desc_extended = "装有远程武器弹药，使用时请确认口径匹配。"
	icon = 'icons/obj/item/magazine/honey.dmi'
	icon_state = "honey"

	ammo = /obj/item/bullet_cartridge/honey
	ammo_surplus = /obj/item/bullet_cartridge/honey/surplus

	weapon_whitelist = list(
		/obj/item/weapon/ranged/bullet/magazine/rifle/honey = TRUE
	)

	bullet_length_min = 34
	bullet_length_best = 35
	bullet_length_max = 36

	bullet_diameter_min = 7.61
	bullet_diameter_best = 7.62
	bullet_diameter_max = 7.63

	size = SIZE_2

	bullet_count_max = 30

	icon_states = 1

	value = 10
