/obj/item/weapon/ranged/energy/gatling
	name = "L055原型加特林激光枪"
	desc = "让这把武器开火12秒，要用上400,000瓦的功率。"
	desc_extended = "武器中的庞然大物，如今换成了激光版本。小心使用。"
	icon = 'icons/obj/item/weapons/ranged/laser/gatling_new.dmi'
	value = 10000

	company_type = "Solarian"

	shoot_delay = 1.25

	damage_mod = 0.6

	bullet_count = 3

	projectile = /obj/projectile/bullet/laser/weak
	ranged_damage_type = /damagetype/ranged/laser/carbine

	shoot_sounds = list('sound/weapons/ranged/energy/gatling/shoot.ogg')

	bullet_color = "#FF0000"

	projectile_speed = TILE_SIZE - 1
	automatic = TRUE

	can_wield = TRUE
	wield_only = TRUE

	override_icon_state = TRUE
	override_icon_state_held = TRUE

	heat_max = 0.2

	charge_cost = CELL_SIZE_BASIC / 300

	size = SIZE_5
	weight = 40

	inaccuracy_modifier = 2
	movement_inaccuracy_modifier = 0.75
	movement_spread_base = 0.3

	value_burgerbux = 1

	rarity = RARITY_MYTHICAL

	charge_icon_state_count = 5

	charge_icon_uses_bullet_color = TRUE

	polymorphs = list(
		"base" = "#FFFFFF",
		"barrel" = "#FF6A00"
	)

/obj/item/weapon/ranged/energy/gatling/get_static_spread(var/mob/living/L)
	return 0.05

/obj/item/weapon/ranged/energy/gatling/get_base_spread()
	return 0.2

/obj/item/weapon/ranged/energy/gatling/get_skill_spread(var/mob/living/L)
	return max(0,0.15 - (0.1 * L.get_skill_power(SKILL_RANGED)))
