/obj/item/clothing/underbottom/underwear
	name = "内裤"
	desc = "用来遮住你的私密部位。"
	desc_extended = "一条普通内裤。"

	size = SIZE_1


/obj/item/clothing/underbottom/underwear/boxers
	name = "平角内裤"
	desc = "穿在普通裤子里面的小裤子。"
	desc_extended = "一条普通的平角内裤。"
	icon = 'icons/obj/item/clothing/underwear/boxers_new.dmi'
	flags_clothing = FLAG_CLOTHING_NOBEAST_FEET

	dyeable = TRUE

	value = 10

/obj/item/clothing/underbottom/underwear/boxers/random/Generate()
	color = random_color()
	return ..()

/obj/item/clothing/underbottom/underwear/boxers/nanotrasen
	color = COLOR_NANOTRASEN

/obj/item/clothing/underbottom/underwear/boxers/engineering
	color = COLOR_ENGINEERING

/obj/item/clothing/underbottom/underwear/boxers/janitor
	color = COLOR_JANITOR

/obj/item/clothing/underbottom/underwear/boxers/medical
	color = COLOR_MEDICAL

/obj/item/clothing/underbottom/underwear/boxers/syndicate
	color = COLOR_CRIMSON

/obj/item/clothing/underbottom/underwear/boxers/heart
	name = "爱心平角内裤"
	desc = "懒汉的经典款。"
	desc_extended = "一条印有爱心图案的平角内裤。"
	icon = 'icons/obj/item/clothing/underwear/heart_boxers.dmi'

/obj/item/clothing/underbottom/underwear/long_johns
	name = "秋裤"
	desc = "虽然有点老派，但穿着舒服。"
	desc_extended = "一条很长的贴身内裤。"
	icon = 'icons/obj/item/clothing/underwear/long_john.dmi'
	flags_clothing = FLAG_CLOTHING_NOBEAST_FEET

	armor = /armor/cloth

	dyeable = TRUE

	value = 30

/obj/item/clothing/underbottom/underwear/long_johns/grey
	color = "#888888"

/obj/item/clothing/underbottom/underwear/panty
	icon = 'icons/obj/item/clothing/underwear/panty.dmi'
	desc = "女性、女装男孩和程序员共同的选择。"
	desc_extended = "一条窄小的内裤。"

	dyeable = TRUE

	value = 10


/obj/item/clothing/underbottom/underwear/panty/pink
	color = "#ff66ff"

/obj/item/clothing/underbottom/underwear/panty/brown
	color = "#603A20"

/obj/item/clothing/underbottom/underwear/panty/red
	color = "#C60000"

/obj/item/clothing/underbottom/underwear/panty/random/Generate()
	color = random_color()
	return ..()

/obj/item/clothing/underbottom/underwear/panty/neko
	name = "诅咒猫咪内裤"
	desc = "谁他妈弄的，这他妈是什么。"
	desc_extended = "为什么。"
	icon = 'icons/obj/item/clothing/underwear/neko_panty.dmi'

	value = 500

/obj/item/clothing/underbottom/underwear/thong
	name = "丁字裤"
	desc = "勉强算条内裤。"
	desc_extended = "大概刚好够得上法律对内裤的最低要求。"
	icon = 'icons/obj/item/clothing/underwear/thong.dmi'
	color = COLOR_WHITE

	dyeable = TRUE

	dyeable = TRUE

	value = 30

/obj/item/clothing/underbottom/underwear/loincloth
	name = "兜裆布"
	desc = "应急内裤。"
	desc_extended = "没有缝纫工具时，用这个凑合吧。"
	icon = 'icons/obj/item/clothing/underwear/loincloth.dmi'

	value = 5


/obj/item/clothing/underbottom/underwear/loincloth/brown
	color = "#603A20"

/obj/item/clothing/underbottom/underwear/loincloth/red
	color = "#8E0000"


