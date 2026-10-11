/obj/item/grenade/device/timed/
	icon = 'icons/obj/item/grenade_new.dmi'
	icon_state = "grenade"

/obj/item/grenade/device/timed/Generate()
	var/obj/item/device/timer/T = new(src)
	T.time_set = 30
	stored_trigger = T
	open = FALSE
	return ..()

/obj/item/grenade/device/timed/explosive
	name = "定时爆破手榴弹"
	desc = "轰！"
	desc_extended = "预装好的定时爆破手榴弹。标签注明引信设为3秒。"
	value = 50

	marker_color = COLOR_GREEN

/obj/item/grenade/device/timed/explosive/Generate()
	stored_containers += new /obj/item/container/simple/beaker/water(src)
	stored_containers += new /obj/item/container/simple/beaker/potassium(src)
	return ..()

/obj/item/grenade/device/timed/smoke/
	name = "定时烟雾手榴弹"
	desc = "差不多也算轰吧！"
	desc_extended = "预装好的定时烟雾手榴弹。标签注明引信设为3秒。"

	marker_color = COLOR_BLUE

	value = 1

/obj/item/grenade/device/timed/smoke/Generate()
	stored_containers += new /obj/item/container/simple/beaker/smoke_01(src)
	stored_containers += new /obj/item/container/simple/beaker/smoke_02(src)
	return ..()





/obj/item/grenade/device/timed/emp
	name = "定时电磁脉冲手榴弹"
	desc = "差不多也算轰吧！"
	desc_extended = "预装好的定时电磁脉冲手榴弹。标签注明引信设为3秒。"
	marker_color = COLOR_CYAN
	value = 1

/obj/item/grenade/device/timed/emp/Generate()
	stored_containers += new /obj/item/container/simple/beaker/iron(src)
	stored_containers += new /obj/item/container/simple/beaker/uranium(src)
	return ..()


/obj/item/grenade/device/timed/incendiary
	name = "定时燃烧手榴弹"
	desc = "差不多也算轰吧！"
	desc_extended = "预装好的定时燃烧手榴弹。标签注明引信设为3秒。"

	paint_color = COLOR_RED
	marker_color = COLOR_ORANGE

	value = 1

/obj/item/grenade/device/timed/incendiary/Generate()
	stored_containers += new /obj/item/container/simple/beaker/oxygen(src)
	stored_containers += new /obj/item/container/simple/beaker/phoron(src)
	return ..()








