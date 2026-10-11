/obj/structure/interactive/crate/bodybag
	name = "裹尸袋"
	desc = "你以前又吵又丑，现在还死了！"
	desc_extended = "用于运送尸体的塑料袋。"
	icon = 'icons/obj/structure/crates.dmi'
	icon_state = "bodybag"

	collision_flags = FLAG_COLLISION_WALKING //Not wall because crawling.
	collision_bullet_flags = FLAG_COLLISION_BULLET_SPECIFIC

	value = 100 //same value as /obj/item/deployable/bodybag to avoid money duping
	anchored = FALSE
	bullet_block_chance = 0

	pixel_y = 2

	density = TRUE

/obj/structure/interactive/crate/bodybag/get_examine_list(var/mob/examiner)
	. = ..()
	. += span("notice","空手按住ALT点击，可将空袋收起取回。")

/obj/structure/interactive/crate/bodybag/clicked_on_by_object(var/mob/activator,var/atom/object,location,control,params)


	if(activator.attack_flags & CONTROL_MOD_DISARM)
		if(can_pack_up(activator))
			activator.visible_message(span("warning","[activator.name]开始收起[src.name]……"),span("notice","你开始收起[src.name]……"))
			PROGRESS_BAR(activator,src,SECONDS_TO_DECISECONDS(5),src::pack_up(),activator)
			PROGRESS_BAR_CONDITIONS(activator,src,src::can_pack_up(),activator)
		return TRUE

	return ..()


/obj/structure/interactive/crate/bodybag/proc/can_pack_up(var/mob/activator)
    INTERACT_CHECK_NO_DELAY(src)

    if(length(src.contents))
        activator.to_chat(span("warning","[src.name]里还装着东西，无法收起！"))
        return FALSE

    if(qdeleting || !src.z)
        activator.to_chat(span("warning","无法在这里收起[src.name]！"))
        return FALSE

    return TRUE

/obj/structure/interactive/crate/bodybag/proc/pack_up(var/mob/activator)

	activator.visible_message(span("warning","[activator.name]收起了[src.name]。"),span("notice","你收起了[src.name]。"))

	var/obj/item/deployable/bodybag/S = new(get_turf(src))
	INITIALIZE(S)
	FINALIZE(S)

	qdel(src)

	return TRUE


/obj/item/deployable/bodybag
    name = "裹尸袋"
    desc = "带这个干吗？你又没法把自己装进去。除非……"
    desc_extended = "用于运送尸体的塑料袋，使用后展开。"
    structure_to_deploy = /obj/structure/interactive/crate/bodybag
    icon = 'icons/obj/item/deployable/bodybag.dmi'
    value = 100
    weight = 3

    amount_max = 5

    size = SIZE_3

/obj/item/deployable/bodybag/get_deploy_time(var/mob/activator)
	return SECONDS_TO_DECISECONDS(1)

/obj/item/deployable/bodybag/can_deploy_to(var/mob/activator,var/turf/T)

    if(amount <= 0)
        qdel(src)
        return FALSE

    return TRUE //to deploy structures it checks if the turf allows construction, but this would mean you cant place it on the station so not even medbay
