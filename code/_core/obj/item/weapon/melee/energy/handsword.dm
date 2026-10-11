/obj/item/weapon/melee/energy/handsword
	name = "能量拳剑"
	desc = "做工奇特的拳剑。"
	desc_extended = "构造奇特、用于贴身格斗的拳剑，同时运用使用者的近战和徒手技能。"
	icon = 'icons/obj/item/weapons/melee/laser/handsword.dmi'
	damage_type = /damagetype/unarmed/fists
	damage_type_on = /damagetype/melee/sword/handsword

	value = 500

	size = SIZE_2

	dan_mode = TRUE

	rarity = RARITY_RARE

/obj/item/weapon/melee/energy/handsword/click_self(var/mob/activator,location,control,params)

	. = ..()

	if(.)
		if(enabled)
			play_sound(pick('sound/weapons/melee/handsword/deploy.ogg'),get_turf(src),range_max=VIEW_RANGE*0.5)
		else
			play_sound(pick('sound/weapons/melee/handsword/retract.ogg'),get_turf(src),range_max=VIEW_RANGE*0.5)
