/obj/item/magazine/carbine_223
	name = "\improper .223卡宾枪弹匣"
	desc = "这是弹匣，不是弹夹！"
	desc_extended = "装有远程武器弹药，使用时请确认口径匹配。"
	icon = 'icons/obj/item/magazine/223_carbine.dmi'
	icon_state = "556"
	bullet_count_max = 42

	weapon_whitelist = list(
		/obj/item/weapon/ranged/bullet/magazine/rifle/carbine = TRUE,
		/obj/item/weapon/ranged/bullet/magazine/rifle/carbine/mod = TRUE,
		/obj/item/weapon/ranged/bullet/magazine/rifle/carbine/prototype = TRUE,
		/obj/item/weapon/ranged/bullet/magazine/rifle/carbine/prototype/equipped = TRUE
	)

	ammo = /obj/item/bullet_cartridge/rifle_223
	ammo_surplus = /obj/item/bullet_cartridge/rifle_223/surplus

	bullet_length_min = 40
	bullet_length_best = 45
	bullet_length_max = 46

	bullet_diameter_min = 5.5
	bullet_diameter_best = 5.56
	bullet_diameter_max = 5.6

	size = SIZE_2

	icon_states = 21

	value = 10


/obj/item/magazine/carbine_223/ap
	name = "\improper .223卡宾枪穿甲弹匣"
	ammo = /obj/item/bullet_cartridge/rifle_223/ap
	rarity = RARITY_UNCOMMON
