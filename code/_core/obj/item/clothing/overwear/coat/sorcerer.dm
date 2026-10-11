/obj/item/clothing/overwear/coat/sorcerer
	name = "术士斗篷"
	icon = 'icons/obj/item/clothing/suit/sorcerer_cloak.dmi'

	desc = "术士的斗篷，通常通过染色来表明自己精通哪一门魔法。"
	desc_extended = "术士通常会按求学时所属的主要魔法学派给衣服染色。他们极为重视长袍的品质与保养，疏于打理的人很快就会惹怒同行。"

	protected_limbs = list(BODY_TORSO,BODY_GROIN,BODY_ARM_LEFT,BODY_ARM_RIGHT)

	hidden_organs = list(
		BODY_TORSO = TRUE
	)

	armor = /armor/cloth/arcane/bonus

	size = SIZE_3

	value = 1200

	dyeable = TRUE

	additional_clothing = list(
		/obj/item/clothing/head/hat/sorcerer_hood,
		/obj/item/clothing/neck/sorcerer
	)

	mob_values_add = list(
		SKILL_MAGIC = 3,
		SKILL_SUMMONING = 3
	)

	rarity = RARITY_RARE
