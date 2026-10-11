/obj/item/clothing/feet/socks/
	name = "袜子"
	desc = "别他妈穿着袜子配凉鞋，不然我弄死你。"
	desc_extended = "一只袜子，左右脚都能穿。"
	icon_state = "inventory"
	icon_state_worn = "worn"
	flags_clothing = FLAG_CLOTHING_NOBEAST_FEET
	worn_layer = LAYER_MOB_CLOTHING_SOCKS
	item_slot = SLOT_FOOT
	item_slot_mod = SLOT_MOD_RIGHT | SLOT_MOD_LEFT

	ignore_other_slots = TRUE

	slot_icons = TRUE

	protected_limbs = list(BODY_FOOT_RIGHT,BODY_FOOT_LEFT)

	dyeable = TRUE

	armor = /armor/cloth/reduced

	size = SIZE_0

	speed_bonus = 0.05

	item_slot_layer = 1

	uses_until_condition_fall = 150

	save_on_death = TRUE



/obj/item/clothing/feet/socks/ankle
	name = "短袜"
	icon = 'icons/obj/item/clothing/socks/normal.dmi'
	polymorphs = null

	value = 3

/obj/item/clothing/feet/socks/knee
	name = "及膝袜"
	icon = 'icons/obj/item/clothing/socks/knee.dmi'
	polymorphs = list(
		"sock" = COLOR_WHITE
	)

	value = 3

/obj/item/clothing/feet/socks/knee/striped
	polymorphs = list(
		"sock" = COLOR_WHITE,
		"stripes" = COLOR_GREY
	)

/obj/item/clothing/feet/socks/knee/striped/scottish
	polymorphs = list(
		"sock" = "#53512A",
		"stripes" = "#32321B"
	)

	value = 3

/obj/item/clothing/feet/socks/thigh/
	name = "过膝长袜"
	icon = 'icons/obj/item/clothing/socks/programmer.dmi'

	value = 10

	polymorphs = list(
		"sock" = COLOR_WHITE
	)

/obj/item/clothing/feet/socks/thigh/striped/
	polymorphs = list(
		"sock" = COLOR_WHITE,
		"stripes" = COLOR_GREY
	)

/obj/item/clothing/feet/socks/thigh/striped/pink
	name = "程序员长袜"

	polymorphs = list(
		"sock" = COLOR_WHITE,
		"stripes" = "#FFBFEC"
	)

/obj/item/clothing/feet/socks/thigh/striped/bee
	name = "蜜蜂条纹长袜"

	polymorphs = list(
		"sock" = COLOR_BLACK,
		"stripes" = "#F7DD5D"
	)
