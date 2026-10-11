/obj/item/weapon/melee/energy/energy_wrench
	name = "能量扳手"
	desc = "小子，这回你可闯大祸了……"
	desc_extended = "适配已知宇宙中任何螺栓的能量扳手，满足愤怒工程师的一切需求。"
	icon = 'icons/obj/item/weapons/melee/laser/wrench.dmi'

	damage_type = /damagetype/melee/sword/energy_wrench
	damage_type_on = /damagetype/melee/sword/energy_wrench/on

	value = 1200

	size = SIZE_2
	weight = 3

	rarity = RARITY_RARE

/obj/item/weapon/melee/energy/energy_wrench/click_self(var/mob/activator,location,control,params)

	. = ..()

	if(.)
		SPAM_CHECK(20)
		if(enabled)
			play_sound('sound/weapons/melee/esword/energy_on.ogg',get_turf(src),range_max=VIEW_RANGE)
		else
			play_sound('sound/weapons/melee/esword/energy_off.ogg',get_turf(src),range_max=VIEW_RANGE)
// cant use both the sounds and the wrench flag code
//obj/item/weapon/melee/energy/energy_wrench/click_self(var/mob/activator,location,control,params)
//
//	INTERACT_CHECK
//	INTERACT_DELAY(1)
//
//	if(enabled)
//		enabled = FALSE
//		update_sprite()
//		STOP_THINKING(src)
//
//	else
//		enabled = TRUE
//		update_sprite()
//		flags_tool = FLAG_TOOL_WRENCH
//
//
//	return TRUE


