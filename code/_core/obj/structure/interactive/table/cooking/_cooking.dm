/obj/structure/table/cooking
	name = "烹饪台"
	var/enabled = FALSE
	var/temperature_mod = 590 //How hot to make it. This adds to the turf's temperature.
	density = TRUE
	pixel_y = 0

/obj/structure/table/cooking/Finalize()
	. = ..()
	var/old_enabled = enabled //Hacky wooo
	enabled = FALSE
	set_enabled(old_enabled,TRUE)

/obj/structure/table/cooking/proc/set_enabled(var/desired_enabled=TRUE,var/force=FALSE)

	if(enabled == desired_enabled && !force)
		return FALSE

	var/previous_value = enabled
	enabled = desired_enabled

	if(is_simulated(loc) && (previous_value != enabled))
		var/turf/simulated/T = loc
		if(enabled)
			T.turf_temperature_mod += temperature_mod
		else
			T.turf_temperature_mod -= temperature_mod

	update_sprite()
	update_atom_light()

	return TRUE

/obj/structure/table/cooking/get_examine_details_list(var/mob/examiner)
	. = ..()
	. += span("notice","目前处于[enabled ? "开启" : "关闭"]状态。")

/obj/structure/table/cooking/clicked_on_by_object(var/mob/activator,var/atom/object,location,control,params)

	if(is_item(object))
		INTERACT_CHECK
		INTERACT_CHECK_OBJECT
		INTERACT_DELAY(1)
		var/obj/item/I = object
		if(I.flags_tool & FLAG_TOOL_WRENCH && !initial(anchored))
			src.set_anchored(!anchored)
			activator.to_chat(span("notice","你[anchored ? "固定了" : "解除了固定"][src.name]。"))
			return TRUE
		I.drop_item(get_turf(src))
		return TRUE

	if(!initial(enabled))
		set_enabled(!enabled)
		activator.visible_message(span("notice","[activator.name][enabled ? "打开" : "关闭"]了[src.name]。"),span("notice","你[enabled ? "打开" : "关闭"]了[src.name]。"))
		return TRUE

	. = ..()

/obj/structure/table/cooking/post_move(var/atom/old_loc)

	. = ..()

	if(old_loc && is_simulated(old_loc))
		var/turf/simulated/T = old_loc
		T.turf_temperature_mod -= temperature_mod

	if(loc && is_simulated(loc))
		var/turf/simulated/T = loc
		T.turf_temperature_mod += temperature_mod
		if(old_loc && is_simulated(old_loc))
			var/turf/T2 = old_loc
			for(var/k in T2.contents)
				var/atom/movable/M = k
				if(M.anchored)
					continue
				M.force_move(loc)
