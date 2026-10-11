/obj/item/cassette_player
	name = "卡式磁带播放器"
	desc = "音频播放倒计时，三……"
	desc_extended = "可以播放预录歌曲的老式磁带播放器。手持使用即可开始为自己播放，或停止正在播放的歌曲。"
	icon = 'icons/obj/item/tape.dmi'
	icon_state = "taperecorder_empty"
	value = 1000
	value_burgerbux = 1

	weight = 1
	size = SIZE_1

	var/mob/current_hearer
	var/obj/item/cassette_tape/stored_tape
	var/playing = FALSE

	rarity = RARITY_RARE

/obj/item/cassette_player/get_examine_list(var/mob/examiner)
	. = ..()
	if(stored_tape)
		. += div("notice","里面目前装着[stored_tape.name]。")
	. += div("notice","目前[playing ? "正在播放" : "未在播放"]。")

/obj/item/cassette_player/save_item_data(var/mob/living/advanced/player/P,var/save_inventory = TRUE,var/died=FALSE,var/loadout=FALSE)
	RUN_PARENT_SAFE
	SAVEATOM("stored_tape")

/obj/item/cassette_player/load_item_data_post(var/mob/living/advanced/player/P,var/list/object_data,var/loadout=FALSE)
	RUN_PARENT_SAFE
	LOADATOM("stored_tape")

/obj/item/cassette_player/Finalize()
	. = ..()
	update_sprite()

/obj/item/cassette_player/update_icon()
	. = ..()
	if(!stored_tape)
		icon_state = "taperecorder_empty"
	else if(playing)
		icon_state = "taperecorder_playing"
	else
		icon_state = "taperecorder_idle"

/obj/item/cassette_player/proc/disable()
	if(current_hearer && current_hearer.client)
		stop_music_track(current_hearer.client)
		if(playing) current_hearer.to_chat(span("notice","[src.name]关闭了。"))
		HOOK_REMOVE("post_move","loc_check_\ref[src]",current_hearer)
		CALLBACK_REMOVE("tape_stop_\ref[src]")
	playing = FALSE
	update_sprite()

/obj/item/cassette_player/proc/enable()
	if(current_hearer && current_hearer.client)
		var/track/T = SStrack.all_tracks[stored_tape.stored_track]
		if(!T)
			return
		play_music_track(stored_tape.stored_track,current_hearer.client)
		if(!playing) current_hearer.to_chat(span("notice","[src.name]开启了。"))
		HOOK_ADD("post_move","loc_check_\ref[src]",current_hearer,src,src::check_valid())
		CALLBACK("tape_stop_\ref[src]",SECONDS_TO_DECISECONDS(T.length),src,src::disable())
	playing = TRUE
	update_sprite()


/obj/item/cassette_player/clicked_on_by_object(var/mob/activator,var/atom/object,location,control,params)

	INTERACT_CHECK
	INTERACT_DELAY(5)

	if(istype(object,/obj/item/cassette_tape))
		disable()
		var/obj/item/old_tape
		if(stored_tape)
			old_tape = stored_tape
			old_tape.drop_item(get_turf(src))
			activator.to_chat(span("notice","你从[src.name]中弹出了[old_tape.name]。"))
			stored_tape = null
		stored_tape = object
		stored_tape.drop_item(src)
		activator.to_chat(span("notice","你将[stored_tape.name]放入了[src.name]。"))
		if(old_tape && is_advanced(activator))
			var/mob/living/advanced/A = activator
			A.put_in_hands(stored_tape,params)
		return TRUE

	if(stored_tape && is_inventory(object))
		disable()
		var/obj/hud/inventory/I = object
		activator.to_chat(span("notice","你从[src.name]中弹出了[stored_tape.name]。"))
		I.add_object(stored_tape)
		stored_tape = null
		return TRUE

	. = ..()

/obj/item/cassette_player/click_self(var/mob/activator,var/atom/object)

	INTERACT_CHECK
	INTERACT_DELAY(20)

	if(playing)
		disable()
	else if(!stored_tape || !stored_tape.stored_track)
		activator.to_chat(span("warning","[src.name]中没有可播放的磁带！"))
	else
		if(is_inventory(src.loc))
			var/obj/hud/inventory/I = src.loc
			if(I.essential)
				current_hearer = I.owner
				enable()

/obj/item/cassette_player/proc/check_valid()

	if(!current_hearer)
		disable()
		return FALSE

	if(get_turf(src) != get_turf(current_hearer))
		disable()
		return FALSE

	return TRUE

/obj/item/cassette_player/post_move(var/atom/old_loc)
	. = ..()
	check_valid()


/obj/item/cassette_tape
	name = "卡式磁带"
	desc = "终于他妈的有点好音乐了。"
	desc_extended = "录有音乐的老式卡式磁带，需要卡式磁带播放器才能播放。"
	var/track/stored_track
	icon = 'icons/obj/item/tape.dmi'
	icon_state = "tape_white"

	value = 200

	rarity = RARITY_UNCOMMON

/obj/item/cassette_tape/Finalize()
	if(!stored_track)
		value = -1
	else
		var/track/T = SStrack.all_tracks[stored_track]
		if(T)
			name = "[initial(name)]: [T.name]"
	. = ..()

/obj/item/cassette_tape/Generate()
	. = ..()
	if(!stored_track)
		stored_track = pick(SStrack.all_tracks)
		icon_state = "tape_blue"

/obj/item/cassette_tape/save_item_data(var/mob/living/advanced/player/P,var/save_inventory = TRUE,var/died=FALSE,var/loadout=FALSE)
	RUN_PARENT_SAFE
	SAVEPATH("stored_track")

/obj/item/cassette_tape/load_item_data_post(var/mob/living/advanced/player/P,var/list/object_data,var/loadout=FALSE)
	RUN_PARENT_SAFE
	LOADPATH("stored_track")
