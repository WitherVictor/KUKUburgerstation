/obj/item/weapon/melee/energy/sword/
	name = "能量剑"
	desc = "由能量构成的刀刃。请别起诉。"
	desc_extended = "轻巧的能量剑，几乎各地都已将其列为制式近战武器。主要问题是重量太轻、机构复杂，无法当作刺刀使用。"
	icon = 'icons/obj/item/weapons/melee/laser/sword.dmi'

	value = 400

	damage_type = /damagetype/melee/sword/energy
	damage_type_on = /damagetype/melee/sword/energy/on

	polymorphs = list(
		"base" = "#FFFFFF",
		"blade" = "#FFFFFF",
		"core" = "#FFFFFF"
	)

	weight = 5
	size = SIZE_2

	rarity = RARITY_RARE

/obj/item/weapon/melee/energy/sword/click_self(var/mob/activator,location,control,params)

	. = ..()

	if(.)
		SPAM_CHECK(20)
		if(enabled)
			play_sound('sound/weapons/melee/esword/energy_on.ogg',get_turf(src),range_max=VIEW_RANGE)
		else
			play_sound('sound/weapons/melee/esword/energy_off.ogg',get_turf(src),range_max=VIEW_RANGE)


/obj/item/weapon/melee/energy/sword/blue
	polymorphs = list(
		"base" = "#FFFFFF",
		"blade" = "#0000FF",
		"core" = "#FFFFFF"
	)

/obj/item/weapon/melee/energy/sword/green
	polymorphs = list(
		"base" = "#FFFFFF",
		"blade" = "#00FF00",
		"core" = "#FFFFFF"
	)

/obj/item/weapon/melee/energy/sword/red
	polymorphs = list(
		"base" = "#FFFFFF",
		"blade" = "#FF0000",
		"core" = "#FFFFFF"
	)

/obj/item/weapon/melee/energy/sword/yellow
	polymorphs = list(
		"base" = "#FFFFFF",
		"blade" = "#FFFF00",
		"core" = "#FFFFFF"
	)
