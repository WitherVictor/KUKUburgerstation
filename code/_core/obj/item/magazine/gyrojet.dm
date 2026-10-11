/obj/item/magazine/gyrojet
	name = "\improper 20mm旋转火箭弹匣"
	desc = "这是弹匣，不是弹夹！"
	desc_extended = "装有远程武器弹药，使用时请确认口径匹配。"
	icon = 'icons/obj/item/magazine/gyrojet.dmi'
	icon_state = "gyrojet"
	bullet_count_max = 4

	weapon_whitelist = list(
		/obj/item/weapon/ranged/bullet/magazine/pistol/gyrojet = TRUE
	)

	ammo = /obj/item/bullet_cartridge/gyrojet
	ammo_surplus = /obj/item/bullet_cartridge/gyrojet/surplus

	bullet_length_min = 48
	bullet_length_best = 50
	bullet_length_max = 52

	bullet_diameter_min = 19
	bullet_diameter_best = 20
	bullet_diameter_max = 21

	size = SIZE_2

	icon_states = 1

	value = 10
