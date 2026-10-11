/proc/notify_ghosts(var/text,var/turf/T)
	var/formatted_message = span("dead bold","[text]（点击<a href='?spectate=1;x=[T.x];y=[T.y];z=[T.z]'>此处</a>旁观。）")

	for(var/mob/abstract/observer/ghost/O in SSliving.all_mobs)
		O.to_chat(formatted_message)

	return TRUE
