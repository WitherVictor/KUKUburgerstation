obj/structure/interactive/chair
	name = "椅子"
	desc = "你会坐上去的。自愿也好，被迫也罢。"
	desc_extended = "由椅腿支撑座面、通常供一人就座的家具。站在椅子所在位置时，可点击椅子将自己固定在上面。"
	icon = 'icons/obj/structure/chairs.dmi'
	icon_state = "chair"

	bullet_block_chance = 25

	density = TRUE
	anchored = FALSE

	var/armrest = FALSE

obj/structure/interactive/chair/update_overlays()
	. = ..()
	if(armrest)
		var/image/I = new/image(icon,"[icon_state]_armrest")
		I.appearance_flags = src.appearance_flags
		I.plane = PLANE_MOVABLE
		I.layer = LAYER_MOB_ABOVE + 1
		add_overlay(I)

obj/structure/interactive/chair/Finalize()
	. = ..()
	if(armrest)
		update_sprite()
	set_dir(dir,TRUE)

obj/structure/interactive/chair/set_dir(var/desired_dir,var/force = FALSE)

	. = ..()

	if(. || force)
		if(dir == NORTH)
			plane = PLANE_MOVABLE
			layer = LAYER_MOB_ABOVE
		else
			plane = initial(plane)


obj/structure/interactive/chair/Crossed(atom/movable/O,atom/OldLoc)

	. = ..()

	if(is_living(O))
		CALLBACK("sit_down_\ref[src]",SECONDS_TO_DECISECONDS(1),src,src::sit_your_ass_down(),O)


obj/structure/interactive/chair/proc/sit_your_ass_down(var/mob/living/L)

	if(L.loc != src.loc)
		return FALSE

	L.set_dir(src.dir)

	return TRUE

/obj/structure/interactive/chair/clicked_on_by_object(var/mob/activator,var/atom/object,location,control,params)

	if(activator.loc == src.loc)
		src.buckle(activator)
		return TRUE

	. = ..()

obj/structure/interactive/chair/stool
	name = "凳子"
	desc = "请把屁股放上去。"
	desc_extended = "没有靠背和扶手的椅子，也就是凳子。"
	icon_state = "stool"

	bullet_block_chance = 5

obj/structure/interactive/chair/stool/bar
	name = "吧台凳"
	desc = "请把屁股放上去。"
	desc_extended = "没有靠背和扶手的椅子，也就是凳子。这张比较高，所以算吧台凳。"
	icon_state = "bar"


obj/structure/interactive/chair/wood
	name = "木椅"
	desc = "你会坐上去的。自愿也好，被迫也罢。"
	desc_extended = "由椅腿支撑座面、通常供一人就座的家具。"
	icon_state = "wooden_chair"

	bullet_block_chance = 10

obj/structure/interactive/chair/office
	name = "办公椅"
	icon_state = "officechair_white"

obj/structure/interactive/chair/office/dark
	name = "办公椅"
	icon_state = "officechair_dark"

obj/structure/interactive/chair/comfy
	name = "舒适座椅"
	icon_state = "comfychair"

	armrest = TRUE


obj/structure/interactive/chair/shuttle
	name = "穿梭机座椅"
	icon_state = "shuttle_chair"

	armrest = TRUE

	pixel_y = 2

obj/structure/interactive/chair/shuttle/dark
	color = COLOR_GREY_LIGHT
