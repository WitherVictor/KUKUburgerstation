/obj/item/attachment/
	name = "武器配件"
	desc = "模块化！"
	desc_extended = "装到武器上，获得额外威力！"
	icon = 'icons/obj/item/attachments.dmi'

	var/list/attachment_stats = list()

	/*Possible stats:
		damage_multiplier - The multiplier of damage.
		bullet_count - The amount of projectiles that is shot from this gun at once.
		projectile_speed - The speed of the bullet. Capped at 31
		bullet_spread - Spread from the bullet (like shotgun buckshot, most other ammos have 0)
		static_spread - Spread just from the gun's design.
		skill_spread - Spread from how bad you are at using a gun.
		heat_spread - Spread from constant firing of the gun.
		movement_spread - Spread from moving around.
		inaccuracy_modifier - Target doll inaccuracy.
		prone_mod - accuracy improvement from laying prone.
		view_punch - visual recoil
		heat_per_shot - spread added pers hot
		shoot_delay - Delay of the gun.
		bursts_to_use - How many shots does one sustained trigger pull give. Only works on automatic weapons.
		shoot_sounds
		shoot_alert
		damage_type
		bullet_color
		durability_mod
	*/

	//TODO: ADD AUTOMATIC, ZOOM

	var/attachment_offset_x = 0
	var/attachment_offset_y = 0

	var/removable = TRUE

	weight = 1

	rarity = RARITY_UNCOMMON

/obj/item/attachment/get_examine_list(var/mob/activator)

	. = ..()

	var/list/stat_display_names = list("damage_multiplier"="伤害倍率","projectile_speed"="弹体速度","bullet_spread"="弹丸散布","heat_spread"="后坐散布","shoot_delay"="射击间隔","bullet_color"="弹体颜色","skill_spread"="技能散布","movement_spread"="移动散布","inaccuracy_modifier"="不精确度系数","zoom_mul"="瞄准倍率","heat_per_shot"="每次射击后坐量","static_spread"="基础散布","condition_use_mod"="耐久消耗系数","mana_cost_multiplier"="法力消耗倍率","bullet_count"="弹体数量","max_bursts"="连发次数","bursts_to_use"="连发次数","burst_delay"="连发间隔","projectile"="弹体","ranged_damage_type"="远程伤害类型","penetrations"="额外穿透次数","prone_mul"="卧姿系数","prone_mod"="卧姿系数")
	for(var/k in attachment_stats)
		var/v = attachment_stats[k]
		var/stat_display = stat_display_names[k] ? stat_display_names[k] : k
		. += span("notice","[stat_display]：[v]")
