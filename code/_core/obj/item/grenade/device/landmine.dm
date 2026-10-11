/obj/item/grenade/device/landmine
	name = "地雷"
	icon_state = "landmine"

/obj/item/grenade/device/landmine/proximity/Generate()
	var/obj/item/device/proximity/T = new(src)
	T.time_set = 50
	stored_trigger = T
	open = FALSE
	return ..()

/obj/item/grenade/device/landmine/proximity/explosive/
	name = "感应爆破地雷"
	desc = "轰！"
	desc_extended = "预装好的感应爆破地雷。标签注明感应装置的启动延迟设为5秒。"
	value = 50

/obj/item/grenade/device/landmine/proximity/explosive/Generate()
	stored_containers += new /obj/item/container/simple/beaker/water(src)
	stored_containers += new /obj/item/container/simple/beaker/potassium(src)
	return ..()
