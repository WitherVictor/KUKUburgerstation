/obj/item/magazine/pistol_40
	name = "\improper .40手枪弹匣"
	desc = "这是弹匣，不是弹夹！"
	desc_extended = "装有远程武器弹药，使用时请确认口径匹配。"
	icon = 'icons/obj/item/magazine/40pistol.dmi'
	icon_state = "40"
	bullet_count_max = 9

	weapon_whitelist = list(
		/obj/item/weapon/ranged/bullet/magazine/pistol/military/prototype = TRUE,
		/obj/item/weapon/ranged/bullet/magazine/pistol/brown = TRUE,
		/obj/item/weapon/ranged/bullet/magazine/pistol/brown/mod = TRUE,
		/obj/item/weapon/ranged/bullet/magazine/pistol/brown/mod/silenced = TRUE
	)

	ammo = /obj/item/bullet_cartridge/pistol_40
	ammo_surplus = /obj/item/bullet_cartridge/pistol_40/surplus

	bullet_length_min = 21
	bullet_length_best = 22
	bullet_length_max = 23

	bullet_diameter_min = 9.8
	bullet_diameter_best = 10
	bullet_diameter_max = 11.2

	size = SIZE_2

	icon_states = 9

	value = 5

/obj/item/magazine/pistol_40/tranq
	name = "\improper .40麻醉弹手枪弹匣"
	icon = 'icons/obj/item/magazine/40pistol_tranq.dmi'
	ammo = /obj/item/bullet_cartridge/pistol_40/tranq
	rarity = RARITY_UNCOMMON
