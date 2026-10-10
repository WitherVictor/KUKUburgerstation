/obj/hud/button/intent
	name = "交互意图"
	desc = "不切伤害意图，誓不罢休。"
	icon_state = "intent"
	screen_loc = "RIGHT:1-2,BOTTOM:11"

	flags_hud = FLAG_HUD_MOB

	var/intent = INTENT_HELP

	var/active = FALSE

/obj/hud/button/intent/update_owner()

	. = ..()

	if(is_living(owner))
		var/mob/living/L = owner
		active = L.intent == intent
		update_sprite()

/obj/hud/button/intent/clicked_on_by_object(var/mob/activator,var/atom/object,location,control,params)

	. = ..()

	if(. && is_living(activator))
		var/mob/living/L = activator
		L.selected_intent = intent
		L.update_intent()

/obj/hud/button/intent/update_overlays()

	. = ..()

	if(active)
		var/image/I = new/image(initial(icon),"[initial(icon_state)]_active")
		add_overlay(I)

//The reason why this isn't one button is to support button binds.
/obj/hud/button/intent/help
	name = "帮助意图"
	desc_extended = "点击这里切换为帮助意图。这是一种较被动的姿态，会让你显得不那么有攻击性，并使徒手攻击只造成疲劳伤害。"
	icon_state = "intent_help"
	intent = INTENT_HELP

/obj/hud/button/intent/harm
	name = "伤害意图"
	desc_extended = "点击这里切换为伤害意图。这是一种进攻姿态，会使角色面朝鼠标指针，并提高徒手攻击的伤害。"
	icon_state = "intent_harm"
	intent = INTENT_HARM

/obj/hud/button/intent/disarm
	name = "缴械意图"
	desc_extended = "点击这里切换为缴械意图。这是一种防御姿态，会将徒手攻击改为推搡敌人或缴掉其武器。"
	icon_state = "intent_disarm"
	intent = INTENT_DISARM

/obj/hud/button/intent/grab
	name = "抓取意图"
	desc_extended = "点击这里切换为抓取意图。这是一种进攻姿态，会将徒手攻击改为抓住敌人。被抓住的敌人仍能攻击你，除非它们倒地或背对着你。你抓住的敌人受到的攻击必定暴击。"
	icon_state = "intent_grab"
	intent = INTENT_GRAB
