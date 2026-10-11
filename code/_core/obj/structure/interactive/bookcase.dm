/obj/structure/interactive/bookcase
	name = "积灰书柜"
	desc = "里面会藏着什么知识呢？"
	desc_extended = "古老而积满灰尘的书柜。自吉嘉普乐多媒体家庭娱乐系统问世以来就被抛弃了，不过也许还有值得挽救的知识？"
	icon = 'icons/obj/structure/bookcase.dmi'
	icon_state = "book"

	var/chance_of_scroll = 5

	density = TRUE
	anchored = TRUE

	collision_flags = FLAG_COLLISION_WALL
	collision_bullet_flags = FLAG_COLLISION_BULLET_NONE

	collision_dir = NORTH | EAST | SOUTH | WEST

	interaction_flags = FLAG_INTERACTION_LIVING

	pixel_y = 6

	var/static/list/stored_bookcase_phrases = list(
		"……原来胡迪后来是这样啊……",
		"……这些异形还真是欲望旺盛……",
		"……还真全是色情读物……",
		"……难怪他们要用霰弹枪……",
		"……好吧，这就是脑壳真的凹进去后的一种症状……",
		"……只有……看不完的动漫……",
		"……哦，默剧演员的书……全是空白……"
	)

/obj/structure/interactive/bookcase/no_scrolls
	chance_of_scroll = 0

/obj/structure/interactive/bookcase/Generate()

	if(chance_of_scroll)
		chance_of_scroll = rand(1,chance_of_scroll)

	. = ..()

/obj/structure/interactive/bookcase/Finalize()
	. = ..()
	update_sprite()

/obj/structure/interactive/bookcase/update_sprite()
	. = ..()
	icon_state = initial(icon_state)
	if(chance_of_scroll > 0)
		icon_state = "[icon_state]-[chance_of_scroll]"

/obj/structure/interactive/bookcase/clicked_on_by_object(var/mob/activator,var/atom/object,location,control,params)

	if(!is_inventory(object))
		return ..()

	if(can_search_case(activator))
		activator.to_chat(span("notice","你开始翻找[src.name]……"))
		PROGRESS_BAR(activator,src,SECONDS_TO_DECISECONDS(5),src::search_case(),activator)
		PROGRESS_BAR_CONDITIONS(activator,src,src::can_search_case(),activator)

	return TRUE

/obj/structure/interactive/bookcase/proc/can_search_case(var/mob/activator)

	INTERACT_CHECK_NO_DELAY(src)

	if(chance_of_scroll <= 0)
		activator.to_chat(span("warning","你觉得这里已经找不到有用的东西了。"))
		return FALSE

	if(prob(2))
		activator.to_chat(span("notice",pick(stored_bookcase_phrases)))

	return TRUE

/obj/structure/interactive/bookcase/proc/search_case(var/mob/activator)

	if(prob(chance_of_scroll*10))
		var/rarity = 0
		var/mob/living/advanced/player/P
		if(is_player(activator))
			P = activator
			rarity = P.get_rarity()
		var/turf/T = get_turf(src)
		var/list/found_items = SPAWN_LOOT(/loot/random/scroll,T,rarity)
		if(P)
			for(var/k in found_items)
				var/obj/item/I = k
				P.put_in_hands(I)
		activator.to_chat(span("notice","咦，你在[src.name]里找到了东西！"))
	else
		activator.to_chat(span("warning","你没在[src.name]里找到有用的东西……"))

	chance_of_scroll--
	update_sprite()

	return TRUE
