/obj/item/weapon/ranged/bullet/magazine/pistol/overseer
	name = "\improper 12.7mm强威自动手枪"
	desc = "这里的‘自动’指半自动。全自动12.7mm手枪也太离谱了！"
	desc_extended = "为纳米传讯高级指挥官设计的强力半自动手枪。"
	icon = 'icons/obj/item/weapons/ranged/pistol/12mm_nt.dmi'
	icon_state = "inventory"
	value = 700

	company_type = "NanoTrasen"

	tier = 2

	shoot_delay = 6

	automatic = FALSE

	movement_spread_base = 0.006
	inaccuracy_modifier = 0.5
	movement_inaccuracy_modifier = 0.025

	shoot_sounds = list('sound/weapons/ranged/pistol/overseer/shoot.ogg')

	can_wield = FALSE

	size = SIZE_2
	weight = 9

	heat_max = 0.1

	bullet_length_min = 27
	bullet_length_best = 33
	bullet_length_max = 34

	bullet_diameter_min = 12
	bullet_diameter_best = 12.7
	bullet_diameter_max = 13

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
		/obj/item/attachment/sight/scope/large = FALSE,
		/obj/item/attachment/sight/targeting_computer = TRUE,



		/obj/item/attachment/undermount/angled_grip = FALSE,
		/obj/item/attachment/undermount/bipod = FALSE,
		/obj/item/attachment/undermount/burst_adapter = FALSE,
		/obj/item/attachment/undermount/vertical_grip = FALSE
	)

	attachment_barrel_offset_x = 29 - 16
	attachment_barrel_offset_y = 20 - 16

	attachment_sight_offset_x = 20 - 16
	attachment_sight_offset_y = 21 - 16

	attachment_undermount_offset_x = 24 - 16
	attachment_undermount_offset_y = 12 - 16

	rarity = RARITY_UNCOMMON

/obj/item/weapon/ranged/bullet/magazine/pistol/overseer/get_static_spread()
	return 0.002

/obj/item/weapon/ranged/bullet/magazine/pistol/overseer/get_skill_spread(var/mob/living/L)
	return max(0,0.01 - (0.01 * L.get_skill_power(SKILL_RANGED)))

/obj/item/weapon/ranged/bullet/magazine/pistol/overseer/mod
	name = "\improper 12.7mm强威自动手枪改装型"
	desc = "这把的‘自动’，可是全自动。"
	desc_extended = "纳米传讯指挥官常用的强威自动手枪之原型版本，采用品质更高的零件，常见于雇佣兵手中。"
	icon = 'icons/obj/item/weapons/ranged/pistol/12mm_nt_proto.dmi'
	icon_state = "inventory"
	value = 2000

	tier = 3
	shoot_delay = 4

	heat_max = 0.05

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

		/obj/item/attachment/sight/laser_sight = FALSE,
		/obj/item/attachment/sight/quickfire_adapter = FALSE,
		/obj/item/attachment/sight/red_dot = FALSE,
		/obj/item/attachment/sight/scope = FALSE,
		/obj/item/attachment/sight/scope/large = FALSE,
		/obj/item/attachment/sight/targeting_computer = FALSE,



		/obj/item/attachment/undermount/angled_grip = FALSE,
		/obj/item/attachment/undermount/bipod = FALSE,
		/obj/item/attachment/undermount/burst_adapter = FALSE,
		/obj/item/attachment/undermount/vertical_grip = FALSE
	)

	attachment_barrel_offset_x = 28 - 16
	attachment_barrel_offset_y = 20 - 16

	attachment_sight_offset_x = 18 - 16
	attachment_sight_offset_y = 21 - 16

	attachment_undermount_offset_x = 21 - 16
	attachment_undermount_offset_y = 14 - 16

	automatic = TRUE

	rarity = RARITY_RARE

/obj/item/weapon/ranged/bullet/magazine/pistol/overseer/mod/silenced/Generate()

	. = ..()

	attachment_barrel = new/obj/item/attachment/barrel/suppressor(src)
