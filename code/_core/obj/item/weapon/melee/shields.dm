/obj/item/weapon/melee/shield
	name = "基础木盾"
	desc = "基础款，基础用。"
	desc_extended = "适合格挡近战攻击。"
	icon = 'icons/obj/item/shields/wooden.dmi'
	damage_type = /damagetype/melee/club/shield

	block_defense = list(
		ATTACK_TYPE_UNARMED = 0.5,
		ATTACK_TYPE_MELEE = 0.9,
		ATTACK_TYPE_RANGED = 0.25,
		ATTACK_TYPE_MAGIC = 0.25
	)

	weight = 6
	size = SIZE_4

	value = 100

	block_sound = 'sound/effects/impacts/shield_wood.ogg'

	rarity = RARITY_COMMON

	var/static/list/shield_price_mul = list(
		ATTACK_TYPE_UNARMED = 0.75,
		ATTACK_TYPE_MELEE = 0.5,
		ATTACK_TYPE_RANGED = 2,
		ATTACK_TYPE_MAGIC = 3
	)

/obj/item/weapon/melee/shield/get_base_value()

	. = ..()

	var/total_block = 0
	for(var/k in block_defense)
		var/v = block_defense[k]*100
		. += (v**1.2) * shield_price_mul[k]
		total_block += v

	. += total_block**1.1

	. = CEILING(.,1)

/obj/item/weapon/melee/shield/get_examine_list(var/mob/examiner)
	. = ..()
	var/list/attack_display_names = list(ATTACK_TYPE_UNARMED="徒手",ATTACK_TYPE_MELEE="近战",ATTACK_TYPE_RANGED="远程",ATTACK_TYPE_MAGIC="魔法")
	for(var/k in block_defense)
		var/v = block_defense[k]
		var/attack_display = attack_display_names[k] ? attack_display_names[k] : k
		. += div("notice","[attack_display]格挡：[v*100]%。")

/obj/item/weapon/melee/shield/ballistic
	name = "防弹盾"
	icon = 'icons/obj/item/shields/ballistic.dmi'

	block_defense = list(
		ATTACK_TYPE_UNARMED = 0.75,
		ATTACK_TYPE_MELEE = 0.75,
		ATTACK_TYPE_RANGED = 1,
		ATTACK_TYPE_MAGIC = 0
	)
	weight = 25
	size = SIZE_7

	value = 500

	block_sound = 'sound/effects/impacts/shield_metal.ogg'

	rarity = RARITY_UNCOMMON

/obj/item/weapon/melee/shield/glass
	name = "魔法玻璃盾"
	icon = 'icons/obj/item/shields/glass.dmi'

	block_defense = list(
		ATTACK_TYPE_UNARMED = 0.5,
		ATTACK_TYPE_MELEE = 0.85,
		ATTACK_TYPE_RANGED = 0,
		ATTACK_TYPE_MAGIC = 0.9
	)

	block_sound = 'sound/effects/impacts/shield_metal.ogg'

	value = 800

	rarity = RARITY_RARE

/obj/item/weapon/melee/shield/buckler
	name = "淬硬钢小圆盾"
	icon = 'icons/obj/item/shields/buckler.dmi'

	block_defense = list(
		ATTACK_TYPE_UNARMED = 0.9,
		ATTACK_TYPE_MELEE = 0.9,
		ATTACK_TYPE_RANGED = 0.25,
		ATTACK_TYPE_MAGIC = 0.25
	)

	dan_mode = TRUE
	dan_offset_pixel_x = list(6,0,-6,0)
	dan_offset_pixel_y = list(-2,-2,-2,-2)

	value = 200

	rarity = RARITY_COMMON

/obj/item/weapon/melee/shield/great
	name = "铁制大盾"
	icon = 'icons/obj/item/shields/great.dmi'

	block_defense = list(
		ATTACK_TYPE_UNARMED = 1,
		ATTACK_TYPE_MELEE = 1,
		ATTACK_TYPE_RANGED = 0.5,
		ATTACK_TYPE_MAGIC = 0
	)

	dan_mode = TRUE
	dan_offset_pixel_x = list(4,0,-4,0)
	dan_offset_pixel_y = list(-2,-2,-2,-2)

	block_sound = 'sound/effects/impacts/shield_metal.ogg'

	value = 900

	rarity = RARITY_MYTHICAL

/obj/item/weapon/melee/shield/heartstone
	name = "心石盾"
	icon = 'icons/obj/item/shields/heartstone.dmi'

	block_defense = list(
		ATTACK_TYPE_UNARMED = 0.5,
		ATTACK_TYPE_MELEE = 0.75,
		ATTACK_TYPE_RANGED = 0.25,
		ATTACK_TYPE_MAGIC = 0.9
	)

	dan_mode = TRUE
	dan_offset_pixel_x = list(5,0,-5,0)
	dan_offset_pixel_y = list(-2,-2,-2,-2)

	block_sound = 'sound/effects/impacts/shield_polymer.ogg'

	value = 600

	rarity = RARITY_RARE


/obj/item/weapon/melee/shield/holy_forest
	name = "圣林盾"
	icon = 'icons/obj/item/shields/holy_forest.dmi'

	block_defense = list(
		ATTACK_TYPE_UNARMED = 0.5,
		ATTACK_TYPE_MELEE = 0.9,
		ATTACK_TYPE_RANGED = 0.25,
		ATTACK_TYPE_MAGIC = 0.75
	)

	dan_mode = TRUE
	dan_offset_pixel_x = list(6,0,-6,0)
	dan_offset_pixel_y = list(-1,-1,-1,-1)

	dan_mode = TRUE

	block_sound = 'sound/effects/impacts/shield_wood.ogg'

	value = 600

	rarity = RARITY_RARE

/obj/item/weapon/melee/shield/leather
	name = "皮革钢盾"
	icon = 'icons/obj/item/shields/leather.dmi'

	block_defense = list(
		ATTACK_TYPE_UNARMED = 0.5,
		ATTACK_TYPE_MELEE = 0.9,
		ATTACK_TYPE_RANGED = 0,
		ATTACK_TYPE_MAGIC = 0
	)

	dan_mode = TRUE
	dan_offset_pixel_x = list(5,0,-5,0)
	dan_offset_pixel_y = list(-1,-1,-1,-1)

	block_sound = 'sound/effects/impacts/shield_wood.ogg'

	value = 200

	rarity = RARITY_COMMON

/obj/item/weapon/melee/shield/mirror
	name = "巨型镜盾"
	icon = 'icons/obj/item/shields/mirror.dmi'

	block_defense = list(
		ATTACK_TYPE_UNARMED = 0.5,
		ATTACK_TYPE_MELEE = 0.9,
		ATTACK_TYPE_RANGED = 0.9,
		ATTACK_TYPE_MAGIC = 0.9
	)

	dan_mode = TRUE
	dan_offset_pixel_x = list(6,0,-6,0)
	dan_offset_pixel_y = list(-2,-2,-2,-2)

	block_sound = 'sound/effects/impacts/shield_polymer.ogg'

	value = 1200

	rarity = RARITY_LEGENDARY

/obj/item/weapon/melee/shield/redstar
	name = "斯拉夫红星盾"
	icon = 'icons/obj/item/shields/redstar.dmi'

	block_defense = list(
		ATTACK_TYPE_UNARMED = 0.85,
		ATTACK_TYPE_MELEE = 0.85,
		ATTACK_TYPE_RANGED = 0.5,
		ATTACK_TYPE_MAGIC = 0.25
	)

	dan_mode = TRUE
	dan_offset_pixel_x = list(5,0,-5,0)
	dan_offset_pixel_y = list(-2,-2,-2,-2)

	block_sound = 'sound/effects/impacts/shield_wood.ogg'

	value = 300

	rarity = RARITY_UNCOMMON

/obj/item/weapon/melee/shield/spider
	name = "红蜘蛛盾"
	icon = 'icons/obj/item/shields/spider.dmi'

	block_defense = list(
		ATTACK_TYPE_UNARMED = 0.8,
		ATTACK_TYPE_MELEE = 0.9,
		ATTACK_TYPE_RANGED = 0.25,
		ATTACK_TYPE_MAGIC = 0
	)

	dan_mode = TRUE
	dan_offset_pixel_x = list(6,0,-6,0)
	dan_offset_pixel_y = list(-2,-2,-2,-2)

	block_sound = 'sound/effects/impacts/shield_wood.ogg'

	value = 300

	rarity = RARITY_UNCOMMON

/obj/item/weapon/melee/shield/sun
	name = "太阳盾"
	icon = 'icons/obj/item/shields/sun.dmi'

	block_defense = list(
		ATTACK_TYPE_UNARMED = 0.5,
		ATTACK_TYPE_MELEE = 0.9,
		ATTACK_TYPE_RANGED = 0.25,
		ATTACK_TYPE_MAGIC = 0.75
	)

	dan_mode = TRUE
	dan_offset_pixel_x = list(6,0,-6,0)
	dan_offset_pixel_y = list(-1,-1,-1,-1)

	block_sound = 'sound/effects/impacts/shield_wood.ogg'

	value = 400

	rarity = RARITY_UNCOMMON

/obj/item/weapon/melee/shield/target
	name = "铁制靶纹盾"
	icon = 'icons/obj/item/shields/target.dmi'

	block_defense = list(
		ATTACK_TYPE_UNARMED = 0.9,
		ATTACK_TYPE_MELEE = 0.9,
		ATTACK_TYPE_RANGED = 0.25,
		ATTACK_TYPE_MAGIC = 0
	)

	dan_mode = TRUE
	dan_offset_pixel_x = list(6,0,-6,0)
	dan_offset_pixel_y = list(-2,-2,-2,-2)

	block_sound = 'sound/effects/impacts/shield_metal.ogg'

	value = 300

	rarity = RARITY_COMMON

/obj/item/weapon/melee/shield/whitewood
	name = "白木魔法盾"
	icon = 'icons/obj/item/shields/whitewood.dmi'

	block_defense = list(
		ATTACK_TYPE_UNARMED = 0.75,
		ATTACK_TYPE_MELEE = 0.75,
		ATTACK_TYPE_RANGED = 0.25,
		ATTACK_TYPE_MAGIC = 0.75
	)

	dan_mode = TRUE
	dan_offset_pixel_x = list(6,0,-6,0)
	dan_offset_pixel_y = list(-2,-2,-2,-2)

	block_sound = 'sound/effects/impacts/shield_wood.ogg'

	value = 400

	rarity = RARITY_UNCOMMON
