/obj/item/weapon/ranged/spellgem/shock
	name = "电击流法术宝石"
	desc = "一切魔法的源泉。"
	desc_extended = "短暂喷射一道快速移动的闪电流。"
	icon_state = "damage"

	shoot_delay = 3

	rarity = RARITY_UNCOMMON

	bullet_count = 1
	projectile_speed = TILE_SIZE*0.7 - 1

	projectile = /obj/projectile/magic/lightning

	ranged_damage_type = /damagetype/ranged/magic/shock

	color = "#FFB600"
	color_2 = "#FFE566"
	color_3 = "#FFD800"

	shoot_sounds = list('sound/effects/zzzt.ogg')
	value = 800
