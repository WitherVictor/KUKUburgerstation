/obj/item/magazine/pistol_9mm
	name = "\improper 9mm手枪弹匣"
	desc = "这是弹匣，不是弹夹！"
	desc_extended = "装有远程武器弹药，使用时请确认口径匹配。"
	icon = 'icons/obj/item/magazine/9mmpistol.dmi'
	icon_state = "9mm"
	bullet_count_max = 18

	weapon_whitelist = list(
		/obj/item/weapon/ranged/bullet/magazine/pistol/military = TRUE,
		/obj/item/weapon/ranged/bullet/magazine/pistol/military/nanotrasen = TRUE,
		/obj/item/weapon/ranged/bullet/magazine/pistol/laton = TRUE,
		/obj/item/weapon/ranged/bullet/magazine/pistol/laton/mod = TRUE,
		/obj/item/weapon/ranged/bullet/magazine/pistol/laton/kitchen = TRUE,
		/obj/item/weapon/ranged/bullet/magazine/pistol/yarygin = TRUE,
		/obj/item/weapon/ranged/bullet/magazine/pistol/syndie/slavic = TRUE,
		/obj/item/weapon/ranged/bullet/magazine/smg/chris = TRUE,
		/obj/item/weapon/ranged/bullet/magazine/pistol/classic = TRUE
	)

	ammo = /obj/item/bullet_cartridge/pistol_9mm
	ammo_surplus = /obj/item/bullet_cartridge/pistol_9mm/surplus

	bullet_diameter_min = 8
	bullet_diameter_best = 9
	bullet_diameter_max = 10

	bullet_length_min = 18
	bullet_length_best = 19
	bullet_length_max = 20

	size = SIZE_2

	icon_states = 9

	value = 5

/obj/item/magazine/pistol_9mm/hp

	name = "\improper 9mm空尖弹手枪弹匣"
	icon = 'icons/obj/item/magazine/9mmpistol_hp.dmi'
	desc_extended = "装有远程武器弹药，使用时请确认口径匹配。这款装有空尖弹。"

	ammo = /obj/item/bullet_cartridge/pistol_9mm/hp
	ammo_surplus = /obj/item/bullet_cartridge/pistol_9mm/surplus

	rarity = RARITY_UNCOMMON
