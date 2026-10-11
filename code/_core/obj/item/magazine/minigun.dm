/obj/item/magazine/minigun_46
	name = "\improper 4.6x30mm无壳弹大型弹匣"
	desc = "这是弹匣，不是弹夹！"
	desc_extended = "装有远程武器弹药，使用时请确认口径匹配。"
	icon = 'icons/obj/item/magazine/minigun.dmi'
	icon_state = "mini"
	bullet_count_max = 200

	weapon_whitelist = list(
		/obj/item/weapon/ranged/bullet/magazine/rifle/minigun = TRUE,
		/obj/item/weapon/ranged/bullet/magazine/misc/sentry = TRUE,
	)

	ammo = /obj/item/bullet_cartridge/pistol_4mm/caseless
	ammo_surplus = /obj/item/bullet_cartridge/pistol_4mm/caseless/surplus

	bullet_length_min = 25
	bullet_length_best = 30
	bullet_length_max = 31

	bullet_diameter_min = 4
	bullet_diameter_best = 4.6
	bullet_diameter_max = 5

	size = SIZE_3

	icon_states = 1

	value = 50

/obj/item/magazine/minigun_46/du
	name = "\improper 4.6x30mm无壳贫铀弹大型弹匣"
	icon = 'icons/obj/item/magazine/minigun.dmi'
	icon_state = "mini_du"
	rarity = RARITY_RARE
	value_burgerbux = 1
	ammo = /obj/item/bullet_cartridge/pistol_4mm/caseless/du
