/obj/structure/wip
	name = "施工中"
	desc = "这个区域仍在施工。"
	desc_extended = "你好，看到这个标志就说明此处仍在施工，暂时没什么可玩的。除非你想体验一片空白，否则请回头。"

	icon = 'icons/debug/work_in_progress.dmi'
	icon_state = "WIP"

	plane = PLANE_WALL

	pixel_x = -16
	pixel_y = -16


/obj/structure/wip/main
	name = "天啊，卧槽"
	desc = "我的沉浸感啊"
	icon = 'icons/meme.dmi'
	icon_state = "unga"

	plane = PLANE_ALWAYS_VISIBLE



/obj/structure/wip/meme
	name = "哇哦"
	desc = "他妈的什么都没有。"
	desc_extended = "想象一下：建了一个区域，然后里面什么都没放。"
	icon = 'icons/meme2.dmi'
	icon_state = "nothing"
	pixel_x = 16-55
	pixel_y = 16-45
