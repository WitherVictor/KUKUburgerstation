/obj/item/clothing/uniform/security
	name = "旧式安保制服"
	desc = "我发誓，发现他的时候，他的脑袋就已经被打扁了！"
	desc_extended = "烂安保以前穿的制服。"
	flags_clothing = FLAG_CLOTHING_NOBEAST_FEET
	icon = 'icons/obj/item/clothing/uniforms/security.dmi'

	item_slot = SLOT_TORSO | SLOT_GROIN

	flags_clothing = FLAG_CLOTHING_NOBEAST_FEET

	defense_rating = list(
		BLADE = 20,
		BLUNT = 20,
		PIERCE = 20,
		ARCANE = -20,
		HEAT = 10
	)

	value = 40


/obj/item/clothing/uniform/ABOMB
	name = "\improper A.B.O.M.B.制服"
	desc = "JC，小心！"
	desc_extended = "据说，一组科学家差点解开这个缩写的含义，却因为楼里发现了一枚炸弹（A BOMB）而中断了研究。"
	flags_clothing = FLAG_CLOTHING_NOBEAST_FEET
	icon = 'icons/obj/item/clothing/uniforms/abomb_suit.dmi'


	item_slot = SLOT_TORSO | SLOT_GROIN

	flags_clothing = FLAG_CLOTHING_NOBEAST_FEET

	defense_rating = list(
		BLADE = 20,
		BLUNT = 20,
		PIERCE = 20,
		LASER = 20,
		ARCANE = -20,
		COLD = 20,
		BOMB = -20
	)

	value = 400

/*
/obj/item/clothing/uniform/tacticool
	name = "tacticool uniform"
	desc = "Look mom! I'm a real soldier!"
	desc_extended = "A tacticool shirt for less than cool people."
	flags_clothing = FLAG_CLOTHING_NOBEAST_FEET
	icon = 'icons/obj/item/clothing/uniforms/tacticool.dmi'

	item_slot = SLOT_TORSO | SLOT_GROIN

	flags_clothing = FLAG_CLOTHING_NOBEAST_FEET

	defense_rating = list(
		BLADE = 15,
		BLUNT = 10,
		PIERCE = 15,
		LASER = -15,
		ARCANE = -15,
		COLD = 15
	)

	value = 30
*/
