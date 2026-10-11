/obj/item/whistle
	name = "哨子"
	desc = "用它当个讨人嫌的规则较真狂。"
	desc_extended = "使用时会发出烦人的哨声。"
	icon = 'icons/obj/item/whistle.dmi'
	damage_type = /damagetype/item/light

	value = 200

	icon_state_held_left = "held_left"
	icon_state_held_right = "held_right"

	weight = 0.25

	rarity = RARITY_UNCOMMON

/obj/item/whistle/click_self(var/mob/activator,location,control,params)

	INTERACT_CHECK
	INTERACT_DELAY(30)

	var/turf/T = get_turf(src)

	play_sound('sound/effects/whistle.ogg',T,range_min=VIEW_RANGE*0.25,range_max=VIEW_RANGE*2,pitch=RAND_PRECISE(0.95,1.05))

	create_alert(VIEW_RANGE,T,activator,ALERT_LEVEL_CAUTION)

	return TRUE


