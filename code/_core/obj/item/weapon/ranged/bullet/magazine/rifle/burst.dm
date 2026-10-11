/obj/item/weapon/ranged/bullet/magazine/rifle/burst
	name = "\improper 5.56mm L-HON"
	desc = "太空法国制造！"
	desc_extended = "采用三发点射的突击步枪，用于快速击倒中远距离目标。拿不定主意该用冲锋枪还是突击步枪的纳米传讯士兵，常常选择它。"
	icon = 'icons/obj/item/weapons/ranged/rifle/nanotrasen/556_3.dmi'
	icon_state = "inventory"
	value = 1800

	company_type = "NanoTrasen"

	tier = 2

	damage_mod = 1.3
	shoot_delay = 1.1
	burst_delay = 7
	max_bursts = 3

	automatic = TRUE

	firemodes = list("burst","semi-automatic")

	shoot_sounds = list('sound/weapons/ranged/rifle/nt_burst/shoot.ogg')

	can_wield = TRUE

	size = SIZE_4
	weight = 14

	bullet_length_min = 40
	bullet_length_best = 45
	bullet_length_max = 46

	bullet_diameter_min = 5.5
	bullet_diameter_best = 5.56
	bullet_diameter_max = 5.6

	ai_heat_sensitivity = 0.75

	attachment_whitelist = list(
		/obj/item/attachment/barrel/charger = TRUE, /obj/item/attachment/barrel/charger/advanced = TRUE,
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
		/obj/item/attachment/undermount/burst_adapter = FALSE,
		/obj/item/attachment/undermount/vertical_grip = TRUE,
		/obj/item/attachment/undermount/gun/grenade_launcher = TRUE
	)

	attachment_barrel_offset_x = 30 - 16
	attachment_barrel_offset_y = 19 - 16

	attachment_sight_offset_x = 19 - 16
	attachment_sight_offset_y = 22 - 16

	attachment_undermount_offset_x = 23 - 16
	attachment_undermount_offset_y = 15 - 16

	dan_mode = TRUE

	heat_max = 0.09

	inaccuracy_modifier = 0.25
	movement_inaccuracy_modifier = 1
	movement_spread_base = 0.02

	rarity = RARITY_COMMON

/obj/item/weapon/ranged/bullet/magazine/rifle/burst/get_static_spread()
	return 0.0075

/obj/item/weapon/ranged/bullet/magazine/rifle/burst/get_skill_spread(var/mob/living/L)
	return max(0,0.03 - (0.06 * L.get_skill_power(SKILL_RANGED)))

/obj/item/weapon/ranged/bullet/magazine/rifle/burst/mod
	name = "\improper 5.56mm L-HON-0"
	icon = 'icons/obj/item/weapons/ranged/rifle/nanotrasen/556_3_new.dmi'
	desc_extended = "纳米传讯L-HON的极早期原型，当时它其实还属于太阳系。这款原型采用更高品质的材料，射速显著更高，收藏家和雇佣兵都对它趋之若鹜。"

	company_type = "Solarian"

	tier = 3

	weight = 14

	damage_mod = 1.2
	shoot_delay = 1
	burst_delay = 3
	max_bursts = 3

	firemodes = list("automatic","burst","semi-automatic")

	value = 4000

	heat_max = 0.05

	attachment_barrel_offset_x = 31 - 16
	attachment_barrel_offset_y = 19 - 16

	attachment_sight_offset_x = 16 - 16
	attachment_sight_offset_y = 23 - 16

	attachment_undermount_offset_x = 24 - 16
	attachment_undermount_offset_y = 17 - 16

	rarity = RARITY_RARE


/obj/item/weapon/ranged/bullet/magazine/rifle/burst/mod/get_static_spread()
	return 0.002

/obj/item/weapon/ranged/bullet/magazine/rifle/burst/mod/get_skill_spread(var/mob/living/L)
	return max(0,0.03 - (0.06 * L.get_skill_power(SKILL_RANGED)))
