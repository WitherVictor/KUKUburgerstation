/obj/item/portal_scroll
	name = "传送门卷轴"
	desc = "看起来还算稳定。"
	desc_extended = "阅读后可开启通往己方安全地点的传送门。"
	icon = 'icons/obj/item/portal_scroll.dmi'
	icon_state = "inventory"
	has_quick_function = TRUE //Allows scrolls to show up in the belt slots.
	value = 500

	rarity = RARITY_RARE

/obj/item/portal_scroll/get_examine_list(var/mob/examiner)
	. = ..()
	if(is_living(examiner))
		var/mob/living/L = examiner
		if(L.loyalty_tag && length(portal_markers[L.loyalty_tag]))
			var/obj/marker/M = portal_markers[L.loyalty_tag][1]
			var/area/A = get_area(M)
			if(A) . += span("notice","使用后可开启通往[A.name]的传送门。")

/obj/item/portal_scroll/quick(var/mob/activator,var/atom/object,location,params)
	click_self(activator)

/obj/item/portal_scroll/click_self(var/mob/activator,location,control,params)

	if(!is_player(activator) || !activator.client)
		activator.to_chat(span("warning","你不知道该怎么使用它……"))
		return TRUE

	var/mob/living/advanced/player/P = activator

	if(!P.z)
		activator.to_chat(span("warning","你不能在这里使用它！"))
		return TRUE

	var/area/A = P.loc.loc
	if(A.area_identifier != "Mission")
		activator.to_chat(span("warning","你不能在这里使用它！"))
		return TRUE

	if(enable_friendly_fire)
		activator.to_chat(span("warning","不知为何，它似乎无法工作……"))
		return TRUE

	if(!P.loyalty_tag || !portal_markers[P.loyalty_tag])
		activator.to_chat(span("warning","你不知道该怎么使用它……"))
		return TRUE

	if(!length(portal_markers[P.loyalty_tag]))
		activator.to_chat(span("warning","无法开启传送门……现有传送门已经太多了！"))
		return TRUE

	P.clear_portals()

	var/turf/T = get_turf(src)
	var/turf/T2 = get_step(T,activator.dir)
	if(T2.can_move_to())
		T = T2

	var/obj/marker/portal/PM = pick(portal_markers[P.loyalty_tag])
	var/turf/PMT = get_turf(PM)

	if(!T || !PMT)
		activator.to_chat(span("warning","无法开启传送门，出了严重的问题。"))
		return TRUE

	var/obj/effect/temp/portal/start_portal = new(T,SECONDS_TO_DECISECONDS(300))
	var/obj/effect/temp/portal/end_portal = new(PMT,SECONDS_TO_DECISECONDS(300))
	if(SSdmm_suite.is_pvp_coord(T.x,T.y,T.z)) //Effectively one way.
		end_portal.mouse_opacity = 0
		end_portal.alpha = 0
		end_portal.invisibility = 101

	start_portal.linked_portal = end_portal
	start_portal.loyalty_tag = P.loyalty_tag

	end_portal.linked_portal = start_portal
	end_portal.loyalty_tag = P.loyalty_tag

	end_portal.linked_marker = PM
	P.linked_portals = list(start_portal,end_portal)

	var/area/A1 = T.loc
	var/area/A2 = PMT.loc

	start_portal.name = "[P.name]通往[A2.name]的传送门"
	end_portal.name = "[P.name]通往[A1.name]的传送门"

	start_portal.update_sprite()
	end_portal.update_sprite()

	qdel(src)

	play_sound('sound/effects/portal.ogg',T)
	play_sound('sound/effects/portal.ogg',PMT)

	return TRUE
