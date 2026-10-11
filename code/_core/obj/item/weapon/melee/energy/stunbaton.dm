/obj/item/weapon/melee/energy/stunbaton
	name = "电击警棍"
	desc = "一根电击警棍，只是击晕档卡在了致命模式。"
	desc_extended = "私人安保与太空警察使用的警棍。敲别人脑袋前记得开启，否则它就只是一根沉重的棍子。"
	icon = 'icons/obj/item/weapons/melee/clubs/stunbaton.dmi'
	damage_type = /damagetype/melee/club/stunbaton
	damage_type_on = /damagetype/melee/club/stunbaton/on

	value = 50

	size = SIZE_2

	rarity = RARITY_COMMON

/obj/item/weapon/melee/energy/stunbaton/click_self(var/mob/activator,location,control,params)

	. = ..()

	if(.)
		if(enabled)
			play_sound(pick('sound/effects/sparks/sparks1.ogg','sound/effects/sparks/sparks2.ogg','sound/effects/sparks/sparks3.ogg','sound/effects/sparks/sparks4.ogg'),get_turf(src),range_max=VIEW_RANGE*0.5)
