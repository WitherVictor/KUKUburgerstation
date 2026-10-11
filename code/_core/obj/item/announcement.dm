var/global/next_announcement = 0

/obj/item/announcement/
	name = "公告广播装置"
	desc = "有一天，当……"
	desc_extended = "一次性公告系统。"
	icon = 'icons/obj/item/pda.dmi'
	icon_state = "captain"

	value = 3000
	value_burgerbux = 5

	var/sound_to_play = 'sound/alert/announcement.ogg'

	var/sender
	var/title
	var/print_owner = TRUE

	weight = 3

	var/stored_message

	rarity = RARITY_RARE

/obj/item/announcement/proc/can_use(var/mob/activator)
	return TRUE

/obj/item/announcement/click_self(var/mob/activator,location,control,params)

	INTERACT_CHECK
	INTERACT_DELAY(10)

	if(!activator.client)
		return FALSE

	if(!can_use(activator))
		return FALSE

	if(next_announcement > world.time)
		activator.to_chat(span("warning","请再等[DECISECONDS_TO_SECONDS(CEILING(next_announcement - world.time,10))]秒后发送公告！"))
		return FALSE

	var/message = input("你想发送什么内容？", "公告内容", stored_message) as message | null

	if(src.qdeleting)
		return FALSE

	INTERACT_CHECK_OTHER(src) //Hacky

	stored_message = message

	if(!message)
		activator.to_chat(span("notice","你决定不使用这个装置。"))
		return FALSE

	message = police_text(activator.client,message,check_characters=TRUE)

	if(!message)
		activator.to_chat(span("notice","你决定不使用这个装置。"))
		return FALSE

	if(get_turf(activator) != get_turf(src))
		activator.to_chat(span("warning","你离得太远了！"))
		return FALSE

	if(!sender)
		sender = "中央指挥部便携公告系统"

	if(!title)
		title = "来自[activator.name]的消息"

	if(print_owner)
		message = "[message]<br> -[activator.name]"

	if(next_announcement > world.time)
		activator.to_chat(span("warning","请再等[DECISECONDS_TO_SECONDS(CEILING(next_announcement - world.time,10))]秒后发送公告！"))
		return FALSE

	announce(sender,title,message,sound_to_play=sound_to_play)

	next_announcement = world.time + SECONDS_TO_DECISECONDS(60)

	stored_message = null

	qdel(src)

	return TRUE

/obj/item/announcement/syndicate
	desc_extended = "向船员发送挑衅的一次性公告系统。这款供辛迪加使用，会自动在消息中签上你的名字。"
	icon_state = "syndicate"
	title = "宣战公告"
	sender = "辛迪加"
	value = 500
	sound_to_play = 'sound/alert/warning.ogg'

/obj/item/announcement/syndicate/can_use(var/mob/activator)

	if(!is_living(activator))
		activator.to_chat(span("warning","你似乎不知道该怎么用这东西……"))
		return FALSE

	var/mob/living/L = activator
	if(L.loyalty_tag != "Syndicate")
		L.to_chat(span("warning","你似乎不知道该怎么用这东西……"))
		return FALSE

	return TRUE


/obj/item/announcement/wizard
	desc_extended = "向船员发送挑衅的一次性公告系统。这款供巫师使用，会自动在消息中签上你的名字。"
	icon_state = "syndicate"
	title = "巫师宣言"
	sender = "巫师联邦"
	value = 500
	sound_to_play = 'sound/alert/warning.ogg'

/obj/item/announcement/wizard/can_use(var/mob/activator)

	if(!is_living(activator))
		activator.to_chat(span("warning","你似乎不知道该怎么用这东西……"))
		return FALSE

	var/mob/living/L = activator
	if(L.loyalty_tag != "Wizard Federation")
		L.to_chat(span("warning","你似乎不知道该怎么用这东西……"))
		return FALSE

	return TRUE

/obj/item/announcement/rev
	desc_extended = "向船员发送挑衅的一次性公告系统。这款供革命军使用，会自动在消息中签上你的名字。"
	icon_state = "rev"
	title = "兵变宣言"
	sender = "革命军"
	value = 500
	var/sounds_to_play = list('sound/alert/rev_pda_1.ogg','sound/alert/rev_pda_2.ogg','sound/alert/rev_pda_3.ogg','sound/alert/rev_pda_4.ogg')

/obj/item/announcement/rev/can_use(var/mob/activator)

	if(!is_living(activator))
		activator.to_chat(span("warning","你似乎不知道该怎么用这东西……"))
		return FALSE

	var/mob/living/L = activator
	if(L.loyalty_tag != "Revolutionary")
		L.to_chat(span("warning","你似乎不知道该怎么用这东西……"))
		return FALSE

	return TRUE

//This is fucking horrible but it works so I don't care
/obj/item/announcement/rev/click_self(var/mob/activator,location,control,params)

	INTERACT_CHECK
	INTERACT_DELAY(10)

	if(!activator.client)
		return FALSE

	if(!can_use(activator))
		return FALSE

	if(next_announcement > world.time)
		activator.to_chat(span("warning","请再等[DECISECONDS_TO_SECONDS(CEILING(next_announcement - world.time,10))]秒后发送公告！"))
		return FALSE

	var/message = input("你想发送什么内容？", "公告内容", stored_message) as message | null

	if(src.qdeleting)
		return FALSE

	INTERACT_CHECK_OTHER(src) //Hacky

	stored_message = message

	if(!message)
		activator.to_chat(span("notice","你决定不使用这个装置。"))
		return FALSE

	message = police_text(activator.client,message,check_characters=TRUE)

	if(!message)
		activator.to_chat(span("notice","你决定不使用这个装置。"))
		return FALSE

	if(get_turf(activator) != get_turf(src))
		activator.to_chat(span("warning","你离得太远了！"))
		return FALSE

	if(!sender)
		sender = "中央指挥部便携公告系统"

	if(!title)
		title = "来自[activator.name]的消息"

	if(print_owner)
		message = "[message]<br> -[activator.name]"

	if(next_announcement > world.time)
		activator.to_chat(span("warning","请再等[DECISECONDS_TO_SECONDS(CEILING(next_announcement - world.time,10))]秒后发送公告！"))
		return FALSE

	announce(sender,title,message,sound_to_play=pick(sounds_to_play))

	next_announcement = world.time + SECONDS_TO_DECISECONDS(60)

	stored_message = null

	qdel(src)

	return TRUE

