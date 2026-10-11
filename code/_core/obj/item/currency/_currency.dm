/obj/item/currency/
	name = "货币"
	desc = "趁热赶紧拿！"
	desc_extended = "可用于售货机及其他需要货币的地方。据说是万恶之源。"

	amount_max = 10000

	size = 0.002
	weight = 0.002

	var/currency_class = "none"

	value_burgerbux = 1 //Prevents being sold in vendors.

	glide_size = 1

	rarity = RARITY_UNCOMMON

/obj/item/currency/can_transfer_stacks_to(var/obj/item/target)

	if(target == src) //Self-stacking.
		return FALSE

	if(target.amount_max <= 1 || src.amount_max <= 1) //Non-stackable.
		return FALSE

	if(target.amount >= target.amount_max) //Full.
		return FALSE

	if(!istype(target,/obj/item/currency/)) //Not a currency.
		return FALSE

	var/obj/item/currency/C = target
	if(C.currency_class != src.currency_class) //Not the same currency.
		return FALSE

	return TRUE


/obj/item/currency/Finalize()
	. = ..()
	update_sprite()

/obj/item/currency/telecrystals
	name = "传送晶体"
	desc = "这些晶体相当可疑。"
	desc_extended = "主要由辛迪加行动人员使用的货币。"
	icon = 'icons/obj/item/currency/telecrystals.dmi'
	icon_state = "1"
	value = 100

	amount_max = 5000

	currency_class = "telecrystal"

	rarity = RARITY_RARE

/obj/item/currency/telecrystals/update_icon()
	switch(amount)
		if(1 to 10)
			icon_state = "[amount]"
		if(10 to 100)
			icon_state = "[FLOOR(amount/10, 1)*10]"
		if(100 to 1000)
			icon_state = "[FLOOR(amount/100, 1)*100]"
		if(1000 to 5000)
			icon_state = "[FLOOR(amount/1000, 1)*1000]"
	return ..()

/obj/item/currency/prize_ticket
	name = "兑奖券"
	desc = "什么，又一种没用的货币？汉堡币还不够吗？？？"
	desc_extended = "可在奖品售货机兑换奖品的票券。完成街机小游戏即可获得。"
	icon = 'icons/obj/item/currency/ticket.dmi'
	icon_state = "1"
	value = 0.25

	amount_max = 10000

	currency_class = "prize ticket"

/obj/item/currency/prize_ticket/update_icon()
	switch(amount)
		if(1)
			icon_state = "1"
		if(2 to 10)
			icon_state = "2"
		if(11 to 50)
			icon_state = "3"
		if(51 to INFINITY)
			icon_state = "4"
	return ..()


/obj/item/currency/magic_token
	name = "魔法碎片代币"
	desc = "美味得像魔法一样！"
	desc_extended = "与巫师联邦交易时常用的特殊魔法碎片代币，可用于购买稀有魔法物品。"
	icon = 'icons/obj/item/currency/magic_token.dmi'
	icon_state = "1"
	value = 1000

	amount_max = 8

	currency_class = "magic shard"

	rarity = RARITY_RARE

/obj/item/currency/magic_token/update_icon()
	icon_state = "[amount]"
	return ..()
