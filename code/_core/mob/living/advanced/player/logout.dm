mob/living/advanced/player/proc/can_save(var/area/A)

	if(!ckey_last)
		return FALSE

	if(!A || !(A.flags_area & FLAG_AREA_SAVEZONE))
		src.to_chat(span("danger","这里不能保存并退出！先找个适合休息的区域！"))
		return FALSE

	var/obj/structure/interactive/bed/sleeper/S = locate() in src.loc.contents
	if(!S)
		src.to_chat(span("danger","保存前，请先找个休眠舱躺下！"))
		return FALSE

	if(!S.buckled)
		src.to_chat(span("danger","保存前，请先躺到床上！"))
		return FALSE

	return TRUE


/mob/living/advanced/player/proc/force_logout()
	if(!ckey_last)
		return FALSE
	var/savedata/client/mob/mobdata = MOBDATA(ckey_last)
	if(!mobdata)
		return FALSE
	mobdata.save_character(src)
	make_ghost()
	qdel(src)
	return TRUE
