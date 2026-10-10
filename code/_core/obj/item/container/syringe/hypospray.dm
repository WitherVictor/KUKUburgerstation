/obj/item/container/syringe/hypospray
	name = "高压注射器"
	desc = ";医疗主管是变形怪！！"
	desc_extended = "一款体积较大、无菌且可重复使用的气压式自动注射器，可快速向患者给药。每次最多注射15单位，几乎瞬间完成。"

	value = 800
	icon = 'icons/obj/item/container/hypospray.dmi'
	icon_state = "hypo"

	injection_sound = 'sound/effects/stimpack.ogg'

	quality_reduction_on_use = 0
	injection_time = SECONDS_TO_DECISECONDS(0.25)
	inject_amount_max = 15
	reagents = /reagent_container/syringe/hypospray // holds 60u
	adjustable = TRUE

	size = SIZE_3

	var/icon_count = 12

	rarity = RARITY_RARE

	can_draw = FALSE
	can_inject = TRUE

/obj/item/container/syringe/hypospray/clicked_on_by_object(var/mob/activator,var/atom/object,location,control,params)

	if(!object.reagents)
		return ..()

	INTERACT_CHECK
	INTERACT_DELAY(5)

	if(!istype(object,/obj/item/container/simple/beaker/bottle/hypospray))
		activator.to_chat(span("warning","你不知道该怎么把[object.name]装入[src.name]……也许需要特殊容器？"))
		return TRUE

	var/obj/item/container/simple/beaker/bottle/hypospray/H = object
	if(H.spent)
		activator.to_chat(span("warning","[H.name]的气罐已经耗尽，无法注入其中的液体！"))
		return TRUE
	H.spent = TRUE

	if(H.reagents.transfer_reagents_to(src.reagents))
		activator.to_chat(span("notice","你将[H.name]装入[src.name]，释放了加压气体。"))
	else
		activator.to_chat(span("warning","你将[H.name]装入[src.name]，释放了加压气体，但药剂未能转移到[src.name]中！"))

	return TRUE

/obj/item/container/syringe/hypospray/update_icon()
	. = ..()
	//Plunger
	icon = initial(icon)
	icon_state = initial(icon_state)
	var/num_state = CEILING(clamp(reagents.volume_current/reagents.volume_max,0,1)*icon_count,1)
	icon_state = "[icon_state]_[num_state]"

/obj/item/container/syringe/hypospray/update_overlays()
	. = ..()
	if(reagents && reagents.volume_current)
		var/image/I = new/image(icon,"liquid")
		I.appearance_flags = src.appearance_flags | RESET_COLOR
		I.color = reagents.color
		add_underlay(I)

/obj/item/container/syringe/hypospray/combat
	name = "战斗高压注射器"
	desc = ";医疗主管是变形怪！！"
	desc_extended = "一款无菌且可重复使用的气压式自动注射器，可快速向患者给药。体积约为普通高压注射器的一半，效果同样强劲。每次最多瞬间注射30单位。"

	value = 1600
	icon = 'icons/obj/item/container/hypospray_combat.dmi'
	icon_state = "hypo"

	injection_sound = 'sound/effects/stimpack.ogg'

	quality_reduction_on_use = 0
	injection_time = 0
	inject_amount_max = 30
	reagents = /reagent_container/syringe/hypospray/combat // holds 30u
	adjustable = TRUE

	size = SIZE_2

	icon_count = 5

	rarity = RARITY_MYTHICAL
