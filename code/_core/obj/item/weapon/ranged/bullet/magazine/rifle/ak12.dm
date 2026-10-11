/obj/item/weapon/ranged/bullet/magazine/rifle/ak12
	name = "\improper 5.45x39mm AK-12"
	desc = "来吧，奇基布里基，一步登王！"
	desc_extended = "AK-12是5.45x39mm全自动步枪，以精度出色、射速高于更常见的AK Type-13而闻名。较小的口径降低了后坐力，却没有削弱威力——这枪一如既往地好用。太空斯拉夫联邦特种部队仍在使用它（装备好用，他们就不爱换），精锐革命军似乎也通过黑市和政府交易成批购入。便宜得要命、高效、易维护，是人人向往却难得一见的武器。"
	icon = 'icons/obj/item/weapons/ranged/rifle/rev/545_rifle_2.dmi'
	icon_state = "inventory"
	value = 2000

	company_type = "Slavic"

	tier = 2

	shoot_delay = 1.1

	shoot_sounds = list('sound/weapons/slavic/abakan.ogg')

	firemodes = list("automatic","semi-automatic")

	can_wield = TRUE

	automatic = TRUE

	size = SIZE_4
	weight = 15

	heat_max = 0.1

	bullet_length_min = 38
	bullet_length_best = 39
	bullet_length_max = 40

	bullet_diameter_min = 5.4
	bullet_diameter_best = 5.45
	bullet_diameter_max = 5.46  //Just so people wouldn't load this gun with 5.56, would be really-really weird to do so - Stalkeros

	ai_heat_sensitivity = 1.5

	attachment_whitelist = list(
		/obj/item/attachment/barrel/charger = TRUE,
		/obj/item/attachment/barrel/charger/advanced = TRUE,
		/obj/item/attachment/barrel/compensator = TRUE,
		/obj/item/attachment/barrel/extended = TRUE,
		/obj/item/attachment/barrel/suppressor = TRUE,
		/obj/item/attachment/barrel_mod/reinforced_barrel = TRUE,
		/obj/item/attachment/stock_mod/reinforced_stock = TRUE,
		/obj/item/attachment/sight/laser_sight = TRUE,
		/obj/item/attachment/sight/quickfire_adapter = TRUE,
		/obj/item/attachment/sight/red_dot = TRUE,
		/obj/item/attachment/sight/scope = TRUE,
		/obj/item/attachment/undermount/bipod = TRUE,
		/obj/item/attachment/undermount/burst_adapter = TRUE,
		/obj/item/attachment/undermount/angled_grip = TRUE,
		/obj/item/attachment/undermount/vertical_grip = TRUE,
		/obj/item/attachment/undermount/gun/grenade_launcher = TRUE
	)

	attachment_barrel_offset_x = 32 - 16
	attachment_barrel_offset_y = 20 - 16

	attachment_sight_offset_x = 13 - 16
	attachment_sight_offset_y = 21 - 16

	attachment_undermount_offset_x = 22 - 15
	attachment_undermount_offset_y = 18 - 16

	dan_mode = TRUE

	inaccuracy_modifier = 0.25
	movement_inaccuracy_modifier = 1
	movement_spread_base = 0.02

/obj/item/weapon/ranged/bullet/magazine/rifle/ak12/get_static_spread()
	return 0.004

/obj/item/weapon/ranged/bullet/magazine/rifle/ak12/get_skill_spread(var/mob/living/L)
	return max(0,0.01 - (0.03 * L.get_skill_power(SKILL_RANGED)))


/obj/item/weapon/ranged/bullet/magazine/rifle/ak12/syndicate
	name = "\improper 5.45x39mm AK-12 SYN"
	desc = "来吧，奇基布里基，一步登王！"
	desc_extended = "AK-12是5.45x39mm全自动步枪，以精度出色、射速高于更常见的AK-13而闻名。较小的口径降低了后坐力，却没有削弱威力——这枪一如既往地好用。太空斯拉夫联邦特种部队仍在使用它（装备好用，他们就不爱换），精锐革命军似乎也通过黑市和政府交易成批购入。便宜得要命、高效、易维护，是人人向往却难得一见的武器。"
	icon = 'icons/obj/item/weapons/ranged/rifle/syndicate/545.dmi'
	icon_state = "inventory"
	value = 2400

	company_type = "Syndicate"

	tier = 3
	shoot_delay = 1

	weight = 18

	heat_max = 0.12

	attachment_barrel_offset_x = 31 - 16
	attachment_barrel_offset_y = 19 - 16

	attachment_sight_offset_x = 17 - 16
	attachment_sight_offset_y = 20 - 16

	attachment_undermount_offset_x = 24 - 15
	attachment_undermount_offset_y = 17 - 16
