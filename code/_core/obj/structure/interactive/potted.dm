obj/structure/interactive/potted_plant
	name = "盆栽"
	desc = "补回这些蠢货白白浪费的氧气。"
	desc_extended = "随机样式的装饰盆栽，为周围增添生气。"
	icon = 'icons/obj/structure/flora/potted.dmi'

	bullet_block_chance = 10

	pixel_y = 8

obj/structure/interactive/potted_plant/nanotrasen
	icon_state = "nt_1"

obj/structure/interactive/potted_plant/nanotrasen/New(var/desired_loc)
	icon_state = "nt_[rand(1,6)]"
	return ..()

obj/structure/interactive/potted_plant/office
	icon_state = "office_1"

obj/structure/interactive/potted_plant/office/New(var/desired_loc)
	icon_state = "office_[rand(1,3)]"
	return ..()

obj/structure/interactive/potted_plant/bin
	icon_state = "bin_1"

obj/structure/interactive/potted_plant/bin/New(var/desired_loc)
	icon_state = "bin_[rand(1,4)]"
	return ..()
