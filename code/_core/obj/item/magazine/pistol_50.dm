/obj/item/magazine/pistol_50
	name = "\improper .50手枪弹匣"
	desc = "与“Degle”不兼容。"
	desc_extended = "装有远程武器弹药，使用时请确认口径匹配。"
	icon = 'icons/obj/item/magazine/50aepistol.dmi'
	icon_state = "50ae"
	bullet_count_max = 7

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

	ammo = /obj/item/bullet_cartridge/pistol_50
	ammo_surplus = /obj/item/bullet_cartridge/pistol_50/surplus

	bullet_length_min = 30
	bullet_length_best = 33
	bullet_length_max = 36

	bullet_diameter_min = 12
	bullet_diameter_best = 12.7
	bullet_diameter_max = 13

	size = SIZE_2

	icon_states = 7

	value = 5

/obj/item/magazine/pistol_50/heartbreaker
	name = "\improper .50碎心弹手枪弹匣"
	desc = "与“Degle”不兼容。"
	desc_extended = "装有远程武器弹药，使用时请确认口径匹配。"

	ammo = /obj/item/bullet_cartridge/pistol_50/heartbreaker

	rarity = RARITY_RARE
