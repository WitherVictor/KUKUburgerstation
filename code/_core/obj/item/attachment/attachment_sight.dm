/obj/item/attachment/sight
	name = "瞄具配件"

/obj/item/attachment/sight/red_dot
	name = "红点瞄具"
	desc = "机械瞄具哪里不好了？"
	desc_extended = "精细校准的红点瞄具，让目标瞄准点更加清晰，减轻技能不足造成的散布并提高精度，代价是移动散布增加。"
	icon_state = "red_dot_sight"

	attachment_stats = list(
		skill_spread = 0.75,
		movement_spread = 1.25,
		inaccuracy_modifier = 0.75,

	)

	value = 200

/obj/item/attachment/sight/laser_sight
	name = "激光瞄具"
	desc = "激光束！"
	desc_extended = "提高枪械精度的高功率激光瞄具。减少移动散布并提高精度，代价是对操控技能的要求略高。"
	icon_state = "laser_sight"

	attachment_stats = list(
		movement_spread = 0.75,
		inaccuracy_modifier = 0.75,
		skill_spread = 1.25
	)

	value = 300

/obj/item/attachment/sight/quickfire_adapter
	name = "速射适配器"
	desc = "咻得更快。"
	desc_extended = "复杂的武器配件，大幅提高射速，代价是精度降低、后坐散布增加。"
	icon_state = "quickfire_adapter"

	value = 800

	attachment_stats = list(
		inaccuracy_modifier = 1.25,
		heat_spread = 1.25,

		shoot_delay = 0.75
	)

/obj/item/attachment/sight/scope
	name = "步枪瞄准镜（1.5倍）"
	desc = "机械瞄具哪里不好了？"
	desc_extended = "笨重的步枪瞄准镜，提高武器的瞄准倍率和精度，代价是移动散布与后坐散布明显增加。"
	icon_state = "x2_scope"

	attachment_stats = list(
		zoom_mul = 1.5,
		movement_spread = 1.5,
		heat_spread = 1.25,
		inaccuracy_modifier = 0.5,
	)

	value = 400

/obj/item/attachment/sight/scope/medium
	name = "步枪瞄准镜（2倍）"
	desc = "机械瞄具哪里不好了？"
	desc_extended = "笨重的步枪瞄准镜，提高武器的瞄准倍率和精度，代价是移动散布与后坐散布明显增加。"
	icon_state = "x3_scope"

	attachment_stats = list(
		zoom_mul = 2,
		movement_spread = 2,
		heat_spread = 1.25,
		inaccuracy_modifier = 0.5,
	)

	value = 800

/obj/item/attachment/sight/scope/large
	name = "狙击瞄准镜（4倍）"
	desc = "机械瞄具哪里不好了？"
	desc_extended = "笨重的狙击瞄准镜，提高武器的瞄准倍率和精度，代价是移动散布与后坐散布明显增加。"
	icon_state = "x4_scope"

	attachment_stats  = list(
		zoom_mul = 4,
		movement_spread = 3,
		heat_spread = 1.25,
		inaccuracy_modifier = 0.25,
	)

	value = 1600

/obj/item/attachment/sight/scope/massive
	name = "狙击瞄准镜（6倍）"
	desc = "机械瞄具哪里不好了？"
	desc_extended = "极其笨重的狙击瞄准镜，提高武器的瞄准倍率和精度，代价是移动散布与后坐散布明显增加。"
	icon_state = "x8_scope"

	attachment_stats  = list(
		zoom_mul = 6,
		movement_spread = 3,
		heat_spread = 1.25,
		inaccuracy_modifier = 0.1,
	)

	value = 3200

/obj/item/attachment/sight/scope/massive/sniper_20
	icon_state = "scope_sniper_20"
	removable = FALSE

/obj/item/attachment/sight/scope/massive/sniper_127
	icon_state = "x8_scope_2"
	removable = FALSE

/obj/item/attachment/sight/targeting_computer
	name = "瞄准计算机"
	desc = "书呆子专用。"
	desc_extended = "将复杂昂贵的电路塞进三角形金属全息显示器中，替你完成几乎所有复杂计算，减轻技能不足带来的精度惩罚。"
	icon_state = "targeting_device"

	value = 800

	attachment_stats = list(
		skill_spread = 0
	)

/obj/item/attachment/sight/m4
	icon_state = "m4sight"
	value = 1
