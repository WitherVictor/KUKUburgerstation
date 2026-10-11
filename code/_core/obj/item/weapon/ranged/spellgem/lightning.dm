/obj/item/weapon/ranged/spellgem/lightning
	name = "神圣闪电法术宝石"
	desc = "一切魔法的源泉。"
	desc_extended = "发射快速移动的神圣闪电。命中生物时，还会伤害周围其他生物。"
	icon_state = "damage"
	shoot_delay = 2

	bullet_count = 1
	projectile_speed = TILE_SIZE*0.8 - 1

	projectile = /obj/projectile/magic/lightning_bolt
	ranged_damage_type = /damagetype/ranged/magic/lightning

	color = "#FFD846"
	color_2 = "#C6FFE1"
	color_3 = "#FFFFBE"

	shoot_sounds = list('sound/weapons/magic/zap_large.ogg')
	value = 800

/obj/item/weapon/ranged/spellgem/lightning/calculate_mana_cost()
	. = ..()
	. *= 1.5 //For the AOE damage.
	. = CEILING(.,1)
