/obj/structure/interactive/computer/console/mech_fabricator
	name = "机甲制造控制台"
	desc = "在这里打印机甲所有权凭证。"
	desc_extended = "使用这台控制台，为属于自己的机甲购买所有权和保险！部分组件需要自行组装。"
	computer_type = "mecha"
	keyboard_type = "tech_key"

	var/obj/marker/mech_fabricator/linked_marker


/obj/structure/interactive/computer/console/mech_fabricator/PostInitialize()

	. = ..()

	linked_marker = locate() in range(VIEW_RANGE,src)

	if(!linked_marker)
		log_error("WARNING: Could not find a linked mech fabricator marker for [src.get_debug_name()]!")
		qdel(src)



/obj/structure/interactive/computer/console/mech_fabricator/clicked_on_by_object(var/mob/caller,var/atom/object,location,control,params)

	if(!is_player(caller) || !caller.client)
		return ..()

	INTERACT_CHECK
	INTERACT_CHECK_OBJECT
	INTERACT_DELAY(5)

	var/mob/living/advanced/player/P = caller
	P.dialogue_target_id = /dialogue/npc/mech_fabricator/
	open_menu(P,/menu/dialogue/)

	return TRUE
