/obj/item/weapon/ranged/magic/scroll/

	open = FALSE
	damage_type = null //TODO: Paper cut
	ranged_damage_type = null

	icon = 'icons/obj/item/weapons/ranged/magic/scroll.dmi'
	icon_state = "scroll"

	override_icon_state = TRUE

	has_quick_function = TRUE

	automatic = FALSE

	var/scroll_count = 1

	weight = 0.1


/obj/item/weapon/ranged/magic/scroll/save_item_data(var/save_inventory = TRUE)
	. = ..()
	SAVEVAR("scroll_count")

/obj/item/weapon/ranged/magic/scroll/load_item_data_pre(var/mob/living/advanced/player/P,var/list/object_data)
	. = ..()
	LOADVAR("scroll_count")

/obj/item/weapon/ranged/magic/scroll/get_value()
	. = ..()
	. *= (1 + scroll_count)

/obj/item/weapon/ranged/magic/scroll/quick(var/mob/caller as mob,var/atom/object,location,params)
	shoot(caller,object,location,params)
	return TRUE

/obj/item/weapon/ranged/magic/scroll/click_self(var/mob/caller)
	INTERACT_CHECK
	INTERACT_DELAY(1)
	open = !open
	caller.to_chat(span("notice","你[open ? "展开" : "卷起"]了卷轴。"))
	update_sprite()
	return TRUE

/obj/item/weapon/ranged/magic/scroll/can_gun_shoot(var/mob/caller)

	if(!open)
		caller.to_chat(span("notice","必须先展开卷轴才能施放法术！"))
		return FALSE

	if(get_ammo_count() <= 0)
		caller.to_chat(span("notice","卷轴是空白的！"))
		return FALSE

	return ..()

/obj/item/weapon/ranged/magic/scroll/get_ammo_count()
	return scroll_count

/obj/item/weapon/ranged/magic/scroll/update_icon()

	icon_state = initial(icon_state)

	if(open)
		icon_state += "_open"

	if(get_ammo_count() <= 0)
		icon_state += "_empty"

	..()

/obj/item/weapon/ranged/magic/scroll/handle_empty(var/mob/caller)
	if(!open)
		caller.to_chat(span("warning","必须先展开卷轴才能使用！"))
	else
		caller.to_chat(span("warning","这张卷轴是空白的，没有魔力！"))
	return TRUE //No melee

/obj/item/weapon/ranged/magic/scroll/click_on_object(var/mob/caller as mob,var/atom/object,location,control,params)

	object = object.defer_click_on_object(location,control,params)

	if(is_scroll(object))

		INTERACT_CHECK
		INTERACT_CHECK_OBJECT
		INTERACT_DELAY(1)

		if(scroll_count <= 0)
			caller.to_chat(span("warning","这张卷轴是空白的，没有魔力！"))
			return TRUE

		var/obj/item/weapon/ranged/magic/scroll/S = object

		if(S.scroll_count <= 0)
			caller.to_chat(span("warning","这张卷轴是空白的，没有魔力！"))
			return TRUE

		if(S.type != type) //Need to be the exact same id.
			caller.to_chat(span("warning","没有法术典籍，最好别把不同卷轴混在一起。"))
			return TRUE

		var/transfer_count = S.scroll_count

		caller.to_chat(span("notice","你从[S]中取出了[transfer_count]张卷轴。"))

		S.scroll_count -= scroll_count
		scroll_count += transfer_count
		if(S.scroll_count <= 0)
			qdel(S)

		return TRUE

	return ..()

/obj/item/weapon/ranged/magic/scroll/handle_ammo(var/mob/caller,var/bullet_position=1)
	scroll_count--
	update_sprite()
	return ..()

/obj/item/weapon/ranged/magic/scroll/fireball
	name = "真火球卷轴"
	desc = "发射会爆炸的火球。"

	projectile = /obj/projectile/magic/fireball/explosive

	ranged_damage_type = /damagetype/ranged/magic/fireball

	shoot_delay = 10
	projectile_speed = 16

	shoot_sounds = list('sound/weapons/magic/fireball.ogg')

	value = 15

/obj/item/weapon/ranged/magic/scroll/fireball/Generate()
	scroll_count = 5
	return ..()
