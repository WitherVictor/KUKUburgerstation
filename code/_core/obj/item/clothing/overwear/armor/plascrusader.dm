/obj/item/clothing/overwear/armor/plascrusader
	name = "金甲十字军护甲"
	desc = "金子，金子，金子！"
	desc_extended = "一件金属打造的沉重金色胸甲，看起来帅极了。"
	icon = 'icons/obj/item/clothing/suit/plascrusader.dmi'
	worn_layer = LAYER_MOB_CLOTHING_HARDSUIT
	rarity = RARITY_UNCOMMON

	protected_limbs = list(BODY_TORSO,BODY_GROIN)

	defense_rating = list(
		BLADE = AP_CLUB,
		BLUNT = AP_AXE,
		PIERCE = AP_AXE,
		LASER = AP_AXE,
		HEAT = -AP_AXE,
		ARCANE = -AP_CLUB,
		PAIN = AP_CLUB
	)

	size = SIZE_6

	value = 150

