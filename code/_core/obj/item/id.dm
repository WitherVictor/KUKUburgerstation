/obj/item/id
	name = "身份识别卡"
	desc = "请出示证件。"
	desc_extended = "塑料身份识别卡，用于取得各种机器的使用权限，也可出示以证明身份。"
	icon = 'icons/obj/item/id_card.dmi'
	icon_state = "colonist"
	value = 10

	var/display_name

/obj/item/id/colonist/Generate()
	var/mob/living/advanced/A
	if(is_inventory(src.loc))
		var/obj/hud/inventory/I = src.loc
		if(is_advanced(I.owner))
			A = I.owner
	if(A && length(A.real_name))
		display_name = A.real_name
	else
		if(prob(50))
			display_name = "[pick(SStext.first_names_male)] [pick(SStext.last_names)]"
		else
			display_name = "[pick(SStext.first_names_female)] [pick(SStext.last_names)]"
	. = ..()
	update_sprite()


/obj/item/id/colonist/update_sprite()
	. = ..()
	name = "[initial(name)] ([display_name])"
