/obj/decal/poster/
	name = "海报"
	desc = "别搞色情角色扮演，那可不好。"
	desc_extended = "随机挑选的装饰海报，让这里更有生气。"
	icon = 'icons/obj/decal/poster.dmi'
	mouse_opacity = 1
	icon_state = null
	plane = PLANE_WALL_ATTACHMENT
	layer = LAYER_WALL_DECAL

	var/collectable_poster/stored_poster

/obj/decal/poster/clicked_on_by_object(var/mob/activator,var/atom/object,location,control,params)

	if(stored_poster && is_inventory(object))
		INTERACT_CHECK
		var/obj/hud/inventory/I = object
		var/obj/item/poster/P = new(get_turf(src))
		P.stored_poster = stored_poster
		INITIALIZE(P)
		FINALIZE(P)
		I.add_object(P)
		qdel(src)

	. = ..()

/obj/decal/poster/Initialize()
	setup_dir_offsets()
	dir = SOUTH
	return ..()

/obj/decal/poster/off_station/Generate()
	. = ..()
	if(prob(1))
		stored_poster = pick(SSposter.all_posters)
		var/collectable_poster/P = SSposter.all_posters[stored_poster]
		name = "收藏海报：[P.name]"
		icon = P.icon
		icon_state = P.icon_state
		desc = P.desc
		desc_extended = P.desc_extended

	else if(prob(25))
		icon_state = "poster[rand(1,35)]_legit"
	else
		icon_state = "poster[rand(1,44)]"

/obj/decal/poster/collectable/Generate()
	. = ..()
	stored_poster = pick(SSposter.all_posters)
	var/collectable_poster/P = SSposter.all_posters[stored_poster]
	name = "收藏海报：[P.name]"
	icon = P.icon
	icon_state = P.icon_state
	desc = P.desc
	desc_extended = P.desc_extended

/obj/decal/poster/nanotrasen/Generate() //Random positive poster.
	. = ..()
	if(prob(0.5))
		stored_poster = pick(SSposter.all_posters)
		var/collectable_poster/P = SSposter.all_posters[stored_poster]
		name = "收藏海报：[P.name]"
		icon = P.icon
		icon_state = P.icon_state
		desc = P.desc
		desc_extended = P.desc_extended
	else
		icon_state = "poster[rand(1,35)]_legit"

/obj/decal/poster/syndicate/Generate() //Random negative poster.
	. = ..()
	icon_state = "poster[rand(1,44)]"

/obj/decal/poster/painting
	name = "画作"
	desc = "哇。"
	desc_extended = "随机挑选的画作，让这里更有生气。"

/obj/decal/poster/painting/PostInitialize() //Random painting poster.
	. = ..()
	icon_state = "painting[rand(1,14)]"
