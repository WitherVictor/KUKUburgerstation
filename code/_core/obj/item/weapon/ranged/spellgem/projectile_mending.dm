/obj/item/weapon/ranged/spellgem/mending_other
	name = "他人愈合法术宝石"
	desc = "一切魔法的源泉。"
	desc_extended = "充满纯粹奥术能量的魔法宝石，赋予使用者施放法术的能力，可镶入魔杖。这颗会发射促进再生的法球。"
	icon_state = "heal"
	color = "#ff0080"
	color_2 = "#500028"
	shoot_delay = 10

	bullet_count = 1
	projectile_speed = TILE_SIZE*0.75 - 1
	use_loyalty_tag = FALSE
	projectile_utility = TRUE
	mana_cost_override = 100

	projectile = /obj/projectile/magic/buff/mending
	ranged_damage_type = /damagetype/ranged/magic/buff //AKA no dmg

	shoot_sounds = list('sound/weapons/magic/magic_missile.ogg')
	value = 800

	value_burgerbux = 1
