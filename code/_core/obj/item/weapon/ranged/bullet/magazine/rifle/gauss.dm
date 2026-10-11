/obj/item/weapon/ranged/bullet/magazine/rifle/gauss_gun
	name = "\improper 2.54x12mm实验型高斯步枪"
	desc = "感谢你，巨石，为我们揭示敌人的诡计。愿你的光芒照耀那些为践行你的意志而献出生命的勇士之魂。"
	desc_extended = "精度极高的高科技武器，人称高斯步枪，在斯拉夫设施内的秘密实验室中研发。电磁铁系统将弹丸加速至极高速度，带来惊人的停止作用，却几乎没有后坐力。"
	icon = 'icons/obj/item/weapons/ranged/rifle/rev/gauss.dmi'
	icon_state = "inventory"
	value = 12000

	company_type = "Slavic"

	tier = 3

	shoot_delay = 25

	damage_mod = 2

	automatic = FALSE

	shoot_sounds = list('sound/weapons/ranged/rifle/gauss/shoot.ogg')

	can_wield = TRUE
	wield_only = TRUE

	size = SIZE_5
	weight = 13.37*2

	heat_max = 0.04
	view_punch_mod = 0

	bullet_length_min = 11
	bullet_length_best = 12
	bullet_length_max = 14

	bullet_diameter_min = 1
	bullet_diameter_best = 2.54
	bullet_diameter_max = 3

	ai_heat_sensitivity = 2

	zoom_mul = 3

	attachment_whitelist = list()

	attachment_barrel_offset_x = 32 - 16
	attachment_barrel_offset_y = 19 - 16

	attachment_sight_offset_x = 14 - 16
	attachment_sight_offset_y = 25 - 16

	attachment_undermount_offset_x = 27 - 16
	attachment_undermount_offset_y = 15 - 16

	inaccuracy_modifier = 0.1
	movement_inaccuracy_modifier = 2
	movement_spread_base = 0.15

	rarity = RARITY_RARE

/obj/item/weapon/ranged/bullet/magazine/rifle/gauss_gun/get_static_spread()
	return 0

/obj/item/weapon/ranged/bullet/magazine/rifle/gauss_gun/get_skill_spread(var/mob/living/L)
	return max(0.001 - (0.001 * L.get_skill_power(SKILL_RANGED)))

/obj/item/weapon/ranged/bullet/magazine/rifle/gauss_gun/auto
	name = "\improper 2.54x12mm实验型高斯卡宾枪"
	desc = "别再发巨石的东西了！我都看烦了！"
	desc_extended = "高斯枪的定型设计。后续研究和材料改进使其具备了自动射击所需的耐用性和能源效率。然而，哪怕只造一把也耗资巨大，因此只有太空斯拉夫军方在使用。能弄到它，你得相当走运。" //mucho texto
	icon = 'icons/obj/item/weapons/ranged/rifle/rev/gauss_carbine.dmi'
	icon_state = "inventory"

	shoot_sounds = list('sound/weapons/ranged/rifle/gauss/shoot_short.ogg')

	value = 15000

	tier = 3

	shoot_delay = 6

	damage_mod = 1

	automatic = TRUE

	can_wield = TRUE
	wield_only = TRUE

	size = SIZE_5
	weight = 13.37

	heat_max = 0.1

	ai_heat_sensitivity = 2

	zoom_mul = 1

	attachment_whitelist = list()

	attachment_barrel_offset_x = 32 - 16
	attachment_barrel_offset_y = 19 - 16

	attachment_sight_offset_x = 14 - 16
	attachment_sight_offset_y = 25 - 16

	attachment_undermount_offset_x = 27 - 16
	attachment_undermount_offset_y = 15 - 16

	inaccuracy_modifier = 0.1
	movement_inaccuracy_modifier = 2
	movement_spread_base = 0.075

	rarity = RARITY_LEGENDARY

/obj/item/weapon/ranged/bullet/magazine/rifle/gauss_gun/auto/get_static_spread()
	return 0.001

/obj/item/weapon/ranged/bullet/magazine/rifle/gauss_gun/auto/get_skill_spread(var/mob/living/L)
	return max(0.01 - (0.01 * L.get_skill_power(SKILL_RANGED)))
