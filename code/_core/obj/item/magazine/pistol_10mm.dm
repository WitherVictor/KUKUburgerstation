/obj/item/magazine/pistol_10mm
	name = "\improper 10mm自动手枪弹匣"
	desc = "这是弹匣，不是弹夹！"
	desc_extended = "装有远程武器弹药，使用时请确认口径匹配。"
	icon = 'icons/obj/item/magazine/10mm_pistol.dmi'
	icon_state = "10mmpistol"
	bullet_count_max = 12

	weapon_whitelist = list(
		/obj/item/weapon/ranged/bullet/magazine/pistol/syndie = TRUE,
		/obj/item/weapon/ranged/bullet/magazine/pistol/syndie/mod = TRUE,
		/obj/item/weapon/ranged/bullet/magazine/pistol/high_power = TRUE,
		/obj/item/weapon/ranged/bullet/magazine/pistol/high_power/mod = TRUE,
		/obj/item/weapon/ranged/bullet/magazine/pistol/sol = TRUE,
		/obj/item/weapon/ranged/bullet/magazine/pistol/laton/prototype = TRUE
	)

	ammo = /obj/item/bullet_cartridge/pistol_10mm
	ammo_surplus = /obj/item/bullet_cartridge/pistol_10mm/surplus

	bullet_length_min = 25
	bullet_length_best = 32
	bullet_length_max = 33

	bullet_diameter_min = 10
	bullet_diameter_best = 10.17
	bullet_diameter_max = 11

	size = SIZE_2

	icon_states = 6

	value = 5

/obj/item/magazine/pistol_10mm/ap
	name = "\improper 10mm穿甲弹自动手枪弹匣"
	ammo = /obj/item/bullet_cartridge/pistol_10mm/ap
	rarity = RARITY_UNCOMMON
