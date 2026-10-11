/obj/item/weapon/ranged/bullet/magazine/pistol/high_power
	name = "10mm NT半影手枪"
	desc = "嫌9mm不够大时的选择。"
	desc_extended = "10mm纳米传讯半影手枪面向经验更丰富的使用者，性能也更先进。后坐力和重量虽有些难以驾驭，落到高手手里却能造成可观的伤害。"
	icon = 'icons/obj/item/weapons/ranged/pistol/10mm_nt.dmi'
	icon_state = "inventory"
	value = 500

	company_type = "NanoTrasen"

	tier = 1
	shoot_delay = 2.8

	automatic = FALSE

	movement_spread_base = 0.003
	inaccuracy_modifier = 0.5
	movement_inaccuracy_modifier = 0.0125

	shoot_sounds = list('sound/weapons/ranged/pistol/high_power/shoot.ogg')

	can_wield = FALSE

	size = SIZE_2
	weight = 6

	heat_max = 0.09

	bullet_length_min = 25
	bullet_length_best = 32
	bullet_length_max = 33

	bullet_diameter_min = 10
	bullet_diameter_best = 10.17
	bullet_diameter_max = 11

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
		/obj/item/attachment/sight/scope = FALSE,
		/obj/item/attachment/sight/scope/large = FALSE,
		/obj/item/attachment/sight/targeting_computer = TRUE,



		/obj/item/attachment/undermount/angled_grip = FALSE,
		/obj/item/attachment/undermount/bipod = FALSE,
		/obj/item/attachment/undermount/burst_adapter = FALSE,
		/obj/item/attachment/undermount/vertical_grip = FALSE
	)

	attachment_barrel_offset_x = 28 - 16
	attachment_barrel_offset_y = 22 - 16

	attachment_sight_offset_x = 15 - 16
	attachment_sight_offset_y = 23 - 16

	attachment_undermount_offset_x = 22 - 16
	attachment_undermount_offset_y = 17 - 16

	rarity = RARITY_COMMON

/obj/item/weapon/ranged/bullet/magazine/pistol/high_power/get_static_spread()
	return 0.0009

/obj/item/weapon/ranged/bullet/magazine/pistol/high_power/get_skill_spread(var/mob/living/L)
	return max(0,0.015 - (0.03 * L.get_skill_power(SKILL_RANGED)))


/obj/item/weapon/ranged/bullet/magazine/pistol/high_power/mod
	name = "10mm本影手枪"
	desc = "终极手枪。"
	desc_extended = "10mm NT半影手枪的强力原型，来自为工厂量产简化设计之前的阶段。以离谱的射速进行三发点射。再也造不出当年的味道了。"
	icon = 'icons/obj/item/weapons/ranged/pistol/robo.dmi'

	tier = 2

	value = 1200

	shoot_delay = 1.2

	automatic = TRUE

	weight = 7

	heat_max = 0.11

	attachment_barrel_offset_x = 27 - 16
	attachment_barrel_offset_y = 21 - 16

	attachment_sight_offset_x = 21 - 16
	attachment_sight_offset_y = 23 - 16

	attachment_undermount_offset_x = 22 - 16
	attachment_undermount_offset_y = 17 - 16

	rarity = RARITY_RARE
