/obj/item/bullet_cartridge/sniper_127
	name = "\improper 12.7x90mm狙击弹"
	desc = "一枪狠到连对方的家人都能感受到。"
	desc_extended = "供使用12.7x90mm弹药的狙击步枪装填。"
	icon = 'icons/obj/item/bullet/127_mm.dmi'


	bullet_diameter = 12.7
	bullet_length = 90
	bullet_color = COLOR_BULLET

	amount_max = 4
	amount_max_icon = 4

	projectile = /obj/projectile/bullet/firearm/sniper
	damage_type_bullet = /damagetype/ranged/bullet/sniper_127

	projectile_speed = BULLET_SPEED_SNIPER

	size = 0.09

	penetrations = 2

	value = 1 //Dummy value.

/obj/item/bullet_cartridge/sniper_127/surplus
	name = "\improper 库存旧式12.7x90mm狙击弹"
	damage_type_bullet = /damagetype/ranged/bullet/sniper_127/surplus
	jam_chance = 1
	rarity = RARITY_BROKEN

/obj/item/bullet_cartridge/sniper_127/ap
	name = "\improper 12.7x90mm穿甲狙击弹"
	desc = "一枪穿甲，狠到连对方的家人都能感受到。"
	damage_type_bullet = /damagetype/ranged/bullet/sniper_127/ap
	rarity = RARITY_UNCOMMON

/obj/item/bullet_cartridge/sniper_127/premium //incase you want someone extremely dead.
	name = "\improper 优质12.7x90mm狙击弹"
	desc = "一枪狠到所有人都能感受到。"
	damage_type_bullet = /damagetype/ranged/bullet/sniper_127/premium
	rarity = RARITY_RARE

/obj/item/bullet_cartridge/sniper_127/du //incase you want someone EXTREMELY dead.
	name = "\improper 12.7x90mm贫铀狙击弹"
	desc = "一枪狠到所有人都痛得直不起腰。"
	rarity = RARITY_RARE
	damage_type_bullet = /damagetype/ranged/bullet/sniper_127/du
	penetrations = 3
