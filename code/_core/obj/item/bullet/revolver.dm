/obj/item/bullet_cartridge/revolver_38
	name = "\improper .38左轮手枪弹"
	desc = "给你的枪来点特别的。"
	desc_extended = "供使用.38弹药的左轮手枪装填。"
	icon = 'icons/obj/item/bullet/38.dmi'


	bullet_diameter = 9
	bullet_length = 29
	bullet_color = COLOR_BULLET

	amount_max = 6
	amount_max_icon = 6

	projectile = /obj/projectile/bullet/firearm/revolver/
	damage_type_bullet = /damagetype/ranged/bullet/revolver_38

	projectile_speed = BULLET_SPEED_PISTOL_LIGHT

	size = 0.02
	value = 1 //Dummy value.

/obj/item/bullet_cartridge/revolver_38/surplus
	name = "\improper 库存旧式.38左轮手枪弹"
	damage_type_bullet = /damagetype/ranged/bullet/revolver_38/surplus
	jam_chance = 1
	rarity = RARITY_BROKEN

/obj/item/bullet_cartridge/revolver_357
	name = "\improper .357左轮手枪弹"
	desc = "拔枪！"
	desc_extended = "供使用.357弹药的左轮手枪装填。"
	icon = 'icons/obj/item/bullet/357.dmi'


	bullet_diameter = 9
	bullet_length = 33
	bullet_color = COLOR_BULLET

	amount_max = 6
	amount_max_icon = 6

	projectile = /obj/projectile/bullet/firearm/revolver/
	damage_type_bullet = /damagetype/ranged/bullet/revolver_357

	projectile_speed = BULLET_SPEED_PISTOL_HEAVY

	size = 0.03
	value = 1 //Dummy value.

/obj/item/bullet_cartridge/revolver_357/heap
	name = "\improper .357高爆穿甲左轮手枪弹"
	damage_type_bullet = /damagetype/ranged/bullet/revolver_357/heap


/obj/item/bullet_cartridge/revolver_357/surplus
	name = "\improper 库存旧式.357左轮手枪弹"
	damage_type_bullet = /damagetype/ranged/bullet/revolver_357/surplus
	jam_chance = 1
	rarity = RARITY_BROKEN

/obj/item/bullet_cartridge/revolver_44
	name = "\improper .44左轮手枪弹"
	desc = "我觉得今天运气不错。"
	desc_extended = "供使用.44弹药的左轮手枪装填。"
	icon = 'icons/obj/item/bullet/44.dmi'


	bullet_diameter = 10.9
	bullet_length = 29
	bullet_color = COLOR_BULLET

	amount_max = 6
	amount_max_icon = 6

	projectile = /obj/projectile/bullet/firearm/revolver/
	damage_type_bullet = /damagetype/ranged/bullet/revolver_44

	projectile_speed = BULLET_SPEED_PISTOL_HEAVY

	size = 0.035
	value = 1 //Dummy value.

/obj/item/bullet_cartridge/revolver_44/surplus
	name = "\improper 库存旧式.44左轮手枪弹"
	damage_type_bullet = /damagetype/ranged/bullet/revolver_44/surplus
	jam_chance = 1
	rarity = RARITY_BROKEN

/obj/item/bullet_cartridge/pistol_22
	name = "\improper .22手枪弹"
	desc = "只想给别人添点小麻烦时，就用这个。"
	desc_extended = "供使用.22弹药的手枪和左轮手枪装填。"
	icon = 'icons/obj/item/bullet/22.dmi'

	bullet_diameter = 5.6
	bullet_length = 17.7
	bullet_color = COLOR_BULLET

	amount_max = 6
	amount_max_icon = 6

	projectile = /obj/projectile/bullet/firearm/revolver/
	damage_type_bullet = /damagetype/ranged/bullet/revolver_22

	projectile_speed = BULLET_SPEED_PISTOL_LIGHT

	size = 0.01
	value = 1 //Dummy value.

/obj/item/bullet_cartridge/pistol_22/surplus
	name = "\improper 库存旧式.22手枪弹"
	damage_type_bullet = /damagetype/ranged/bullet/revolver_22/surplus
	jam_chance = 1
	rarity = RARITY_BROKEN

/obj/item/bullet_cartridge/revolver_300
	name = "\improper .300左轮手枪弹"
	desc = "口袋里的驱熊利器，不接受替代品。"
	desc_extended = "供使用.300弹药的左轮手枪装填。"
	icon = 'icons/obj/item/bullet/300.dmi'

	bullet_diameter = 7.62
	bullet_length = 67
	bullet_color = COLOR_BULLET

	amount_max = 5
	amount_max_icon = 5

	projectile = /obj/projectile/bullet/firearm/revolver/
	damage_type_bullet = /damagetype/ranged/bullet/revolver_300

	projectile_speed = BULLET_SPEED_PISTOL_HEAVY

	size = 0.06
	value = 1 //Dummy value.

/obj/item/bullet_cartridge/revolver_762
	name = "\improper 7.62x38mmR左轮手枪弹"
	desc = "这不就是截短了的步枪弹吗？"
	desc_extended = "供使用7.62x38mmR弹药的左轮手枪装填。"
	icon = 'icons/obj/item/bullet/762_revolver.dmi'

	bullet_diameter = 7.62
	bullet_length = 38
	bullet_color = COLOR_BULLET

	amount_max = 7
	amount_max_icon = 7

	projectile = /obj/projectile/bullet/firearm/revolver/
	damage_type_bullet = /damagetype/ranged/bullet/revolver_762

	projectile_speed = BULLET_SPEED_PISTOL_LIGHT

	size = 0.06
	value = 1 //Dummy value.

/obj/item/bullet_cartridge/revolver_762/surplus
	name = "\improper 库存旧式7.62x38mmR左轮手枪弹"
	damage_type_bullet = /damagetype/ranged/bullet/revolver_762/surplus
	jam_chance = 1
	rarity = RARITY_BROKEN
