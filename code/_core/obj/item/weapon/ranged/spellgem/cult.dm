/obj/item/weapon/ranged/spellgem/cult
	name = "亵渎法术宝石"
	desc = "一切魔法的源泉。"
	desc_extended = "发射一只邪秽之手，在短距离内蔓延亵渎之地。"
	icon_state = "damage"
	color = "#7F0000"

	rarity = RARITY_RARE

	shoot_delay = 10

	bullet_count = 3
	projectile_speed = TILE_SIZE*0.6 - 1
	spread_per_shot = 20

	company_type = "Blood Cultists"

	projectile = /obj/projectile/magic/cultist
	ranged_damage_type = /damagetype/ranged/magic/cult

	shoot_sounds = list('sound/weapons/magic/repulse_fast.ogg')

	color = "#7F0000"
	color_2 = "#FF0000"
	color_3 = "#000000"

	value = 800
