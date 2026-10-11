/obj/structure/interactive/vending/prize
	name = "兑奖售货机"
	icon_state = "prize"
	desc = "我发誓，这些真有用。"
	desc_extended = "一台可用街机兑奖券兑换物品的特殊兑奖售货机。"

	accepts_item = /obj/item/currency/prize_ticket

	stored_types = list(
		/obj/item/bikehorn,
		/obj/item/ball/soccer,
		/obj/item/dice/d6,
		/obj/item/dice/d20,
		/obj/item/clothing/mask/mime,
		/obj/item/broom/magic,
		/obj/item/grenade/device/large/timed/lube_smoke,
		/obj/item/clothing/overwear/armor/burger_coat,
		/obj/item/clothing/overwear/armor/burger_coat/courier,
		/obj/item/clothing/overwear/armor/burger_coat/courier/ncr,
		/obj/item/clothing/overwear/armor/burger_coat/courier/legion,
		/obj/item/clothing/overwear/armor/burger_coat/courier/ulysses,
		/obj/item/weapon/melee/flagpole
	)

	ignore_economy = TRUE
