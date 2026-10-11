/obj/item/clothing/undertop/underwear/
	name = "内搭上衣"
	desc = "穿在上衣里面的衣服。"
	desc_extended = "外面也可以不再穿上衣，只是那样看起来像个傻子，或者澳大利亚人。"
	size = SIZE_2


/obj/item/clothing/undertop/underwear/bra
	name = "胸罩"
	desc = "为需要额外支撑的部位提供支撑。"
	desc_extended = "胸罩的英文简称是BRA，可不是“战斗就绪护甲”（Battle Ready Armor）的缩写。"
	icon = 'icons/obj/item/clothing/underwear/bra.dmi'

	dyeable = TRUE

	value = 10

/obj/item/clothing/undertop/underwear/bra/alt
	icon = 'icons/obj/item/clothing/underwear/bra_alt.dmi'

/obj/item/clothing/undertop/underwear/bra/alt/black
	color = "#111111"

/obj/item/clothing/undertop/underwear/bra/alt/red
	color = "#8E0000"

/obj/item/clothing/undertop/underwear/bra/strapless
	icon = 'icons/obj/item/clothing/underwear/bra_strapless.dmi'

/obj/item/clothing/undertop/underwear/bra/strapless/brown
	color = "#603A20"

/obj/item/clothing/undertop/underwear/bra/sport
	icon = 'icons/obj/item/clothing/underwear/bra_sports.dmi'

/obj/item/clothing/undertop/underwear/bra/sport/pink
	color = "#FF9BC6"

/obj/item/clothing/undertop/underwear/bra/pink
	color = "#ff66ff"

/obj/item/clothing/undertop/underwear/bra/red
	color = "#8E0000"

/obj/item/clothing/undertop/underwear/bra/brown
	color = "#603A20"

/obj/item/clothing/undertop/underwear/bra/random/Generate()
	color = random_color()
	return ..()

/obj/item/clothing/undertop/underwear/bra/neko
	name = "诅咒猫咪胸罩"
	desc = "谁他妈弄的，这他妈是什么。"
	desc_extended = "为什么。"
	icon = 'icons/obj/item/clothing/underwear/neko_bra.dmi'

	value = 500

/obj/item/clothing/undertop/underwear/shirt
	desc = "汗衫。"
	desc_extended = "在公共场合单穿这个，比只穿胸罩稍微像样一点。"
	icon = 'icons/obj/item/clothing/underwear/undershirt.dmi'

	dyeable = TRUE

	value = 20

/obj/item/clothing/undertop/underwear/shirt/black
	color = COLOR_BLACK

/obj/item/clothing/undertop/underwear/shirt/random/Generate()
	color = random_color()
	return ..()
