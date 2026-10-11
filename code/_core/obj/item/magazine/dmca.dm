/obj/item/magazine/dmca
	name = "\improper 10x24mm无壳弹DMCA弹匣"
	desc = "这是弹匣，不是弹夹！"
	desc_extended = "先进的弹匣，采用太阳系特有的四排堆叠装填技术，为DMCA提供高速四连发供弹。"
	icon = 'icons/obj/item/magazine/dmca.dmi'
	icon_state = "dmca"
	bullet_count_max = 99

	weapon_whitelist = list(
		/obj/item/weapon/ranged/bullet/magazine/rifle/dmca = TRUE
	)

	ammo = /obj/item/bullet_cartridge/pistol_10x24mm
	ammo_surplus = /obj/item/bullet_cartridge/pistol_10x24mm/surplus

	bullet_length_min = 23
	bullet_length_best = 24
	bullet_length_max = 24

	bullet_diameter_min = 9
	bullet_diameter_best = 10
	bullet_diameter_max = 10

	size = SIZE_2

	icon_states = 1

	value = 100


/obj/item/magazine/dmca/he
	name = "\improper 10x24mm无壳高爆穿甲弹DMCA弹匣"
	desc = "这是弹匣，不是弹夹！"
	desc_extended = "先进的弹匣，采用太阳系特有的四排堆叠装填技术，为DMCA提供高速四连发供弹。这款装有高爆弹药。"
	icon = 'icons/obj/item/magazine/dmca_he.dmi'
	icon_state = "dmca"

	ammo = /obj/item/bullet_cartridge/pistol_10x24mm/explosive
	ammo_surplus = /obj/item/bullet_cartridge/pistol_10x24mm/surplus

	value = 100

	rarity = RARITY_RARE
