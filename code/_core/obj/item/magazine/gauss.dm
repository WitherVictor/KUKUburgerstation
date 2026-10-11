/obj/item/magazine/gauss_gun
	name = "\improper 2.54x12mm高斯步枪弹匣"
	desc = "这是弹匣，不是弹夹！"
	desc_extended = "装有远程武器弹药，使用时请确认口径匹配。"
	icon = 'icons/obj/item/magazine/gauss_gun.dmi'
	icon_state = "fgauss"
	bullet_count_max = 10

	weapon_whitelist = list(
		/obj/item/weapon/ranged/bullet/magazine/rifle/gauss_gun = TRUE,
		/obj/item/weapon/ranged/bullet/magazine/rifle/gauss_gun/auto = TRUE
	)

	ammo = /obj/item/bullet_cartridge/gauss
	ammo_surplus = /obj/item/bullet_cartridge/gauss/surplus

	bullet_length_min = 11
	bullet_length_best = 12
	bullet_length_max = 14

	bullet_diameter_min = 1
	bullet_diameter_best = 2.54
	bullet_diameter_max = 3

	size = SIZE_2

	icon_states = 8

	value = 20

/obj/item/magazine/gauss_gun/explosive
	name = "\improper 2.54x12mm高斯步枪弹匣（爆晶矿独头弹）"
	icon_state = "fgausshe"
	ammo = /obj/item/bullet_cartridge/gauss/explosive
	rarity = RARITY_RARE

/obj/item/magazine/gauss_gun/ion
	name = "\improper 2.54x12mm高斯步枪弹匣（铀铁合金弹）"
	icon_state = "fgaussion"
	ammo = /obj/item/bullet_cartridge/gauss/ion
	rarity = RARITY_RARE

/obj/item/magazine/gauss_gun/incendiary
	name = "\improper 2.54x12mm高斯步枪弹匣（压缩凝固汽油弹）"
	icon_state = "fgaussinc"
	ammo = /obj/item/bullet_cartridge/gauss/incendiary
	rarity = RARITY_RARE

/obj/item/magazine/gauss_gun/ap
	name = "\improper 2.54x12mm高斯步枪弹匣（穿甲弹）"
	icon_state = "fgaussap"
	ammo = /obj/item/bullet_cartridge/gauss/ap
	rarity = RARITY_UNCOMMON
