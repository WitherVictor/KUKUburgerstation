/obj/item/magazine/smp_9mm
	name = "\improper 9mm SMP弹匣"
	desc = "这是弹匣，不是弹夹！"
	desc_extended = "装有远程武器弹药，使用时请确认口径匹配。"
	icon = 'icons/obj/item/magazine/9mmsmp.dmi'
	icon_state = "smp"
	bullet_count_max = 27

	weapon_whitelist = list(
		/obj/item/weapon/ranged/bullet/magazine/smg/handheld = TRUE
	)

	ammo = /obj/item/bullet_cartridge/pistol_9mm
	ammo_surplus = /obj/item/bullet_cartridge/pistol_9mm/surplus

	bullet_length_min = 16
	bullet_length_best = 19
	bullet_length_max = 20

	bullet_diameter_min = 8.5
	bullet_diameter_best = 9
	bullet_diameter_max = 9.5

	size = SIZE_2

	icon_states = 9

	value = 10
