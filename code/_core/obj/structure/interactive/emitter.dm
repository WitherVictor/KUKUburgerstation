/obj/structure/interactive/emitter
	name = "超物质发射器"
	desc = "咻咻！"
	desc_extended = "发射高度集中的纯能量光束，为超物质充能。想赢就让它一直开着。"

	icon = 'icons/obj/structure/emitter.dmi'
	icon_state = "emitter"

	var/active = FALSE

	var/next_fire = 0

	collision_flags = FLAG_COLLISION_WALL
	collision_bullet_flags = FLAG_COLLISION_BULLET_NONE
	bullet_block_chance = 50

	density = TRUE

/obj/structure/interactive/emitter/active
	active = TRUE

/obj/structure/interactive/emitter/Finalize()
	if(active)
		START_THINKING(src)
		update_sprite()
	return ..()

/obj/structure/interactive/emitter/update_icon()
	icon_state = initial(icon_state)
	if(active) icon_state = "[icon_state]_on"
	return ..()

/obj/structure/interactive/emitter/think()

	if(next_fire <= world.time)

		shoot_projectile(
			src,
			get_step(src,dir),
			null,
			null,
			/obj/projectile/bullet/laser/emitter,
			/damagetype/ranged/laser/emitter,
			16,
			16,
			0,
			TILE_SIZE*0.75,
			1,
			"#FF00DC",
			0,
			1,
			null,
			null
		)
		play_sound('sound/weapons/ranged/energy/emitter/shoot.ogg',get_turf(src))

		next_fire = world.time + SECONDS_TO_DECISECONDS(5)
		flick("[initial(icon_state)]_fire",src)


	. = ..()

	if(!active)
		return FALSE

	if(!.)
		active = FALSE



/obj/structure/interactive/emitter/clicked_on_by_object(var/mob/activator,var/atom/object,location,control,params)



	if(is_inventory(object))
		INTERACT_CHECK
		INTERACT_CHECK_OBJECT
		INTERACT_DELAY(5)
		active = !active
		activator.visible_message(span("warning","[activator.name][active ? "启动" : "关闭"]了[src.name]。"),span("warning","你[active ? "启动" : "关闭"]了[src.name]。"))
		if(active) START_THINKING(src)
		update_sprite()

	return ..()
