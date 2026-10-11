#define VR_BUTTONS list(/obj/hud/button/virtual_reality/info,/obj/hud/button/virtual_reality/exit,/obj/hud/button/virtual_reality/enter)

/obj/structure/interactive/vr_pod
	name = "虚拟现实舱"
	desc = "在这里学习新知识，无须冒死亡风险！"
	desc_extended = "一台纳米传讯牌虚拟现实舱，能神奇地将使用者的意识连接到虚拟世界。感觉就像真实生活一样！"
	icon = 'icons/obj/structure/vr_pod.dmi'
	icon_state = "open"

	var/mob/living/advanced/player/user

	var/mob/living/advanced/player/virtual_avatar = /mob/living/advanced/player/virtual

/obj/structure/interactive/vr_pod/Destroy()
	force_eject_user()
	user = null
	QDEL_NULL(virtual_avatar)
	. = ..()

/obj/structure/interactive/vr_pod/proc/print_information()
	return TRUE

/obj/structure/interactive/vr_pod/proc/enter_virtual_reality()
	if(!SSvirtual_reality.current_virtual_reality || !SSvirtual_reality.current_virtual_reality)
		user.to_chat(span("warning","虚拟现实程序尚未加载！"))
		return FALSE
	check_virtual_avatar()
	if(istype(virtual_avatar))
		SSvirtual_reality.current_virtual_reality.on_player_join(virtual_avatar)
	return TRUE

/obj/structure/interactive/vr_pod/proc/exit_virtual_reality()
	if(istype(virtual_avatar))
		SSvirtual_reality.current_virtual_reality.on_player_leave(virtual_avatar)
		qdel(virtual_avatar)
		virtual_avatar = null
	return TRUE

/obj/structure/interactive/vr_pod/proc/add_buttons()

	for(var/k in VR_BUTTONS)
		var/obj/hud/button/virtual_reality/B = new k
		B.linked_pod = src
		B.update_owner(user)

/obj/structure/interactive/vr_pod/proc/remove_buttons()

	for(var/obj/hud/button/virtual_reality/B in user.buttons)
		B.update_owner(null)

/obj/structure/interactive/vr_pod/proc/check_virtual_avatar()

	if(istype(virtual_avatar))
		user.to_chat(span("notice","正在进入已有的虚拟化身……"))
		user.client.control_mob(virtual_avatar)
		return TRUE
	else
		virtual_avatar = initial(virtual_avatar)
		if(!virtual_avatar)
			log_error("WARNING: [user.get_debug_name()] tried accessing virtual reality with [src.get_debug_name()], but there was no default virtual avatar assigned!")
			return FALSE
		user.to_chat(span("notice","正在初始化新的虚拟化身……"))
		virtual_avatar = new virtual_avatar(get_turf(src),user.client,1)
		virtual_avatar.fallback_mob = user
		user.linked_mobs += virtual_avatar
		INITIALIZE(virtual_avatar)
		GENERATE(virtual_avatar)
		FINALIZE(virtual_avatar)

	return TRUE

/obj/structure/interactive/vr_pod/update_icon()
	. = ..()
	if(user)
		icon_state = "idle"
	else
		icon_state = "open"

/obj/structure/interactive/vr_pod/Entered(var/atom/movable/enterer,var/atom/oldloc)
	if(is_player(enterer))
		var/mob/living/advanced/player/P = enterer
		if(P.client)
			user = enterer
			add_buttons()
			update_sprite()
	. = ..()

/obj/structure/interactive/vr_pod/Exited(var/atom/movable/exiter,var/atom/newloc)
	if(exiter == user)
		remove_buttons()
		exit_virtual_reality()
		user = null
		update_sprite()
	. = ..()

/obj/structure/interactive/vr_pod/proc/force_eject_user()
	if(user)
		user.Move(get_turf(src))
		return TRUE
	return FALSE

/obj/structure/interactive/vr_pod/proc/can_enter_pod(var/mob/caller)

	INTERACT_CHECK_NO_DELAY(src)

	if(!is_player(caller) || !caller.client)
		return FALSE

	if(user)
		return FALSE

	if(!caller.client)
		return FALSE

	return TRUE

/obj/structure/interactive/vr_pod/proc/enter_pod(var/mob/living/advanced/player/P)
	force_eject_user() //Just in case.
	P.Move(src)
	return TRUE

/obj/structure/interactive/vr_pod/clicked_on_by_object(var/mob/caller,var/atom/object,location,control,params)

	INTERACT_CHECK

	if(is_inventory(object))
		if(user)
			if(user.dead)
				caller.to_chat(span("notice","你将[user]的尸体从[src.name]中移了出来。"))
				force_eject_user()
				return TRUE
			caller.to_chat(span("warning","[src.name]已经有人使用了！"))
		else if(can_enter_pod(caller))
			PROGRESS_BAR(caller,src,SECONDS_TO_DECISECONDS(1),src::enter_pod(),caller)
			PROGRESS_BAR_CONDITIONS(caller,src,src::can_enter_pod(),caller)
		return TRUE

	. = ..()
