/obj/item/weapon/ranged/energy/mech
	name = "机甲枪械"
	desc = "枪，不过更大。"
	desc_extended = "供你的机甲使用的武器。"
	icon = 'icons/obj/item/weapons/ranged/mech.dmi'

	projectile = /obj/projectile/bullet/laser
	projectile_speed = 8
	shoot_delay = 20
	automatic = FALSE
	bullet_color = "#0000FF"

	dan_mode = FALSE

	charge_cost = 1000

	view_punch_to_add = 0

	shoot_sounds = list('sound/weapons/laser_rifle/shoot.ogg')

	mech_only = TRUE

	size = SIZE_6
	weight = 50

	plane = PLANE_ABSTRACT
	value_burgerbux = -1

/obj/item/weapon/ranged/energy/mech/can_owner_shoot(var/mob/caller,var/atom/object,location,params)

	if(!istype(loc?.loc,/mob/living/vehicle/))
		caller?.to_chat(span("warning","这件武器只能在载具内开火！"))
		return FALSE

	return ..()

/obj/item/weapon/ranged/energy/mech/get_battery()

	if(istype(loc,/obj/item/mech_part))
		var/obj/item/mech_part/MP = loc
		if(istype(MP.loc,/mob/living/vehicle/mech/modular))
			var/mob/living/vehicle/mech/modular/MM = MP.loc
			return MM.battery

	return ..()

/obj/item/weapon/ranged/energy/mech/smg
	name = "9x19mm冲锋枪"
	desc = "子弹水管。"
	desc_extended = "使用冲锋枪口径的机甲武器，消耗电池电量制造弹药。尽管当作无限弹药扫射，直到电池耗尽。也可安装在肩部槽位。"
	icon_state = "mech_ballistic"

	automatic = TRUE

	shoot_delay = 1.5

	charge_cost = CELL_SIZE_VEHICLE / 600

	projectile = /obj/projectile/bullet/firearm/pistol
	ranged_damage_type = /damagetype/ranged/bullet/pistol_9mm

	projectile_speed = BULLET_SPEED_PISTOL_LIGHT

	shoot_sounds = list('sound/weapons/40/shoot_smg.ogg')

	bullet_color = COLOR_BULLET

	heat_per_shot_to_add = 0.01
	heat_max = 0.03

	value = 500

/obj/item/weapon/ranged/energy/mech/smg/get_static_spread()
	return 0.005

/obj/item/weapon/ranged/energy/mech/smg/get_skill_spread(var/mob/living/L)
	return 0

/obj/item/weapon/ranged/energy/mech/lmg
	name = "5.56mm轻机枪"
	desc = "算不上真正的机关炮。"
	desc_extended = "架设机枪堪称经典，现在你的机甲也能用上。能耗和射速适中，伤害不错，在各种情况下都是稳妥选择。"
	icon_state = "mech_uac2"

	automatic = TRUE

	shoot_delay = 2

	charge_cost = CELL_SIZE_VEHICLE / 500

	projectile = /obj/projectile/bullet/firearm/rifle
	ranged_damage_type = /damagetype/ranged/bullet/rifle_223

	projectile_speed = BULLET_SPEED_RIFLE_LIGHT

	shoot_sounds = list('sound/weapons/223/lmg.ogg')

	value = 1000

	bullet_color = COLOR_BULLET

	heat_per_shot_to_add = 0.005
	heat_max = 0.04

/obj/item/weapon/ranged/energy/mech/lmg/get_static_spread()
	return 0.002

/obj/item/weapon/ranged/energy/mech/lmg/get_skill_spread(var/mob/living/L)
	return 0


/obj/item/weapon/ranged/energy/mech/laser
	name = "AER14激光步枪"
	desc = "咻咻咻！"
	desc_extended = "适配机甲的模块化NT激光步枪，发射标准光束，由机甲电池供能。射速较慢，但对某些目标的效果优于子弹。"
	icon_state = "mech_lasercarbine"

	projectile = /obj/projectile/bullet/laser
	ranged_damage_type = /damagetype/ranged/laser/rifle

	projectile_speed = TILE_SIZE - 1
	shoot_delay = 4

	automatic = TRUE

	charge_cost = CELL_SIZE_VEHICLE / 600

	shoot_sounds = list('sound/weapons/laser_rifle/shoot.ogg')

	size = SIZE_4

	value = 1400

	bullet_color = "#FF0000"

	heat_per_shot_to_add = 0.004
	heat_max = 0.03

/obj/item/weapon/ranged/energy/mech/laser/get_static_spread()
	return 0

/obj/item/weapon/ranged/energy/mech/laser/get_skill_spread(var/mob/living/L)
	return 0




/obj/item/weapon/ranged/energy/mech/ion
	name = "AER35离子步枪"
	desc = "只能有一台（机甲）活下来！"
	desc_extended = "适配机甲的模块化NT激光步枪，发射重型离子束，专用于机甲间的战斗，但能耗很高。"
	icon_state = "mech_ionrifle"

	projectile = /obj/projectile/bullet/laser/ion
	ranged_damage_type = /damagetype/ranged/laser/ion

	projectile_speed = TILE_SIZE - 1
	shoot_delay = 4

	automatic = FALSE

	charge_cost = CELL_SIZE_VEHICLE / 200

	shoot_sounds = list('sound/weapons/laser_rifle/shoot.ogg')

	size = SIZE_4

	value = 1400

	bullet_color = COLOR_BLUE

	heat_per_shot_to_add = 0.004
	heat_max = 0.03

/obj/item/weapon/ranged/energy/mech/ion/get_static_spread()
	return 0

/obj/item/weapon/ranged/energy/mech/ion/get_skill_spread(var/mob/living/L)
	return 0



/obj/item/weapon/ranged/energy/mech/missile_pod
	name = "RK导弹巢"
	desc = "附带损害倒计时，三……"
	desc_extended = "机甲肩部高爆火箭弹巢，爆炸范围广，消耗大量电量补充火箭弹。按住ALT键开火。两边肩膀各装一个，快乐翻倍！"
	icon_state = "mech_missile_pod"

	projectile = /obj/projectile/bullet/rocket_he
	ranged_damage_type = /damagetype/ranged/bullet/gyrojet/

	bullet_color = "#FFFFFF"

	projectile_speed = 16
	shoot_delay = 10

	automatic = FALSE

	charge_cost = CELL_SIZE_VEHICLE / 100

	shoot_sounds = list('sound/weapons/gyrojet/shoot.ogg')

	size = SIZE_4

	value = 1900

	heat_per_shot_to_add = 0.004
	heat_max = 0.03

/obj/item/weapon/ranged/energy/mech/missile_pod/get_static_spread()
	return 0.01

/obj/item/weapon/ranged/energy/mech/missile_pod/get_skill_spread(var/mob/living/L)
	return 0
