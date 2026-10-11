

/ticket/
	var/list/message_log = list()
	var/list/involved_ckeys = list() //Assoc list (ckey = TRUE)
	var/password //Random password in case someone manages to be clever. Then again, only admins can join new tickets. Just in case.
	var/ticket_number = 1
	var/attacker //The person who opened the ticket (ckey). The person who activated the ticket (either an admin bwoinking a player, or a player asking for help)
	var/victim //The creator of the ticket (ckey). The person basically getting bwoinked or the person who ahelped.
	var/status = null

/ticket/Topic(href,href_list[])

	if(href_list["password"] && usr.client)
		if(!involved_ckeys[usr.client.ckey])
			src.join(usr.client)
		var/desired_message = input("请输入回复内容。","管理员求助") as message
		if(desired_message)
			desired_message = police_text(usr.client,desired_message,check_characters=TRUE)
			if(desired_message)
				send_message(usr.client,desired_message)

	. = ..()

/ticket/New(var/desired_loc)
	ticket_number = SSclient.ticket_number_counter
	SSclient.ticket_number_counter++
	password = rand(1,1000000)
	. = ..()

/ticket/proc/open(var/client/C,var/desired_message,var/is_victim)

	for(var/k in involved_ckeys)
		var/client/C2 = CLIENT(k)
		C2?.to_chat(span("ahelp","[C.ckey]已[isnull(status) ? "创建" : "重新开启"]工单（#[ticket_number]）。"))

	log_admin("[C.ckey] opened ticket (#[ticket_number]).")

	attacker = C.ckey

	status = TRUE

	if(!involved_ckeys[C.ckey])
		join(C,is_victim) //If you opened it, you must join it.

	var/fresh = length(message_log) <= 0

	if(desired_message)
		send_message(C,desired_message)

	if(fresh)
		message_log += "[C.ckey] has opened the ticket."
	else
		message_log += "[C.ckey] has reopened the ticket."

/ticket/proc/close(var/client/C)
	for(var/k in involved_ckeys)
		var/client/C2 = CLIENT(k)
		C2.to_chat(span("ahelp bold","[C.ckey]已关闭工单（#[ticket_number]）。"))
	status = FALSE
	message_log += "[C.ckey] has closed the ticket."
	log_admin("[C.ckey] closed ticket (#[ticket_number]).")

/ticket/proc/send_message(var/client/C,var/message)

	if(!involved_ckeys[C.ckey])
		return FALSE

	for(var/k in involved_ckeys)
		var/client/C2 = CLIENT(k)
		if(!C2)
			C.to_chat(span("ahelp","注意：[k]已离线，无法收到消息。"))
			continue
		play_sound_target('sound/effects/bwoink.ogg',C2.mob)
		if(C2 == C) //We're the person that sent the message.
			if(C2.permissions & FLAG_PERMISSION_MODERATOR) //We're a moderator who sent the message.
				C2?.to_chat(span("ahelp","[ICON_TO_HTML(chat_tags.icon,"PM_OUT",32,10)]Admin PM sent-<a class='bold' href='?src=\ref[src];password=[password]'>[C.ckey]</a>: [message]"))
			else //We're not a moderator who sent the message.
				C2?.to_chat(span("blue","[ICON_TO_HTML(chat_tags.icon,"PM_OUT",32,10)]发给管理员的私信－<a class='bold' href='?src=\ref[src];password=[password]'>[C.ckey]</a>：[message]"))
		else if(C2.ckey == victim) //We're the victim and getting an admin PM from an admin.
			C2?.to_chat(span("ahelp","[ICON_TO_HTML(chat_tags.icon,"PM_IN",32,10)]管理员私信来自－<a class='bold' href='?src=\ref[src];password=[password]'>[C.ckey]</a>：[message]"))
		else //We're just a spectator.
			C2?.to_chat(span("ahelp","<a class='bold' href='?src=\ref[src];password=[password]'>（工单#[ticket_number]）[C.ckey]</a>：[message]"))

	if(attacker == victim && !length(message_log)) //Gotta send the message to all moderators if its the first message from a player who needs help.
		var/notified_admins = 0
		for(var/k in SSclient.all_clients)
			var/client/C2 = CLIENT(k)
			if(C2.permissions & FLAG_PERMISSION_MODERATOR)
				C2.to_chat(span("ahelp","[ICON_TO_HTML(chat_tags.icon,"HELP",32,10)]New ticket (#[ticket_number]) message from <a href='?src=\ref[src];password=[password]'>[victim]</a>: [message]"))
				play_sound_target('sound/effects/bwoink.ogg',C2.mob)
				notified_admins++
		log_admin("[notified_admins] admins were notified of ticket #[ticket_number].")
		if(!notified_admins)
			C.to_chat(span("ahelp","目前没有管理员在线。如需协助，请在Discord上联系他们。"))

	message_log += "[C.ckey]: [message]"

/ticket/proc/join(var/client/C,var/is_victim=FALSE)

	if(involved_ckeys[C.ckey])
		C.to_chat(span("ahelp bold","你已经加入此工单（#[ticket_number]）了！"))
		return FALSE

	if(!is_victim && !(C.permissions & FLAG_PERMISSION_MODERATOR))
		C.to_chat(span("ahelp bold","你没有权限加入此工单（#[ticket_number]）。如果你认为有误，请在Discord上联系Burger。"))
		return FALSE

	if(is_victim)
		victim = C.ckey

	involved_ckeys[C.ckey] = TRUE

	if(!SSclient.ckey_to_tickets[C.ckey])
		SSclient.ckey_to_tickets[C.ckey] = list()
	SSclient.ckey_to_tickets[C.ckey] += src

	var/client/VC = CLIENT(victim)
	if(victim == attacker) //Victim called for the ahelp and someone has joined the ticket.
		if(VC != C)
			VC.to_chat(span("ahelp bold","一名管理员已加入你的工单，即将回复。"))
		else
			VC.to_chat(span("ahelp bold","你已创建工单（#[ticket_number]）。请等待管理员处理。"))
	else if(victim && VC == C) //Victim did not call for the ahelp and is just tuning in.
		VC.to_chat(span("ahelp big bold center","--管理员私信--"))
		VC.to_chat(span("ahelp center","工单#[ticket_number]"))
		VC.to_chat(span("ahelp","管理员私信来自－<a class='bold' href='?src=\ref[src];password=[password]'>[attacker]</a>：[message_log[1]]"))
		VC.to_chat(span("ahelp italic","点击管理员的名称即可回复。"))

	log_admin("[C.ckey] joined ticket (#[ticket_number]).")

	return TRUE
