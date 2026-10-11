/obj/item/defib
	name = "除颤器"
	icon = 'icons/obj/item/defib.dmi'
	desc = "太空人的最后希望。"
	desc_extended = "可自动充能的重型除颤器，用于让患者的心脏重新跳动。"

	var/obj/item/defib_paddle/paddle_left
	var/obj/item/defib_paddle/paddle_right

	worn_layer = LAYER_MOB_CLOTHING_BACK
	item_slot = SLOT_TORSO_BACK
	slot_icons = TRUE

	size = SIZE_3

	value = 2000

	weight = 16

	rarity = RARITY_UNCOMMON

/obj/item/defib/get_examine_list(var/mob/examiner)
	. = ..()
	if(item_slot == SLOT_TORSO_BACK) //shitcode is my passion
		. += span("notice","装备在背部后可取出电极板；放在地上时，按住Alt点击也可取出。<br>取用并操作两块电极板需要双手空闲。")
	else
		. += span("notice","装备在腰带槽后可取出电极板；放在地上时，按住Alt点击也可取出。<br>取用并操作两块电极板需要双手空闲。")

/obj/item/defib/belt
	name = "便携式除颤器"
	icon = 'icons/obj/item/clothing/belts/compact_defib.dmi'
	desc_extended = "可自动充能的除颤器，用于让患者的心脏重新跳动。现在体积更小了！"

	size = SIZE_2
	item_slot = SLOT_GROIN_BELT

	weight = 8

	value = 2100

	rarity = RARITY_RARE

/obj/item/defib/PreDestroy()
	QDEL_NULL(paddle_left)
	QDEL_NULL(paddle_right)
	. = ..()

/obj/item/defib/can_be_worn(var/mob/living/advanced/owner,var/obj/hud/inventory/I,var/messages=FALSE)
	return TRUE

/obj/item/defib/Initialize(var/desired_loc) //Fill inventory handles the initializations here.
	paddle_left = new /obj/item/defib_paddle(src)
	paddle_left.linked_defib = src
	paddle_right = new /obj/item/defib_paddle(src)
	paddle_right.linked_defib = src
	return ..()

/obj/item/defib/proc/on_paddle(var/mob/activator)

	if(!paddle_left.placed_target_ref || !paddle_right.placed_target_ref || paddle_left.placed_target_ref != paddle_right.placed_target_ref)
		return FALSE

	var/mob/living/target = locate(paddle_left.placed_target_ref)
	if(!target)
		return FALSE

	var/turf/T = get_turf(target)

	activator.visible_message(span("danger","[activator.name]正在给[src.name]充能……"),span("warning","你正在给[src.name]充能……"))

	play_sound('sound/items/defib/defib_charge.ogg',T,range_max=VIEW_RANGE)
	create_alert(VIEW_RANGE,T,activator,ALERT_LEVEL_NOISE)

	paddle_left.placed_target_ref = null
	paddle_right.placed_target_ref = null

	PROGRESS_BAR(activator,src,30,src::defib_target(),activator,target)
	PROGRESS_BAR_CONDITIONS(activator,src,src::can_defib_target(),activator,target)

	return TRUE

/obj/item/defib/proc/can_defib_target(var/mob/activator,var/mob/living/target)

	INTERACT_CHECK_NO_DELAY(src)
	INTERACT_CHECK_NO_DELAY(target)

	return TRUE

/obj/item/defib/proc/defib_target(var/mob/activator,var/mob/living/target)

	var/turf/T = get_turf(target)

	activator.visible_message(span("notice","[activator.name]用[src.name]电击了[target.name]！"),span("notice","你用[src.name]电击了[target.name]！"))

	play_sound('sound/items/defib/defib_zap.ogg',T,range_max=VIEW_RANGE)
	create_alert(VIEW_RANGE,T,activator,ALERT_LEVEL_NOISE)

	var/target_dead = target.dead || target.has_status_effect(CRIT)

	if(target_dead)
		target.add_status_effect(ADRENALINE,100,100)

	if(target.check_death() || (target.dead && !target.is_player_controlled()) || target.suicide)
		target.visible_message(span("warning","什么也没发生……"))
		play_sound('sound/items/defib/defib_failed.ogg',T,range_max=VIEW_RANGE)
		create_alert(VIEW_RANGE,T,activator,ALERT_LEVEL_NOISE)
		return FALSE

	play_sound('sound/items/defib/defib_ready.ogg',T,range_max=VIEW_RANGE*0.5)
	create_alert(VIEW_RANGE*0.5,T,activator,ALERT_LEVEL_NOISE)

	if(target_dead) //Was dead
		target.revive()
		activator.visible_message(span("danger","[target.name]猛地抽动，恢复了生机！"))
		/* TODO, CHECK THE JOB INSTEAD.
		if(money && is_player(activator) && is_player(target))
			var/mob/living/advanced/player/PC = activator
			var/mob/living/advanced/player/PT = target
			if(PC.loyalty_tag == PT.loyalty_tag)
				var/charged_amount = PT.adjust_currency(-500)
				if(charged_amount > 0)
					src.do_say("[charged_amount] credit(s) have been transfered from the patient's account into the practitioner's account for successful revival.")
					PC.adjust_currency(charged_amount)
		*/
	else
		var/atom/target_to_damage = target
		if(is_advanced(target))
			var/mob/living/advanced/A = target
			if(A.labeled_organs[BODY_TORSO])
				target_to_damage = A.labeled_organs[BODY_TORSO]
		if(target_to_damage.health)
			var/damage_to_deal = (activator == target) ? 50 : 20
			target.add_status_effect(ADRENALINE,50,100)
			target.add_status_effect(STUN,20,20)
			if(target_to_damage.health.organic)
				target_to_damage?.health?.adjust_loss_smart(pain=damage_to_deal,fatigue=damage_to_deal,organic=TRUE,robotic=FALSE)
			else
				target_to_damage?.health?.adjust_loss_smart(burn=damage_to_deal*2,organic=FALSE,robotic=TRUE)


	return TRUE

/obj/item/defib/click_self(var/mob/activator,location,control,params)

	if(!is_advanced(activator))
		return FALSE

	INTERACT_CHECK
	INTERACT_DELAY(1)

	var/mob/living/advanced/A = activator

	. = FALSE
	if(paddle_left in src.contents)
		A.put_in_hands(paddle_left)
		. = TRUE

	if(paddle_right in src.contents)
		A.put_in_hands(paddle_right)
		. = TRUE

	if(!.)
		return ..()


/obj/item/defib/post_move(var/atom/old_loc)
	. = ..()
	if(paddle_left && paddle_left.loc != src)
		paddle_left.drop_item(src)
	if(paddle_right && paddle_right.loc != src)
		paddle_right.drop_item(src)

/obj/item/defib_paddle
	name = "除颤电极板"
	desc = "都闪开！"
	desc_extended = "一块除颤电极板。将两块都贴在刚去世的患者身上，然后祈祷吧。"
	icon = 'icons/obj/item/defib_paddle.dmi'
	var/obj/item/defib/linked_defib
	var/placed_target_ref //While refs can be replaced by other objects, placing the last paddle with check if it's a valid ref.

	throwable = FALSE

	size = 9999

	size = SIZE_6

	weight = 2

	can_save = FALSE

	value = 0

/obj/item/defib_paddle/Destroy()
	linked_defib = null
	. = ..()

/obj/item/defib_paddle/click_on_object(var/mob/activator as mob,var/atom/object,location,control,params)

	if(is_inventory(object))
		return ..()

	if(activator.is_busy())
		return TRUE

	if(!linked_defib)
		INTERACT_CHECK
		INTERACT_CHECK_OBJECT
		INTERACT_DELAY(10)
		activator.to_chat(span("danger","除颤电极板发生错误。请向Burger说明你是如何遇到这个问题的。"))
		return TRUE

	if(object == linked_defib)
		INTERACT_CHECK
		INTERACT_CHECK_OBJECT
		drop_item(get_turf(src))
		return TRUE

	if(is_living(object))
		INTERACT_CHECK
		INTERACT_CHECK_OBJECT
		INTERACT_DELAY(1)
		if(placed_target_ref == "\ref[object]")
			activator.visible_message(span("notice","[activator.name]从[object.name]胸前移开了[src.name]……"),span("warning","你从[object.name]胸前移开了[src.name]……"))
			placed_target_ref = null
		else
			activator.visible_message(span("danger","[activator.name]把[src.name]贴在[object.name]胸前……"),span("warning","你把[src.name]贴在[object.name]胸前……"))
			placed_target_ref = "\ref[object]"
			linked_defib.on_paddle(activator)
		return TRUE

	return ..()

/obj/item/defib_paddle/post_move(var/atom/old_loc)

	. = ..()

	if(.)
		placed_target_ref = null
		if(is_inventory(old_loc))
			var/obj/hud/inventory/I = old_loc
			if(I.owner)
				HOOK_REMOVE("post_move","\ref[src]_post_move_defib",I.owner)
		if(is_inventory(src.loc))
			var/obj/hud/inventory/I = src.loc
			if(!I.click_flags || !I.owner)
				src.drop_item(linked_defib)
			else
				HOOK_ADD("post_move","\ref[src]_post_move_defib",I.owner,src,src::check_distance())
		else if(linked_defib && src.z)
			src.drop_item(linked_defib)

/obj/item/defib_paddle/proc/check_distance()

	var/turf/T1 = get_turf(src)

	if(!linked_defib)
		src.drop_item(T1)
		return FALSE

	var/turf/T2 = get_turf(linked_defib)

	if(get_dist(T1,T2) > 2)
		src.drop_item(T1)
		return FALSE

	return TRUE
