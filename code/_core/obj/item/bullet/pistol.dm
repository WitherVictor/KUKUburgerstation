/obj/item/bullet_cartridge/pistol_10mm/
	name = "\improper 10x32mm手枪弹"
	desc = "至少比9mm大了1mm。"
	desc_extended = "供使用10mm自动手枪弹的手枪、左轮手枪和冲锋枪装填。"
	icon = 'icons/obj/item/bullet/10mm.dmi'

	amount_max = 6
	amount_max_icon = 6

	bullet_diameter = 10.17
	bullet_length = 32
	bullet_color = COLOR_BULLET

	projectile = /obj/projectile/bullet/firearm/pistol
	damage_type_bullet = /damagetype/ranged/bullet/pistol_10mm

	projectile_speed = BULLET_SPEED_PISTOL_HEAVY

	size = 0.02

	value = 1 //Dummy value.

/obj/item/bullet_cartridge/pistol_10mm/surplus
	name = "\improper 库存旧式10mm手枪弹"
	damage_type_bullet = /damagetype/ranged/bullet/pistol_10mm/surplus
	jam_chance = 1
	value = 0
	rarity = RARITY_BROKEN


/obj/item/bullet_cartridge/pistol_10mm/ap
	name = "\improper 10mm穿甲手枪弹"
	desc_extended = "供使用10mm自动手枪弹的手枪、左轮手枪和冲锋枪装填。这款采用穿甲弹头。"
	rarity = RARITY_UNCOMMON
	icon = 'icons/obj/item/bullet/10mm_ap.dmi'

	damage_type_bullet = /damagetype/ranged/bullet/pistol_10mm/ap

	size = 0.02

	penetrations = 1

/obj/item/bullet_cartridge/pistol_50
	name = "\improper .50手枪弹"
	desc = "酷孩子都用这个。"
	desc_extended = "供使用.50弹药的手枪装填。"
	icon = 'icons/obj/item/bullet/50ae.dmi'

	amount_max = 5
	amount_max_icon = 5

	bullet_diameter = 12.7
	bullet_length = 33
	bullet_color = COLOR_BULLET


	projectile = /obj/projectile/bullet/firearm/revolver/
	damage_type_bullet = /damagetype/ranged/bullet/pistol_50

	projectile_speed = BULLET_SPEED_PISTOL_HEAVY

	size = 0.025

	value = 1 //Dummy value.

/obj/item/bullet_cartridge/pistol_50/surplus
	name = "\improper 库存旧式.50手枪弹"
	damage_type_bullet = /damagetype/ranged/bullet/pistol_50/surplus
	jam_chance = 1
	rarity = RARITY_BROKEN


/obj/item/bullet_cartridge/pistol_50/ap
	name = "\improper .50穿甲手枪弹"
	desc_extended = "供使用.50弹药的手枪装填。这款采用穿甲弹头。"
	rarity = RARITY_UNCOMMON
	icon = 'icons/obj/item/bullet/50ae_ap.dmi'

	damage_type_bullet = /damagetype/ranged/bullet/pistol_50/ap

	penetrations = 1

/obj/item/bullet_cartridge/pistol_50/heartbreaker
	name = "\improper .50碎心手枪弹"
	desc_extended = "供使用.50弹药的手枪装填。这款采用穿甲弹头，并带有爆炸破片弹芯。"
	rarity = RARITY_RARE
	icon = 'icons/obj/item/bullet/50ae_ap.dmi'

	damage_type_bullet = /damagetype/ranged/bullet/pistol_50/heartbreaker

/obj/item/bullet_cartridge/pistol_12mm/
	name = "\improper 12.7mm手枪弹"
	desc = "未来的手枪弹，今天就能用！"
	desc_extended = "供使用12.7mm弹药的手枪、左轮手枪和冲锋枪装填。"
	icon = 'icons/obj/item/bullet/12mm.dmi'

	amount_max = 5
	amount_max_icon = 5

	bullet_diameter = 12.7
	bullet_length = 33
	bullet_color = COLOR_BULLET

	projectile = /obj/projectile/bullet/firearm/revolver
	damage_type_bullet = /damagetype/ranged/bullet/pistol_12mm

	projectile_speed = BULLET_SPEED_PISTOL_HEAVY

	size = 0.025

	value = 1 //Dummy value.

/obj/item/bullet_cartridge/pistol_12mm/surplus
	name = "\improper 库存旧式12.7mm手枪弹"
	damage_type_bullet = /damagetype/ranged/bullet/pistol_12mm/surplus
	jam_chance = 1
	rarity = RARITY_BROKEN


/obj/item/bullet_cartridge/pistol_12mm/ap
	name = "\improper 12.7mm穿甲手枪弹"
	desc_extended = "供使用12.7mm弹药的手枪、左轮手枪和冲锋枪装填。这款采用穿甲弹头。"
	rarity = RARITY_UNCOMMON
	icon = 'icons/obj/item/bullet/12mm_ap.dmi'

	damage_type_bullet = /damagetype/ranged/bullet/pistol_12mm/ap

	penetrations = 1

/obj/item/bullet_cartridge/pistol_9mm/
	name = "\improper 9mm手枪弹"
	desc = "普通射手的普通子弹。"
	desc_extended = "供使用9mm弹药的手枪、左轮手枪和冲锋枪装填。"
	icon = 'icons/obj/item/bullet/9mm.dmi'

	amount_max = 5
	amount_max_icon = 5

	bullet_diameter = 9
	bullet_length = 19
	bullet_color = COLOR_BULLET

	projectile = /obj/projectile/bullet/firearm/pistol
	damage_type_bullet = /damagetype/ranged/bullet/pistol_9mm

	projectile_speed = BULLET_SPEED_PISTOL_LIGHT

	size = 0.01

	value = 1 //Dummy value.

/obj/item/bullet_cartridge/pistol_9mm/surplus
	name = "\improper 库存旧式9mm手枪弹"
	damage_type_bullet = /damagetype/ranged/bullet/pistol_9mm/surplus
	jam_chance = 1
	rarity = RARITY_BROKEN


/obj/item/bullet_cartridge/pistol_9mm/ap
	name = "\improper 9mm穿甲手枪弹"
	desc_extended = "供使用9mm弹药的手枪、左轮手枪和冲锋枪装填。这款采用穿甲弹头。"
	rarity = RARITY_UNCOMMON
	icon = 'icons/obj/item/bullet/9mm_ap.dmi'

	damage_type_bullet = /damagetype/ranged/bullet/pistol_9mm/ap

	penetrations = 1

/obj/item/bullet_cartridge/pistol_9mm/hp
	name = "\improper 9mm空尖手枪弹"
	desc_extended = "供使用9mm弹药的手枪、左轮手枪和冲锋枪装填。这款采用空尖弹头。"
	rarity = RARITY_UNCOMMON
	icon = 'icons/obj/item/bullet/9mm_hp.dmi'

	damage_type_bullet = /damagetype/ranged/bullet/pistol_9mm/hp


/obj/item/bullet_cartridge/pistol_4mm/
	name = "\improper 4.6x30mm冲锋枪弹"
	desc = "穿甲如切黄油。"
	desc_extended = "供使用4.6x30mm弹药的冲锋枪装填。"
	icon = 'icons/obj/item/bullet/46mm.dmi'

	amount_max = 5
	amount_max_icon = 5


	bullet_diameter = 4.6
	bullet_length = 30
	bullet_color = COLOR_BULLET

	projectile = /obj/projectile/bullet/firearm/pistol
	damage_type_bullet = /damagetype/ranged/bullet/smg_4mm

	projectile_speed = TILE_SIZE - 1 //fast as fuck booooooooooi

	size = 0.01
	value = 1 //Dummy value.

/obj/item/bullet_cartridge/pistol_4mm/smart
	name = "\improper 4.6x30mm智能弹"
	desc = "比一般佣兵还聪明。"
	desc_extended = "供使用4.6x30mm弹药的冲锋枪装填。这款弹药侧面装有尾翼，内部装有GPS，可自动追踪目标。"
	icon = 'icons/obj/item/bullet/4mm_smart.dmi'

	amount_max = 5
	amount_max_icon = 5


	bullet_diameter = 4.6
	bullet_length = 30
	bullet_color = COLOR_BULLET

	projectile = /obj/projectile/bullet/firearm/pistol/smart
	damage_type_bullet = /damagetype/ranged/bullet/smg_4mm

	projectile_speed = TILE_SIZE*0.5 - 1

	size = 0.01

	rarity = RARITY_UNCOMMON

/obj/item/bullet_cartridge/pistol_4mm/toxin
	name = "\improper 4.6x30mm毒素冲锋枪弹"
	rarity = RARITY_UNCOMMON
	caseless = TRUE

	damage_type_bullet = /damagetype/ranged/bullet/smg_4mm/toxin

/obj/item/bullet_cartridge/pistol_4mm/ion
	name = "\improper 4.6x30mm离子冲锋枪弹"
	rarity = RARITY_UNCOMMON
	caseless = TRUE

	damage_type_bullet = /damagetype/ranged/bullet/smg_4mm/ion

/obj/item/bullet_cartridge/pistol_4mm/ap
	name = "\improper 4.6x30mm穿甲冲锋枪弹"
	rarity = RARITY_UNCOMMON
	caseless = TRUE

	damage_type_bullet = /damagetype/ranged/bullet/smg_4mm/ap

	penetrations = 1

/obj/item/bullet_cartridge/pistol_4mm/incendiary
	name = "\improper 4.6x30mm燃烧冲锋枪弹"
	rarity = RARITY_UNCOMMON
	caseless = TRUE

	damage_type_bullet = /damagetype/ranged/bullet/smg_4mm/incendiary

/obj/item/bullet_cartridge/pistol_4mm/surplus
	name = "\improper 库存旧式4.6x30mm手枪弹"
	damage_type_bullet = /damagetype/ranged/bullet/smg_4mm/surplus
	jam_chance = 1
	rarity = RARITY_BROKEN

/obj/item/bullet_cartridge/pistol_4mm/caseless
	name = "\improper 4.6x30mm无壳冲锋枪弹"
	rarity = RARITY_UNCOMMON
	caseless = TRUE

/obj/item/bullet_cartridge/pistol_4mm/caseless/du
	name = "\improper 4.6x30mm无壳贫铀冲锋枪弹"
	rarity = RARITY_RARE
	value_burgerbux = 1
	damage_type_bullet = /damagetype/ranged/bullet/smg_4mm/du
	caseless = TRUE
	penetrations = 2

/obj/item/bullet_cartridge/pistol_4mm/caseless/surplus
	name = "\improper 库存旧式4.6x30mm无壳手枪弹"
	damage_type_bullet = /damagetype/ranged/bullet/smg_4mm/surplus
	jam_chance = 1
	rarity = RARITY_BROKEN

/obj/item/bullet_cartridge/pistol_40/
	name = "\improper .40手枪弹"
	desc = "跟9mm可不一样！"
	desc_extended = "供使用.40弹药的手枪、左轮手枪和冲锋枪装填。"
	icon = 'icons/obj/item/bullet/40.dmi'

	amount_max = 5
	amount_max_icon = 5

	bullet_diameter = 10
	bullet_length = 22
	bullet_color = COLOR_BULLET


	projectile = /obj/projectile/bullet/firearm/pistol
	damage_type_bullet = /damagetype/ranged/bullet/pistol_40

	projectile_speed = BULLET_SPEED_PISTOL_LIGHT

	size = 0.01
	value = 1 //Dummy value.

/obj/item/bullet_cartridge/pistol_40/surplus
	name = "\improper 库存旧式.40手枪弹"
	damage_type_bullet = /damagetype/ranged/bullet/pistol_40/surplus
	jam_chance = 1
	rarity = RARITY_BROKEN

/obj/item/bullet_cartridge/pistol_40/ap
	name = "\improper .40穿甲手枪弹"
	desc = "跟9mm可不一样！"
	desc_extended = "供使用.40弹药的手枪、左轮手枪和冲锋枪装填。这款采用钢制弹头。"
	rarity = RARITY_UNCOMMON
	icon = 'icons/obj/item/bullet/40_ap.dmi'

	damage_type_bullet = /damagetype/ranged/bullet/pistol_40/ap

	penetrations = 1

/obj/item/bullet_cartridge/pistol_40/tranq
	name = "\improper .40麻醉手枪弹"
	desc = "跟9mm可不一样！"
	desc_extended = "供使用.40弹药的手枪、左轮手枪和冲锋枪装填。这款采用装有镇静剂的化学弹壳。"
	rarity = RARITY_RARE
	icon = 'icons/obj/item/bullet/40_tranq.dmi'

	damage_type_bullet = /damagetype/ranged/bullet/pistol_40/tranq

	jam_chance = 100 //Required.

/obj/item/bullet_cartridge/pistol_40/tranq/surplus
	name = "\improper 库存旧式.40麻醉手枪弹"
	damage_type_bullet = /damagetype/ranged/bullet/pistol_40/tranq/surplus
	misfire_chance = 1
	rarity = RARITY_BROKEN

/obj/item/bullet_cartridge/pistol_45/
	name = "\improper .45手枪弹"
	desc = "经典之选，总不会错。"
	desc_extended = "供使用.45弹药的手枪和冲锋枪装填。"
	icon = 'icons/obj/item/bullet/45.dmi'

	amount_max = 6
	amount_max_icon = 6

	bullet_diameter = 11.43
	bullet_length = 23
	bullet_color = COLOR_BULLET

	projectile = /obj/projectile/bullet/firearm/smg
	damage_type_bullet = /damagetype/ranged/bullet/pistol_45

	projectile_speed = BULLET_SPEED_PISTOL_LIGHT

	size = 0.015
	value = 1 //Dummy value.

/obj/item/bullet_cartridge/pistol_45/surplus
	name = "\improper 库存旧式.45手枪弹"
	damage_type_bullet = /damagetype/ranged/bullet/pistol_45/surplus
	jam_chance = 1
	value = 0
	rarity = RARITY_BROKEN

/obj/item/bullet_cartridge/pistol_45/ap
	name = "\improper .45穿甲手枪弹"
	desc_extended = "供使用.45弹药的手枪和冲锋枪装填。这款采用穿甲弹头。"
	rarity = RARITY_UNCOMMON
	icon = 'icons/obj/item/bullet/45_ap.dmi'

	damage_type_bullet = /damagetype/ranged/bullet/pistol_45/ap

	penetrations = 1

/obj/item/bullet_cartridge/pistol_45holy
	name = "\improper 神圣.45手枪弹"
	desc = "约书亚·格雷厄姆的风格。"
	desc_extended = "供使用神圣.45弹药的手枪和冲锋枪装填。"
	icon = 'icons/obj/item/bullet/holy45.dmi'

	amount_max = 6
	amount_max_icon = 6

	bullet_diameter = 11.77
	bullet_length = 24

	bullet_color = COLOR_SILVER

	projectile = /obj/projectile/bullet/firearm/smg
	damage_type_bullet = /damagetype/ranged/bullet/holybullet

	projectile_speed = BULLET_SPEED_PISTOL_LIGHT

	size = 0.015

	value = 1

/obj/item/bullet_cartridge/pistol_45holy/surplus
	name = "\improper 库存旧式神圣.45手枪弹"
	damage_type_bullet = /damagetype/ranged/bullet/holybullet/surplus
	jam_chance = 1
	rarity = RARITY_BROKEN

/obj/item/bullet_cartridge/pistol_10x24mm
	name = "\improper 10x24mm无壳手枪弹"
	desc = "至少比9mm大了1mm。"
	desc_extended = "供使用10x24mm无壳弹的武器装填。"
	icon = 'icons/obj/item/bullet/10x24mm.dmi'

	amount_max = 6
	amount_max_icon = 6

	bullet_diameter = 10
	bullet_length = 24
	bullet_color = COLOR_BULLET

	projectile = /obj/projectile/bullet/firearm/pistol
	damage_type_bullet = /damagetype/ranged/bullet/pistol_10x24mm

	projectile_speed = BULLET_SPEED_PISTOL_HEAVY

	size = 0.02
	value = 1 //Dummy value.

/obj/item/bullet_cartridge/pistol_10x24mm/surplus
	name = "\improper 库存旧式10x24mm无壳手枪弹"
	damage_type_bullet = /damagetype/ranged/bullet/pistol_10x24mm/surplus
	jam_chance = 1
	rarity = RARITY_BROKEN

/obj/item/bullet_cartridge/pistol_10x24mm/explosive
	name = "\improper 10x24mm无壳高爆穿甲手枪弹"
	desc = "至少比9mm大了1mm。"
	desc_extended = "供使用10x24mm无壳弹的武器装填。"
	icon = 'icons/obj/item/bullet/10x24mm.dmi'

	amount_max = 6
	amount_max_icon = 6

	bullet_diameter = 10
	bullet_length = 24
	bullet_color = COLOR_BULLET

	projectile = /obj/projectile/bullet/firearm/pistol
	damage_type_bullet = /damagetype/ranged/bullet/pistol_10x24mm/explosive

	projectile_speed = BULLET_SPEED_PISTOL_HEAVY

	size = 0.02

	rarity = RARITY_RARE
