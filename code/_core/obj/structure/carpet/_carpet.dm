/obj/structure/carpet
	name = "地毯"
	desc = "掠夺者都嫉妒我的新地毯。"
	desc_extended = "温馨、舒适又漂亮。比较脆弱，可以被破坏。"
	icon = 'icons/obj/structure/carpet.dmi'
	icon_state = "preview"

	var/trim_icon_state
	var/trim_color = "#FFFFFF"
	var/pattern_icon_state
	var/pattern_color = "#FFFFFF"

	var/override_overlays = FALSE

	plane = PLANE_WIRE
	layer = LAYER_FLOOR_CARPET

	health = /health/construction/

	mouse_opacity = 0

	appearance_flags = PIXEL_SCALE | LONG_GLIDE | KEEP_TOGETHER

/obj/structure/carpet/on_destruction(var/damage = TRUE)
	. = ..()
	qdel(src)

/obj/structure/carpet/Finalize()
	. = ..()
	update_sprite()

/obj/structure/carpet/update_icon()
	. = ..()
	icon_state = "base"

/obj/structure/carpet/update_overlays()
	. = ..()

	if(!override_overlays)
		if(pattern_icon_state && pattern_color)
			var/image/I = new/image(icon,pattern_icon_state)
			I.color = pattern_color
			I.appearance_flags = src.appearance_flags | RESET_COLOR
			add_overlay(I)

		if(trim_icon_state && trim_color)
			for(var/d in DIRECTIONS_CARDINAL)
				var/obj/structure/carpet/C = locate() in get_step(src,d)
				if(C && C.type == src.type) continue
				var/image/I = new/image(icon,"[trim_icon_state]_[d]")
				I.color = trim_color
				I.appearance_flags = src.appearance_flags | RESET_COLOR
				add_overlay(I)

/obj/structure/carpet/red
	name = "红地毯"
	color = "#7C1717"

	trim_icon_state = "t1"
	trim_color = COLOR_GOLD
	pattern_icon_state = "p1"
	pattern_color = "#540F0F"


/obj/structure/carpet/blue
	name = "蓝地毯"
	color = "#17699B"

	trim_icon_state = "t1"
	trim_color = "#2F5797"
	pattern_icon_state = "p1"
	pattern_color = "#3E7497"

/obj/structure/carpet/blue/royal
	name = "蓝色皇家地毯"
	color = "#173B7A"

	trim_icon_state = "t1"
	trim_color = COLOR_GOLD
	pattern_icon_state = "p2"
	pattern_color = "#17697A"

/obj/structure/carpet/blue/magic
	name = "魔法地毯"
	color = "#3E32AD"

	trim_icon_state = "t1"
	trim_color = "#D3A741"
	pattern_icon_state = "p1"
	pattern_color = "#6F69AA"

/obj/structure/carpet/brown
	name = "棕色地毯"
	color = "#7F3300"

	trim_icon_state = "t1"
	trim_color = COLOR_GOLD
	pattern_icon_state = "p3"
	pattern_color = "#AE4600"


/obj/structure/carpet/command
	name = "指挥部地毯"
	color = COLOR_COMMAND

	trim_icon_state = "t1"
	trim_color = COLOR_GOLD
	pattern_icon_state = "p3"
	pattern_color = COLOR_BLUE



/obj/structure/carpet/grey
	name = "灰色地毯"
	color = COLOR_GREY_DARK

	trim_icon_state = "t2"
	trim_color = COLOR_BLACK
	pattern_icon_state = "p2"
	pattern_color = COLOR_GREY
