/obj/item/matter_cartridge
	name = "物质补充匣"
	icon = 'icons/obj/item/matter_cartridge.dmi'
	icon_state = "rcd"
	desc = "里面有很多原子！"
	desc_extended = "快速建造装置的“弹药”。装置材料耗尽时，将它装入即可补充物质。"
	value = 50

	weight = 5


/obj/item/matter_cartridge/click_on_object(var/mob/activator as mob,var/atom/object,location,control,params)



	if(istype(object,/obj/item/rcd/))
		INTERACT_CHECK
		INTERACT_CHECK_OBJECT
		INTERACT_DELAY(10)
		var/obj/item/rcd/R = object
		R.add_matter(R.matter_max)
		activator.to_chat(span("notice","你为[R.name]补充了物质。"))
		qdel(src)
		return TRUE

	return ..()
