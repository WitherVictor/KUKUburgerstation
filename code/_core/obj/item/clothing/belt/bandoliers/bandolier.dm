/obj/item/clothing/belt/bandoliers/bandolier
	name = "错误弹药带"
	desc = "献给立志横扫战场的人。"
	desc_extended = "朴素的弹药带，可存放多发霰弹枪弹药。手持弹药时，用ALT+单击可再取出一发同类弹药。"

	icon = 'icons/obj/item/clothing/belts/bandolier_12.dmi'
	worn_layer = LAYER_MOB_CLOTHING_COAT_OVER
	dyeable = TRUE


	value = 0
	size = SIZE_3

	stored_bullets = list()

	bullet_count = 0
	max_bullets = 0
	bullet_type = /obj/item/bullet_cartridge

	num_overlays = 5

/obj/item/clothing/belt/bandoliers/get_base_value()
	return max_bullets*3

/obj/item/clothing/belt/bandoliers/bandolier/shotgun_12
	name = "12号霰弹枪弹药带"
	desc_extended = "朴素的弹药带，最多可存放100发12号霰弹枪弹药。ALT+单击取出一把弹药，单击只取一发。"
	icon = 'icons/obj/item/clothing/belts/bandolier_12.dmi'
	max_bullets = 100
	bullet_type = /obj/item/bullet_cartridge/shotgun_12
	value = 1 //Dummy value.

/obj/item/clothing/belt/bandoliers/bandolier/shotgun_20
	name = "20号霰弹枪弹药带"
	desc_extended = "染色弹药带，最多可存放120发20号霰弹枪弹药。ALT+单击取出一把弹药，单击只取一发。"
	icon = 'icons/obj/item/clothing/belts/bandolier_20.dmi'
	max_bullets = 120
	bullet_type = /obj/item/bullet_cartridge/shotgun_20
	value = 1 //Dummy value.

/obj/item/clothing/belt/bandoliers/bandolier/shotgun_23
	name = "23x75mmR霰弹枪弹药带"
	desc_extended = "库存旧式弹药带，最多可存放80发23x75mmR霰弹枪弹药。ALT+单击取出一把弹药，单击只取一发。"
	icon = 'icons/obj/item/clothing/belts/bandolier_23.dmi'
	max_bullets = 80
	bullet_type = /obj/item/bullet_cartridge/shotgun_23
	value = 1 //Dummy value.
