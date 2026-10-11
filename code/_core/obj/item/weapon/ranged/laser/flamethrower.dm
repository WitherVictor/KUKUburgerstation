/obj/item/weapon/ranged/energy/flamethrower //I sure hope this doesn't break anything. If it does, well... uhhhhhhhhh
	name = "火焰喷射器"
	desc = "W前进 + 鼠标左键"
	desc_extended = "生物武器很有趣，可留下的烂摊子够呛。何不让清理工作也有趣一点？"
	icon = 'icons/obj/item/weapons/ranged/flamethrower.dmi'

	company_type = "Solarian"

	value = 0 //This is, after all, part of the Flamethrower Pack

	shoot_sounds = list('sound/weapons/magic/fractal.ogg') //sounds more fire-y

	projectile = /obj/projectile/bullet/flamer
	ranged_damage_type = /damagetype/ranged/laser/flamethrower

	shoot_delay = 2
	charge_cost = CELL_SIZE_BASIC / 400

	projectile_speed = TILE_SIZE*0.3

	bullet_color = null

	automatic = TRUE

	can_wield = TRUE
	wield_only = TRUE //sorting is hell

	battery = /obj/item/powercell/recharging //I'm sorry!

	can_save = FALSE

/obj/item/weapon/ranged/energy/flamethrower/clicked_on_by_object(var/mob/caller,var/atom/object,location,control,params)

	if(is_item(object))
		var/obj/item/I = object
		if(I.flags_tool & FLAG_TOOL_CROWBAR)
			INTERACT_CHECK
			INTERACT_CHECK_OBJECT
			INTERACT_DELAY(5)
			if(battery)
				caller.to_chat(span("warning","你无法撬出[battery.name]。"))
			else
				caller.to_chat(span("warning","[src.name]里没有可撬出的东西！"))
			return TRUE

	. = ..()
