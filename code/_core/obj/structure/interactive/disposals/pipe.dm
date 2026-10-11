/obj/structure/interactive/disposals/pipe
	name = "废物输送管"
	icon_state = "pipe"
	layer = LAYER_FLOOR_PIPE
	under_tile = TRUE

	plane = PLANE_AREA-2 //Layered above stuff in maps.

	alpha = 100

/obj/structure/interactive/disposals/pipe/New(var/desired_loc)
	plane = PLANE_FLOOR
	. = ..()
	alpha = 255


/obj/structure/interactive/disposals/pipe/get_connections()

	. = list()

	if(dir == NORTH || dir == EAST || dir == SOUTH || dir == WEST)
		.["[dir]"] = TRUE
		.["[turn(dir,180)]"] = TRUE
	else
		for(var/c_dir in DIRECTIONS_CARDINAL)
			if(!(dir & c_dir))
				continue
			.["[c_dir]"] = TRUE



/obj/structure/interactive/disposals/pipe/Finalize()

	var/list/disposals_count = list()
	for(var/obj/structure/interactive/disposals/pipe/DP in src.loc.contents)
		var/list/found_connections = DP.get_connections()
		for(var/k in found_connections) //Only the key matters.
			disposals_count[k] += 1

	for(var/k in disposals_count)
		var/v = disposals_count[k]
		if(v > 1)
			log_error("Multiple disposals pipes ([disposals_count]) detected at [src.loc.get_debug_name()].")
			qdel(src)
			break

	return ..()

/obj/structure/interactive/disposals/pipe/ending
	name = "废物管道连接管"
	icon_state = "pipe-t"

/obj/structure/interactive/disposals/pipe/ending/get_connections()
	. = list()
	.["[dir]"] = TRUE
	.["0"] = TRUE

/obj/structure/interactive/disposals/pipe/junction
	name = "废物管道三通"
	icon_state = "pipe-j1"

/obj/structure/interactive/disposals/pipe/junction/get_connections()
	. = list()
	.["[dir]"] = TRUE
	.["[turn(dir,180)]"] = FALSE
	.["[turn(dir,-90)]"] = FALSE

/obj/structure/interactive/disposals/pipe/junction/flipped
	icon_state = "pipe-j2"

/obj/structure/interactive/disposals/pipe/junction/flipped/get_connections()
	. = list()
	.["[dir]"] = TRUE
	.["[turn(dir,180)]"] = FALSE
	.["[turn(dir,90)]"] = FALSE

/obj/structure/interactive/disposals/pipe/junction/sorting
	name = "废物管道分拣三通"
	icon_state = "pipe-j1s"
	var/sorting_tag

/obj/structure/interactive/disposals/pipe/junction/sorting/get_connections()
	. = list()
	.["[dir]"] = TRUE
	.["[turn(dir,180)]"] = FALSE
	.["[turn(dir,-90)]"] = sorting_tag


/obj/structure/interactive/disposals/pipe/junction/sorting/flipped
	name = "废物管道分拣三通"
	icon_state = "pipe-j2s"

/obj/structure/interactive/disposals/pipe/junction/sorting/flipped/get_connections()
	. = list()
	.["[dir]"] = TRUE
	.["[turn(dir,180)]"] = FALSE
	.["[turn(dir,90)]"] = sorting_tag

/obj/structure/interactive/disposals/pipe/x
	name = "废物管道四通"
	icon_state = "pipe-4way"

/obj/structure/interactive/disposals/pipe/x/get_connections()
	. = list()
	for(var/d in DIRECTIONS_CARDINAL)
		.["[d]"] = d == dir
