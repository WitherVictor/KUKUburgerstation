/obj/item/clothing/neck/goblin_necklace
	name = "地精王项链"
	icon = 'icons/obj/item/clothing/neck/goblin_necklace.dmi'
	desc = "你这怪物，居然偷小绿人的东西。"
	desc_extended = "项链中蕴含着已故地精王的生命精华，深受法师追捧。"
	worn_layer = LAYER_MOB_CLOTHING_BELT

	item_slot = SLOT_NECK

	protected_limbs = list(BODY_TORSO)

	armor = /armor/cloth

	size = SIZE_1

	value = 1000

	var/cooldown_effect = 0

	item_slot_layer = 1

	value_burgerbux = 1

	rarity = RARITY_LEGENDARY

/obj/item/clothing/neck/on_equip(var/atom/old_location,var/silent=FALSE)
	. = ..()
	var/obj/hud/inventory/I = loc
	if(I.worn)
		START_THINKING(src)

/obj/item/clothing/neck/on_unequip(var/obj/hud/inventory/old_inventory,var/silent=FALSE) //When the object is dropped from the old_inventory
	. = ..()
	STOP_THINKING(src)

/obj/item/clothing/neck/goblin_necklace/think()
	if(cooldown_effect > world.time)
		return TRUE
	cooldown_effect = world.time + SECONDS_TO_DECISECONDS(1)
	var/turf/T = get_turf(src)
	for(var/mob/living/affectLiving in T)
		if(affectLiving.dead)
			continue
		if(affectLiving.health.mana_current >= affectLiving.health.mana_max)
			continue
		affectLiving.mana_regen_buffer += 1
		CREATE(/obj/effect/temp/healing,affectLiving.loc)
	return TRUE
