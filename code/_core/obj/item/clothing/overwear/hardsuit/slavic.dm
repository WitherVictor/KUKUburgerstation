/obj/item/clothing/overwear/hardsuit/exosuit
	name = "斯拉夫外骨骼装甲"
	icon = 'icons/obj/item/clothing/suit/exosuit.dmi'
	desc = "塔琴科，安息吧。"
	desc_extended = "军用外骨骼的试验样品。由于造价惊人且存在一些设计缺陷，从未量产。尽管如此，它能承担随身装备的重量，因此仍有需求，地下设施也在小批量制造。"


	item_slot = SLOT_TORSO_ARMOR

	worn_layer = LAYER_MOB_CLOTHING_HARDSUIT

	armor = /armor/hardsuit/combat/slavic

	size = SIZE_7


	additional_clothing = list(/obj/item/clothing/head/helmet/full/hardsuit/exosuit)

	value = 750 //Extraordinary cost. :P

	rarity = RARITY_RARE


/obj/item/clothing/overwear/hardsuit/skat
	name = "SKAT-9装甲服"
	icon = 'icons/obj/item/clothing/suit/skat.dmi'
	desc = "黄貂鱼，安息吧。"
	desc_extended = "这套现代军用装甲服用于异常区域的突击行动，由PSZ-12p重型军用装甲服、内置补偿服和异常防护紧身服组成。它能有效抵御子弹与破片，同时保持较好的机动性。没有附带异常遗物容器，因为这里根本没有那种遗物。你懂的，毕竟不是同一个宇宙。"


	item_slot = SLOT_TORSO_ARMOR
	worn_layer = LAYER_MOB_CLOTHING_HARDSUIT

	armor = /armor/hardsuit/combat/slavic

	size = SIZE_7

	additional_clothing = list(/obj/item/clothing/head/helmet/full/hardsuit/skat)

	value = 1050

	rarity = RARITY_UNCOMMON

/obj/item/clothing/overwear/hardsuit/skat/antag
	name = "SKAT-10装甲服"
	icon = 'icons/obj/item/clothing/suit/skat_antag.dmi'
	desc = "《潜行者》的梗我真想不出来了。"
	desc_extended = "SKAT-9组合装甲服的全面重设计版。辛迪加与太空斯拉夫联邦的科学家依据一份未具名的非正式和平协议，从零开始联合研发，但因造价过高而未能量产。由PSZ-15b超重型军用装甲服、内置半固态防破片服和增强型异常防护紧身服组成。在保持较好机动性的同时，提供顶尖的防弹与防破片能力。"


	item_slot = SLOT_TORSO_ARMOR
	worn_layer = LAYER_MOB_CLOTHING_HARDSUIT

	armor = /armor/hardsuit/combat/slavic/plus

	size = SIZE_7

	additional_clothing = list(/obj/item/clothing/head/helmet/full/hardsuit/skat/antag)

	value = 2050

	rarity = RARITY_MYTHICAL

	var/cooldown_effect = 0

/*
/obj/item/clothing/overwear/hardsuit/skat/antag/post_move(atom/old_loc)
	. = ..()
	if(istype(loc, /obj/hud/inventory/organs/torso))
		START_THINKING(src)
	else
		STOP_THINKING(src)

/obj/item/clothing/overwear/hardsuit/skat/antag/think()
	if(cooldown_effect > world.time)
		return TRUE
	cooldown_effect = world.time + SECONDS_TO_DECISECONDS(1)
	var/turf/T = get_turf(src)
	for(var/mob/living/affectLiving in T)
		if(affectLiving.dead)
			continue
		affectLiving.brute_regen_buffer += 1
		affectLiving.burn_regen_buffer += 1
		affectLiving.tox_regen_buffer += 1
		affectLiving.rad_regen_buffer += 1
		CREATE(/obj/effect/temp/healing,affectLiving.loc)
	return TRUE
*/
