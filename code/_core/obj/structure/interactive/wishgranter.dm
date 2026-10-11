var/list/obj/structure/interactive/wishgranter/all_wishgranters = list()
var/obj/structure/interactive/wishgranter/main_wishgranter


obj/structure/interactive/wishgranter
	name = "许愿机"
	desc = "这里面藏着什么秘密？"
	collision_flags = FLAG_COLLISION_NONE
	collision_bullet_flags = FLAG_COLLISION_BULLET_NONE


	icon = 'icons/obj/structure/wishgranter.dmi'
	icon_state = "wishgranter"


	desired_light_range = 10
	desired_light_power = 0.5
	desired_light_color = "#FFFFFF"

obj/structure/interactive/wishgranter/New()
	. = ..()
	all_wishgranters[id] = src
	if(desired_light_range && desired_light_power && desired_light_color)
		set_light(desired_light_range,desired_light_power,desired_light_color)


obj/structure/interactive/wishgranter/fake/New()
	//Do literally nothing.
	return TRUE

obj/structure/interactive/wishgranter/spawn_and_join_faction
	var/faction_to_join

obj/structure/interactive/wishgranter/spawn_and_join_faction/clicked_on_by_object(caller,object,location,control,params)

	if(!is_observer(caller))
		return FALSE

	var/mob/abstract/observer/O = caller
	var/mob/living/advanced/player/P = new(src.loc,O.client)
	P.Initialize()
	if(P.client)
		P.client.eye = P
		P.client.update_zoom(-1)
	P.factions = list()

	P.initialize_factions()

	var/faction/F = all_factions[faction_to_join]
	P.factions += faction_to_join
	//P.update_faction_icons()

	P.to_chat(span(F.icon_state,"你已加入[F.name]！注意，友军伤害当前<b>[F.friendly_fire ? "开启" : "关闭"]</b>。"))
	P.to_chat(span("notice","使用镜子改变外貌。进入白光时，你的外貌、穿戴物品和装备都会保存。"))
	P.to_chat(span("danger","记得带齐能带的装备！一旦进入白光，除非死亡，否则无法返回！"))

	qdel(O)

obj/structure/interactive/wishgranter/spawn_and_join_faction/red
	name = "红队许愿机"
	faction_to_join = "arena_red"

obj/structure/interactive/wishgranter/spawn_and_join_faction/blue
	name = "蓝队许愿机"
	faction_to_join = "arena_blue"

obj/structure/interactive/wishgranter/spawn_and_join_faction/green
	name = "绿队许愿机"
	faction_to_join = "arena_green"

obj/structure/interactive/wishgranter/spawn_and_join_faction/yellow
	name = "黄队许愿机"
	faction_to_join = "arena_yellow"


obj/structure/interactive/wishgranter/normal
	name = "教程许愿机"
	id = "tutorial"
	var/main = FALSE

obj/structure/interactive/wishgranter/normal/New(var/desired_loc)

	if(main)
		main_wishgranter = src

	return ..()


obj/structure/interactive/wishgranter/normal/Crossed(var/atom/crosser)

	if(!is_player(crosser))
		return FALSE

	var/mob/living/advanced/player/P = crosser

	if(!P.client)
		return FALSE

	if(main)
		P.show_hud(TRUE,FLAGS_HUD_TELEPORT,FLAGS_HUD_SPECIAL,speed=1)
		return TRUE

	var/turf/desired_turf = get_turf(main_wishgranter)
	desired_turf = get_step(desired_turf,SOUTH)

	var/list/callback_list = list()
	callback_list["start_turf"] = get_turf(P)
	callback_list["end_turf"] = desired_turf
	if(add_progress_bar(P,"teleport",SECONDS_TO_DECISECONDS(3),callback_list))
		P.to_chat(span("notice","你开始走进光芒……"))
		P.show_hud(FALSE,FLAGS_HUD_TELEPORT,FLAGS_HUD_SPECIAL|FLAGS_HUD_WIDGET,speed=1)

	return TRUE


obj/structure/interactive/wishgranter/normal/Uncrossed(var/atom/crosser)

	if(!is_player(crosser))
		return TRUE

	var/mob/living/advanced/player/P = crosser

	if(main)
		P.show_hud(FALSE,FLAGS_HUD_TELEPORT,FLAGS_HUD_SPECIAL|FLAGS_HUD_WIDGET,speed=1)

	return TRUE

/*
obj/structure/interactive/wishgranter/normal/Crossed(var/atom/crosser)
	if(is_player(crosser))
		var/mob/living/advanced/player/P = crosser
		if(P.client)
			var/choice = input("Which Wishgranter would you like to teleport to?","Teleport Destination") as anything|null in all_wishgranters
			if(!choice)
				return
			var/list/callback_list = list()
			callback_list["start_turf"] = get_turf(P)
			callback_list["end_turf"] = all_wishgranters[choice]
			if(add_progress_bar(P,"teleport",SECONDS_TO_DECISECONDS(10),callback_list))
				P.to_chat(span("notice","Now teleporting..."))

	return ..()
*/

obj/structure/interactive/wishgranter/normal/main
	name = "最初的许愿机"
	id = "first"
	main = TRUE

/obj/structure/interactive/wishgranter/normal/village
	name = "村庄许愿机"
	id = "village"

/obj/structure/interactive/wishgranter/normal/northern_heights
	name = "北方高地酒吧许愿机"
	id = "northern_heights"

/obj/structure/interactive/wishgranter/normal/jungle
	name = "丛林许愿机"
	id = "jungle"

/obj/structure/interactive/wishgranter/normal/clockwork
	name = "发条许愿机"
	id = "clockwork"

/obj/structure/interactive/wishgranter/normal/clockwork/boss
	name = "发条首领许愿机"
	id = "clockwork_boss"


/obj/structure/interactive/wishgranter/normal/caves/
	name = "洞穴许愿机"
	id = "caves"

/obj/structure/interactive/wishgranter/normal/caves/hidden
	name = "隐秘洞穴许愿机"
	id = "caves_hidden"

/obj/structure/interactive/wishgranter/normal/caves/nymph
	name = "仙灵洞穴许愿机"
	id = "caves_nymph"

/obj/structure/interactive/wishgranter/normal/cult_hideout/
	name = "邪教藏身处许愿机"
	id = "cult_hideout"


/obj/structure/interactive/wishgranter/normal/hell/
	name = "地狱许愿机"
	id = "hell"

/obj/structure/interactive/wishgranter/normal/hell/chapel
	name = "地狱礼拜堂许愿机"
	id = "hell_chapel"
