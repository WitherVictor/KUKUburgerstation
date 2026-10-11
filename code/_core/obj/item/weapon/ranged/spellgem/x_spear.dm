/obj/item/weapon/ranged/spellgem/ice_spear
	name = "冰矛法术宝石"
	desc = "一切魔法的源泉。"
	desc_extended = "发射快速移动、能够穿透目标的冰晶。"
	icon_state = "damage"

	company_type = "Ashwalkers"

	rarity = RARITY_UNCOMMON

	shoot_delay = 10

	bullet_count = 1
	projectile_speed = TILE_SIZE - 1

	projectile = /obj/projectile/magic/crystal/ice
	ranged_damage_type = /damagetype/ranged/magic/ice

	shoot_sounds = list('sound/weapons/ranged/energy/freeze_gun/shoot1.ogg')

	color = "#75C7FF"
	color_2 = "#5D8EAF"
	color_3 = "#C2FFFF"

	value = 800

/obj/item/weapon/ranged/spellgem/fire_spear
	name = "火矛法术宝石"
	desc = "一切魔法的源泉。"
	desc_extended = "发射快速而精准、能够穿透目标的火焰晶体。"
	icon_state = "damage"

	company_type = "Ashwalkers"

	rarity = RARITY_UNCOMMON

	shoot_delay = 10

	bullet_count = 1
	projectile_speed = TILE_SIZE - 1

	projectile = /obj/projectile/magic/crystal/fire
	ranged_damage_type = /damagetype/ranged/magic/fire

	shoot_sounds = list('sound/weapons/ranged/energy/freeze_gun/shoot2.ogg')

	color = "#FF8E75"
	color_2 = "#AD6C5D"
	color_3 = "#FFEAC4"

	value = 800
