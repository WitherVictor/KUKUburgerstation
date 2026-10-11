/obj/item/weapon/ranged/bullet/magazine/rifle/an94
	name = "\improper 9x39mm AM84步枪"
	desc = "能打两发，何必只打一发？"
	desc_extended = "AM84又称自动机械步枪，是太空斯拉夫军队精锐部队的制式武器之一，用于取代过时的KA-47步枪。快速双发点射系统带来了很高的射击精度和密集的弹着点。"
	icon = 'icons/obj/item/weapons/ranged/rifle/rev/939_rifle_2.dmi'
	icon_state = "inventory"
	value = 4500

	company_type = "Slavic"

	tier = 3

	shoot_delay = 0.6
	burst_delay = 2
	max_bursts = 2

	firemodes = list("burst")

	shoot_sounds = list('sound/weapons/ranged/rifle/abakan/shoot.ogg')

	can_wield = TRUE
	wield_only = TRUE

	automatic = TRUE

	size = SIZE_4
	weight = 12

	heat_max = 0.05

	bullet_length_min = 38
	bullet_length_best = 39
	bullet_length_max = 40

	bullet_diameter_min = 8
	bullet_diameter_best = 9
	bullet_diameter_max = 10

	ai_heat_sensitivity = 1.5

	attachment_whitelist = list(
		/obj/item/attachment/barrel/charger = TRUE, /obj/item/attachment/barrel/charger/advanced = TRUE,
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
		/obj/item/attachment/undermount/gun/grenade_launcher = TRUE
	)

	attachment_barrel_offset_x = 32 - 16
	attachment_barrel_offset_y = 17 - 16

	attachment_sight_offset_x = 12 - 16
	attachment_sight_offset_y = 20 - 16

	attachment_undermount_offset_x = 25 - 16
	attachment_undermount_offset_y = 17 - 16

	dan_mode = TRUE

	inaccuracy_modifier = 0.35
	movement_inaccuracy_modifier = 1.5
	movement_spread_base = 0.05

	rarity = RARITY_UNCOMMON

/obj/item/weapon/ranged/bullet/magazine/rifle/an94/get_static_spread()
	return 0.005

/obj/item/weapon/ranged/bullet/magazine/rifle/an94/get_skill_spread(var/mob/living/L)
	return max(0,0.01 - (0.07 * L.get_skill_power(SKILL_RANGED)))
