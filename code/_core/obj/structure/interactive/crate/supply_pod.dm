/obj/structure/interactive/crate/closet/supply_pod
	name = "空投舱"
	desc = "专程送达！"
	desc_extended = "从太空投送的补给舱，既能运兵，也能运送物资。"
	icon = 'icons/obj/structure/supply_pods.dmi'
	icon_state = "supplypod"

	collect_contents_on_initialize = FALSE

	anchored = TRUE

	var/transit = FALSE

	pixel_x = -16

	var/auto_open = TRUE

	pixel_y = 2

/obj/structure/interactive/crate/closet/supply_pod/PostInitialize()

	. = ..()

	update_sprite()

	if(!open)
		play_sound('sound/effects/mortar_long_whistle.ogg',get_turf(src),range_min = VIEW_RANGE*0.5,range_max = VIEW_RANGE * 2)
		create_alert(VIEW_RANGE,src.loc,src,ALERT_LEVEL_NOISE)
		pixel_z = TILE_SIZE*VIEW_RANGE*4
		pixel_w = TILE_SIZE*VIEW_RANGE*0.5
		animate(src, pixel_z = 0, pixel_w = 0,time = SECONDS_TO_DECISECONDS(2))
		CALLBACK("pod_land_\ref[src]",SECONDS_TO_DECISECONDS(2),src,src::land())
		if(auto_open)
			CALLBACK("pod_open_\ref[src]",SECONDS_TO_DECISECONDS(3),src,src::open())


/obj/structure/interactive/crate/closet/supply_pod/proc/land()
	explode(get_turf(src),1,src,src)
	return TRUE

/obj/structure/interactive/crate/closet/supply_pod/close(var/mob/activator)

	if(activator && auto_open)
		return FALSE

	return ..()

/obj/structure/interactive/crate/closet/supply_pod/open(var/mob/activator)

	if(activator && auto_open)
		return FALSE

	. = ..()

	if(. && auto_open)
		play_sound('sound/meme/tada.ogg',get_turf(src),range_max = VIEW_RANGE)

/obj/structure/interactive/crate/closet/supply_pod/update_icon()
	. = ..()
	icon_state = initial(icon_state)
	if(transit)
		icon_state = "[icon_state]_falling"

/obj/structure/interactive/crate/closet/supply_pod/update_overlays()
	. = ..()
	if(!transit)
		var/image/I = new/image(icon,"[icon_state]_[open ? "open" : "closed"]")
		add_overlay(I)

/obj/structure/interactive/crate/closet/supply_pod/bluespace
	name = "蓝空间空投舱"
	icon_state = "bluespacepod"

/obj/structure/interactive/crate/closet/supply_pod/centcomm
	name = "中央指挥部空投舱"
	icon_state = "centcommpod"

/obj/structure/interactive/crate/closet/supply_pod/centcomm/meme
	auto_open = FALSE

/obj/structure/interactive/crate/closet/supply_pod/centcomm/meme/Generate()
	CREATE(/obj/structure/interactive/dont_look,src)
	. = ..()

/obj/structure/interactive/crate/closet/supply_pod/syndicate
	name = "辛迪加空投舱"
	icon_state = "syndiepod"


/obj/structure/interactive/crate/closet/supply_pod/syndicate/ultra
	name = "究极特工空投舱"
	auto_open = TRUE

/obj/structure/interactive/crate/closet/supply_pod/syndicate/ultra/occupied/Generate()
	. = ..()
	CREATE(/mob/living/advanced/npc/syndicate/ultra,src)


/obj/structure/interactive/crate/closet/supply_pod/stray
	name = "偏航空投舱"
	icon_state = "squadpod"
	auto_open = FALSE

/obj/structure/interactive/crate/closet/supply_pod/yankee
	name = "太空扬基空投舱"
	icon_state = "squadpod"

/obj/structure/interactive/crate/closet/supply_pod/yankee/occupied/Generate()
	. = ..()
	CREATE(/mob/living/advanced/npc/space_soldier,src)
