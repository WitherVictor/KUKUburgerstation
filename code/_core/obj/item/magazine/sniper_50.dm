/obj/item/magazine/sniper_50
	name = "\improper .50狙击枪弹匣"
	desc = "这是弹匣，不是弹夹！"
	desc_extended = "装有远程武器弹药，使用时请确认口径匹配。"
	icon = 'icons/obj/item/magazine/50_sniper.dmi'
	icon_state = "50"
	bullet_count_max = 8

	bullet_length_min = 90
	bullet_length_best = 99
	bullet_length_max = 100

	bullet_diameter_min = 12
	bullet_diameter_best = 12.7
	bullet_diameter_max = 13

	weapon_whitelist = list(
		/obj/item/weapon/ranged/bullet/magazine/rifle/heavy_sniper = TRUE
	)

	ammo = /obj/item/bullet_cartridge/sniper_50
	ammo_surplus = /obj/item/bullet_cartridge/sniper_50/surplus

	size = SIZE_2

	icon_states = 1

	value = 20

/obj/item/magazine/sniper_50/explosive
	name = "\improper .50狙击枪弹匣（爆炸弹）"
	icon_state = "50EXP"
	ammo = /obj/item/bullet_cartridge/sniper_50/explosive
	rarity = RARITY_UNCOMMON

/obj/item/magazine/sniper_50/ion
	name = "\improper .50狙击枪弹匣（离子弹）"
	icon_state = "50ION"
	ammo = /obj/item/bullet_cartridge/sniper_50/ion
	rarity = RARITY_UNCOMMON

/obj/item/magazine/sniper_50/incendiary
	name = "\improper .50狙击枪弹匣（燃烧弹）"
	icon_state = "50INC"
	ammo = /obj/item/bullet_cartridge/sniper_50/incendiary
	rarity = RARITY_UNCOMMON

/obj/item/magazine/sniper_50/ap
	name = "\improper .50狙击枪弹匣（穿甲弹）"
	icon_state = "50AP"
	ammo = /obj/item/bullet_cartridge/sniper_50/ap
	rarity = RARITY_UNCOMMON

/obj/item/magazine/sniper_50/du
	name = "\improper .50狙击枪弹匣（贫铀弹）"
	icon_state = "50_DU"
	rarity = RARITY_RARE
	ammo = /obj/item/bullet_cartridge/sniper_50/du
	prem_restock_ammo = /obj/item/bullet_cartridge/sniper_50
	value_burgerbux = 1
