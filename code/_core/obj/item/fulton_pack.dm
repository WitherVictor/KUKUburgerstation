/obj/item/fulton_pack
	name = "富尔顿回收包"
	desc = "让人飞起来。"
	desc_extended = "装有蓝空间回收伞的背包，可将连接的目标升空回收并出售为信用点。目标必须未固定在地面上且具有出售价值；活体目标还须满足倒地、非友方等回收条件。"
	icon = 'icons/obj/item/fulton.dmi'
	icon_state = "inventory"

	amount_max = 3

	value = 200

	rarity = RARITY_UNCOMMON

	size = SIZE_3
	weight = 20

/obj/item/fulton_pack/Generate()
	amount = 3
	. = ..()

/obj/item/fulton_pack/Finalize()
	. = ..()
	update_sprite()

/obj/item/fulton_pack/update_icon()
	. = ..()
	icon_state = "[initial(icon_state)]_[min(amount,3)]"

/obj/item/fulton_pack/proc/can_attach_fulton(var/mob/activator,var/atom/movable/object,var/value_check = FALSE,var/turf_check=FALSE)

	INTERACT_CHECK_NO_DELAY(src)
	INTERACT_CHECK_NO_DELAY(object)

	if(turf_check)
		if(!is_turf(activator.loc))
			activator.to_chat(span("warning","无法接收到你的信号！"))
			return FALSE
		if(!is_turf(object.loc))
			activator.to_chat(span("warning","无法接收到目标的信号！"))
			return FALSE
		if(object.anchored)
			activator.to_chat(span("warning","[object.name]固定在地面上！"))
			return FALSE

	if(activator == object)
		activator.to_chat(span("warning","你不能回收自己！"))
		return FALSE

	if(is_living(object))
		var/mob/living/L = object
		if(L.minion_master)
			activator.to_chat(span("warning","随从无法进行富尔顿回收！"))
			return FALSE
		if(is_turf(L.loc) && !L.horizontal)
			activator.to_chat(span("warning","[L.name]必须倒在地上才能成功回收！"))
			return FALSE
		if(L.dead)
			activator.to_chat(span("warning","[L.name]已经死了！"))
			return FALSE
		if(is_living(activator))
			var/mob/living/L2 = activator
			if(!allow_hostile_action(L2.loyalty_tag,L))
				activator.to_chat(span("warning","你的阵营标记不允许你回收[L.name]！"))
				return FALSE
		if(L.boss)
			activator.to_chat(span("warning","[L.name]太大了，无法回收！"))
			return FALSE

	if(istype(object,/obj/structure/interactive/crate/))
		var/obj/structure/interactive/crate/C = object
		if(istype(object,/obj/structure/interactive/crate/secure))
			var/obj/structure/interactive/crate/secure/S = object
			if(S.locked)
				activator.to_chat(span("warning","必须先解锁[S.name]才能进行富尔顿回收！"))
				return FALSE
		for(var/k in C.contents)
			var/atom/movable/M = k
			if(!can_attach_fulton(activator,M,FALSE,FALSE))
				return FALSE

	if(value_check && object.get_value() <= 0)
		activator.to_chat(span("warning","[object.name]没有出售价值，无法卖出！"))
		return FALSE

	return TRUE

/obj/item/fulton_pack/proc/attach_fulton(var/mob/activator,var/atom/movable/M)

	var/obj/structure/interactive/fulton/F = new(get_turf(M))
	INITIALIZE(F)
	GENERATE(F)
	FINALIZE(F)
	F.add_movable(activator,M)

	activator.visible_message(span("warning","[activator.name]将[src.name]连接到了[M.name]上！"))
	activator.to_chat(span("notice","你还剩[amount-1]个富尔顿回收包。"))

	add_item_count(-1)

	return TRUE


/obj/item/fulton_pack/click_on_object(var/mob/activator,var/atom/object,location,control,params)

	if(!ismovable(object))
		return ..()

	if(!is_turf(object.loc))
		return ..()

	INTERACT_CHECK
	INTERACT_CHECK_OBJECT
	INTERACT_DELAY(10)

	if(!can_attach_fulton(activator,object,TRUE,TRUE))
		return TRUE

	activator.visible_message(span("warning","[activator.name]开始将[src.name]连接到[object.name]上！"),span("warning","你开始将[src.name]连接到[object.name]上。"))

	PROGRESS_BAR(activator,src,SECONDS_TO_DECISECONDS(2),src::attach_fulton(),activator,object)
	PROGRESS_BAR_CONDITIONS(activator,src,src::can_attach_fulton(),activator,object)

	return TRUE


