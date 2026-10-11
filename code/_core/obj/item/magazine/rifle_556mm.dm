/obj/item/magazine/rifle_556
	name = "\improper 5.56mm步枪弹匣"
	desc = "这是弹匣，不是弹夹！"
	desc_extended = "装有远程武器弹药，使用时请确认口径匹配。"
	icon = 'icons/obj/item/magazine/556_rifle.dmi'
	icon_state = "556"
	bullet_count_max = 40

	weapon_whitelist = list(
		/obj/item/weapon/ranged/bullet/magazine/rifle/standard = TRUE,
		/obj/item/weapon/ranged/bullet/magazine/rifle/bullpup_sol = TRUE,
		/obj/item/weapon/ranged/bullet/magazine/rifle/burst = TRUE,
		/obj/item/weapon/ranged/bullet/magazine/rifle/semi = TRUE,
		/obj/item/weapon/ranged/bullet/magazine/rifle/m4 = TRUE,
		/obj/item/weapon/ranged/bullet/magazine/rifle/m4_soap = TRUE,
		/obj/item/weapon/ranged/bullet/magazine/rifle/burst/mod = TRUE,
		/obj/item/weapon/ranged/bullet/magazine/rifle/sol_burst = TRUE,
		/obj/item/weapon/ranged/bullet/magazine/rifle/moar = TRUE,
		/obj/item/weapon/ranged/bullet/magazine/rifle/ooc = TRUE

	)

	ammo = /obj/item/bullet_cartridge/rifle_223/nato
	ammo_surplus = /obj/item/bullet_cartridge/rifle_223/nato/surplus

	bullet_length_min = 40
	bullet_length_best = 45
	bullet_length_max = 46

	bullet_diameter_min = 5.5
	bullet_diameter_best = 5.56
	bullet_diameter_max = 5.6

	size = SIZE_2

	icon_states = 1

	value = 10

/obj/item/magazine/rifle_556/ap
	name = "\improper 5.56mm穿甲弹步枪弹匣"
	icon = 'icons/obj/item/magazine/556_rifle_ap.dmi'
	icon_state = "556"
	ammo = /obj/item/bullet_cartridge/rifle_223/nato/ap
	rarity = RARITY_UNCOMMON

/obj/item/magazine/rifle_556/du
	name = "\improper 5.56mm贫铀弹步枪弹匣"
	icon = 'icons/obj/item/magazine/556_rifle_du.dmi'
	icon_state = "556"
	rarity = RARITY_RARE
	ammo = /obj/item/bullet_cartridge/rifle_223/du
	prem_restock_ammo = /obj/item/bullet_cartridge/rifle_223
	value_burgerbux = 1
