/obj/item/magazine/lmg_223
	name = "\improper .223轻机枪弹匣"
	desc = "这是弹匣，不是弹夹！"
	desc_extended = "装有远程武器弹药，使用时请确认口径匹配。"
	icon = 'icons/obj/item/magazine/223_lmg.dmi'
	icon_state = "223"
	bullet_count_max = 90

	weapon_whitelist = list(
		/obj/item/weapon/ranged/bullet/magazine/rifle/lmg = TRUE
	)

	ammo = /obj/item/bullet_cartridge/rifle_223
	ammo_surplus = /obj/item/bullet_cartridge/rifle_223/surplus

	bullet_length_min = 40
	bullet_length_best = 45
	bullet_length_max = 46

	bullet_diameter_min = 5.5
	bullet_diameter_best = 5.56
	bullet_diameter_max = 5.6

	size = SIZE_3

	icon_states = 11

	value = 30
