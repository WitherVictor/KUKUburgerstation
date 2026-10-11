/obj/item/magazine/holy45
	name = "\improper 神圣.45手枪弹匣"
	desc = "这是弹匣，不是弹夹！"
	desc_extended = "装有远程武器弹药，使用时请确认口径匹配。"
	icon = 'icons/obj/item/magazine/holy45.dmi'
	icon_state = "holy45"
	bullet_count_max = 7

	weapon_whitelist = list(
		/obj/item/weapon/ranged/bullet/magazine/pistol/holy45 = TRUE,
	)

	ammo = /obj/item/bullet_cartridge/pistol_45holy/
	ammo_surplus = /obj/item/bullet_cartridge/pistol_45holy/surplus

	bullet_length_min = 20
	bullet_length_best = 24
	bullet_length_max = 24.1

	bullet_diameter_min = 11
	bullet_diameter_best = 11.77
	bullet_diameter_max = 11.78

	size = SIZE_2

	icon_states = 7

	value = 5
