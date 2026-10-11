/obj/item/shell
	name = "贝壳"
	desc = "海边的贝壳，你看见了没？"
	desc_extended = "色彩漂亮的贝壳，除了卖钱也没什么用。"

	icon = 'icons/obj/item/shell.dmi'
	icon_state = "shell1"

	value = 50

/obj/item/shell/Generate()
	. = ..()
	icon_state = "shell[rand(1,3)]"
	color = random_color()
