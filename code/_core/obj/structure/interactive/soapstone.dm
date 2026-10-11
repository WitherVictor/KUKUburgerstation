obj/structure/interactive/soapstone_message
	name = "皂石留言"
	desc = "前方有捷径。"
	desc_extended = "一位旅人留下的话。"
	icon = 'icons/obj/structure/soapstone.dmi'
	icon_state = "message"
	anchored = TRUE

	var/owner
	var/ckey
	var/soapstone_text
	var/date
	var/time

	alpha = 180

	layer = LAYER_FLOOR_DECAL

/obj/structure/interactive/soapstone_message/New(var/desired_loc)
	. = ..()

/obj/structure/interactive/soapstone_message/Finalize()
	. = ..()
	update_sprite()

obj/structure/interactive/soapstone_message/update_icon()

	. = ..()

	if(icon_state == "death")
		name = "诅咒留言"
		alpha = 255
		desc = "来自坟墓彼端的BYOND之声。"
		desc_extended = "这里记录着一位被自己人杀害的亡魂的遗言。<br>它低语道：‘[soapstone_text]……’"
		color = "#FFFFFF"
	else
		desc_extended = "上面写着：‘[soapstone_text]’<br>署名：[owner]。"
