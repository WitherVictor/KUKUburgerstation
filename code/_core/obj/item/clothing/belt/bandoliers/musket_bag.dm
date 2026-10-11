/obj/item/clothing/belt/bandoliers/musket_bag
	name = "火枪弹药袋"
	desc = "这叫牛角火药筒，懂吗？"
	desc_extended = "给燧发枪爱好者装更多弹药用的老派袋子和牛角筒（说的就是你）。手持弹药时，用ALT+单击可再取出一发同类弹药。最多可存放80发。"

	icon = 'icons/obj/item/clothing/belts/musket_bag.dmi'
	worn_layer = LAYER_MOB_CLOTHING_COAT_OVER
	dyeable = FALSE


	value = 0
	size = SIZE_3

	stored_bullets = list()

	bullet_count = 0
	max_bullets = 80
	bullet_type = /obj/item/bullet_cartridge/flintlock
	bullet_type_premium = /obj/item/bullet_cartridge/flintlock/premium

	next_regen = 0 //Ammo restocking functionality woo!
	can_be_restocked = TRUE

	num_overlays = 0

/obj/item/clothing/belt/bandoliers/musket_bag/get_base_value()
	return max_bullets*3

/obj/item/clothing/belt/bandoliers/musket_bag/basic/Generate()
	. = ..()
	stored_bullets[/obj/item/bullet_cartridge/flintlock] = rand(20,30)
	bullet_count = stored_bullets[/obj/item/bullet_cartridge/flintlock]

/obj/item/clothing/belt/bandoliers/musket_bag/premium/Generate()
	. = ..()
	stored_bullets[/obj/item/bullet_cartridge/flintlock/premium] = rand(20,30)
