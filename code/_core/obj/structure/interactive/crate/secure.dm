/obj/structure/interactive/crate/secure
	name = "安全货箱"
	desc = "你休想打开它。"
	desc_extended = "带锁的安全货箱。"
	icon_state = "secure"

	var/locked = TRUE

	value = 500

/obj/structure/interactive/crate/secure/update_overlays()
	. = ..()
	var/image/I = new/image(icon,locked ? "secure_red" : "secure_green")
	add_overlay(I)


/obj/structure/interactive/crate/secure/open(var/mob/activator)
	if(locked)
		return FALSE
	. = ..()

/obj/structure/interactive/crate/secure/close(var/mob/activator)
	if(locked)
		return FALSE
	. = ..()

/obj/structure/interactive/crate/secure/proc/lock(var/mob/activator)
	locked = TRUE
	activator?.to_chat(span("notice","你锁上了[src.name]。"))
	update_sprite()
	return TRUE

/obj/structure/interactive/crate/secure/proc/unlock(var/mob/activator)
	locked = FALSE
	activator?.to_chat(span("notice","你解锁了[src.name]。"))
	update_sprite()
	return TRUE

/obj/structure/interactive/crate/secure/clicked_on_by_object(var/mob/activator,var/atom/object,location,control,params)

	if(activator.attack_flags & CONTROL_MOD_DISARM)
		INTERACT_CHECK
		INTERACT_CHECK_OBJECT
		INTERACT_DELAY(10)
		if(locked)
			unlock(activator)
		else
			lock(activator)
		return TRUE

	return ..()

/obj/structure/interactive/crate/secure/cargo
	name = "货运安全货箱"
	var/owner_name
	var/credits_required


/obj/structure/interactive/crate/secure/cargo/get_examine_details_list(var/mob/examiner)

	. = ..()

	if(owner_name)
		. += div("warning","此安全货箱属于[owner_name]。姓名不符的人无法打开。")

	if(credits_required)
		. += div("warning","此安全货箱解锁时将收取[credits_required]信用点。")

	var/list/contents_to_display = list()
	for(var/k in contents)
		var/atom/movable/M = k
		contents_to_display += M.name

	. += div("notice","内含：[length(contents_to_display) ? jointext(contents_to_display,"、") : "无"]。")


/obj/structure/interactive/crate/secure/cargo/lock(var/mob/activator)

	if(!owner_name)
		return ..()

	if(!activator)
		return ..()

	if(is_advanced(activator))
		var/mob/living/advanced/A = activator
		if(lowertext(A.real_name) != lowertext(owner_name))
			activator.to_chat(span("notice","[src.name]拒绝上锁！"))
			return FALSE
	else
		if(lowertext(activator.name) != lowertext(owner_name))
			activator.to_chat(span("notice","[src.name]拒绝上锁！"))
			return FALSE

	return ..()


/obj/structure/interactive/crate/secure/cargo/unlock(var/mob/activator)

	if(!owner_name)
		return ..()

	if(!activator)
		return ..()

	if(!is_player(activator) || !activator.client)
		return FALSE

	var/mob/living/advanced/player/A = activator
	if(A.real_name != owner_name)
		src.do_say("错误：无法识别用户。")
		return FALSE
	if(credits_required && A.currency < credits_required)
		src.do_say("错误：信用点不足。")
		return FALSE

	. = ..()

	if(. && credits_required)
		A.adjust_currency(-credits_required)
		src.do_say("交易完成。")
		credits_required = null

