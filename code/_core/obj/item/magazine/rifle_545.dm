/obj/item/magazine/rifle_545
	name = "\improper 5.45x39mm弹匣"
	desc = "这是弹匣，不是弹夹！"
	desc_extended = "装有远程武器弹药，使用时请确认口径匹配。"
	icon = 'icons/obj/item/magazine/545_rifle.dmi'
	icon_state = "545"
	bullet_count_max = 30

	weapon_whitelist = list(
		/obj/item/weapon/ranged/bullet/magazine/rifle/an94 = TRUE,
	)

	ammo = /obj/item/bullet_cartridge/rifle_545mm
	ammo_surplus = /obj/item/bullet_cartridge/rifle_545mm/surplus

	bullet_length_min = 38
	bullet_length_best = 39
	bullet_length_max = 40

	bullet_diameter_min = 5.4
	bullet_diameter_best = 5.45
	bullet_diameter_max = 5.46

	size = SIZE_2

	icon_states = 1

	value = 10

/obj/item/magazine/rifle_545/ap
	name = "\improper 5.45x39mm穿甲弹匣"
	desc = "这是弹匣，不是弹夹！"
	desc_extended = "装有远程武器弹药，使用时请确认口径匹配。"
	icon = 'icons/obj/item/magazine/545_rifle_ap.dmi'

	ammo = /obj/item/bullet_cartridge/rifle_545mm/ap
