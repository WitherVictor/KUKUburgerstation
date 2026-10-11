/obj/item/weapon/ranged/bullet/magazine/pistol/tactical
	name = ".45 1984战术手枪"
	desc = "这里没有橡胶弹，全是致命弹药。"
	desc_extended = "现代警队和部分私人军事公司常用的手枪，也受到收藏家和太空殖民者的喜爱。"
	value = 700

	tier = 2

	company_type = "Solarian"

	icon = 'icons/obj/item/weapons/ranged/pistol/45.dmi'
	shoot_delay = 2.7
	shoot_sounds = list('sound/weapons/ranged/pistol/1984/shoot.ogg')

	movement_spread_base = 0.008
	inaccuracy_modifier = 0.5
	movement_inaccuracy_modifier = 0

	automatic = FALSE

	size = SIZE_2
	weight = 6

	heat_max = 0.07

	bullet_length_min = 20
	bullet_length_best = 23
	bullet_length_max = 24

	bullet_diameter_min = 11
	bullet_diameter_best = 11.43
	bullet_diameter_max = 12

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
		/obj/item/attachment/sight/scope = FALSE,
		/obj/item/attachment/sight/scope/large = FALSE,
		/obj/item/attachment/sight/targeting_computer = TRUE,



		/obj/item/attachment/undermount/angled_grip = FALSE,
		/obj/item/attachment/undermount/bipod = FALSE,
		/obj/item/attachment/undermount/burst_adapter = FALSE,
		/obj/item/attachment/undermount/vertical_grip = FALSE
	)

	attachment_barrel_offset_x = 29 - 16
	attachment_barrel_offset_y = 21 - 16

	attachment_sight_offset_x = 12 - 16
	attachment_sight_offset_y = 20 - 16

	attachment_undermount_offset_x = 25 - 16
	attachment_undermount_offset_y = 16 - 16

	rarity = RARITY_COMMON


/obj/item/weapon/ranged/bullet/magazine/pistol/tactical/get_static_spread()
	return 0.003

/obj/item/weapon/ranged/bullet/magazine/pistol/tactical/get_skill_spread(var/mob/living/L)
	return max(0,0.01 - (0.03 * L.get_skill_power(SKILL_RANGED)))

/obj/item/weapon/ranged/bullet/magazine/pistol/tactical/mod
	name = ".45 1984手枪改装型"
	desc_extended = "供弹坡打磨得光可鉴人，套筒经过加固，与枪身的配合也更加紧密，以提高精度。\
	瞄准系统也是独家设计。拇指保险经过加长，操作更顺手。带防滑槽的长型扳机，还有环形击锤……\
	扳机护圈根部经过锉削，可以握得更高。不止如此，这把枪几乎每个部件都经过精心制作和定制。\
	这种好东西，你从哪儿弄来的？"
	value = 2000
	icon = 'icons/obj/item/weapons/ranged/pistol/45_2.dmi'
	shoot_delay = 1.9

	damage_mod = 1.25
	tier = 3

	size = SIZE_2

	heat_max = 0.04

	attachment_whitelist = list(
		/obj/item/attachment/barrel/charger = TRUE,
		/obj/item/attachment/barrel/charger/advanced = TRUE,
		/obj/item/attachment/barrel/compensator = TRUE,
		/obj/item/attachment/barrel/extended = TRUE,
		/obj/item/attachment/barrel/suppressor = TRUE,
		/obj/item/attachment/barrel_mod/reinforced_barrel = TRUE,
		/obj/item/attachment/stock_mod/reinforced_stock = TRUE,
		/obj/item/attachment/undermount/burst_adapter = TRUE
	)

	attachment_barrel_offset_x = 31 - 16
	attachment_barrel_offset_y = 21 - 16

	attachment_sight_offset_x = 11 - 16
	attachment_sight_offset_y = 22 - 16

	attachment_undermount_offset_x = 24 - 16
	attachment_undermount_offset_y = 16 - 16

	rarity = RARITY_RARE

/obj/item/weapon/ranged/bullet/magazine/pistol/tactical/mod/get_static_spread()
	return 0

/obj/item/weapon/ranged/bullet/magazine/pistol/tactical/mod/get_skill_spread(var/mob/living/L)
	return max(0,0.03 - (0.03 * L.get_skill_power(SKILL_RANGED)))
