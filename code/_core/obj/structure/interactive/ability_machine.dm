//Change your abilities here.

/obj/structure/interactive/ability_machine
	name = "能力装配机"
	desc = "这就是科学，老子才懒得解释。"
	desc_extended = "一台近乎魔法的基因改造机器，能赋予使用者超能力。可以在此自定义基因能力。"

	icon = 'icons/obj/structure/ability_machine.dmi'
	icon_state = "ability_machine"

	density = TRUE
	anchored = TRUE
	collision_flags = FLAG_COLLISION_WALL
	collision_bullet_flags = FLAG_COLLISION_BULLET_INORGANIC

	pixel_x = -16

	pixel_y = 6

	var/list/ability_types = list(
		/ability/cqc,
		/ability/dash,
		/ability/quick_draw
	)



/obj/structure/interactive/ability_machine/clicked_on_by_object(var/mob/activator,var/atom/object,location,control,params)

	if(activator.ckey && is_advanced(activator) && is_inventory(object))
		INTERACT_CHECK
		INTERACT_DELAY(10)
		SPAM_CHECK(10)
		show_ability_choices(activator,src)
		return TRUE

	. = ..()


/obj/structure/interactive/ability_machine/tall
	name = "法术台"
	desc_extended = "这就是魔法，老子才懒得解释。"
	desc_extended = "一台神奇的法术调整机器，能赋予使用者超能力。可以在此自定义法术能力。"
	icon = 'icons/obj/structure/ability_machine_tall.dmi'
	pixel_x = 0
	ability_types = list(
		/ability/magic
	)
