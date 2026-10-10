/obj/item/consumable/soulgem
	name = "蓝空间宝石"
	desc = "容纳低等生物的灵魂。别和蓝空间水晶搞混了。"
	desc_extended = "用于物品附魔，或为法杖补充魔力。"
	icon = 'icons/obj/items/soulgem.dmi'
	icon_state = "common"

	var/total_charge = 0
	//TODO: Make these enchant things.

/obj/item/consumable/soulgem/on_spawn()
	total_charge = 1000

/obj/item/consumable/soulgem/get_examine_text(var/mob/caller)
	return ..() + span("notice","当前共有[total_charge]点能量。")

/obj/item/consumable/soulgem/update_icon()
	if(total_charge)
		icon_state = "[initial(icon_state)]_1"
	else
		icon_state = initial(icon_state)
	..()

/obj/item/consumable/soulgem/click_on_object(var/mob/caller as mob,var/atom/object,location,control,params)

	object = object.defer_click_on_object()

	if(is_staff(object))
		var/obj/item/weapon/ranged/magic/staff/S = object
		if(total_charge)
			caller.to_chat(span("notice","你用[src]为[S]补充了魔力。"))
			S.total_charge += total_charge
			total_charge = 0
		else
			caller.to_chat(span("notice","[src]已经没有能量了！"))
		update_icon()

		return TRUE

	return ..()
