/obj/item/bikehorn
	name = "自行车喇叭"
	desc = "赞美鸣笛之母！"
	desc_extended = "你猜对了——手持使用时会发出标志性的“叭”声。"
	icon = 'icons/obj/item/fluff/bikehorn.dmi'
	damage_type = /damagetype/item/light

	value = 20

	icon_state_held_left = "held_left"
	icon_state_held_right = "held_right"

	weight = 0.25

/obj/item/bikehorn/click_self(var/mob/activator,location,control,params)

	INTERACT_CHECK
	INTERACT_DELAY(20)

	var/turf/T = get_turf(src)

	play_sound('sound/items/bikehorn.ogg',T)

	create_alert(VIEW_RANGE,T,activator,ALERT_LEVEL_NOISE)

	return TRUE


/obj/item/bikehorn/magic
	name = "魔法自行车喇叭"
	value = 500
	rarity = RARITY_RARE
	value_burgerbux = 5

/obj/item/bikehorn/magic/click_self(var/mob/activator,location,control,params)

	. = ..()

	if(.)
		for(var/mob/living/L in viewers(VIEW_RANGE,activator))
			if(L.dead)
				continue
			L.do_emote("spin")


