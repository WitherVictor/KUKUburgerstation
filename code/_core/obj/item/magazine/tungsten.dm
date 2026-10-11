/obj/item/magazine/rifle_tungsten
	name = "\improper 钨弹弹匣"
	desc = "这是弹匣，不是弹夹！"
	desc_extended = "装有远程武器弹药，使用时请确认口径匹配。"
	icon = 'icons/obj/item/magazine/tungsten.dmi'
	icon_state = "t"
	bullet_count_max = 20

	weapon_whitelist = list(
		/obj/item/weapon/ranged/bullet/magazine/rifle/tungsten = TRUE,
	)

	ammo = /obj/item/bullet_cartridge/tungsten
	ammo_surplus = /obj/item/bullet_cartridge/tungsten/surplus

	bullet_length_min = 15
	bullet_length_best = 20
	bullet_length_max = 25

	bullet_diameter_min = 4
	bullet_diameter_best = 5
	bullet_diameter_max = 6

	size = SIZE_2

	icon_states = 10

	value = 10
