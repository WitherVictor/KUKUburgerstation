/obj/item/clothing/shirt/normal
	name = "T恤"
	desc = "一件T恤。"
	desc_extended = "大概是宇宙中最普通的衣服了。"
	icon = 'icons/obj/item/clothing/shirts/normal.dmi'

	item_slot = SLOT_TORSO

	armor = /armor/cloth

	dyeable = TRUE

	polymorphs = list(
		"shirt" = COLOR_WHITE
	)

	value = 1


/obj/item/clothing/shirt/normal/priest
	polymorphs = list(
		"shirt" = COLOR_GREY_DARK
	)

/obj/item/clothing/shirt/normal/striped
	name = "条纹上衣"
	desc = "满是条纹！"
	desc_extended = "斯卡舞者、默剧演员和古怪角色扮演游戏主角的首选上衣。"
	polymorphs = list(
		"shirt" = COLOR_WHITE,
		"stripes" = COLOR_BLACK
	)

/obj/item/clothing/shirt/normal/striped/zombie_clown
	polymorphs = list(
		"shirt" = COLOR_WHITE,
		"stripes" = COLOR_BLOOD
	)

/obj/item/clothing/shirt/normal/uniform
	name = "制服上衣"
	desc = "循规蹈矩也很酷。"
	desc_extended = "讨厌周五便装日的人最喜欢的上衣。"
	polymorphs = list(
		"shirt" = COLOR_WHITE,
		"shoulders" = COLOR_BLACK
	)

/obj/item/clothing/shirt/normal/uniform/nanotrasen
	polymorphs = list(
		"shirt" = COLOR_NANOTRASEN,
		"shoulders" = COLOR_WHITE
	)


/obj/item/clothing/shirt/normal/uniform/engineering
	polymorphs = list(
		"shirt" = COLOR_ENGINEERING,
		"shoulders" = COLOR_VISIBLE_GREEN
	)

/obj/item/clothing/shirt/normal/uniform/science
	name = "科研制服上衣"
	desc = "书呆子。"
	desc_extended = "讨厌周五便装日的人最喜欢的上衣。"
	polymorphs = list(
		"shirt" = COLOR_WHITE,
		"shoulders" = COLOR_SCIENCE
	)

/obj/item/clothing/shirt/normal/uniform/botanty
	polymorphs = list(
		"shirt" = COLOR_BLUE,
		"shoulders" = COLOR_GREEN
	)

/obj/item/clothing/shirt/normal/uniform/janitor
	polymorphs = list(
		"shirt" = COLOR_GREY,
		"shoulders" = COLOR_JANITOR
	)

/obj/item/clothing/shirt/normal/uniform/chemistry
	polymorphs = list(
		"shirt" = COLOR_WHITE,
		"shoulders" = COLOR_CHEMISTRY
	)

/obj/item/clothing/shirt/normal/tee
	polymorphs = list(
		"shirt_tee" = COLOR_WHITE
	)

/obj/item/clothing/shirt/normal/tee/soccer
	polymorphs = list(
		"shirt_tee" = COLOR_WHITE,
		"shoulders" = COLOR_BLACK
	)

/obj/item/clothing/shirt/normal/tee/soccer/red
	polymorphs = list(
		"shirt_tee" = COLOR_RED,
		"shoulders" = COLOR_WHITE
	)

/obj/item/clothing/shirt/normal/tee/soccer/blue
	polymorphs = list(
		"shirt_tee" = COLOR_BLUE,
		"shoulders" = COLOR_BLACK
	)

/obj/item/clothing/shirt/normal/tee/cargo
	polymorphs = list(
		"shirt_tee" = COLOR_CARGO,
		"shoulders" = COLOR_GOLD
	)

/obj/item/clothing/shirt/normal/tee/engineering/solarian
	polymorphs = list(
		"shirt_tee" = "#B59463",
	)

/obj/item/clothing/shirt/normal/tee/soccer/ref
	polymorphs = list(
		"shirt_tee" = COLOR_YELLOW,
	)


/obj/item/clothing/shirt/normal/recruit
	polymorphs = list(
		"shirt" = COLOR_RECRUIT_LIGHT,
	)

/obj/item/clothing/shirt/normal/ancient_security
	name = "古早安保上衣"
	desc = "红衫炮灰！"
	desc_extended = "一款早已过时的安保上衣。"
	polymorphs = list(
		"shirt" = COLOR_CRIMSON,
	)

/obj/item/clothing/shirt/normal/medical
	name = "医疗上衣"
	desc = "闻起来很干净。"
	desc_extended = "经过细致消毒的医护服，看起来有人格外费心地洗净了所有血迹。"
	polymorphs = list(
		"shirt" = COLOR_MEDICAL_LIGHT
	)


/obj/item/clothing/shirt/normal/grey
	name = "助理上衣"
	desc = "捣蛋鬼的首选。"
	desc_extended = "灰潮标志性的上衣。"
	polymorphs = list(
		"shirt" = COLOR_GREY
	)

/obj/item/clothing/shirt/normal/military_green
	name = "军用上衣"
	desc = "这里没有污渍。"
	desc_extended = "革命军标志性的上衣。"
	polymorphs = list(
		"shirt" = COLOR_GREY
	)

/obj/item/clothing/shirt/normal/janitor
	name = "清洁工上衣"
	desc = "浓浓的清洁工气息扑面而来。"
	desc_extended = "一件紫得不能再紫的上衣。"
	polymorphs = list(
		"shirt" = COLOR_JANITOR,
	)

/obj/item/clothing/shirt/normal/reinforced
	name = "加固上衣"
	icon = 'icons/obj/item/clothing/shirts/reinforced.dmi'

	armor = /armor/cloth/hard

	rarity = RARITY_UNCOMMON

/obj/item/clothing/shirt/normal/reinforced/ntops
	name = "NT行动人员加固上衣"
	polymorphs = list(
		"shirt" = COLOR_WHITE,
		"shoulders" = COLOR_BLACK
	)

/obj/item/clothing/shirt/normal/reinforced/merc
	name = "佣兵加固上衣"
	polymorphs = list(
		"shirt_tee" = COLOR_OLIVE_DRAB
	)

/obj/item/clothing/shirt/normal/reinforced/space_soldier
	polymorphs = list(
		"shirt_tee" = COLOR_BLACK
	)

/obj/item/clothing/shirt/normal/reinforced/merc_alt
	polymorphs = list(
		"shirt_tee" = "#626C65"
	)

/obj/item/clothing/shirt/normal/random/Generate()
	. = ..()
	for(var/k in polymorphs)
		polymorphs[k] = random_color()


/obj/item/clothing/shirt/normal/reinforced/abductor
	name = "绑架者加固上衣"
	polymorphs = list(
		"shirt_tee" = "#62869E"
	)

/obj/item/clothing/shirt/normal/reinforced/mining
	polymorphs = list(
		"shirt" = "#717261",
		"shoulders" = COLOR_MINING
	)


