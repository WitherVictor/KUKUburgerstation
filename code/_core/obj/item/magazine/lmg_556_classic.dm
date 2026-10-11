/obj/item/magazine/lmg_556_classic
	name = "\improper 5.56mm经典轻机枪弹匣"
	desc = "这是弹匣，不是弹夹！"
	desc_extended = "装有远程武器弹药，使用时请确认口径匹配。"
	icon = 'icons/obj/item/magazine/556_lmg_classic.dmi'
	icon_state = "556"
	bullet_count_max = 100

	weapon_whitelist = list(
		/obj/item/weapon/ranged/bullet/magazine/rifle/lmg_nt_classic = TRUE
	)

	ammo = /obj/item/bullet_cartridge/rifle_223/nato
	ammo_surplus = /obj/item/bullet_cartridge/rifle_223/nato/surplus

	bullet_length_min = 40
	bullet_length_best = 45
	bullet_length_max = 46

	bullet_diameter_min = 5.5
	bullet_diameter_best = 5.56
	bullet_diameter_max = 5.6

	size = SIZE_2

	icon_states = 1

	value = 10
