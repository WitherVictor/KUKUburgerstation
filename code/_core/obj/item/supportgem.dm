/obj/item/supportgem
	name = "辅助宝石"
	desc = "我发誓，这可没抄别的游戏。"
	desc_extended = "增强魔杖中所镶嵌法术的魔法宝石。"

	icon = 'icons/obj/item/spellgem.dmi'
	icon_state = "support"

	var/support_desc

	var/power_base = 1
	var/power_per_quality = 0 //Above 100.

	quality = 100

	color = "#FFFFFF"
	var/color_2 = "#FFFFFF"
	var/color_3 = "#FFFFFF"

	var/list/support_stats = list()

	tier_type = "support gem"

	rarity = RARITY_UNCOMMON

/obj/item/supportgem/get_base_value()

	if(!length(support_stats)) //Dummy item, something went wrong.
		return 0

	return initial(value)

/obj/item/supportgem/proc/update_support_stats()
	return TRUE

/obj/item/supportgem/proc/get_power()
	return power_base + (quality-100)*power_per_quality

/obj/item/supportgem/set_quality(var/quality_to_set=100,var/force=FALSE)
	. = ..()
	if(.)
		update_support_stats()

/obj/item/supportgem/update_overlays()
	. = ..()

	if(color_2)
		var/image/I = new(icon,"[icon_state]_grad")
		I.appearance_flags = appearance_flags | RESET_COLOR
		I.alpha = 200
		I.color = color_2
		add_overlay(I)

	if(color_3)
		var/image/I = new(icon,"[icon_state]_outline")
		I.appearance_flags = appearance_flags | RESET_COLOR
		I.alpha = 200
		I.color = color_3
		add_overlay(I)

/obj/item/supportgem/Initialize()
	update_support_stats()
	. = ..()

/obj/item/supportgem/Finalize()
	. = ..()
	update_sprite()

/obj/item/supportgem/get_examine_list(var/mob/examiner)
	. = ..()
	. += div("notice",support_desc)
	. += div("notice","上方加粗的数值会随品质变化。")


/obj/item/supportgem/damage
	name = "致命冲击辅助宝石"
	power_base = 0.2 //20%
	power_per_quality = 1/100 //100% more damage per 100 quality
	value = 1000

	color = COLOR_RED
	color_2 = COLOR_ORANGE
	color_3 = COLOR_GOLD


/obj/item/supportgem/damage/update_support_stats()
	var/damage_mul = power_base + (quality-100)*power_per_quality
	support_stats = list(
		"damage_multiplier" = 1 + damage_mul,
		"mana_cost_multiplier" = 2,
		"shoot_delay" = 1.5
	)
	support_desc = "伤害提高<b>[(damage_mul)*100]</b>%。\n法力消耗增加100%。\n射击间隔延长50%。"

/obj/item/supportgem/cost
	name = "节能施法辅助宝石"
	power_base = 0.10 //10%
	power_per_quality = 0.5/100 //50% reduced mana cost per 100 quality
	value = 500

	color = COLOR_BLUE
	color_2 = COLOR_WHITE
	color_3 = COLOR_GREEN

/obj/item/supportgem/cost/update_support_stats()
	var/mana_mul = min(0.75,power_base + (quality-100)*power_per_quality)
	support_stats = list(
		"mana_cost_multiplier" = 1 - mana_mul,
		"projectile_speed" = 0.75,
		"inaccuracy_modifier" = 1.25
	)
	support_desc = "法力消耗减少<b>[mana_mul*100]</b>%。\n弹体速度降低25%。\n不精确度系数增加25%。"

/*
/obj/item/supportgem/projectiles
	name = "spliting shots support gem"
	power_base = 1 //1 extra projectile
	power_per_quality = 5/100 //5 extra projectiles per 100 quality
	value = 300

	color = COLOR_GREEN
	color_2 = COLOR_GREEN_DARK
	color_3 = COLOR_GOLD

/obj/item/supportgem/projectiles/update_support_stats()
	var/projectile_count = power_base + (quality-100)*power_per_quality
	support_stats = list(
		"bullet_count" = projectile_count,
		"mana_cost_multiplier" = 3,
		"bullet_spread" = 3
	)
	support_desc = "Increases projectile count by <b>[projectile_count]</b>.\nIncreases mana cost by 200%.\nIncreases projectile spread by 200%."
*/


/obj/item/supportgem/spread
	name = "集中射击辅助宝石"
	power_base = 0.5 //50%
	power_per_quality = 0.2 / 100 //20% less spread per 100 quality
	value = 750

	color = COLOR_GREEN
	color_2 = COLOR_BLUE
	color_3 = COLOR_RED

/obj/item/supportgem/spread/update_support_stats()
	var/bullet_spread = min(0.75,power_base + (quality-100)*power_per_quality)
	support_stats = list(
		"bullet_spread" = 1 - bullet_spread,
		"inaccuracy_modifier" = 0.75,
		"projectile_speed" = 1.25,
		"shoot_delay" = 2
	)
	support_desc = "弹体散布减少<b>[bullet_spread*100]</b>%。\n不精确度系数降低25%。\n弹体速度提高25%。\n射击间隔延长100%。"

/obj/item/supportgem/penetrations
	name = "穿透辅助宝石"
	power_base = 1 //1 extra penetration
	power_per_quality = 3/100 //3 extra penetrations per 100 quality
	value = 1000

	color = COLOR_PINK
	color_2 = COLOR_PURPLE
	color_3 = COLOR_WHITE

/obj/item/supportgem/penetrations/update_support_stats()
	var/penetration_count = power_base + (quality-100)*power_per_quality
	support_stats = list(
		"penetrations" = 1 + penetration_count,
		"mana_cost_multiplier" = 1.5
	)
	support_desc = "穿透次数增加<b>[1 + penetration_count]</b>次。\n法力消耗增加50%。"

/obj/item/supportgem/overkill
	name = "过度杀伤辅助宝石"
	power_base = 0.4 //1.4x dmg
	power_per_quality = 1/100 //100% more damage per 100% qual
	value = 2500

	color = COLOR_PINK
	color_2 = COLOR_PURPLE
	color_3 = COLOR_WHITE

/obj/item/supportgem/overkill/update_support_stats()
	var/damagemult = power_base + (quality-100)*power_per_quality
	var/manamult = power_base + (quality-100)*power_per_quality
	support_stats = list(
		"damage_multiplier" = 1 + damagemult,
		"inaccuracy_modifier" = 1.25,
		"projectile_speed" = 1.25,
		"mana_cost_multiplier" = manamult + 2.5,
		"shoot_delay" = 2
	)
	support_desc = "伤害提高<b>[damagemult*100]%</b>。\n法力消耗增加<b>[(manamult + 1.5)*100]%</b>。\n弹体速度提高25%。\n不精确度系数增加25%。\n射击间隔延长100%。"


/obj/item/supportgem/speed
	name = "加速辅助宝石"
	power_base = 0.2 //20% increased speed.
	power_per_quality = 0.4/100 //40% increased speed per 100 quality.
	value = 750

	color = COLOR_GOLD
	color_2 = COLOR_RED
	color_3 = COLOR_WHITE

/obj/item/supportgem/speed/update_support_stats()
	var/projectile_speed = power_base + (quality-100)*power_per_quality
	support_stats = list(
		"projectile_speed" = 1 + projectile_speed,
		"mana_cost_multiplier" = 1.5
	)
	support_desc = "弹体速度提高<b>[projectile_speed*100]%</b>。\n法力消耗增加50%。\n注意：弹体速度存在上限。"


/obj/item/supportgem/precision
	name = "精准辅助宝石"
	power_base = 0.2 //20% increased accuracy.
	power_per_quality = 0.4/100 //40% increased accuracy per 100 quality.
	value = 500

	color = COLOR_GREEN
	color_2 = COLOR_RED
	color_3 = COLOR_RED

/obj/item/supportgem/precision/update_support_stats()
	var/precision = power_base + (quality-100)*power_per_quality
	support_stats = list(
		"inaccuracy_modifier" = 1 - precision,
		"mana_cost_multiplier" = 1.3
	)
	support_desc = "不精确度系数降低<b>[precision*100]%</b>。\n法力消耗增加30%。"
