/obj/item/magazine/lmg_762
	name = "\improper 7.62mm弹鼓"
	desc = "这是弹匣，不是弹夹！"
	desc_extended = "装有远程武器弹药，使用时请确认口径匹配。"
	icon = 'icons/obj/item/magazine/762_lmg.dmi'
	icon_state = "lmg"
	bullet_count_max = 40

	weapon_whitelist = list(
		/obj/item/weapon/ranged/bullet/magazine/rifle/lmg_nt = TRUE
	)

	ammo = /obj/item/bullet_cartridge/rifle_308/nato
	ammo_surplus = /obj/item/bullet_cartridge/rifle_308/nato/surplus

	bullet_length_min = 46
	bullet_length_best = 51
	bullet_length_max = 52

	bullet_diameter_min = 7.6
	bullet_diameter_best = 7.62
	bullet_diameter_max = 7.7

	size = SIZE_3

	icon_states = 1

	value = 20
