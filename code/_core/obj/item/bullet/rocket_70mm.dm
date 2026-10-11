/obj/item/bullet_cartridge/rocket_70mm/
	name = "70mm高爆战斗部"
	desc = "我是火箭人。"
	desc_extended = "火箭筒用高爆弹，禁止用于火箭跳。"
	rarity = RARITY_COMMON
	icon = 'icons/obj/item/bullet/rocket.dmi'
	icon_state = "HE"

	amount_max = 1
	amount_max_icon = 1

	bullet_length = 800
	bullet_diameter = 70

	projectile = /obj/projectile/bullet/rocket_he
	damage_type_bullet = /damagetype/ranged/bullet/rocket/he

	projectile_speed = TILE_SIZE * 0.9

	size = 2

	caseless = TRUE

	bullet_insert_sound = 'sound/weapons/ranged/rifle/rocket/rocket_insert.ogg'

	value = 1 //Dummy value.

/obj/item/bullet_cartridge/rocket_70mm/get_base_value()
	. = ..()
	. += 400

/obj/item/bullet_cartridge/rocket_70mm/wp
	name = "70mm白磷战斗部"
	desc = "我是火箭人。"
	desc_extended = "火箭筒用白磷弹。《太空日内瓦公约》不是把这东西禁了吗……？"
	rarity = RARITY_UNCOMMON
	icon = 'icons/obj/item/bullet/rocket.dmi'
	icon_state = "WP"

	amount_max = 1
	amount_max_icon = 1

	bullet_length = 800
	bullet_diameter = 70

	projectile = /obj/projectile/bullet/rocket_wp
	damage_type_bullet = /damagetype/ranged/bullet/rocket/wp

	projectile_speed = TILE_SIZE * 0.9

	size = 2

/obj/item/bullet_cartridge/rocket_70mm/nuclear
	name = "70mm核战斗部"
	desc = "看我这门戴维·克罗克特！"
	desc_extended = "火箭筒用弹药。等等，那他妈是核弹？！"
	rarity = RARITY_RARE
	value_burgerbux = 1
	icon = 'icons/obj/item/bullet/rocket.dmi'
	icon_state = "NUKE"

	amount_max = 1
	amount_max_icon = 1

	bullet_length = 800
	bullet_diameter = 70
	value_burgerbux = 1
	projectile = /obj/projectile/bullet/rocket_nuclear
	damage_type_bullet = /damagetype/ranged/bullet/rocket/nuclear

	projectile_speed = TILE_SIZE * 0.7

	size = 2

/obj/item/bullet_cartridge/rocket_70mm/wp/get_base_value()
	. = ..()
	. += 200

/obj/item/bullet_cartridge/rocket_70mm/ap
	name = "70mm穿甲战斗部"
	desc = "我是火箭人。"
	desc_extended = "火箭筒用穿甲弹，双重装药带来出色的穿透能力。"
	rarity = RARITY_UNCOMMON
	icon = 'icons/obj/item/bullet/rocket.dmi'
	icon_state = "AP"

	amount_max = 1
	amount_max_icon = 1

	bullet_length = 800
	bullet_diameter = 70

	projectile = /obj/projectile/bullet/rocket_ap
	damage_type_bullet = /damagetype/ranged/bullet/rocket/ap

	projectile_speed = TILE_SIZE * 0.9

	size = 2

/obj/item/bullet_cartridge/rocket_70mm/ap/get_base_value()
	. = ..()
	. += 200
