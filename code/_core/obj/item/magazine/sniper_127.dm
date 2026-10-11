/obj/item/magazine/sniper_127
	name = "\improper 12.7x90mm狙击枪弹匣"
	desc = "这是弹匣，不是弹夹！"
	desc_extended = "装有远程武器弹药，使用时请确认口径匹配。"
	icon = 'icons/obj/item/magazine/127_sniper.dmi'
	icon_state = "12"
	bullet_count_max = 8

	bullet_length_min = 80
	bullet_length_best = 90
	bullet_length_max = 95

	bullet_diameter_min = 12
	bullet_diameter_best = 12.7
	bullet_diameter_max = 13

	weapon_whitelist = list(
		/obj/item/weapon/ranged/bullet/magazine/rifle/sniper_127 = TRUE
	)

	ammo = /obj/item/bullet_cartridge/sniper_127
	ammo_surplus = /obj/item/bullet_cartridge/sniper_127/surplus

	size = SIZE_2

	icon_states = 1

	value = 20

/obj/item/magazine/sniper_127/du
	name = "\improper 12.7x90mm贫铀弹狙击枪弹匣"
	ammo = /obj/item/bullet_cartridge/sniper_127/du
	prem_restock_ammo = /obj/item/bullet_cartridge/sniper_127
	rarity = RARITY_RARE
	icon_state = "12_DU"
	value_burgerbux = 1
