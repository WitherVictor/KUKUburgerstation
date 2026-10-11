/obj/item/bullet_cartridge/rifle_308
	name = "\improper .308步枪弹"
	desc = "可靠的老伙计。"
	desc_extended = "供使用.308弹药的步枪装填。"
	icon = 'icons/obj/item/bullet/762.dmi'


	bullet_diameter = 7.62
	bullet_length = 51
	bullet_color = COLOR_BULLET

	amount_max = 5
	amount_max_icon = 5
	bullet_color = COLOR_BULLET

	projectile = /obj/projectile/bullet/firearm/rifle
	damage_type_bullet = /damagetype/ranged/bullet/rifle_308

	projectile_speed = BULLET_SPEED_RIFLE_HEAVY

	size = 0.04

	inaccuracy_modifier = 0.75

	value = 1 //Dummy value.

/obj/item/bullet_cartridge/rifle_308/surplus
	name = "\improper 库存旧式.308步枪弹"
	damage_type_bullet = /damagetype/ranged/bullet/rifle_308/surplus
	jam_chance = 1
	rarity = RARITY_BROKEN

/obj/item/bullet_cartridge/rifle_308/ap
	name = "\improper .308穿甲步枪弹"
	desc_extended = "供使用.308弹药的步枪装填。这款采用钢制弹头。"
	rarity = RARITY_UNCOMMON
	icon = 'icons/obj/item/bullet/762_ap.dmi'

	damage_type_bullet = /damagetype/ranged/bullet/rifle_308/ap

	projectile_speed = BULLET_SPEED_RIFLE_HEAVY

	size = 0.04

	penetrations = 1

/obj/item/bullet_cartridge/rifle_308/du
	name = "\improper .308贫铀步枪弹"
	desc_extended = "供使用.308弹药的步枪装填。这款采用贫铀弹头。"
	rarity = RARITY_RARE
	value_burgerbux = 1
	damage_type_bullet = /damagetype/ranged/bullet/rifle_308/du
	penetrations = 2

/obj/item/bullet_cartridge/rifle_308/nato/du
	name = "\improper 7.62mm贫铀步枪弹"
	desc = "射手和机枪手的选择。这款采用贫铀弹头。"
	desc_extended = "供使用7.62mm弹药的步枪装填。"
	rarity = RARITY_RARE
	value_burgerbux = 1
	damage_type_bullet = /damagetype/ranged/bullet/rifle_762mm/du
	penetrations = 2

/obj/item/bullet_cartridge/rifle_308/nato
	name = "\improper 7.62mm步枪弹"
	desc = "射手和机枪手的选择。"
	desc_extended = "供使用7.62mm弹药的步枪装填。"
	icon = 'icons/obj/item/bullet/762.dmi'
	damage_type_bullet = /damagetype/ranged/bullet/rifle_762mm

/obj/item/bullet_cartridge/rifle_308/nato/surplus
	name = "\improper 库存旧式7.62mm步枪弹"
	damage_type_bullet = /damagetype/ranged/bullet/rifle_762mm/surplus
	jam_chance = 1
	rarity = RARITY_BROKEN

/obj/item/bullet_cartridge/rifle_308/nato/premium
	name = "\improper 优质7.62mm步枪弹"
	rarity = RARITY_RARE
	damage_type_bullet = /damagetype/ranged/bullet/rifle_762mm/premium

/obj/item/bullet_cartridge/rifle_308/nato/ap
	name = "\improper 7.62mm穿甲步枪弹"
	rarity = RARITY_UNCOMMON
	desc_extended = "供使用7.62mm弹药的步枪装填。这款采用钢制弹头。"
	icon = 'icons/obj/item/bullet/762_ap.dmi'
	damage_type_bullet = /damagetype/ranged/bullet/rifle_762mm/ap

/obj/item/bullet_cartridge/rifle_308/short
	name = "\improper 7.62x39mmR苏式步枪弹"
	desc = "卡拉什尼科夫的杰作。"
	desc_extended = "供使用7.62x39mm弹药的苏式步枪装填。"
	icon = 'icons/obj/item/bullet/762_short.dmi'
	damage_type_bullet = /damagetype/ranged/bullet/rifle_762mm/short

	bullet_diameter = 7.62
	bullet_length = 39

	projectile_speed = BULLET_SPEED_RIFLE_HEAVY*0.9

	rarity = RARITY_COMMON

/obj/item/bullet_cartridge/rifle_308/short/surplus
	name = "\improper 库存旧式7.62x39mmR苏式步枪弹"
	damage_type_bullet = /damagetype/ranged/bullet/rifle_762mm/short/surplus
	jam_chance = 1
	rarity = RARITY_BROKEN

/obj/item/bullet_cartridge/rifle_308/long
	name = "\improper 7.62x54mmR苏式步枪弹"
	desc = "击毙的法西斯比任何同类弹药都多！"
	desc_extended = "供使用7.62x54mmR弹药的步枪装填。"
	icon = 'icons/obj/item/bullet/762.dmi'
	damage_type_bullet = /damagetype/ranged/bullet/rifle_762mm/long

	bullet_length = 54
	rarity = RARITY_COMMON


/obj/item/bullet_cartridge/rifle_308/long/surplus
	name = "\improper 库存旧式7.62x54mmR苏式步枪弹"
	damage_type_bullet = /damagetype/ranged/bullet/rifle_762mm/long/surplus
	jam_chance = 1
	rarity = RARITY_BROKEN

/obj/item/bullet_cartridge/rifle_545mm
	name = "\improper 5.45mm步枪弹"
	desc = "比7.62x39小，却能留下吓人的伤口！"
	desc_extended = "供使用5.45mm弹药的步枪和机枪装填。"
	icon = 'icons/obj/item/bullet/223.dmi'

	bullet_diameter = 5.45
	bullet_length = 39
	bullet_color = COLOR_BULLET

	amount_max = 5
	amount_max_icon = 5

	projectile = /obj/projectile/bullet/firearm/rifle
	damage_type_bullet = /damagetype/ranged/bullet/rifle_545mm

	projectile_speed = BULLET_SPEED_RIFLE_LIGHT

	value = 1 //Dummy value.

	rarity = RARITY_COMMON

/obj/item/bullet_cartridge/rifle_545mm/surplus
	name = "\improper 库存旧式5.45mm步枪弹"
	damage_type_bullet = /damagetype/ranged/bullet/rifle_545mm/surplus
	jam_chance = 1
	rarity = RARITY_BROKEN

/obj/item/bullet_cartridge/rifle_545mm/ap
	name = "\improper 5.45mm穿甲步枪弹"
	desc = "比7.62x39小，却能留下吓人的伤口！现在还带闪亮的高铜黄铜镀层被甲！"
	desc_extended = "供使用5.45mm弹药的步枪和机枪装填。这款采用穿甲弹头。"
	rarity = RARITY_UNCOMMON
	icon = 'icons/obj/item/bullet/223_ap.dmi'

	bullet_diameter = 5.45
	bullet_length = 39
	bullet_color = COLOR_BULLET

	amount_max = 5
	amount_max_icon = 5

	projectile = /obj/projectile/bullet/firearm/rifle
	damage_type_bullet = /damagetype/ranged/bullet/rifle_545mm/ap

	projectile_speed = BULLET_SPEED_RIFLE_LIGHT

	penetrations = 1

/obj/item/bullet_cartridge/rifle_939mm
	name = "\improper 9x39mm亚音速步枪弹"
	desc = "安静，千、千万要安静。"
	desc_extended = "供使用9x39mm弹药的步枪装填。"
	icon = 'icons/obj/item/bullet/223.dmi'

	bullet_diameter = 9
	bullet_length = 39
	bullet_color = COLOR_BULLET

	amount_max = 5
	amount_max_icon = 5
	bullet_color = COLOR_BULLET

	projectile = /obj/projectile/bullet/firearm/pistol/stealth
	damage_type_bullet = /damagetype/ranged/bullet/rifle_939mm

	projectile_speed = BULLET_SPEED_RIFLE_HEAVY

	size = 0.04

	value = 1 //Dummy value.

	inaccuracy_modifier = 0.75

	rarity = RARITY_COMMON

/obj/item/bullet_cartridge/rifle_939mm/surplus
	name = "\improper 库存旧式9x39mm亚音速步枪弹"
	damage_type_bullet = /damagetype/ranged/bullet/rifle_939mm/surplus
	jam_chance = 1
	rarity = RARITY_BROKEN
