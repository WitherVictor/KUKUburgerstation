/obj/item/weapon/melee/mezzaluna
	name = "半月刀"

	desc = "哈哈，剃刀唰地一下。"
	desc_extended = "外形像巨型剃刀的剑，通过刀刃两侧的横向握柄使用。劈砍时威力惊人，其他挥击方式却几乎没用。"
	icon = 'icons/obj/item/weapons/melee/swords/mezzaluna.dmi'
	damage_type = /damagetype/melee/sword/mezzaluna

	can_wield = TRUE
	wield_only = TRUE

	value = 150

	drop_sound = 'sound/items/drop/axe.ogg'

	size = SIZE_4
	weight = 20

	rarity = RARITY_RARE

/obj/item/weapon/melee/mezzaluna/should_cleave(var/atom/attacker,var/atom/victim,var/list/params)

	if(wielded)
		return TRUE

	return ..()
