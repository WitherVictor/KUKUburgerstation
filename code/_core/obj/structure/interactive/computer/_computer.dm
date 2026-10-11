obj/structure/interactive/computer
	name = "电脑"
	desc = "哔哔啵啵。"
	desc_extended = "用于操控设备，具体功能取决于控制台类型。"
	icon = 'icons/obj/structure/computer.dmi'
	var/on = TRUE
	plane = PLANE_MOVABLE

obj/structure/interactive/computer/console
	name = "电脑控制台"
	var/computer_type = "generic"
	var/keyboard_type = "generic_key"
	icon_state = "computer"

	desired_light_range = 1
	desired_light_power = 0.75
	desired_light_color = "#00FF00"

	collision_flags = FLAG_COLLISION_WALL
	collision_bullet_flags = FLAG_COLLISION_BULLET_INORGANIC

	collision_dir = NORTH | EAST | SOUTH | WEST

	bullet_block_chance = 75

	density = TRUE

obj/structure/interactive/computer/console/Finalize()
	. = ..()
	update_sprite()

obj/structure/interactive/computer/console/update_overlays()

	. = ..()

	if(computer_type && on)
		var/image/I = new/image(initial(icon),computer_type)
		I.appearance_flags = src.appearance_flags | KEEP_APART | RESET_COLOR
		I.plane = PLANE_LIGHTING_EFFECT
		add_overlay(I)

	if(keyboard_type)
		var/image/I = new/image(initial(icon),keyboard_type)
		I.appearance_flags = src.appearance_flags | KEEP_APART | RESET_COLOR
		I.plane = PLANE_LIGHTING_EFFECT
		add_overlay(I)

obj/structure/interactive/computer/console/laptop
	name = "个人笔记本电脑"
	icon_state = "laptop"


obj/structure/interactive/computer/console/old
	name = "旧电脑"
	desc = "它压根不能用。搞什么？！"
	desc_extended = "一台已经无法工作的旧电脑。"
	pixel_y = 10

	icon_state = "oldcomp"
	computer_type = "library"
	keyboard_type = "no_keyboard"


obj/structure/interactive/computer/console/old/cargo/
	name = "旧货运电脑"
	desc = "至少它还能用。"
	desc_extended = "一台用于处理货运订单的旧电脑。"

obj/structure/interactive/computer/console/old/cargo/clicked_on_by_object(var/mob/activator,var/atom/object,location,control,params)

	if(!is_player(activator) || !activator.client)
		return ..()

	INTERACT_CHECK
	INTERACT_CHECK_OBJECT
	INTERACT_DELAY(5)

	var/mob/living/advanced/player/P = activator

	P.dialogue_target = src
	P.dialogue_target_id = /dialogue/npc/cargo_computer/
	open_menu(P,/menu/dialogue/)

	return TRUE




obj/structure/interactive/computer/console/medical
	name = "医疗控制台"
	computer_type = "medcomp"
	keyboard_type = "med_key"

obj/structure/interactive/computer/console/old/cargo
	name = "货运电脑"
	computer_type = "library"
	keyboard_type = ""

obj/structure/interactive/computer/console/engineering
	name = "工程控制台"

obj/structure/interactive/computer/console/engineering/Generate()
	computer_type = pick("power","solar","tank","area_atmos","alert:1")
	keyboard_type = "[computer_type]_key"

	var/list/type_to_light = list(
		"power" = "#C6B227",
		"solar" = "#C6B227",
		"tank" = "#BFE2FF",
		"area_atmos" = "#BFE2FF",
		"alert:1" = "#BFE2FF",
	)

	desired_light_color = type_to_light[computer_type]

	. = ..()
