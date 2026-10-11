/obj/item/magazine/sniper_20mm
	name = "\improper 20x117mm狙击枪弹匣"
	desc = "这是弹匣，不是弹夹！"
	desc_extended = "装有远程武器弹药，使用时请确认口径匹配。"
	icon = 'icons/obj/item/magazine/20mm_sniper.dmi'
	icon_state = "20"
	bullet_count_max = 4

	weapon_whitelist = list(
		/obj/item/weapon/ranged/bullet/magazine/rifle/sniper_20 = TRUE,
	)

	ammo = /obj/item/bullet_cartridge/sniper_20
	ammo_surplus = /obj/item/bullet_cartridge/sniper_20/surplus

	bullet_length_min = 110
	bullet_length_best = 117
	bullet_length_max = 120

	bullet_diameter_min = 19
	bullet_diameter_best = 20
	bullet_diameter_max = 21

	size = SIZE_2

	icon_states = 1

	value = 40

/obj/item/magazine/sniper_20mm/du
	ammo = /obj/item/bullet_cartridge/sniper_20/du
	icon_state = "20_DU"
	prem_restock_ammo = /obj/item/bullet_cartridge/sniper_20
	rarity = RARITY_RARE
	value = 120
	value_burgerbux = 1
