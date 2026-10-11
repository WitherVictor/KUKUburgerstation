/obj/item/color/crayon/
	name = "蜡笔"
	icon = 'icons/obj/items/color/crayons.dmi'
	icon_state = "crayon"
	uses = 20

/obj/item/color/crayon/New(var/desired_loc)
	..()
	update_icon()

/obj/item/color/crayon/update_icon()
	..()
	color = selected_color

/obj/item/color/crayon/blue
	name = "蓝色蜡笔"
	selected_color = "#0000FF"

/obj/item/color/crayon/red
	name = "红色蜡笔"
	selected_color = "#FF0000"

/obj/item/color/crayon/orange
	name = "橙色蜡笔"
	selected_color = "#FF8800"

/obj/item/color/crayon/brown
	name = "棕色蜡笔"
	selected_color = "#7F4A00"

/obj/item/color/crayon/dev
	name = "开发者蜡笔"
	uses = 99999

/obj/item/color/crayon/green
	name = "绿色蜡笔"
	selected_color = "#00FF00"

/obj/item/color/crayon/dev/get_selected_color(var/mob/caller)
	return input(caller,"你想使用什么颜色？","选择颜色","#FFFFFF") as color|null
