/obj/item/magazine/shotgun_auto
	name = "\improper 20号斗牛犬弹匣"
	desc = "这是弹匣，不是弹夹！"
	desc_extended = "装有弹匣供弹式无托霰弹枪使用的弹药，使用时请确认口径匹配。"
	icon = 'icons/obj/item/magazine/auto_shotgun.dmi'
	icon_state = "auto"
	bullet_count_max = 9

	weapon_whitelist = list(
		/obj/item/weapon/ranged/bullet/magazine/shotgun/bulldog = TRUE,
		/obj/item/weapon/ranged/bullet/magazine/shotgun/saiga_20 = TRUE
	)

	ammo = /obj/item/bullet_cartridge/shotgun_20
	ammo_surplus = /obj/item/bullet_cartridge/shotgun_20/surplus

	bullet_length_min = 88
	bullet_length_best = 88.9
	bullet_length_max = 89

	bullet_diameter_min = 15
	bullet_diameter_best = 15.6
	bullet_diameter_max = 16

	size = SIZE_2

	icon_states = 9

	value = 15

/obj/item/magazine/shotgun_auto/slug
	name = "\improper 20号斗牛犬弹匣（独头弹）"
	ammo = /obj/item/bullet_cartridge/shotgun_20/slug

	rarity = RARITY_UNCOMMON
