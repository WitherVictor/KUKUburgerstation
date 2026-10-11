/obj/item/weapon/melee/crystal
	name = "塑形水晶"
	icon = 'icons/obj/item/weapons/melee/swords/crystal.dmi'
	icon_state = "inventory"
	desc = "水晶守卫用于塑形魔法的水晶簇。"
	desc_extended = "闪耀的水晶，自水晶守卫诞生以来，就被它们用于塑形魔法。"
	var/shape = 0
	damage_type = /damagetype/melee/sword/crystal
	drop_sound = 'sound/items/drop/knife.ogg'
	size = SIZE_2
	weight = 1
	value = 3000
	override_icon_state = TRUE
	override_icon_state_held = TRUE

	rarity = RARITY_MYTHICAL

/obj/item/weapon/melee/crystal/Finalize()
	. = ..()
	update_sprite()

/obj/item/weapon/melee/crystal/save_item_data(var/mob/living/advanced/player/P,var/save_inventory = TRUE,var/died=FALSE,var/loadout=FALSE)
	RUN_PARENT_SAFE
	SAVEVAR("shape")

/obj/item/weapon/melee/crystal/load_item_data_pre(var/mob/living/advanced/player/P,var/list/object_data,var/loadout=FALSE)
	RUN_PARENT_SAFE
	LOADVAR("shape")

/obj/item/weapon/melee/crystal/click_self(var/mob/activator as mob,var/atom/object,location,control,params) //The src is used on the object

	INTERACT_CHECK
	INTERACT_DELAY(1)

	if(shape < 2)
		shape++
		activator.to_chat(span("notice","你改变了[src.name]的形状。"))
	else
		shape = 0
		activator.to_chat(span("notice","你让[src.name]重新化为纯净的水晶。"))

	if(shape == 0)
		name = "塑形水晶"
		desc = "水晶守卫用于塑形魔法的水晶簇。"
		desc_extended = "闪耀的水晶，自水晶守卫诞生以来，就被它们用于塑形魔法。"
		damage_type = /damagetype/melee/sword/crystal
		size = SIZE_2
		weight = 1
		value = 3000
		update_sprite()
		return TRUE

	if(shape == 1)
		name = "水晶刺剑"
		desc = "由纯净水晶精华塑成的刺剑。"
		desc_extended = "水晶守卫以新式样塑成的闪耀水晶刺剑。"
		damage_type = /damagetype/melee/sword/crystal/rapier
		size = SIZE_4
		weight = 5
		value = 3000
		update_sprite()
		return TRUE

	if(shape == 2)
		name = "水晶长剑"
		desc = "由纯净水晶精华塑成的长剑。"
		desc_extended = "自水晶守卫诞生以来，它们就会塑造这种闪耀的水晶长剑。"
		damage_type = /damagetype/melee/sword/crystal/longsword
		size = SIZE_5
		weight = 8
		value = 3000
		update_sprite()
		return TRUE

	return TRUE

/obj/item/weapon/melee/crystal/update_icon()

	if(shape == 0)
		icon_state = initial(icon_state)
		icon_state_held_left = initial(icon_state_held_left)
		icon_state_held_right = initial(icon_state_held_right)

	if(shape == 1)
		icon_state = "[initial(icon_state)]_r"
		icon_state_held_left = "[initial(icon_state_held_left)]_r"
		icon_state_held_right = "[initial(icon_state_held_right)]_r"

	if(shape == 2)
		icon_state = "[initial(icon_state)]_ls"
		icon_state_held_left = "[initial(icon_state_held_left)]_ls"
		icon_state_held_right = "[initial(icon_state_held_right)]_ls"
	update_held_icon()
	return ..()

//These are for AI so that the weapon starts off deployed in a different state.

//DO NOT LET THESE BE PICKED UP//

/obj/item/weapon/melee/crystal/rapier
	name = "水晶刺剑"
	damage_type = /damagetype/melee/sword/crystal/rapier
	size = SIZE_4
	weight = 5
	shape = 1
	value_burgerbux = 1

/obj/item/weapon/melee/crystal/longsword
	name = "水晶长剑"
	damage_type = /damagetype/melee/sword/crystal/longsword
	size = SIZE_5
	weight = 8
	shape = 2
	value_burgerbux = 1
