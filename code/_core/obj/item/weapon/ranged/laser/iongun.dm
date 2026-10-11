/obj/item/weapon/ranged/energy/iongun
	name = "AM-ION离子炮"
	desc = "各种机械化单位的克星。"
	desc_extended = "发射强力离子化电脉冲的能量武器，摧毁机甲的绝佳选择。"
	icon = 'icons/obj/item/weapons/ranged/laser/ion.dmi'

	company_type = "NanoTrasen"

	value = 3000

	projectile = /obj/projectile/bullet/laser/ion
	ranged_damage_type = /damagetype/ranged/laser/ion

	projectile_speed = TILE_SIZE - 1
	shoot_delay = 6

	automatic = FALSE

	bullet_color = "#00FFFF"

	charge_cost = CELL_SIZE_BASIC / 30

	shoot_sounds = list('sound/weapons/ranged/energy/ion/shoot.ogg')

	override_icon_state = TRUE

	heat_max = 0.03

	size = SIZE_4
	weight = 18

	dan_mode = TRUE

	can_wield = TRUE

	inaccuracy_modifier = 0.5
	movement_inaccuracy_modifier = 0.5
	movement_spread_base = 0.05

	rarity = RARITY_UNCOMMON

	charge_icon_state_count = 4

/obj/item/weapon/ranged/energy/iongun/get_static_spread()
	if(wielded) return 0
	return 0.001

/obj/item/weapon/ranged/energy/iongun/get_skill_spread(var/mob/living/L)
	return max(0,0.005 - (0.01 * L.get_skill_power(SKILL_RANGED)))
