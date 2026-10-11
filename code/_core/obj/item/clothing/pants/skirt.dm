/obj/item/clothing/pants/skirt
	name = "短裙"
	icon = 'icons/obj/item/clothing/pants/skirt.dmi'

	desc = "让别人知道你是女性，或者程序员，或者两者都是。"
	desc_extended = "时尚的巅峰。"

	armor = /armor/cloth/summer

	dyeable = TRUE

	polymorphs = list(
		"skirt" = COLOR_WHITE
	)

	size = SIZE_2


	value = 10

/obj/item/clothing/pants/skirt/black
	polymorphs = list(
		"skirt" = COLOR_BLACK
	)

/obj/item/clothing/pants/skirt/nanotrasen_dark
	polymorphs = list(
		"skirt" = COLOR_NANOTRASEN_DARK
	)

/obj/item/clothing/pants/skirt/striped
	name = "条纹短裙"
	desc = "*挥手*"
	desc_extended = "女默剧演员最常穿的短裙。小心别被关进隐形箱子里。"
	polymorphs = list(
		"skirt" = COLOR_WHITE,
		"stripes" = COLOR_BLACK
	)

/obj/item/clothing/pants/skirt/grey
	name = "助理短裙"
	desc = "哎呀，不小心拿长矛戳到你了，嘻嘻！"
	desc_extended = "想当捣蛋鬼，又想捣蛋时显得可爱？穿这个吧。"
	polymorphs = list(
		"skirt" = COLOR_GREY
	)

/obj/item/clothing/pants/skirt/random/Generate()
	. = ..()
	for(var/k in polymorphs)
		polymorphs[k] = random_color()
