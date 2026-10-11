/emote/sound/
	var/list/sounds_male = list()
	var/list/sounds_female = list()

/emote/sound/on_emote(var/atom/emoter,var/atom/target)
	. = ..()
	if(.)
		var/sound_to_play = get_sound_to_play(emoter,target)
		if(sound_to_play) play_sound(sound_to_play,get_turf(emoter),range_max=VIEW_RANGE)

/emote/sound/proc/get_sound_to_play(var/atom/emoter,var/atom/target)
	if(is_living(emoter))
		var/mob/living/L = emoter
		return L.get_emote_sound(id)
	return null

/emote/sound/laugh
	name = "Laugh"
	id = "laugh"
	action = "#USER笑了起来！"
	action_target = "#USER嘲笑着#TARGET！"

/emote/sound/cough
	name = "Cough"
	id = "cough"
	action = "#USER咳嗽了几声。"
	action_target = "#USER朝#TARGET咳嗽。"

/emote/sound/deathgasp
	name = "Death Gasp"
	id = "deathgasp"
	action = "#USER浑身抽搐，随后瘫软下来，双眼失去了生气……"

/emote/sound/gasp
	name = "Gasp"
	id = "gasp"
	action = "#USER倒吸了一口气！"

/emote/sound/grenade
	name = "Grenade!"
	id = "grenade"
	action = "#USER拉开了手榴弹的保险！"

/emote/sound/medic
	name = "Medic!"
	id = "medic"
	action = "#USER大声呼叫医护人员！"

/emote/sound/pain
	name = "Oof"
	id = "pain"
	action = "#USER痛叫了一声！"

/emote/sound/scream
	name = "Scream"
	id = "scream"
	action = "#USER尖叫起来！"
	action_target = "#USER朝#TARGET尖叫！"
