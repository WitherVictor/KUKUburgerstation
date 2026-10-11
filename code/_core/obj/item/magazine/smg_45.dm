/obj/item/magazine/smg_45
	name = "\improper .45香蕉弹匣"
	desc = "这是弹匣，不是弹夹！"
	desc_extended = "装有远程武器弹药，使用时请确认口径匹配。"
	icon = 'icons/obj/item/magazine/45_smg.dmi'
	icon_state = "45"
	bullet_count_max = 25

	bullet_length_min = 20
	bullet_length_best = 23
	bullet_length_max = 24

	bullet_diameter_min = 11
	bullet_diameter_best = 11.43
	bullet_diameter_max = 12

	weapon_whitelist = list(
		/obj/item/weapon/ranged/bullet/magazine/smg/bullpup = TRUE,
		/obj/item/weapon/ranged/bullet/magazine/smg/bullpup/mod = TRUE,
		/obj/item/weapon/ranged/bullet/magazine/smg/fbi = TRUE,
	)

	ammo = /obj/item/bullet_cartridge/pistol_45
	ammo_surplus = /obj/item/bullet_cartridge/pistol_45/surplus

	size = SIZE_2

	value = 10

/obj/item/magazine/smg_45/update_icon()
	. = ..()
	icon_state = "[initial(icon_state)]_[get_ammo_count() ? 1 : 0]"

/obj/item/magazine/smg_45/ap
	name = "\improper .45穿甲弹香蕉弹匣"
	icon = 'icons/obj/item/magazine/45_smg_ap.dmi'
	icon_state = "45"
	ammo = /obj/item/bullet_cartridge/pistol_45/ap
	rarity = RARITY_UNCOMMON
