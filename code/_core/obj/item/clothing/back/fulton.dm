var/global/list/obj/item/clothing/back/fulton/fulton_devices = list()

/obj/item/clothing/back/fulton
	name = "个人富尔顿回收装置"
	desc = "懒得护送高价值目标时，就用这个。"
	icon = 'icons/obj/item/clothing/back/fulton.dmi'
	desc_extended = "仅限一次性使用。在手中使用可开关回收功能。类人生物可以穿戴它来快速撤离。室内无法使用；只有德尔塔穿梭机离开作战区域时才会回收目标。"
	size = SIZE_3
	weight = WEIGHT_4
	value = 400
	var/enabled = FALSE

/obj/item/clothing/back/fulton/Initialize()
	fulton_devices += src
	return ..()

/obj/item/clothing/back/fulton/Destroy()
	enabled = FALSE
	fulton_devices -= src
	return ..()

/obj/item/clothing/back/fulton/click_self(var/mob/caller)
	enabled = !enabled
	caller.to_chat("你[enabled ? "启用" : "停用"]了[src]。")
	return TRUE

/obj/item/clothing/back/fulton/proc/try_extract(var/turf/desired_turf)

	if(!enabled)
		return FALSE

	if(!is_inventory(loc))
		return FALSE

	var/obj/hud/inventory/I = loc

	if(!(src in I.worn_objects))
		return FALSE

	if(!I.loc || !is_organ(I.loc))
		return FALSE

	var/mob/living/advanced/A = I.loc.loc

	if(!is_advanced(A))
		return FALSE

	A.force_move(desired_turf)
	qdel(src)

	return TRUE
