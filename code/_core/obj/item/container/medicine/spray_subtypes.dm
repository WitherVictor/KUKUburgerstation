/obj/item/container/spray/silver_sulfadiazine
	name = "医疗喷雾（磺胺嘧啶银）"
	color = "#FFBD7F"
	glass_color = "#FFFF00"

/obj/item/container/spray/silver_sulfadiazine/Generate()
	reagents.add_reagent(/reagent/medicine/silver_sulfadiazine,60)
	return ..()

/obj/item/container/spray/mustard
	name = "医疗喷雾（芥末酱）"
	color = "#FFBD7F"
	glass_color = "#FFFF00"

/obj/item/container/spray/mustard/Generate()
	reagents.add_reagent(/reagent/nutrition/mustard,60)
	return ..()

/obj/item/container/spray/styptic_powder
	name = "医疗喷雾（止血粉）"
	color = "#FF7F7F"
	glass_color = "#FF0000"

/obj/item/container/spray/styptic_powder/Generate()
	reagents.add_reagent(/reagent/medicine/styptic_powder,60)
	return ..()

/obj/item/container/spray/ketchup
	name = "医疗喷雾（番茄酱）"
	color = "#FF7F7F"
	glass_color = "#FF0000"

/obj/item/container/spray/ketchup/Generate()
	reagents.add_reagent(/reagent/nutrition/tomato,60)
	return ..()

/obj/item/container/spray/synthflesh
	name = "医疗喷雾（合成血肉）"
	color = "#FFEBEB"
	glass_color = "#FFFFFF"

/obj/item/container/spray/synthflesh/Generate()
	reagents.add_reagent(/reagent/medicine/synthflesh,60)
	return ..()
