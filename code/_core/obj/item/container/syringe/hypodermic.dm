/obj/item/container/syringe/hypodermic/
	name = "皮下注射器"
	value = 5
	injection_time = SECONDS_TO_DECISECONDS(2)

	inject_amount_desired = 5
	inject_amount_precision = 5

	icon = 'icons/obj/item/container/syringe.dmi'
	icon_state = "syringe"
	var/icon_count = 7

	rarity = RARITY_UNCOMMON

	injecting = null //Auto generate.



/obj/item/container/syringe/hypodermic/update_icon()
	. = ..()
	//Plunger
	icon = initial(icon)
	icon_state = initial(icon_state)
	var/num_state = CEILING(clamp(reagents.volume_current/reagents.volume_max,0,1)*icon_count,1)
	icon_state = "[icon_state]_[num_state]"

/obj/item/container/syringe/hypodermic/update_underlays()
	. = ..()
	//Liquid
	if(reagents && reagents.volume_current)
		var/image/I = new/image(icon,"liquid")
		I.appearance_flags = src.appearance_flags | RESET_COLOR
		I.color = reagents.color
		add_underlay(I)

/obj/item/container/syringe/hypodermic/update_overlays()
	. = ..()
	//Action
	if(src.loc && is_inventory(src.loc))
		var/image/I = new/image(icon,"action_[injecting]")
		I.appearance_flags = src.appearance_flags | RESET_COLOR
		add_overlay(I)
	//Needle
	var/image/I = new/image(icon,"needle[quality <= 0 ? "_broken" : ""]")
	I.appearance_flags = src.appearance_flags | RESET_COLOR
	add_overlay(I)


/obj/item/container/syringe/hypodermic/adjust_quality(var/quality_to_add=0)
	. = ..()
	if(. && finalized) update_sprite()


/obj/item/container/syringe/hypodermic/on_equip(var/atom/old_location,var/silent=FALSE) //When the item is picked up.
	. = ..()
	update_sprite()

/obj/item/container/syringe/hypodermic/drop_item(var/atom/desired_loc,var/pixel_x_offset = 0,var/pixel_y_offset = 0,var/silent=FALSE)
	. = ..()
	update_sprite()



/obj/item/container/syringe/hypodermic/epinephrine/
	name = "皮下注射器（急救肾上腺素）"

/obj/item/container/syringe/hypodermic/epinephrine/Generate()
	reagents.add_reagent(/reagent/medicine/adrenaline/epinephrine,reagents.volume_max)
	return ..()

/obj/item/container/syringe/hypodermic/opium/
	name = "皮下注射器（鸦片）"

/obj/item/container/syringe/hypodermic/opium/Generate()
	reagents.add_reagent(/reagent/medicine/painkiller/opium,reagents.volume_max)
	return ..()

/obj/item/container/syringe/hypodermic/omnizine
	name = "皮下注射器（全能灵药）"

/obj/item/container/syringe/hypodermic/omnizine/Generate()
	reagents.add_reagent(/reagent/medicine/omnizine,reagents.volume_max)
	return ..()


/obj/item/container/syringe/hypodermic/auto
	name = "自动注射器"
	desc_extended = "蝴蝶注射笔的罕见原型，使用压缩空气将化学物质快速注入血液。加压系统无法调节，因此只要条件允许，就会一次注入全部内容物。"
	icon = 'icons/obj/item/container/syringe_advanced.dmi'
	rarity = RARITY_RARE
	quality_reduction_on_use = 5
	injection_time = SECONDS_TO_DECISECONDS(1.5)
	icon_count = 11
	inject_amount_desired = INFINITY
	injection_sound = 'sound/effects/epi.ogg'
	value = 100
	reagents = /reagent_container/syringe/auto
