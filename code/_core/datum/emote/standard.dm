/emote/dab
	name = "Dab"
	id = "dab"
	action = "#USER突然摆出了甩臂舞姿！"
	action_target = "#USER朝#TARGET摆出甩臂舞姿！"

/emote/flex
	name = "Flex"
	id = "flex"
	action = "#USER秀了秀肌肉！"
	action_target = "#USER朝#TARGET秀了秀肌肉！"

/emote/nod
	name = "Nod Head"
	id = "nod"
	action = "#USER点了点头。"
	action_target = "#USER朝#TARGET点了点头。"

/emote/shake
	name = "Shake Head"
	id = "shake"
	action = "#USER摇了摇头。"
	action_target = "#USER朝#TARGET摇了摇头。"

/emote/bow
	name = "Bow"
	id = "bow"
	action = "#USER鞠了一躬。"
	action_target = "#USER朝#TARGET鞠了一躬。"

/emote/fist
	name = "Shake Fist"
	id = "fist"
	action = "#USER挥了挥拳头。"
	action_target = "#USER朝#TARGET挥了挥拳头！"

/emote/think
	name = "Think"
	id = "think"
	action = "#USER思考着。"
	action_target = null

/emote/wave
	name = "Wave"
	id = "wave"
	action = "#USER挥了挥手。"
	action_target = "#USER朝#TARGET挥了挥手。"

/emote/shrug
	name = "Shrug"
	id = "shrug"
	action = "#USER耸了耸肩。"
	action_target = null

/emote/cheer
	name = "Cheer"
	id = "cheer"
	action = "#USER欢呼起来！"
	action_target = "#USER为#TARGET加油！"

/emote/beckon
	name = "Beckon"
	id = "beckon"
	action = "#USER招了招手。"
	action_target = "#USER朝#TARGET招了招手。"

/emote/yawn
	name = "Yawn"
	id = "yawn"
	action = "#USER打了个哈欠。"
	action_target = "#USER朝#TARGET打了个哈欠。"

/emote/cry
	name = "Cry"
	id = "cry"
	action = "#USER哭了起来。"
	action_target = "#USER朝#TARGET哭了起来！"

/emote/clap
	name = "Clap"
	id = "clap"
	action = "#USER鼓起掌来！"
	action_target = "#USER为#TARGET鼓掌！"

/emote/salute
	name = "Salute"
	id = "salute"
	action = "#USER敬了个礼！"
	action_target = "#USER向#TARGET敬礼！"

/emote/inhale
	name = "Inhale"
	id = "inhale"
	action = "#USER吸了一口气。"

/emote/inhale/on_emote(var/atom/emoter,var/atom/target)
	if(is_advanced(emoter))
		var/mob/living/advanced/A = emoter
		if(A.inventories_by_id[BODY_FACE])
			var/obj/item/I = A.inventories_by_id[BODY_FACE].get_top_object()
			if(istype(I,/obj/item/container/cigarette))
				var/obj/item/container/cigarette/C = I
				C.consume(5)
	. = ..()

/emote/drag
	name = "Drag"
	id = "drag"
	action = "#USER吸了一口烟。"

/emote/drag/can_emote(var/atom/emoter,var/atom/target)
	. = ..()
	if(!.) return FALSE
	if(is_advanced(emoter))
		var/mob/living/advanced/A = emoter
		if(A.inventories_by_id[BODY_FACE])
			var/obj/item/I = A.inventories_by_id[BODY_FACE].get_top_object()
			if(istype(I,/obj/item/container/cigarette))
				return TRUE

/emote/drag/on_emote(var/atom/emoter,var/atom/target)
	if(is_advanced(emoter))
		var/mob/living/advanced/A = emoter
		if(A.inventories_by_id[BODY_FACE])
			var/obj/item/I = A.inventories_by_id[BODY_FACE].get_top_object()
			if(istype(I,/obj/item/container/cigarette))
				var/obj/item/container/cigarette/C = I
				C.consume(10)
	. = ..()

/emote/exhale
	name = "Exhale"
	id = "exhale"
	action = "#USER呼出一口气。"

/emote/blink
	name = "Blink"
	id = "blink"
	action = "#USER眨了眨眼。"

/emote/spin
	name = "Spin"
	id = "spin"
	action = null
	action_target = null

/emote/spin/proc/spin(var/atom/emoter,var/spins_remaining=0)

	emoter.set_dir(turn(emoter.dir,90))

	if(spins_remaining > 0)
		CALLBACK("\ref[emoter]_spin",1,src,src::spin(),emoter,spins_remaining-1)

/emote/spin/on_emote(var/atom/emoter,var/atom/target)
	spin(emoter,11)
	return ..()

/emote/help
	name = "Help"
	id = "help"
	action = null
	action_target = null

/emote/help/on_emote(var/atom/emoter,var/atom/target)
	var/mob/M = emoter
	M.view_emotes()
	return ..()
