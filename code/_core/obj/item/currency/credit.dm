

/obj/item/currency/credits
	name = "信用点"
	desc = "看着眼熟。"
	desc_extended = "塑料微芯片中存着一段超级独特、长达1024 EB的哈希值，代表蓝空间网络中一块空间的所有权。显然，它在现实世界也有价值。"
	icon = 'icons/obj/item/credit.dmi'
	icon_state = "null"

	currency_class = "credits"

	amount_max = 5000

	value = 1

	var/static/list/credit_amounts = list(1,5,10,20,50,100,500,1000)

/obj/item/currency/credits/update_overlays()

	. = ..()

	icon = initial(icon)
	icon_state = "0"

	var/total_count = 0
	var/local_value = amount
	while(local_value > 0)
		var/chosen_value = 0
		for(var/n in credit_amounts)
			if(local_value >= n)
				chosen_value = n
		if(!chosen_value)
			break
		var/image/I = new/image(icon,"[chosen_value]")
		I.pixel_x = total_count*2*0.5
		I.pixel_y = -total_count*2*0.5
		add_overlay(I)
		total_count++
		local_value -= chosen_value
		if(total_count >= 10)
			break

	pixel_w = -total_count*0.5
	pixel_z = total_count*0.5

/obj/item/currency/credits/update_sprite()
	. = ..()
	if(amount == 1)
		name = "1信用点"
	else
		name = "[amount]信用点"
