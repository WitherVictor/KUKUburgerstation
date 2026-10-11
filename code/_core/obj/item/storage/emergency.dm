/obj/item/storage/emergency
	name = "生存应急包"
	desc = "老兄，你的供氧设备呢？"
	desc_extended = "一个小盒子，配有一些基本医疗用品。紧急时刻能救人一命。"
	icon = 'icons/obj/item/storage/boxes.dmi'
	icon_state = "emergency"
	value = 10


/obj/item/storage/emergency/fill_inventory()
	new /obj/item/container/healing/bandage(src)
	new /obj/item/container/healing/ointment(src)
	new /obj/item/container/edible/pill/dylovene(src)
	new /obj/item/container/syringe/hypodermic/epinephrine(src)
	. = ..()
