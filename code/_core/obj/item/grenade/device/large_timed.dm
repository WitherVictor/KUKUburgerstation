/obj/item/grenade/device/large/timed/


/obj/item/grenade/device/large/timed/Generate()
	var/obj/item/device/timer/T = new(src)
	T.time_set = 30
	stored_trigger = T
	open = FALSE
	return ..()

/obj/item/grenade/device/large/timed/explosive_large
	name = "大型定时爆破手榴弹"
	desc = "轰！"
	desc_extended = "预装好的定时爆破手榴弹。标签注明引信设为3秒。这枚装药量更大。"
	marker_color = COLOR_GREEN

/obj/item/grenade/device/large/timed/explosive_large/Generate()
	stored_containers += new /obj/item/container/simple/beaker/large/water(src)
	stored_containers += new /obj/item/container/simple/beaker/large/potassium(src)
	return ..()



/obj/item/grenade/device/large/timed/lube_smoke
	name = "定时润滑烟雾手榴弹"
	desc = "差不多也算轰吧！"
	desc_extended = "预装好的定时润滑烟雾手榴弹。标签注明引信设为3秒。"

	marker_color = COLOR_BLUE

/obj/item/grenade/device/large/timed/lube_smoke/Generate()
	stored_containers += new /obj/item/container/simple/beaker/large/lube_smoke_01(src)
	stored_containers += new /obj/item/container/simple/beaker/large/lube_smoke_02(src)
	return ..()

/obj/item/grenade/device/large/timed/cleaning_smoke
	name = "定时砰！清洁烟雾手榴弹"
	desc = "砰！"
	desc_extended = "预装好的定时清洁烟雾手榴弹。标签注明引信设为3秒。"

	paint_color = COLOR_GREEN
	marker_color = COLOR_GREEN

/obj/item/grenade/device/large/timed/cleaning_smoke/Generate()
	stored_containers += new /obj/item/container/simple/beaker/large/cleaing_smoke_01(src)
	stored_containers += new /obj/item/container/simple/beaker/large/cleaing_smoke_02(src)
	return ..()


/obj/item/grenade/device/large/timed/apocalypse
	name = "定时末日手榴弹"
	desc = "砰！"
	desc_extended = "预装好的定时末日手榴弹。标签注明引信设为3秒。"

	paint_color = COLOR_RED
	marker_color = COLOR_ORANGE

	value_burgerbux = 1

/obj/item/grenade/device/large/timed/apocalypse/Generate()
	stored_containers += new /obj/item/container/simple/beaker/bluespace/oxygen(src)
	stored_containers += new /obj/item/container/simple/beaker/bluespace/phoron(src)
	return ..()
