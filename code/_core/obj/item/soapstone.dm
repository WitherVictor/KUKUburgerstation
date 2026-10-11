/obj/item/soapstone/ //Rare drops from bosses.
	name = "留言皂石"
	desc = "留下一段话，等待他人发现。"
	desc_extended = "可在地板上写下一条跨回合保存的留言，使用后消失。声明：不能当肥皂用。"
	icon = 'icons/obj/item/soapstone.dmi'
	icon_state = "inventory"
	dir = NORTH
	var/cooldown = 0
	color = "#FFFFFF"

	value = 1000
	value_burgerbux = 10

	weight = 0.5

	rarity = RARITY_MYTHICAL

/obj/item/soapstone/Finalize()
	. = ..()
	update_sprite()

/obj/item/soapstone/orange
	color = "#FF6A00"

/obj/item/soapstone/red
	color = "#880000"

/obj/item/soapstone/yellow
	color = "#888800"

/obj/item/soapstone/blue
	color = "#0094FF"

/obj/item/soapstone/green
	color = "#527F46"

/obj/item/soapstone/update_icon()
	. = ..()
	icon = initial(icon)
	icon_state = "stone"

/obj/item/soapstone/update_overlays()
	. = ..()
	var/image/I2 = new/image(icon,"rope")
	I2.appearance_flags = src.appearance_flags
	add_overlay(I2)
	var/image/I3 = new/image(icon,"fade")
	I3.appearance_flags = src.appearance_flags
	add_overlay(I3)

/obj/item/soapstone/click_on_object(var/mob/activator as mob,var/atom/object,location,control,params)

	INTERACT_CHECK
	INTERACT_CHECK_OBJECT
	INTERACT_DELAY(10)

	if(!is_floor(object))
		activator.to_chat(span("warning","这里不是地板，不能留言！"))
		return TRUE

	var/turf/T = object

	var/obj/structure/interactive/soapstone_message/existing_message = locate() in T //Copied from /tg/
	if(existing_message)
		activator.to_chat(span("warning","这里已经有留言了，不能再写！"))
		return TRUE

	var/input_text = input("你想留下什么话？") as text|null

	input_text = police_text(activator.client,input_text,check_characters=TRUE)

	if(!input_text)
		return TRUE

	var/date = get_date()
	var/time = get_time()

	SSsoapstone.create_new_soapstone(T,get_dir(activator,object),color,activator.name,activator.ckey,input_text,date,time)

	activator.visible_message(\
		span("notice","[activator.name]用留言皂石在[T.name]上写下了一段话。"),\
		span("notice","你在[T.name]上写下最后一个字后，留言皂石在你手中渐渐消失。")\
	)

	qdel(src)

	return TRUE
