/obj/item/bullet_cartridge/rifle_223
	name = "\improper .223步枪弹"
	desc = "军事扮装爱好者的首选弹药。"
	desc_extended = "供使用.223弹药的步枪和机枪装填。"
	icon = 'icons/obj/item/bullet/223.dmi'

	bullet_diameter = 5.56
	bullet_length = 45
	bullet_color = COLOR_BULLET

	amount_max = 5
	amount_max_icon = 5

	projectile = /obj/projectile/bullet/firearm/rifle
	damage_type_bullet = /damagetype/ranged/bullet/rifle_223

	projectile_speed = BULLET_SPEED_RIFLE_LIGHT

	size = 0.03

	value = 1 //Dummy value.

/obj/item/bullet_cartridge/rifle_223/surplus
	name = "\improper 库存旧式.223步枪弹"
	damage_type_bullet = /damagetype/ranged/bullet/rifle_223/surplus
	jam_chance = 1
	rarity = RARITY_BROKEN

/obj/item/bullet_cartridge/rifle_223/ap
	name = "\improper .223穿甲步枪弹"
	rarity = RARITY_UNCOMMON
	desc_extended = "供使用.223弹药的步枪和机枪装填。这款采用穿甲弹头。"
	icon = 'icons/obj/item/bullet/223_ap.dmi'

	damage_type_bullet = /damagetype/ranged/bullet/rifle_223/ap

	size = 0.03

	penetrations = 1

/obj/item/bullet_cartridge/rifle_223/du
	name = "\improper .223贫铀步枪弹"
	desc_extended = "供使用.223弹药的步枪装填。这款采用贫铀弹头。"
	rarity = RARITY_RARE
	damage_type_bullet = /damagetype/ranged/bullet/rifle_223/du
	projectile_speed = BULLET_SPEED_RIFLE_HEAVY
	penetrations = 2


/obj/item/bullet_cartridge/rifle_223/nato
	name = "\improper 5.56mm步枪弹"
	desc = "“贵宾犬杀手”的最爱。"
	desc_extended = "供使用5.56mm弹药的步枪和机枪装填。"
	rarity = RARITY_COMMON

	amount_max = 5
	amount_max_icon = 5

	projectile = /obj/projectile/bullet/firearm/rifle
	damage_type_bullet = /damagetype/ranged/bullet/rifle_556mm

	projectile_speed = BULLET_SPEED_RIFLE_LIGHT

/obj/item/bullet_cartridge/rifle_223/nato/surplus
	name = "\improper 库存旧式5.56mm步枪弹"
	damage_type_bullet = /damagetype/ranged/bullet/rifle_556mm/surplus
	jam_chance = 1
	rarity = RARITY_BROKEN

/obj/item/bullet_cartridge/rifle_223/nato/premium
	name = "\improper 优质5.56mm步枪弹"
	rarity = RARITY_RARE
	damage_type_bullet = /damagetype/ranged/bullet/rifle_556mm/premium

/obj/item/bullet_cartridge/rifle_223/nato/caseless
	name = "\improper 5.56mm无壳步枪弹"
	desc = "“贵宾犬杀手”的最爱，现在还有无壳版！"
	desc_extended = "供使用5.56mm弹药的步枪和机枪装填，击发后不留下弹壳。"
	rarity = RARITY_UNCOMMON

	amount_max = 5
	amount_max_icon = 5

	projectile = /obj/projectile/bullet/firearm/rifle
	damage_type_bullet = /damagetype/ranged/bullet/rifle_556mm

	projectile_speed = BULLET_SPEED_RIFLE_LIGHT

	caseless = TRUE

/obj/item/bullet_cartridge/rifle_223/caseless/surplus
	name = "\improper 库存旧式5.56mm步枪弹"
	damage_type_bullet = /damagetype/ranged/bullet/rifle_556mm/surplus
	jam_chance = 1
	value = 0
	rarity = RARITY_BROKEN



/obj/item/bullet_cartridge/rifle_223/nato/ap
	name = "\improper 5.56mm穿甲步枪弹"
	rarity = RARITY_UNCOMMON
	desc_extended = "供使用5.56mm弹药的步枪和机枪装填。这款采用穿甲弹头。"
	icon = 'icons/obj/item/bullet/223_ap.dmi'

	damage_type_bullet = /damagetype/ranged/bullet/rifle_556mm/ap

	size = 0.03
