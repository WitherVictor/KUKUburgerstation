/obj/item/container/edible/pill/bicaridine
	name = "比卡利定药片（5单位）"

/obj/item/container/edible/pill/bicaridine/Generate()
	reagents.add_reagent(/reagent/medicine/bicaridine,5)
	return ..()

/obj/item/container/edible/pill/kelotane
	name = "克罗烷药片（5单位）"

/obj/item/container/edible/pill/kelotane/Generate()
	reagents.add_reagent(/reagent/medicine/kelotane,5)
	return ..()

/obj/item/container/edible/pill/dylovene
	name = "地洛文药片（5单位）"

/obj/item/container/edible/pill/dylovene/Generate()
	reagents.add_reagent(/reagent/medicine/dylovene,5)
	return ..()

/obj/item/container/edible/pill/calomel
	name = "甘汞药片（5单位）"

/obj/item/container/edible/pill/calomel/Generate()
	reagents.add_reagent(/reagent/medicine/purge,5)
	return ..()

/obj/item/container/edible/pill/charcoal
	name = "活性炭药片（5单位）"

/obj/item/container/edible/pill/charcoal/Generate()
	reagents.add_reagent(/reagent/medicine/charcoal,5)
	return ..()

/obj/item/container/edible/pill/iron
	name = "铁剂药片（10单位）"

/obj/item/container/edible/pill/iron/Generate()
	reagents.add_reagent(/reagent/iron,10)
	return ..()

/obj/item/container/edible/pill/space_drugs
	name = "太空迷幻药（5单位）"
	icon_state = "circle"

/obj/item/container/edible/pill/space_drugs/Generate()
	reagents.add_reagent(/reagent/drug/space,5)
	return ..()


/obj/item/container/edible/pill/space_dust
	name = "太空自由之尘（10单位）"
	icon_state = "circle"

/obj/item/container/edible/pill/space_dust/Generate()
	reagents.add_reagent(/reagent/drug/liberty_dust,10)
	return ..()


/obj/item/container/edible/pill/omnizine
	name = "全能灵药药片（10单位）"

/obj/item/container/edible/pill/omnizine/Generate()
	reagents.add_reagent(/reagent/medicine/omnizine,10)
	return ..()

/obj/item/container/edible/pill/potassium_iodide
	name = "碘化钾药片（10单位）"

/obj/item/container/edible/pill/potassium_iodide/Generate()
	reagents.add_reagent(/reagent/medicine/potassium_iodide,10)
	return ..()

/obj/item/container/edible/pill/antihol
	name = "解酒剂药片（10单位）"

/obj/item/container/edible/pill/antihol/Generate()
	reagents.add_reagent(/reagent/medicine/antihol,10)
	return ..()

/obj/item/container/edible/pill/assprin
	name = "屁司匹林药片（5单位）"

/obj/item/container/edible/pill/assprin/Generate()
	reagents.add_reagent(/reagent/medicine/painkiller/assprin,5)
	return ..()

/obj/item/container/edible/pill/space_prussian_blue
	name = "太空普鲁士蓝（10单位）"

/obj/item/container/edible/pill/space_prussian_blue/Generate()
	reagents.add_reagent(/reagent/medicine/space_prussian_blue,10)
	return ..()

/obj/item/container/edible/pill/chlorine
	name = "氯片（5单位）"
	desc_extended = "片剂形式的氯，用于溶入烧杯或其他化学容器。最好别吃。"
	icon_state = "circle"

/obj/item/container/edible/pill/chlorine/Generate()
	reagents.add_reagent(/reagent/chlorine,5)
	return ..()

/obj/item/container/edible/pill/carbon
	name = "碳片（5单位）"
	desc_extended = "片剂形式的碳，用于溶入烧杯或其他化学容器。最好别吃。"
	icon_state = "circle"

/obj/item/container/edible/pill/carbon/Generate()
	reagents.add_reagent(/reagent/carbon,5)
	return ..()
