/obj/item/magazine/rifle_308
	name = "\improper .308步枪弹匣"
	desc = "这是弹匣，不是弹夹！"
	desc_extended = "装有远程武器弹药，使用时请确认口径匹配。"
	icon = 'icons/obj/item/magazine/308_rifle.dmi'
	icon_state = "308"
	bullet_count_max = 30

	weapon_whitelist = list(
		/obj/item/weapon/ranged/bullet/magazine/rifle/marksman = TRUE,
		/obj/item/weapon/ranged/bullet/magazine/rifle/marksman/mod = TRUE
	)

	ammo = /obj/item/bullet_cartridge/rifle_308/
	ammo_surplus = /obj/item/bullet_cartridge/rifle_308/surplus

	bullet_length_min = 46
	bullet_length_best = 51
	bullet_length_max = 52

	bullet_diameter_min = 7.6
	bullet_diameter_best = 7.62
	bullet_diameter_max = 7.7

	size = SIZE_2

	icon_states = 1

	value = 10


/obj/item/magazine/rifle_308/ap
	name = "\improper .308穿甲弹步枪弹匣"
	icon = 'icons/obj/item/magazine/308_rifle_ap.dmi'
	ammo = /obj/item/bullet_cartridge/rifle_308/ap
