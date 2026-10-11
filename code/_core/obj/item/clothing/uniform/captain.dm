/obj/item/clothing/uniform/captain
	name = "\improper 站长制服"
	desc = "我的脚趾撞到了，快叫穿梭机！"
	desc_extended = "纳米传讯空间站站长穿着的制服。看起来并不像巨型避孕套。"
	icon = 'icons/obj/item/clothing/uniforms/captain.dmi'


	item_slot = SLOT_TORSO | SLOT_GROIN

	flags_clothing = FLAG_CLOTHING_NOBEAST_FEET

	defense_rating = list(
		BLADE = 40,
		BLUNT = 20,
		PIERCE = 20,
		LASER = 20,
		ARCANE = -40,
		COLD = 10
	)

	value = 600

/obj/item/clothing/uniform/captain/formal
	name = "站长礼服"
	icon = 'icons/obj/item/clothing/uniforms/captain_formal.dmi'
