/obj/item/handcuffs
	name = "手铐"
	desc = "用它铐住别人。"
	desc_extended = "做工廉价的金属手铐，只要力气够大，谁都能挣脱。手持手铐点击目标即可开始上铐。"
	icon = 'icons/obj/item/handcuffs.dmi'
	icon_state = "inventory"
	var/strength = 1 //Multiplier required to resist out of them.

	value = 10

	weight = 1

	size = SIZE_1

/obj/item/handcuffs/click_on_object(var/mob/activator as mob,var/atom/object,location,control,params)

	if(ismob(object))
		INTERACT_CHECK
		INTERACT_CHECK_OBJECT
		INTERACT_DELAY(10)
		if(!is_advanced(object))
			activator.to_chat(span("warning","你无法给这个目标上铐！"))
			return TRUE
		var/mob/living/advanced/A = object
		if(can_cuff(activator,A))
			A.visible_message(span("warning","[activator.name]开始给[A.name]上铐……"),span("danger","[activator.name]开始给你上铐！"))
			PROGRESS_BAR(activator,src,SECONDS_TO_DECISECONDS(5),src::cuff(),activator,A)
			PROGRESS_BAR_CONDITIONS(activator,src,src::can_cuff(),activator,A)
		return TRUE

	return ..()

/obj/item/handcuffs/proc/cuff(var/mob/activator,var/mob/living/advanced/target)
	target.visible_message(span("warning","[activator.name]给[target.name]戴上了手铐。"),span("danger","[activator.name]给你戴上了手铐！"))
	target.set_handcuffs(TRUE,src)
	return TRUE

/obj/item/handcuffs/proc/can_cuff(var/mob/activator,var/mob/living/advanced/target)

	INTERACT_CHECK_NO_DELAY(src)
	INTERACT_CHECK_NO_DELAY(target)

	if(target.handcuffed)
		activator.to_chat(span("warning","[target.name]已经戴着手铐了！"))
		return FALSE

	if(!src.loc || !is_inventory(src.loc))
		activator.to_chat(span("warning","你必须手持[src.name]才能给[target.name]上铐！"))
		return FALSE

	var/obj/hud/inventory/I = src.loc

	if(!I.click_flags)
		activator.to_chat(span("warning","你必须手持[src.name]才能给[target.name]上铐！"))
		return FALSE

	if(is_living(activator))
		var/mob/living/L = activator
		if(!allow_hostile_action(L.loyalty_tag,target))
			activator.to_chat(span("warning","你不能给友方上铐！"))
			return FALSE

	return TRUE
