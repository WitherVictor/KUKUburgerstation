/obj/item/magazine/clip/revolver

/obj/item/magazine/clip/revolver/bullet_38
	name = "\improper .38六发快速装弹器"
	desc = "这是弹匣，不是弹——等等，什么？"
	desc_extended = "装有远程武器弹药，使用时请确认口径匹配。"
	icon = 'icons/obj/item/magazine/revolver/38.dmi'
	icon_state = "38"
	bullet_count_max = 6

	weapon_whitelist = list(,
		/obj/item/weapon/ranged/bullet/revolver/detective = TRUE,
		/obj/item/weapon/ranged/bullet/revolver/defender = TRUE
	)

	ammo = /obj/item/bullet_cartridge/revolver_38
	ammo_surplus = /obj/item/bullet_cartridge/revolver_38/surplus

	bullet_length_min = 10
	bullet_length_best = 29
	bullet_length_max = 30

	bullet_diameter_min = 8.5
	bullet_diameter_best = 9
	bullet_diameter_max = 9.5

	size = SIZE_1

	icon_states = 6

	value = 15

/obj/item/magazine/clip/revolver/bullet_44
	name = "\improper .44左轮快速装弹器"
	desc = "这是弹匣，不是弹——等等，什么？"
	desc_extended = "装有远程武器弹药，使用时请确认口径匹配。"
	icon = 'icons/obj/item/magazine/revolver/44.dmi'
	icon_state = "44"
	bullet_count_max = 6

	weapon_whitelist = list(
		/obj/item/weapon/ranged/bullet/revolver/commander = TRUE,
		/obj/item/weapon/ranged/bullet/revolver/deckhard = TRUE
	)

	ammo = /obj/item/bullet_cartridge/revolver_44
	ammo_surplus = /obj/item/bullet_cartridge/revolver_44/surplus

	bullet_length_min = 10
	bullet_length_best = 29
	bullet_length_max = 30

	bullet_diameter_min = 10
	bullet_diameter_best = 10.9
	bullet_diameter_max = 11

	size = SIZE_1

	icon_states = 6

	value = 15

/obj/item/magazine/clip/revolver/bullet_357
	name = "\improper .357快速装弹器"
	desc = "这是弹匣，不是弹——等等，什么？"
	desc_extended = "装有远程武器弹药，使用时请确认口径匹配。"
	icon = 'icons/obj/item/magazine/revolver/357.dmi'
	icon_state = "357"
	bullet_count_max = 6

	weapon_whitelist = list(
		/obj/item/weapon/ranged/bullet/revolver/traitor_357 = TRUE
	)

	ammo = /obj/item/bullet_cartridge/revolver_357
	ammo_surplus = /obj/item/bullet_cartridge/revolver_357/surplus

	bullet_length_min = 20
	bullet_length_best = 33
	bullet_length_max = 35

	bullet_diameter_min = 8.5
	bullet_diameter_best = 9
	bullet_diameter_max = 9.5

	size = SIZE_1

	icon_states = 6

	value = 15

/obj/item/magazine/clip/revolver/bullet_357/heap
	name = "\improper .357高爆穿甲弹快速装弹器"
	ammo = /obj/item/bullet_cartridge/revolver_357/heap
	ammo_surplus = /obj/item/bullet_cartridge/revolver_357/surplus
