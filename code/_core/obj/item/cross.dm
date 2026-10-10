/obj/item/cross
	name = "木制十字架"
	desc = "恶灵退散。"
	desc_extended = "一种特殊的木制十字架，可以阻止一次幽灵猎杀，也能阻挡邪秽之物。"
	icon = 'icons/obj/item/cross.dmi'
	icon_state = "inventory"

	collision_bullet_flags = FLAG_COLLISION_BULLET_SPECIFIC

	value = 100

	weight = 3

	var/broken = FALSE

	health = /health/obj/item/misc/

	health_base = 10

/obj/item/cross/save_item_data(var/mob/living/advanced/player/P,var/save_inventory = TRUE,var/died=FALSE,var/loadout=FALSE)
	RUN_PARENT_SAFE
	SAVEVAR("broken")

/obj/item/cross/load_item_data_pre(var/mob/living/advanced/player/P,var/list/object_data,var/loadout=FALSE)
	RUN_PARENT_SAFE
	LOADVAR("broken")

/obj/item/cross/Finalize()
	update_sprite()
	return ..()

/obj/item/cross/on_destruction(var/damage = TRUE)

	if(!broken)
		var/turf/T = get_turf(src)
		play_sound('sound/effects/crate_break.ogg',T,range_max=VIEW_RANGE)
		broken = TRUE
		update_sprite()

	. = ..()


/obj/item/cross/update_icon()
	icon_state = initial(icon_state)
	if(broken) icon_state = "[icon_state]_broken"
	return ..()

/obj/item/cross/Cross(atom/movable/O,atom/oldloc)

	if(O.health && icon_state == initial(icon_state))
		var/list/defense = O.health.get_defense(ignore_luck=TRUE)
		if(defense[HOLY] < defense[DARK])
			return FALSE

	. = ..()
