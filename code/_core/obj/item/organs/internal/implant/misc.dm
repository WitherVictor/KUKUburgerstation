/obj/item/organ/internal/implant/torso/od_purge
	name = "过量防护植入体"
	desc = "防止药物过量。"
	desc_extended = "一种特殊植入体，通过清除血液中过量的化学物质来防止药物过量。"

	has_life = TRUE

	value = 0

/obj/item/organ/internal/implant/torso/od_purge/on_life()
	. = ..()
	if(loc && is_advanced(loc))
		var/mob/living/advanced/A = loc
		if(A.reagents)
			var/has_purged = FALSE
			for(var/reagent_path in A.reagents.stored_reagents)
				var/reagent_volume = A.reagents.stored_reagents[reagent_path]
				var/reagent/R = REAGENT(reagent_path)
				if(!R.overdose_threshold || reagent_volume < R.overdose_threshold)
					continue
				reagent_volume *= 0.5
				has_purged = TRUE
				A.reagents.stored_reagents[reagent_path] = FLOOR(reagent_volume, 1)
			if(has_purged)
				A.to_chat(span("danger","你的[attached_organ.name]中的[src.name]发出了哔声……"))


/obj/item/organ/internal/implant/torso/death_alarm
	name = "死亡警报植入体"
	desc = "我死了，请重启。"
	desc_extended = "一种特殊植入体，检测到使用者死亡后，会通过医疗频道广播。电量仅够播报一次死亡。"

/obj/item/organ/internal/implant/torso/death_alarm/on_organ_add(var/mob/living/advanced/new_owner)
	. = ..()
	HOOK_ADD("post_death","\ref[src]_implant_post_death",new_owner,src,src::trigger_implant())

/obj/item/organ/internal/implant/torso/death_alarm/on_organ_remove(var/mob/living/advanced/old_owner)
	. = ..()
	HOOK_REMOVE("post_death","\ref[src]_implant_post_death",old_owner)

/obj/item/organ/internal/implant/torso/death_alarm/proc/trigger_implant()

	if(loc && is_advanced(loc) && loc.loc)
		var/mob/living/advanced/A = loc
		var/turf/T = get_turf(src)
		play_sound('sound/effects/death_alarm_beep.ogg',T)
		A.to_chat(span("danger","你的[attached_organ.name]中的[src.name]发出了哔声……"))
		talk(src,src,"医疗警报：[A.real_name]已死亡！",TEXT_RADIO,RADIO_FREQ_MEDICAL,talk_range = YELL_RANGE)
		qdel(src)
		return TRUE

	return FALSE
