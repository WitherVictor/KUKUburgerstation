/obj/structure/interactive/atm
	name = "自动存取款机"
	desc = "墙上的银行。"
	desc_extended = "一台自动存取款机，可向关联银行账户存入信用点或从中取款。"
	icon = 'icons/obj/structure/atm_bank.dmi'
	icon_state = "atm"

	plane = PLANE_MOVABLE

	desired_light_range = 0.5
	desired_light_power = 1
	desired_light_color = "#0000FF"

	var/list/tracked_limits = list()

/obj/structure/interactive/atm/Initialize()
	try_attach_to()
	setup_dir_offsets()
	return ..()

/obj/structure/interactive/atm/Finalize()
	. = ..()
	update_sprite()

/obj/structure/interactive/atm/update_overlays()
	. = ..()
	var/image/I = new/image(initial(icon),"atm_light")
	I.plane = PLANE_LIGHTING_EFFECT
	add_overlay(I)

/obj/structure/interactive/atm/clicked_on_by_object(var/mob/activator,var/atom/object,location,control,params)

	INTERACT_CHECK
	INTERACT_DELAY(5)

	if(activator.client && is_player(activator))
		var/mob/living/advanced/player/P = activator
		if(is_inventory(object))
			var/obj/hud/inventory/I = object
			var/desired_input = input("你想提取多少信用点？（手续费为金额的1%，另加2信用点。）","提取信用点",0) as num
			INTERACT_CHECK
			if(!desired_input || desired_input <= 0)
				P.to_chat(span("warning","操作已取消。"))
				return TRUE
			if(length(tracked_limits) && tracked_limits[P.ckey])
				desired_input -= tracked_limits[P.ckey]
				if(desired_input <= 0)
					P.to_chat(span("warning","本机累计提取金额已达到本次申请金额。操作已取消。"))
					return TRUE
			var/fee = CEILING(2 + desired_input*0.01,1)
			var/list/withdraw_choices = list("是" = "Yes","否" = "No","取消" = "Cancel")
			var/second_input = input("存取款机将从你的账户提取[desired_input]信用点，并收取[fee]信用点手续费。是否接受？","确认","取消") as null|anything in withdraw_choices
			second_input = withdraw_choices[second_input]
			if(!second_input || second_input == "Cancel")
				P.to_chat(span("warning","操作已取消。"))
				return TRUE
			INTERACT_CHECK
			if(fee + desired_input > P.currency)
				P.to_chat(span("warning","余额不足。"))
				return TRUE
			tracked_limits[P.ckey] += desired_input
			P.adjust_currency(-(fee + desired_input))
			var/obj/item/currency/credits/C = new(get_turf(activator))
			INITIALIZE(C)
			C.amount = desired_input
			FINALIZE(C)
			P.to_chat(span("notice","交易完成。"))
			I.add_object(C)
			return TRUE

		if(istype(object,/obj/item/currency/credits/))
			var/obj/item/currency/credits/C = object
			P.adjust_currency(C.amount)
			C.amount = 0
			qdel(C)
			return TRUE


	. = ..()
