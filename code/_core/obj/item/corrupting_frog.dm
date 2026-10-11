/obj/item/corrupting_frog
	name = "腐化蛙"
	icon = 'icons/obj/item/corrupting_frog.dmi'
	icon_state = "inventory"
	desc = "制作此物品时有一只青蛙受到了伤害。"
	desc_extended = "神奇的木制青蛙玩偶，可以将武器或衣物变成另一件类似物品，结果难以预料……"
	rarity = RARITY_LEGENDARY
	value = 6000
	value_burgerbux = 1
	var/can_use = TRUE

/obj/item/corrupting_frog/click_on_object(var/mob/activator, var/atom/object, location, control, params)

	if(!is_item(object))
		return ..()

	var/obj/item/I = object

	if(!can_corrupt_target(activator,object))
		return TRUE

	var/list/confirmation_labels = list("是"="Yes","否"="No","取消"="Cancel")
	var/choice = input("确定要腐化[I.name]吗？这可能产生难以预料的效果……","腐化蛙") as null|anything in confirmation_labels
	choice = confirmation_labels[choice]
	if(choice != "Yes")
		return ..()

	PROGRESS_BAR(activator,src,30,src::try_corrupt(),activator,I)
	PROGRESS_BAR_CONDITIONS(activator,src,src::can_corrupt_target(),activator,I)

	return TRUE


/obj/item/corrupting_frog/proc/can_corrupt_target(var/mob/activator,var/obj/item/target)

	INTERACT_CHECK_NO_DELAY(src)
	INTERACT_CHECK_NO_DELAY(target)

	if(!can_use) //Prevents race conditions.
		return FALSE

	if(target.no_drop || !target.can_save || !target.can_corrupt)
		activator.to_chat(span("warning","你无法对[target.name]使用[src.name]……换件物品试试吧。"))
		return FALSE

	if(!isturf(target.loc))
		activator.to_chat(span("warning","请先将[target.name]放到地上，再尝试腐化它！"))
		return FALSE

	return TRUE


/obj/item/corrupting_frog/proc/try_corrupt(var/mob/activator,var/obj/item/target)

	can_use = FALSE

	var/obj/item/corruption_result = target.corrupt()

	if(corruption_result)
		corruption_result.visible_message(span("warning","[target.name]变成了[corruption_result.name]！"))
		play_sound('sound/weapons/magic/zap_large.ogg',get_turf(corruption_result))
		qdel(src)
	else
		can_use = TRUE
		activator.to_chat(span("warning","腐化失败了……换件物品试试吧。"))

	can_use = TRUE
