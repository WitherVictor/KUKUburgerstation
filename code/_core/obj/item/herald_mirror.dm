/obj/item/herald_mirror
	name = "先驱之镜"
	desc = "凝视镜面，便会被传送至安全的领域。再次使用镜子即可返回。"
	desc_extended = "能将持有者传送至隐秘领域的特殊镜子。"

	icon = 'icons/obj/item/herald_mirror.dmi'
	icon_state = "inventory"

	var/obj/marker/herald/destination/linked_destination
	var/obj/marker/herald/returning/linked_returning

	value = 5000

	rarity = RARITY_MYTHICAL

/obj/item/herald_mirror/Destroy()
	linked_destination = null
	linked_returning = null
	. = ..()

/obj/item/herald_mirror/Finalize()
	linked_destination = locate() in world
	return ..()

/obj/item/herald_mirror/click_self(var/mob/activator,location,control,params)

	INTERACT_CHECK
	INTERACT_DELAY(10)

	if(!is_advanced(activator))
		activator.to_chat(span("warning","你不知道该怎么使用它……"))
		return TRUE

	if(istype(activator,/mob/living/advanced/player/antagonist))
		activator.to_chat(span("warning","你体内装着爆炸植入体，使用它恐怕不是个好主意……"))
		return TRUE

	var/mob/living/advanced/A = activator

	if(!can_teleport(A))
		return FALSE

	PROGRESS_BAR(activator,src,SECONDS_TO_DECISECONDS(5),src::do_teleport(),A)
	PROGRESS_BAR_CONDITIONS(activator,src,src::can_teleport(),A)

	return TRUE

/obj/item/herald_mirror/proc/can_teleport(var/mob/living/advanced/A)

	if(!can_activator_interact_with(A, delay_checks = FALSE)) // This is INTERACT_CHECK_NO_DELAY(x) but 516 friendly
		return FALSE

	if(!linked_destination)
		A.to_chat(span("warning","出了点问题……请在Discord上告诉Burger。"))
		return FALSE

	if(!SSgamemode?.active_gamemode?.allow_launch)
		A.to_chat(span("warning","你现在还不能使用[src.name]……"))
		return FALSE

	if(!A.can_move())
		A.to_chat(span("warning","你当前的状态无法使用[src.name]！"))
		return FALSE

	if(!is_inventory(loc))
		A.to_chat(span("warning","你必须手持[src.name]才能传送！"))
		return FALSE

	var/obj/hud/inventory/I = loc

	if(!I.click_flags || I.owner != A)
		A.to_chat(span("warning","你必须手持[src.name]才能传送！"))
		return FALSE

	return TRUE


/obj/item/herald_mirror/proc/do_teleport(var/mob/living/advanced/A)

	var/area/A2 = get_area(A)

	if(istype(A2,/area/herald))
		var/turf/T = get_turf(linked_returning)
		if(!T)
			A.to_chat(span("notice","你似乎无法返回先前的位置……也许那道光能帮你回去。"))
			return TRUE
		A.force_move(T)
		A.visible_message(span("danger","[A.name]凭空出现了！"),span("notice","[src.name]将你带回了先前的位置。"))
		return TRUE

	if(linked_returning)
		qdel(linked_returning) //Get rid of existing one.
	linked_returning = new(get_turf(A))
	INITIALIZE(linked_returning)
	GENERATE(linked_returning)
	FINALIZE(linked_returning)

	A.force_move(get_turf(linked_destination))
	A.visible_message(span("danger","[A.name]消失在一阵柔和的闪光中！"),span("notice","[src.name]将你带到了安全之地。"))

	return TRUE
