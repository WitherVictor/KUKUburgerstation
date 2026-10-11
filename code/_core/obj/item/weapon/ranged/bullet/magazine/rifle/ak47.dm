/obj/item/weapon/ranged/bullet/magazine/rifle/ak47
	name = "\improper 7.62x39mm KA-47步枪"
	desc = "古老，但升级过。"
	desc_extended = "动能驱动步枪是古代太空斯拉夫人为小型殖民地的代理人战争制造的旧时代遗物。大得离谱的弹药能打出相当精准、致命的一击。"
	icon = 'icons/obj/item/weapons/ranged/rifle/rev/762_rifle.dmi'
	icon_state = "inventory"
	value = 1600

	company_type = "Slavic"

	tier = 2

	damage_mod = 1
	shoot_delay = 1.75

	automatic = TRUE

	firemodes = list("automatic","semi-automatic")

	shoot_sounds = list('sound/weapons/ranged/rifle/ak/shoot.ogg')

	can_wield = TRUE

	size = SIZE_4
	weight = 18

	heat_max = 0.1

	bullet_length_min = 38
	bullet_length_best = 39
	bullet_length_max = 40

	bullet_diameter_min = 7.6
	bullet_diameter_best = 7.62
	bullet_diameter_max = 7.7

	ai_heat_sensitivity = 2

	attachment_whitelist = list(
		/obj/item/attachment/barrel/charger = TRUE,
		/obj/item/attachment/barrel/charger/advanced = TRUE,
		/obj/item/attachment/barrel/compensator = TRUE,
		/obj/item/attachment/barrel/extended = TRUE,
		/obj/item/attachment/barrel/gyro = TRUE,
		/obj/item/attachment/barrel/laser_charger = FALSE,
		/obj/item/attachment/barrel/suppressor = TRUE,
		/obj/item/attachment/barrel_mod/reinforced_barrel = TRUE,
		/obj/item/attachment/stock_mod/reinforced_stock = TRUE,

		/obj/item/attachment/sight/laser_sight = TRUE,
		/obj/item/attachment/sight/quickfire_adapter = TRUE,
		/obj/item/attachment/sight/red_dot = TRUE,
		/obj/item/attachment/sight/scope = TRUE,
		/obj/item/attachment/sight/scope/large = TRUE,
		/obj/item/attachment/sight/targeting_computer = TRUE,



		/obj/item/attachment/undermount/angled_grip = TRUE,
		/obj/item/attachment/undermount/bipod = TRUE,
		/obj/item/attachment/undermount/burst_adapter = TRUE,
		/obj/item/attachment/undermount/vertical_grip = TRUE,
		/obj/item/attachment/undermount/gun/grenade_launcher = TRUE
	)

	attachment_barrel_offset_x = 32 - 16
	attachment_barrel_offset_y = 19 - 16

	attachment_sight_offset_x = 12 - 16
	attachment_sight_offset_y = 21 - 16

	attachment_undermount_offset_x = 23 - 16
	attachment_undermount_offset_y = 19 - 16

	dan_mode = TRUE

	inaccuracy_modifier = 0.1
	movement_inaccuracy_modifier = 1.75
	movement_spread_base = 0.025

	dan_mode = TRUE

	rarity = RARITY_COMMON

/obj/item/weapon/ranged/bullet/magazine/rifle/ak47/get_static_spread()
	return 0.001

/obj/item/weapon/ranged/bullet/magazine/rifle/ak47/get_skill_spread(var/mob/living/L)
	return max(0,0.025 - (0.05 * L.get_skill_power(SKILL_RANGED)))


/obj/item/weapon/ranged/bullet/magazine/rifle/ak47/mod
	name = "\improper 7.62x39mm AKSU Type-13"
	desc = "小小的小枪。"
	desc_extended = "太空海盗使用并改装的AK Type-13紧凑版本。对他们而言，枪身紧凑远比操控性和后坐力控制更重要。"
	icon = 'icons/obj/item/weapons/ranged/rifle/rev/762_carbine.dmi'
	icon_state = "inventory"
	value = 2900

	damage_mod = 1

	tier = 3

	shoot_delay = 1.5

	size = SIZE_3
	weight = 10

	heat_max = 0.2

	inaccuracy_modifier = 0.5
	movement_inaccuracy_modifier = 1.25
	movement_spread_base = 0.01

	dan_mode = TRUE

	rarity = RARITY_RARE

/obj/item/weapon/ranged/bullet/magazine/rifle/ak47/mod/get_static_spread()
	return 0.005
