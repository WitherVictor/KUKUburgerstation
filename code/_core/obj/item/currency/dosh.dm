/obj/item/currency/dosh
	name = "太阳系纸钞"
	desc = "纸钞可以用来换取商品和服务。"
	desc_extended = "太阳系政府公民使用的纸币，代表着供需关系、经济市场的稳定以及——好吧，就是钱。"
	icon = 'icons/obj/item/currency/dosh.dmi'
	icon_state = "null"

	currency_class = "dosh"

	amount_max = 200

	value = 50

/obj/item/currency/dosh/update_icon()

	. = ..()

	icon_state = "null" //Fallback

	switch(amount)
		if(1 to 5)
			icon_state = "[amount]"
		if(5 to 25)
			icon_state = "[FLOOR(amount,5)]"
		if(25 to 100)
			icon_state = "[FLOOR(amount,25)]"
		if(100 to 200)
			icon_state = "[FLOOR(amount,50)]"
		if(200 to INFINITY)
			icon_state = "200"

/obj/item/currency/dosh/update_sprite()
	. = ..()
	name = "太阳系纸钞（$[amount*5]）"
