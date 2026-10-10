/client/Topic(href,href_list,hsrc)

	if(!usr || usr != mob)
		return

	if(findtext(href,"<script",1,0))
		log_admin("Attempted use of scripts within a topic call, by [src]/[usr].")
		return

	if(next_allowed_topic > world.time)
		to_chat(span("danger","你发送信息的速度太快！请等待 [next_allowed_topic - world.time] 秒！"))
		return FALSE

	/*
	if(length(href_list) > 32)
		to_chat(span("danger","You're sending too much information! If this is in error, please contact Burger! Error Code: 1."))
		return FALSE

	if(length(href) > 1000)
		to_chat(span("danger","You're sending too much information! If this is in error, please contact Burger! Error Code: 2."))
		return FALSE
	*/

	if(length(href_list))
		if(href_list["examine"])
			var/datum/D = locate(href_list["examine"])
			if(D && !is_atom(D) || (mob in viewers(VIEW_RANGE,D)))
				examine(D)
		if(href_list["spectate"])
			if(is_observer(mob))
				var/mob/abstract/observer/O = mob
				var/turf/T = locate(text2num(href_list["x"]),text2num(href_list["y"]),text2num(href_list["z"]))
				if(T)
					O.force_move(T)
					to_chat(span("notice","正在跳转到新位置……"))
				else
					to_chat(span("warning","找不到该位置！"))
			else
				to_chat(span("warning","你不能这样做！"))
		if(href_list["vote"])
			var/vote/vote_datum = locate(href_list["vote"]) in SSvote.active_votes
			if(!vote_datum)
				to_chat(span("warning","找不到有效的投票！"))
			else
				if(href_list["vote_option"])
					var/option = text2num(href_list["vote_option"])
					vote_datum.set_vote(src.ckey,option)
					//src << browse(null,"window=Voting")
					to_chat(span("notice","已记录你的投票。"))
					vote_datum.show(src)
				else
					vote_datum.show(src)
		else if(href_list["change_key"])
			//Changing Macros
			var/key = href_list["change_key"]
			var/list/confirmation_choices = list("是" = "Yes","否" = "No","取消" = "Cancel")
			if(key == "quit")
				var/confirm = input("确定要退出吗？所有未保存的修改都会丢失。","退出按键宏编辑器","否") in confirmation_choices
				if(confirmation_choices[confirm] == "Yes")
					winset(mob, "browser(edit_macros)","is-visible:false")
			else if(key == "load")
				var/confirm = input("确定要清除当前修改吗？","清除修改","否") in confirmation_choices
				if(confirmation_choices[confirm] == "Yes")
					macros.macros = controls.loaded_data
			else if(key == "save")
				var/confirm = input("确定要保存按键宏并覆盖已有存档吗？","保存按键宏","否") in confirmation_choices
				if(confirmation_choices[confirm] == "Yes")
					controls.loaded_data = macros.macros
					controls.save()
			else if(key == "QWERTY")
				var/confirm = input("确定要将按键宏重置为 QWERTY 布局吗？","QWERTY 按键宏","否") in confirmation_choices
				if(confirmation_choices[confirm] == "Yes")
					macros.macros = QWERTY_MACROS
					to_chat(span("notice","已成功重置按键宏。"))
			else if(key == "AZERTY")
				var/confirm = input("确定要将按键宏切换为 AZERTY 布局吗？","AZERTY 按键宏","否") in confirmation_choices
				if(confirmation_choices[confirm] == "Yes")
					macros.macros = AZERTY_MACROS
					to_chat(span("notice","已成功将按键宏重置为 AZERTY 布局。"))
			else if(key == "new")
				var/new_key = input("要绑定哪个新按键？留空取消。","新按键绑定") as text | null
				if(new_key)
					var/new_command = input("要绑定哪个新命令？留空取消。","新命令绑定") as text | null
					if(new_command)
						macros.macros[new_key] = new_command
						to_chat(span("notice","已成功将新命令“[new_command]”绑定到按键“[new_key]”。"))
			else
				var/new_command = input("要将哪个命令绑定到“[key]”？留空移除绑定。","更改已有绑定") as text | null
				if(new_command)
					macros.macros[key] = new_command
					to_chat(span("notice","已成功将“[new_command]”绑定到“[key]”。"))
				else
					macros.macros -= key

			if(key != "quit")
				edit_macros()

		if(permissions & FLAG_PERMISSION_ADMIN)
			if("vars")	view_var_Topic(href,href_list,hsrc)
			if(href_list["var_edit_ref"])
				var/datum/actual_reference = locate(href_list["var_edit_ref"])
				if(actual_reference)
					var_edit(actual_reference)
			else if(href_list["var_edit_other"] && href_list["var_edit_other_ref"])
				var/datum/actual_reference = locate(href_list["var_edit_other_ref"])
				var/actual_key = href_list["var_edit_other"]
				change_variable(actual_reference,actual_key,null)
			else if(href_list["check_garbage"])
				var/confirm = input("Are you sure you to check the garbage of this ref? This process is very expensive.","Garbage Checker","Cancel") in list("Yes","No","Cancel")
				if(confirm == "Yes")
					var/datum/actual_reference = locate(href_list["check_garbage"])
					if(actual_reference)
						check_garbage(actual_reference)


		if(href_list["done_loading"])
			var/decoded = url_decode(href_list["done_loading"])
			send_load(src.mob,text2path(decoded))

	. = ..()

	next_allowed_topic = world.time + 1

