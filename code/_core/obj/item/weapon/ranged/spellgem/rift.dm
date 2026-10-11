/obj/item/weapon/ranged/spellgem/rift
	name = "裂隙法术宝石"
	desc = "一切魔法的源泉。"
	desc_extended = "充满纯粹奥术能量的魔法宝石，赋予使用者施放法术的能力，可镶入魔杖。这颗会发射某种裂隙玩意儿，治疗友军，并对敌人造成生物武器伤害。伤害不受魔法技能影响。"
	icon_state = "damage"

	shoot_delay = 2
	burst_delay = 12
	max_bursts = 3

	bullet_count = 1
	projectile_speed = TILE_SIZE*0.25 - 1

	projectile = /obj/projectile/magic/rift
	ranged_damage_type = /damagetype/ranged/bullet/syringe

	shoot_sounds = list('sound/weapons/magic/heal.ogg')

	color = "#FFD800"
	color_2 = "#917E1F"
	color_3 = "#7F0000"

	value = 1800
	value_burgerbux = 1

/*
/obj/item/weapon/ranged/spellgem/rift/revive
	name = "revival rift spell gem"
	desc = "The source of all magic."
	desc_extended = "A magical gem filled with pure arcane energy that gives the user the ability to cast spells. Can be augmented onto wands. This one shoots a rift something-something that revives allies and biologically hurts enemies. Damage's unaffected by your magic skill."
	icon_state = "damage"

	cost_mana = 200
	shoot_delay = 5
	burst_delay = 15
	max_bursts = 1

	bullet_count = 1
	projectile_speed = TILE_SIZE*0.25 - 1

	projectile = /obj/projectile/magic/rift
	ranged_damage_type = /damagetype/ranged/bullet/syringe

	shoot_sounds = list('sound/weapons/magic/heal.ogg')

	color = "#FFD800"
	color_2 = "#917E1F"
	color_3 = "#7F0000"

	value = 3600
	value_burgerbux = 1
*/
