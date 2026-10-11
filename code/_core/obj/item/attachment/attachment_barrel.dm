/obj/item/attachment/barrel
	name = "枪管配件"

/obj/item/attachment/barrel/charger
	name = "磁力枪管增能器"
	desc = "超级增能。"
	desc_extended = "超强磁力枪管增能器，利用磁场让子弹获得超越普通火药的速度和威力。提高伤害和弹体速度，代价是精度降低、后坐增加、射速下降。"
	icon_state = "barrel_charger"

	attachment_stats = list(
		damage_multiplier = 1.25,
		projectile_speed = 1.25,
		bullet_spread = 1.25,
		heat_spread = 1.25,

		shoot_delay = 1.5,
		bullet_color = COLOR_ORANGE
	)

	value = 600


/obj/item/attachment/barrel/charger/advanced
	name = "高级枪管增能器"
	desc = "超级增能，拉到极限。"
	desc_extended = "超强磁力枪管增能器，利用磁场让子弹获得超越普通火药的速度和威力。提高伤害和弹体速度，代价是精度降低、后坐增加、射速下降。"
	icon_state = "barrel_charger_advanced"

	attachment_stats = list(
		damage_multiplier = 1.5,
		projectile_speed = 1.5,
		bullet_spread = 1.25,
		heat_spread = 1.25,

		shoot_delay = 1.5,
		bullet_color = COLOR_CYAN
	)

	value = 3000
	value_burgerbux = 1

	rarity = RARITY_MYTHICAL

/obj/item/attachment/barrel/laser_charger
	name = "模块化激光增能器"
	desc = "超级增能。"
	desc_extended = "增加参与工作的电容数量，在不增加能耗的情况下强化激光武器。提高伤害和弹体速度，代价是后坐与散布增大、射击间隔延长。"
	icon_state = "laser_charger"

	attachment_stats = list(
		damage_multiplier = 1.25,
		projectile_speed = 1.25,
		heat_spread = 1.25,

		shoot_delay = 1.5,
	)

	value = 800

/obj/item/attachment/barrel/suppressor
	name = "消音器"
	desc = "杀人时别吵醒邻居，那可太没礼貌了。"
	desc_extended = "特殊消音管，截留气体并将子弹降至亚音速，减弱音爆和气体排出的噪声。让射击更安静，代价是伤害和弹体速度降低。"
	icon_state = "suppressor"

	attachment_stats = list(
		damage_multiplier = 0.75,
		projectile_speed = 0.75,

		shoot_alert = ALERT_LEVEL_NONE,
		shoot_sounds = list('sound/weapons/ranged/generic/shot_suppressed.ogg')
	)

	//attachment_shoot_alert = ALERT_LEVEL_NONE
	//attachment_shoot_sound = 'sound/weapons/10/shoot_mod.ogg'

	value = 150

/obj/item/attachment/barrel/extended
	name = "加长枪管"
	desc = "加长的力量！"
	desc_extended = "有点傻气的枪管延长配件。提高弹体速度与射击精度，代价是后坐、移动散布、后坐散布和技能不足造成的散布增加。"
	icon_state = "extended_barrel"

	attachment_stats = list(
		projectile_speed = 1.1,

		bullet_spread = 0.5,
		movement_spread = 1.5,
		inaccuracy_modifier = 0.5,
		static_spread = 0.9,
		skill_spread = 1.25,
		heat_per_shot = 2
	)

	value = 100

/obj/item/attachment/barrel/compensator
	name = "后坐补偿器"
	desc = "总得补偿点什么。"
	desc_extended = "特殊枪口配件，将气体引向上方与两侧，减轻武器的垂直和水平后坐。让武器更易操控并减少后坐影响，代价是移动散布增加、弹体速度降低。"
	icon_state = "recoil_compensator"

	attachment_stats = list(
		projectile_speed = 0.9,
		skill_spread = 0.9,
		heat_per_shot = 0.25,
		movement_spread = 1.25,

	)

	value = 300


/obj/item/attachment/barrel/gyro
	name = "陀螺仪配件"
	desc = "通常装在老式太空船上！"
	desc_extended = "安装在枪管上的特殊角度陀螺仪，大幅减少移动散布，并略微减少基础散布，代价是后坐散布增加。"
	icon_state = "gyro"

	attachment_stats = list(
		movement_spread = 0.25,
		static_spread = 0.9,
		heat_spread = 1.25,

	)

	value = 300

/obj/item/attachment/barrel/laser_charger/advanced
	name = "实验型激光增能器"
	desc = "超极限增能。"
	desc_extended = "增加参与工作的电容数量，在不增加能耗的情况下强化激光武器。提高伤害和弹体速度，代价是后坐与散布增大、射击间隔延长。这似乎是突破原设计伤害和弹体速度的原型。"
	icon_state = "laser_charger_advanced"

	attachment_stats = list(
		damage_multiplier = 1.5,
		projectile_speed = 1.5,
		heat_spread = 1.25,

		shoot_delay = 1.5,
	)

	value = 1600
	rarity = RARITY_MYTHICAL
