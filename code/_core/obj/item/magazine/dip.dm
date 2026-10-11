/obj/item/magazine/dip_22
	name = "\improper .22潮人手枪弹匣"
	desc = "这是弹匣，不是弹夹！"
	desc_extended = "装有远程武器弹药，使用时请确认口径匹配。"
	icon = 'icons/obj/item/magazine/22_dip.dmi'
	icon_state = "22"
	bullet_count_max = 10

	weapon_whitelist = list(
		/obj/item/weapon/ranged/bullet/magazine/pistol/dip = TRUE,
	)

	ammo = /obj/item/bullet_cartridge/pistol_22
	ammo_surplus = /obj/item/bullet_cartridge/pistol_22/surplus

	bullet_length_min = 17
	bullet_length_best = 17.7
	bullet_length_max = 18

	bullet_diameter_min = 5
	bullet_diameter_best = 5.6
	bullet_diameter_max = 6

	size = SIZE_1

	icon_states = 1

	value = 5
