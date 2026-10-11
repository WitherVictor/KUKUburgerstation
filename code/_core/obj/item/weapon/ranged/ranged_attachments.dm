/obj/item/weapon/ranged/proc/add_attachment(var/mob/activator,var/obj/item/attachment/A)

	if(!length(attachment_whitelist))
		activator.to_chat(span("warning","这件武器无法安装配件！"))
		return FALSE

	if(!attachment_whitelist[A.type])
		activator.to_chat(span("warning","[A.name]无法安装到[src.name]上！"))
		return FALSE

	var/list/type_to_var = list(
		/obj/item/attachment/barrel/ = "attachment_barrel",
		/obj/item/attachment/sight/ = "attachment_sight",
		/obj/item/attachment/undermount/ = "attachment_undermount",
		/obj/item/attachment/stock = "attachment_stock",
		/obj/item/attachment/barrel_mod = "barrel_mod",
		/obj/item/attachment/stock_mod = "stock_mod"
	)

	for(var/k in type_to_var)
		var/v = type_to_var[k]
		if(!istype(A,k))
			continue
		var/obj/hud/inventory/INV
		var/obj/item/I
		if(vars[v])
			I = vars[v]
			activator.visible_message(span("notice","[activator.name]将[src.name]上的[I.name]换成了[A.name]。"),span("notice","你将[src.name]上的[I.name]换成了[A.name]。"))
			I.drop_item(get_turf(src))
			vars[v] = null
			if(is_inventory(A.loc))
				INV = A.loc
		else
			activator.visible_message(span("notice","[activator.name]将[A.name]安装到了[src.name]上。"),span("notice","你将[A.name]安装到了[src.name]上。"))
		A.drop_item(src)
		vars[v] = A
		update_sprite()
		update_attachment_stats()
		if(I && INV)
			INV.add_object(I)
		return TRUE

	return FALSE

/obj/item/weapon/ranged/proc/remove_attachment(var/mob/activator)

	var/list/attachment_variables = list(
		"attachment_barrel",
		"attachment_sight",
		"attachment_undermount",
		"attachment_stock",
		"barrel_mod",
		"stock_mod"
	)

	var/list/choice_list = list()
	for(var/k in attachment_variables)
		if(!vars[k])
			continue
		var/obj/item/attachment/A = vars[k]
		if(!A.removable)
			continue
		choice_list[A.name] = k

	if(!length(choice_list))
		return FALSE

	choice_list["取消"] = "Cancel"

	var/attachment_choice = input("要拆下哪个配件？","拆卸配件") as null|anything in choice_list
	if(!attachment_choice || choice_list[attachment_choice] == "Cancel")
		activator.to_chat(span("notice","你决定不拆下任何配件。"))
		return FALSE

	attachment_choice = choice_list[attachment_choice]

	var/obj/item/I = vars[attachment_choice]

	activator.visible_message(span("notice","[activator.name]从[src.name]上拆下了[I.name]。"),span("notice","你从[src.name]上拆下了[I.name]。"))
	I.drop_item(get_turf(src))
	vars[attachment_choice] = null
	update_sprite()
	update_attachment_stats()
	return I

/obj/item/weapon/ranged/proc/update_attachment_stats()

	attachment_stats = list()

	var/list/attachment_variables = list(
		"attachment_barrel",
		"attachment_sight",
		"attachment_undermount",
		"attachment_stock",
		"barrel_mod",
		"stock_mod"
	)

	var/list/modifier_count = list()

	for(var/i in attachment_variables)
		var/obj/item/attachment/A = vars[i]
		if(!A) continue
		for(var/k in A.attachment_stats)
			var/v = A.attachment_stats[k]
			attachment_stats[k] += v
			if(isnum(v)) modifier_count[k] += 1

	for(var/k in modifier_count)
		attachment_stats[k] *= (1/modifier_count[k])

	return TRUE


/obj/item/weapon/ranged/get_examine_list(var/mob/activator)

	. = ..()

	var/list/stat_display_names = list("damage_multiplier"="伤害倍率","projectile_speed"="弹体速度","bullet_spread"="弹丸散布","heat_spread"="后坐散布","shoot_delay"="射击间隔","bullet_color"="弹体颜色","skill_spread"="技能散布","movement_spread"="移动散布","inaccuracy_modifier"="不精确度系数","zoom_mul"="瞄准倍率","heat_per_shot"="每次射击后坐量","static_spread"="基础散布","condition_use_mod"="耐久消耗系数","mana_cost_multiplier"="法力消耗倍率","bullet_count"="弹体数量","max_bursts"="连发次数","bursts_to_use"="连发次数","burst_delay"="连发间隔","projectile"="弹体","ranged_damage_type"="远程伤害类型","penetrations"="额外穿透次数","prone_mul"="卧姿系数","prone_mod"="卧姿系数")
	for(var/k in attachment_stats)
		var/v = attachment_stats[k]
		var/stat_display = stat_display_names[k] ? stat_display_names[k] : k
		. += span("notice","[stat_display]：[v]")

