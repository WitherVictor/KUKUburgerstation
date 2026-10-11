/obj/item/magazine/pistol_12mm
	name = "\improper 12.7mm手枪弹匣"
	desc = "这是弹匣，不是弹夹！"
	desc_extended = "装有远程武器弹药，使用时请确认口径匹配。"
	icon = 'icons/obj/item/magazine/12mmpistol2.dmi'
	icon_state = "12mm"
	bullet_count_max = 8

	weapon_whitelist = list(
		/obj/item/weapon/ranged/bullet/magazine/pistol/deagle = TRUE,
		/obj/item/weapon/ranged/bullet/magazine/pistol/deagle/gold = TRUE,
		/obj/item/weapon/ranged/bullet/magazine/pistol/deagle/mod = TRUE,
		/obj/item/weapon/ranged/bullet/magazine/pistol/deagle/mod/equipped = TRUE,
		/obj/item/weapon/ranged/bullet/magazine/pistol/high_calibre = TRUE,
		/obj/item/weapon/ranged/bullet/magazine/pistol/high_calibre/mod = TRUE,
		/obj/item/weapon/ranged/bullet/magazine/pistol/overseer = TRUE,
		/obj/item/weapon/ranged/bullet/magazine/pistol/overseer/mod = TRUE,
		/obj/item/weapon/ranged/bullet/magazine/pistol/overseer/mod/silenced = TRUE
	)

	ammo = /obj/item/bullet_cartridge/pistol_12mm
	ammo_surplus = /obj/item/bullet_cartridge/pistol_12mm/surplus

	bullet_length_min = 30
	bullet_length_best = 33
	bullet_length_max = 36

	bullet_diameter_min = 12
	bullet_diameter_best = 12.7
	bullet_diameter_max = 13

	size = SIZE_2

	icon_states = 8

	value = 5

/obj/item/magazine/pistol_12mm/ap
	name = "\improper 12.7mm穿甲弹手枪弹匣"
	desc_extended = "装有远程武器弹药，使用时请确认口径匹配。这款装有穿甲弹。"
	ammo = /obj/item/bullet_cartridge/pistol_12mm/ap
