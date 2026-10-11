/obj/item/weapon/ranged/spellgem/arcblades
	name = "弧光刃法术宝石"
	desc = "一切魔法的源泉。"
	desc_extended = "发射四枚旋转的弧光刃，能够穿透敌人并从墙面反弹。"
	icon_state = "damage"

	rarity = RARITY_UNCOMMON

	shoot_delay = 20

	bullet_count = 3
	projectile_speed = TILE_SIZE*0.5

	projectile = /obj/projectile/magic/arcblade
	ranged_damage_type = /damagetype/ranged/magic/arcblade

	shoot_sounds = list('sound/weapons/magic/arc_blade.ogg')

	color = "#FFFFFF"
	color_2 = "#00FFFF"
	color_3 = "#008CFF"

	value = 800

	spread_per_shot = 20
