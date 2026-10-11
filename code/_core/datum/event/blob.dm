/event/blob
	name = "Blob Biohazard"

	probability = 5 //relative

	occurances_max = 1

/event/blob/on_start()

	var/gamemode/G = SSgamemode.active_gamemode

	if(!G)
		return FALSE

	if(!G.add_objective(/objective/kill_blob))
		return FALSE

	announce(
		"中央指挥部异星病毒事务处",
		"异形菌毯警报",
		"作战区域附近检测到五级生物危害——正在生长的“异形菌毯”。",
		sound_to_play = 'sound/voice/announcement/blob.ogg'
	)

	. = ..()
