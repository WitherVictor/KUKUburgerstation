/obj/item/magazine/pulse_rifle
	name = "\improper 脉冲步枪弹匣"
	desc = "这是弹匣，不是弹夹！"
	desc_extended = "装有远程武器弹药，使用时请确认口径匹配。"
	icon = 'icons/obj/item/magazine/pulse.dmi'
	icon_state = "battery"
	bullet_count_max = 12

	weapon_whitelist = list(
		/obj/item/weapon/ranged/bullet/magazine/rifle/pulse = TRUE
	)

	ammo = /obj/item/bullet_cartridge/pulse
	ammo_surplus = /obj/item/bullet_cartridge/pulse/surplus

	bullet_length_min = 52
	bullet_length_best = 52
	bullet_length_max = 52

	bullet_diameter_min = 13
	bullet_diameter_best = 13
	bullet_diameter_max = 13

	size = SIZE_2

	icon_states = 6

	value = 10
