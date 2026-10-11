/obj/item/storage/ammo/
	name = "弹药盒"
	desc = "装着弹药。"
	icon = 'icons/obj/item/storage/ammo.dmi'
	icon_state = "template"

	container_whitelist = list(
		/obj/item/bullet_cartridge/
	)

	value = 10

	rarity = RARITY_UNCOMMON

/obj/item/storage/ammo/bullet_22/
	name = ".22 LR弹药盒"
	desc_extended = "标注可容纳36发.22 LR子弹的弹药盒。"
	icon_state = "22"
	size = SIZE_3

	dynamic_inventory_count = 4
	container_max_size = SIZE_1
	container_max_slots = 6

/obj/item/storage/ammo/bullet_22/fill_inventory()
	for(var/i=1, i <= container_max_slots*dynamic_inventory_count, i++)
		new /obj/item/bullet_cartridge/pistol_22{amount=5}(src)
	. = ..()


/obj/item/storage/ammo/slug
	name = "霰弹枪独头弹盒"
	desc_extended = "标注可容纳24发霰弹枪独头弹的弹药盒。"
	icon_state = "slug"

	dynamic_inventory_count = 4
	container_max_size = SIZE_1
	container_max_slots = 6

/obj/item/storage/ammo/slug/fill_inventory()
	for(var/i=1, i <= container_max_slots*dynamic_inventory_count, i++)
		new /obj/item/bullet_cartridge/shotgun_12/slug{amount=5}(src)
	. = ..()

/obj/item/storage/ammo/buckshot
	name = "霰弹枪鹿弹盒"
	desc_extended = "标注可容纳24发霰弹枪鹿弹的弹药盒。"
	icon_state = "buckshot"

	dynamic_inventory_count = 4
	container_max_size = SIZE_1
	container_max_slots = 6

/obj/item/storage/ammo/buckshot/fill_inventory()
	for(var/i=1, i <= container_max_slots*dynamic_inventory_count, i++)
		new /obj/item/bullet_cartridge/shotgun_12{amount=5}(src)
	. = ..()


/obj/item/storage/ammo/flechette
	name = "霰弹枪箭形弹盒"
	desc_extended = "标注可容纳24发霰弹枪箭形弹的弹药盒。"
	icon_state = "flechette"

	dynamic_inventory_count = 4
	container_max_size = SIZE_1
	container_max_slots = 6

/obj/item/storage/ammo/flechette/fill_inventory()
	for(var/i=1, i <= container_max_slots*dynamic_inventory_count, i++)
		new /obj/item/bullet_cartridge/shotgun_12/flechette{amount=5}(src)
	. = ..()



/obj/item/storage/ammo/fire
	name = "飞龙吐息弹盒"
	desc_extended = "标注可容纳24发霰弹枪火球弹的弹药盒。"
	icon_state = "fire"

	dynamic_inventory_count = 4
	container_max_size = SIZE_1
	container_max_slots = 6

/obj/item/storage/ammo/fire/fill_inventory()
	for(var/i=1, i <= container_max_slots*dynamic_inventory_count, i++)
		new /obj/item/bullet_cartridge/shotgun_12/fire{amount=5}(src)
	. = ..()

/obj/item/storage/ammo/rubber
	name = "霰弹枪橡胶独头弹盒"
	desc_extended = "标注可容纳24发霰弹枪橡胶独头弹的弹药盒。"
	icon_state = "rubber"

	dynamic_inventory_count = 4
	container_max_size = SIZE_1
	container_max_slots = 4

/obj/item/storage/ammo/rubber/fill_inventory()
	for(var/i=1, i <= container_max_slots*dynamic_inventory_count, i++)
		new /obj/item/bullet_cartridge/shotgun_12/rubber{amount=5}(src)
	. = ..()

/obj/item/storage/ammo/buckshot_23
	name = "斯拉夫霰弹枪鹿弹盒"
	desc_extended = "标注可容纳16发23x75mmR霰弹枪鹿弹的弹药盒。"
	icon_state = "23buck"

	dynamic_inventory_count = 4
	container_max_size = SIZE_1
	container_max_slots = 4

/obj/item/storage/ammo/buckshot_23/fill_inventory()
	for(var/i=1, i <= container_max_slots*dynamic_inventory_count, i++)
		new /obj/item/bullet_cartridge/shotgun_23{amount=5}(src)
	. = ..()

/obj/item/storage/ammo/slug_23
	name = "斯拉夫霰弹枪独头弹盒"
	desc_extended = "标注可容纳16发23x75mmR霰弹枪独头弹的弹药盒。"
	icon_state = "23slug"

	dynamic_inventory_count = 4
	container_max_size = SIZE_1
	container_max_slots = 4

/obj/item/storage/ammo/slug_23/fill_inventory()
	for(var/i=1, i <= container_max_slots*dynamic_inventory_count, i++)
		new /obj/item/bullet_cartridge/shotgun_23/slug{amount=5}(src)
	. = ..()

/obj/item/storage/ammo/fire_23
	name = "斯拉夫霰弹枪燃烧独头弹盒"
	desc_extended = "标注可容纳16发23x75mmR霰弹枪燃烧独头弹的弹药盒。"
	icon_state = "23fire"

	dynamic_inventory_count = 4
	container_max_size = SIZE_1
	container_max_slots = 4

/obj/item/storage/ammo/fire_23/fill_inventory()
	for(var/i=1, i <= container_max_slots*dynamic_inventory_count, i++)
		new /obj/item/bullet_cartridge/shotgun_23/fire{amount=5}(src)
	. = ..()

/obj/item/storage/ammo/rubber_23
	name = "斯拉夫霰弹枪橡胶独头弹盒"
	desc_extended = "标注可容纳16发23x75mmR霰弹枪橡胶独头弹的弹药盒。"
	icon_state = "23rubber"

	dynamic_inventory_count = 4
	container_max_size = SIZE_1
	container_max_slots = 4

/obj/item/storage/ammo/rubber_23/fill_inventory()
	for(var/i=1, i <= container_max_slots*dynamic_inventory_count, i++)
		new /obj/item/bullet_cartridge/shotgun_23/rubber{amount=5}(src)
	. = ..()

/obj/item/storage/ammo/grenade_40mm
	name = "40mm榴弹盒"
	desc_extended = "标注可容纳8发40mm高爆榴弹的弹药盒。"
	icon_state = "40mm"

	dynamic_inventory_count = 4
	container_max_size = SIZE_1
	container_max_slots = 2

/obj/item/storage/ammo/grenade_40mm/fill_inventory()
	for(var/i=1, i <= container_max_slots*dynamic_inventory_count, i++)
		new /obj/item/bullet_cartridge/grenade_40mm(src)
	. = ..()

/obj/item/storage/ammo/bullet_762/
	name = "7.62x38mmR弹药盒"
	desc_extended = "标注可容纳36发7.62x38mmR子弹的弹药盒。"
	icon_state = "762"
	size = SIZE_3

	dynamic_inventory_count = 4
	container_max_size = SIZE_1
	container_max_slots = 6

/obj/item/storage/ammo/bullet_762/fill_inventory()
	for(var/i=1, i <= container_max_slots*dynamic_inventory_count, i++)
		new /obj/item/bullet_cartridge/revolver_762{amount=6}(src)
	. = ..()

/obj/item/storage/ammo/bullet_38/
	name = ".38弹药盒"
	desc_extended = "标注可容纳36发.38子弹的弹药盒。"
	icon_state = "38"
	size = SIZE_3

	dynamic_inventory_count = 4
	container_max_size = SIZE_1
	container_max_slots = 6

/obj/item/storage/ammo/bullet_38/fill_inventory()
	for(var/i=1, i <= container_max_slots*dynamic_inventory_count, i++)
		new /obj/item/bullet_cartridge/revolver_38{amount=6}(src)
	. = ..()

/obj/item/storage/ammo/bullet_357/
	name = ".357弹药盒"
	desc_extended = "标注可容纳36发.357子弹的弹药盒。"
	icon_state = "357"
	size = SIZE_3

	dynamic_inventory_count = 4
	container_max_size = SIZE_1
	container_max_slots = 32//for some reason 357 and 44 keep spawning in single bullets, this is a botched fix

/obj/item/storage/ammo/bullet_357/fill_inventory()
	for(var/i=1, i <= container_max_slots*dynamic_inventory_count, i++)
		new /obj/item/bullet_cartridge/revolver_357{amount=6}(src)
	. = ..()

/obj/item/storage/ammo/bullet_44/
	name = ".44弹药盒"
	desc_extended = "标注可容纳36发.44子弹的弹药盒。"
	icon_state = "44"
	size = SIZE_3

	dynamic_inventory_count = 4
	container_max_size = SIZE_1
	container_max_slots = 32

/obj/item/storage/ammo/bullet_44/fill_inventory()
	for(var/i=1, i <= container_max_slots*dynamic_inventory_count, i++)
		new /obj/item/bullet_cartridge/revolver_44{amount=6}(src)
	. = ..()

/obj/item/storage/ammo/bullet_300/
	name = ".300弹药盒"
	desc_extended = "标注可容纳36发.300子弹的弹药盒。"
	icon_state = "300"
	size = SIZE_3

	dynamic_inventory_count = 4
	container_max_size = SIZE_1
	container_max_slots = 5

/obj/item/storage/ammo/bullet_300/fill_inventory()
	for(var/i=1, i <= container_max_slots*dynamic_inventory_count, i++)
		new /obj/item/bullet_cartridge/revolver_300{amount=5}(src)
	. = ..()
