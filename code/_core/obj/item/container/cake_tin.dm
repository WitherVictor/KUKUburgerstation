/obj/item/container/beaker/cake_tin
	name = "蛋糕烤模"
	desc = "用来做蛋糕。"
	desc_extended = "用于烘焙蛋糕的不锈钢烤模。装入糕点面糊，然后放进烤箱。"

	icon = 'icons/obj/items/container/cake_tins.dmi'
	icon_state = "cake_tin"

	icon_count = 7

/obj/item/container/beaker/cake_tin/update_underlays()
	. = ..()
	var/image/I = new/image(initial(icon),"[initial(icon_state)]_underlay")
	underlays += I

