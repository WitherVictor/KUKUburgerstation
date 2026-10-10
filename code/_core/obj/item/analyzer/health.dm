/obj/item/analyzer/health
	name = "健康分析仪"
	desc = "别动，让我给你治疗！"
	desc_extended = "手持便携健康分析仪，以特定计量单位显示目标受到的总伤害。它还会播报扫描结果，方便懒得看的人。"

	icon = 'icons/obj/item/analyzers/health.dmi'
	icon_state = "inventory"
	value = 150
	var/advanced = FALSE
	var/stealth = FALSE

	var/scan_range = 1

/obj/item/analyzer/health/syndicate
	name = "辛迪加健康分析仪"
	desc = "想活命就别动。"
	desc_extended = "手持便携健康分析仪，以特定计量单位显示目标受到的总伤害。这款辛迪加型号更加安静，并可在短距离内扫描。"
	stealth = TRUE
	scan_range = VIEW_RANGE*0.75
	icon_state = "inventory_syndicate"

/obj/item/analyzer/health/click_self(var/mob/activator,location,control,params)
	INTERACT_CHECK
	INTERACT_DELAY(1)
	advanced = !advanced
	activator.to_chat(span("notice","高级诊断已[advanced ? "启用" : "禁用"]。"))
	return TRUE

/obj/item/analyzer/health/can_be_scanned(var/mob/activator,var/atom/target)

	if(get_dist(activator,target) > scan_range)
		activator.to_chat(span("warning","你离得太远了！"))
		return FALSE

	return is_living(target)

/obj/item/analyzer/health/on_scan(var/mob/activator,var/atom/target,location,control,params)

	next_scan = world.time + SECONDS_TO_DECISECONDS(4)

	. = "<b>扫描（物理／灼烧／毒素／缺氧）：</b> <font color='red'>[CEILING(target.health.damage[BRUTE],1)]</font>|<font color='yellow'>[CEILING(target.health.damage[BURN],1)]</font>|<font color='green'>[CEILING(target.health.damage[TOX],1)]</font>|<font color='blue'>[CEILING(target.health.damage[OXY],1)]</font>"

	if(!stealth)
		new/obj/effect/chat_text(target,.,TRUE)
		play_sound('sound/items/scanbeep.ogg',get_turf(src))

	if(advanced)
		var/species = "无数据"
		var/blood_type = "无数据"
		var/blood_volume = "无数据"
		var/blood_oxygen = "无数据"
		var/blood_toxicity = "无数据"
		var/reagent_printout = "无数据"
		var/regen_buffer = "无数据"
		if(is_living(target))
			var/mob/living/L = target
			regen_buffer = "<font color='red'>[CEILING(L.brute_regen_buffer,1)]</font>|<font color='yellow'>[CEILING(L.burn_regen_buffer,1)]</font>|<font color='green'>[CEILING(L.tox_regen_buffer,1)]</font>"
			if(is_advanced(target))
				var/mob/living/advanced/A = target
				var/species/S = SPECIES(A.species)
				species = S.name
			else
				species = initial(L.name)
			if(L.blood_type)
				var/reagent/BT = REAGENT(L.blood_type)
				blood_type = BT.name
				blood_volume = "[L.blood_volume]u ([FLOOR(L.blood_volume/L.blood_volume_max,0.01)*100]%)"
				blood_oxygen = "[FLOOR((L.blood_volume/L.blood_volume_max) + L.blood_oxygen,0.01)*100]%"
				blood_toxicity = "[max(0,1 - L.chem_power)*100]%"

		if(target.reagents && length(target.reagents.stored_reagents))
			reagent_printout = ""
			for(var/r_id in target.reagents.stored_reagents)
				var/reagent/R = REAGENT(r_id)
				var/volume = target.reagents.stored_reagents[r_id]
				if(!R.bypass_small_limit && volume < 1) //Ignore small reagents.
					continue
				reagent_printout += "[R.name]：[volume]u<br>"
		. += "<br>名称：[target.name]<br>种族：[species]<br>恢复缓冲（物理／灼烧／毒素）：[regen_buffer]<br>血液类型：[blood_type]<br>血量：[blood_volume]<br>血氧：[blood_oxygen]<br>血液毒性：[blood_toxicity]<br>血液中的试剂：<br>[reagent_printout]"
		activator.to_chat(.)
	else if(stealth)
		activator.to_chat(.)

	return TRUE
