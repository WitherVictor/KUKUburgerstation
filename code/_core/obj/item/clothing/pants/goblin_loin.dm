/obj/item/clothing/pants/goblin_loin
	name = "地精王兜裆布"
	desc = "居然偷小绿人的东西，你这个怪物。"
	desc_extended = "这条兜裆布蕴含着已故地精王的生命精华，深受法师觊觎。"
	icon = 'icons/obj/item/clothing/pants/goblin_loin.dmi'

	armor = /armor/cloth

	size = SIZE_2

	value = 1000

	var/cooldown_effect = 0

	value_burgerbux = 1

	rarity = RARITY_LEGENDARY

/obj/item/clothing/pants/goblin_loin/on_equip(var/atom/old_location,var/silent=FALSE)
	. = ..()
	var/obj/hud/inventory/I = loc
	if(I.worn)
		START_THINKING(src)

/obj/item/clothing/pants/goblin_loin/on_unequip(var/obj/hud/inventory/old_inventory,var/silent=FALSE) //When the object is dropped from the old_inventory
	. = ..()
	STOP_THINKING(src)

/obj/item/clothing/pants/goblin_loin/think()
	if(cooldown_effect > world.time)
		return TRUE
	cooldown_effect = world.time + SECONDS_TO_DECISECONDS(1)
	var/turf/T = get_turf(src)
	for(var/mob/living/affectLiving in T)
		if(affectLiving.dead)
			continue
		if(affectLiving.health.mana_current >= affectLiving.health.mana_max)
			continue
		affectLiving.mana_regen_buffer += 3
		CREATE(/obj/effect/temp/healing,affectLiving.loc)
	return TRUE
