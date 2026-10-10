/obj/item/container/simple/beaker/bottle
	name = "小药瓶"
	desc = "喝之前记得看标签。"
	desc_extended = "化学家用来存放药物和其他试剂的瓶子。"
	icon = 'icons/obj/item/container/cup/bottle.dmi'
	icon_state = "bottle"
	icon_count = 8

	reagents = /reagent_container/beaker/bottle/

	value = 3

	size = SIZE_1


/obj/item/container/simple/beaker/bottle/bicaridine
	name = "比卡利定药瓶"

/obj/item/container/simple/beaker/bottle/bicaridine/Generate()
	reagents.add_reagent(/reagent/medicine/bicaridine,reagents.volume_max)
	return ..()

/obj/item/container/simple/beaker/bottle/dylovene
	name = "地洛文药瓶"

/obj/item/container/simple/beaker/bottle/dylovene/Generate()
	reagents.add_reagent(/reagent/medicine/dylovene,reagents.volume_max)
	return ..()

/obj/item/container/simple/beaker/bottle/kelotane
	name = "克罗烷药瓶"

/obj/item/container/simple/beaker/bottle/kelotane/Generate()
	reagents.add_reagent(/reagent/medicine/kelotane,reagents.volume_max)
	return ..()


/obj/item/container/simple/beaker/bottle/epinephrine
	name = "急救肾上腺素药瓶"

/obj/item/container/simple/beaker/bottle/epinephrine/Generate()
	reagents.add_reagent(/reagent/medicine/adrenaline/epinephrine,reagents.volume_max)
	return ..()

/obj/item/container/simple/beaker/bottle/calomel
	name = "甘汞药瓶"

/obj/item/container/simple/beaker/bottle/calomel/Generate()
	reagents.add_reagent(/reagent/medicine/purge,reagents.volume_max)
	return ..()

/obj/item/container/simple/beaker/bottle/morphine
	name = "吗啡药瓶"

/obj/item/container/simple/beaker/bottle/morphine/Generate()
	reagents.add_reagent(/reagent/medicine/painkiller/morphine,reagents.volume_max)
	return ..()

/obj/item/container/simple/beaker/bottle/antihol
	name = "解酒剂药瓶"

/obj/item/container/simple/beaker/bottle/antihol/Generate()
	reagents.add_reagent(/reagent/medicine/antihol,reagents.volume_max)
	return ..()

/obj/item/container/simple/beaker/bottle/charcoal
	name = "活性炭药瓶"

/obj/item/container/simple/beaker/bottle/charcoal/Generate()
	reagents.add_reagent(/reagent/medicine/charcoal,reagents.volume_max)
	return ..()

/obj/item/container/simple/beaker/bottle/health_potion
	name = "治疗药水"

/obj/item/container/simple/beaker/bottle/health_potion/Generate()
	reagents.add_reagent(/reagent/medicine/health_potion,reagents.volume_max)
	return ..()

/obj/item/container/simple/beaker/bottle/stamina_potion
	name = "体力药水"

/obj/item/container/simple/beaker/bottle/stamina_potion/Generate()
	reagents.add_reagent(/reagent/medicine/stamina_potion,reagents.volume_max)
	return ..()

/obj/item/container/simple/beaker/bottle/mana_potion
	name = "法力药水"

/obj/item/container/simple/beaker/bottle/mana_potion/Generate()
	reagents.add_reagent(/reagent/medicine/mana_potion,reagents.volume_max)
	return ..()

/obj/item/container/simple/beaker/bottle/plant_food
	name = "易养营养液瓶"

/obj/item/container/simple/beaker/bottle/plant_food/Generate()
	reagents.add_reagent(/reagent/nutrition/plant_food,reagents.volume_max)
	return ..()



/obj/item/container/simple/beaker/glass
	name = "玻璃杯"
	desc = "干杯！"
	desc_extended = "可以用来盛饮料。"
	icon = 'icons/obj/item/container/cup/glass.dmi'
	icon_state = "glass"
	icon_count = 12

	reagents = /reagent_container/beaker/drink/

	value = 10

	pixel_y = 4

/obj/item/container/simple/beaker/glass/get_consume_size(var/mob/living/L)
	return ..() * 2

/obj/item/container/simple/beaker/shot
	name = "烈酒小杯"
	desc = "一口闷！"
	desc_extended = "可以用来盛饮料。"
	icon = 'icons/obj/item/container/cup/glass_shot.dmi'
	icon_state = "glass"
	icon_count = 9

	reagents = /reagent_container/beaker/shot_glass/

	value = 5

	pixel_y = 4

/obj/item/container/simple/beaker/shot/get_consume_size(var/mob/living/L)
	return reagents.volume_max

/obj/item/container/simple/beaker/bowl
	name = "玻璃搅拌碗"
	desc = "满足你各种烘焙需求的碗。"
	desc_extended = "可以用来调配烘焙原料。"
	icon = 'icons/obj/item/container/cup/bowl.dmi'
	icon_state = "bowl"
	icon_count = 23

	reagents = /reagent_container/beaker/large/

	value = 25

/obj/item/container/simple/beaker/flask
	name = "金属酒壶"
	desc = "随身携带的酗酒借口。"
	desc_extended = "用于盛装液体的圆形金属酒壶。看起来很酷。"
	icon = 'icons/obj/item/container/cup/flask.dmi'
	icon_state = "flask"
	icon_count = 1

	reagents = /reagent_container/beaker/bottle/medium

	value = 250

	size = SIZE_2

/obj/item/container/simple/beaker/flask/get_consume_size(var/mob/living/L)
	return ..() * 3

/obj/item/container/simple/beaker/flask/Generate()
	reagents.add_reagent(/reagent/nutrition/water,reagents.volume_max)
	return ..()

/obj/item/container/simple/beaker/flask/russian
	name = "带套酒壶"
	desc = "舒舒服服，随时酗酒。"
	desc_extended = "套着帆布套的方形金属酒壶，用于盛装液体。说不定你能一口喝光！"
	icon_state = "russian_flask"

	reagents = /reagent_container/beaker/bottle/large

	value = 450

/obj/item/container/simple/beaker/flask/russian/get_consume_size(var/mob/living/L)
	return ..() * 4

/obj/item/container/simple/beaker/flask/engraved
	name = "雕花酒壶"
	desc = "漂漂亮亮，随时酗酒。"
	desc_extended = "刻着卡通脸的方形金属酒壶，用于盛装液体。说不定你能一口喝光！"
	icon_state = "face_flask"

	reagents = /reagent_container/beaker/bottle/large

	value = 450

/obj/item/container/simple/beaker/flask/engraved/get_consume_size(var/mob/living/L)
	return ..() * 4

/obj/item/container/simple/beaker/flask/onion
	name = "洋葱酒壶"
	desc = "层层递进，随时酗酒。"
	desc_extended = "用于盛装液体的圆形金属酒壶，形似洋葱，壶口很窄。虽然外观普通、个头也比多数酒壶小，但生存专家的精湛工艺让它的容量远超其他酒壶。不过，狭窄的壶口也让你每口只能喝到较少的液体。"
	icon_state = "onion_flask"

	reagents = /reagent_container/beaker/large

	value = 600

	size = SIZE_1
