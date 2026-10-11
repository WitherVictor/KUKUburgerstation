obj/structure/interactive/misc/ //TODO: RENAME THIS ENTIRE CATEGORY
	icon = 'icons/obj/structure/misc.dmi'

obj/structure/interactive/misc/tv
	name = "电视机"
	desc = "别坐得离电视太近！"
	desc_extended = "一台复古电视机，用作装饰，为周围增添生气。"
	icon_state = "tv"
	collision_flags = FLAG_COLLISION_WALL
	collision_bullet_flags = FLAG_COLLISION_BULLET_INORGANIC

	bullet_block_chance = 25


obj/structure/interactive/misc/dresser
	name = "衣柜"
	desc = "内裤分配器。"
	desc_extended = "一只用作装饰的衣柜，为周围增添生气。可惜它其实不会发放内裤。"
	icon_state = "dresser"
	collision_flags = FLAG_COLLISION_WALL
	collision_bullet_flags = FLAG_COLLISION_BULLET_INORGANIC

	bullet_block_chance = 50

	density = TRUE

obj/structure/interactive/misc/dresser/chargen/clicked_on_by_object(var/mob/activator,var/atom/object,location,control,params)

	if(!is_advanced(activator))
		return ..()

	INTERACT_CHECK
	INTERACT_CHECK_OBJECT
	INTERACT_DELAY(5)

	var/mob/living/advanced/A = activator

	if(!length(A.worn_objects))
		A.equip_loadout(/loadout/new_player,TRUE)

	return TRUE

obj/structure/interactive/misc/toilet
	name = "马桶"
	desc = "*此处应有大便笑话*"
	desc_extended = "一只用作装饰的马桶，为周围增添生气。把别人的头按进去冲水会导致保修失效。"
	icon_state = "toilet"

obj/structure/interactive/misc/urinal
	name = "小便池"
	desc = "*此处应有小便笑话*"
	desc_extended = "一只挂墙式小便池，用作装饰，为周围增添生气。"
	icon_state = "urinal"
	plane = PLANE_MOVABLE

obj/structure/interactive/misc/mirror
	name = "镜子"
	desc = "魔镜魔镜告诉我，谁是这里最能打的人？"
	desc_extended = "站在镜子前可以改变你的外貌。"
	icon_state = "mirror"
	plane = PLANE_MOVABLE

	density = TRUE

obj/structure/interactive/misc/mirror/chargen
	var/limited = FALSE

obj/structure/interactive/misc/mirror/chargen/limited
	limited = TRUE

obj/structure/interactive/misc/mirror/chargen/Crossed(atom/movable/O,atom/OldLoc)
	if(is_player(O))
		var/mob/living/advanced/player/P = O
		if(P.client)
			if(limited)
				P.add_chargen_buttons(list(/obj/hud/button/chargen/sex/,/obj/hud/button/chargen/species))
			else
				P.add_chargen_buttons()
			P.handle_hairstyle_chargen(-1,update_blends=FALSE)
			P.handle_beardstyle_chargen(-1,update_blends=FALSE)
			P.show_hud(TRUE,FLAG_HUD_CHARGEN,FLAG_HUD_SPECIAL,speed=SECONDS_TO_DECISECONDS(3))

	return ..()

obj/structure/interactive/misc/mirror/chargen/Uncrossed(atom/movable/O)
	if(is_advanced(O))
		var/mob/living/advanced/player/P = O
		P.remove_chargen_buttons()
	return ..()



/obj/structure/interactive/misc/mirror/cracked
	name = "破裂的镜子"
	desc = "它碎了。"
	desc_extended = "这还能给谁用？"
	icon_state = "mirror_broke"

/obj/structure/interactive/misc/mirror/cracked/chargen/Crossed(atom/movable/O,atom/OldLoc)
	if(istype(O,/mob/living/advanced/player/antagonist/))
		var/mob/living/advanced/player/P = O
		P.add_chargen_buttons()
		P.handle_hairstyle_chargen(-1,update_blends=FALSE)
		P.handle_beardstyle_chargen(-1,update_blends=FALSE)
		P.show_hud(TRUE,FLAG_HUD_CHARGEN,FLAG_HUD_SPECIAL,speed=SECONDS_TO_DECISECONDS(3))

/obj/structure/interactive/misc/mirror/cracked/chargen/Uncrossed(atom/movable/O)
	if(istype(O,/mob/living/advanced/player/antagonist/))
		var/mob/living/advanced/player/P = O
		P.remove_chargen_buttons()
	return ..()


obj/structure/interactive/misc/curtain_open
	name = "帘子"
	desc = "用于挡住偷窥者的视线。"
	desc_extended = "一幅固定在墙上或天花板上的帘子，用作装饰，为周围增添生气。"
	icon_state = "curtain_open"
	alpha = 175

obj/structure/interactive/misc/sink
	name = "洗手池"
	desc = "水儿。不要钱的水儿。"
	desc_extended = "一座立式洗手池，用作装饰，为周围增添生气。怎么？你还真指望它免费供水？"
	icon_state = "sink"
	plane = PLANE_MOVABLE
