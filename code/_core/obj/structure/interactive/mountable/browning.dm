/obj/structure/interactive/mountable/browning
	name = "勃朗宁机枪阵地"
	desc = "可靠的老伙计。"
	desc_extended = "一挺重型机枪。你绝对不会希望它的枪口对着自己。站在其所在格时，按住Alt点击即可握住射击握把。"
	icon = 'icons/obj/structure/mountable/browning.dmi'
	icon_state = "unloaded"

	plane = PLANE_MOVABLE
	layer = LAYER_MOB_ABOVE

	density = TRUE

	bullet_block_chance = 15	//it's pretty big and chairs literally have 25

	var/obj/item/weapon/ranged/bullet/magazine/misc/browning/stored_weapon
	var/obj/item/magazine/browning_127/stored_magazine
	var/obj/item/browning_handle/stored_handle

/obj/structure/interactive/mountable/browning/PreDestroy()
	QDEL_NULL(stored_weapon)
	QDEL_NULL(stored_magazine)
	QDEL_NULL(stored_handle)
	. = ..()

//prototyped from barricades, gun sprite shifted to position around player sprites
/obj/structure/interactive/mountable/browning/PostInitialize()

	update_sprite()

	. = ..()

/obj/structure/interactive/mountable/browning/update_sprite()

	mag_check(src)

	if(dir == NORTH)
		pixel_x = 0
		pixel_y = 16
		layer = LAYER_MOB_BELOW
	else if(dir == EAST)
		pixel_x = 16
		pixel_y = -3
	else if(dir == SOUTH)
		pixel_x = 0
		pixel_y = -17
	else if(dir == WEST)
		pixel_x = -16
		pixel_y = -3

	. = ..()

//prototyped from turret
/obj/structure/interactive/mountable/browning/Finalize()

	. = ..()

	stored_weapon = new /obj/item/weapon/ranged/bullet/magazine/misc/browning(src)
	INITIALIZE(stored_weapon)
	GENERATE(stored_weapon)
	FINALIZE(stored_weapon)

	stored_weapon.linked_gun = src

	stored_handle = new /obj/item/browning_handle(src)
	INITIALIZE(stored_handle)
	GENERATE(stored_handle)
	FINALIZE(stored_handle)

	stored_handle.linked_gun = src

	mag_check(src)



/obj/item/browning_handle
	name = "勃朗宁握把"
	desc = "握稳了。"
	desc_extended = "你需要双手握持，才能正常开火。"
	icon = 'icons/obj/item/browning_handle.dmi'

	var/obj/structure/interactive/mountable/browning/linked_gun

	can_save = FALSE
	throwable = FALSE
	can_wield = TRUE

	size = 99

	weight = 2

	value = 0

/obj/item/browning_handle/PreDestroy()
	QDEL_NULL(linked_gun)
	. = ..()

//prototyped from defib paddles
/obj/item/browning_handle/click_on_object(var/mob/activator,var/atom/object,location,control,params)

	if(is_inventory(object))
		return ..()

	if(activator.is_busy())
		return TRUE

	if(!linked_gun)
		INTERACT_CHECK
		INTERACT_CHECK_OBJECT
		INTERACT_DELAY(10)
		activator.to_chat(span("danger","检测到握把未连接机枪的错误。请在Discord的#bug-reports频道反馈，并说明出现问题的过程。"))
		drop_item(get_turf(src))
		return TRUE

	if(object == linked_gun)
		INTERACT_CHECK
		INTERACT_CHECK_OBJECT
		drop_item(get_turf(src))
		return TRUE

	//shoot gun
	else if(wielded)
		if(angle2dir_cardinal(get_angle(activator,object))==linked_gun.dir)
			linked_gun.stored_weapon.shoot(activator,object,location,params,damage_multiplier=1)
		else
			activator.to_chat(span("warning","机枪无法转向那么大的角度！"))

	return ..()

/obj/item/browning_handle/on_unequip(var/obj/hud/inventory/old_inventory,var/silent=TRUE)

	. = ..()

	if(!istype(loc, /obj/hud/inventory/organs/)) //juggling between hands 'drops' and fucks it
		if(!linked_gun)
			qdel(src)
		else
			src.drop_item(linked_gun)



//taken from chairs, sits down if you move onto it, but only once
/obj/structure/interactive/mountable/browning/Crossed(atom/movable/O,atom/OldLoc)

	. = ..()

	if(is_living(O))
		CALLBACK("sit_down_\ref[src]",SECONDS_TO_DECISECONDS(1),src,src::mount_your_ass(),O)


/obj/structure/interactive/mountable/browning/proc/mount_your_ass(var/mob/living/L)

	if(L.loc != src.loc)
		return FALSE

	L.set_dir(src.dir)

	return TRUE

/obj/structure/interactive/mountable/browning/proc/mag_check(var/structure/interactive/mountable/browning/M)
	if(stored_magazine)
		if(length(stored_magazine.get_ammo_count()) < 1)
			icon_state = "empty"
		else
			icon_state = "loaded"
		return TRUE
	else
		icon_state = "unloaded"

	return TRUE

//pack 'em up, from turret
/obj/structure/interactive/mountable/browning/proc/can_pack_up(var/mob/activator)

	if(qdeleting)
		return FALSE

	INTERACT_CHECK_NO_DELAY(src)

	if(!src.z)
		activator.to_chat(span("warning","你无法在这里收起[src.name]！"))
		return FALSE

	return TRUE

/obj/structure/interactive/mountable/browning/proc/pack_up(var/mob/activator)

	activator.visible_message(span("warning","[activator.name]收起了[src.name]。"),span("notice","你收起了[src.name]。"))

	var/mob/living/advanced/A = activator
	var/obj/item/right_item = A.inventories_by_id[BODY_HAND_RIGHT_HELD]?.get_top_object()
	var/obj/item/left_item = A.inventories_by_id[BODY_HAND_LEFT_HELD]?.get_top_object()

	if(istype(left_item, /obj/item/browning_handle))
		left_item.drop_item()
	if(istype(right_item, /obj/item/browning_handle))
		right_item.drop_item()

	if(stored_magazine)
		stored_magazine.drop_item(get_turf(src))
		stored_magazine = null

	var/obj/item/deployable/mountable/browning/D = new(get_turf(src))
	INITIALIZE(D)
	FINALIZE(D)

	qdel(src)

	return TRUE

/obj/structure/interactive/mountable/browning/drop_on_object(var/mob/activator,var/atom/object,location,control,params)

	if(activator != object)
		return ..()

	INTERACT_CHECK
	INTERACT_CHECK_OBJECT
	INTERACT_DELAY(10)

	if(can_pack_up(activator))
		activator.visible_message(span("warning","[activator.name]开始收起[src.name]……"),span("notice","你开始收起[src.name]……"))
		PROGRESS_BAR(activator,src,SECONDS_TO_DECISECONDS(5),src::pack_up(),activator)
		PROGRESS_BAR_CONDITIONS(activator,src,src::can_pack_up(),activator)

	return TRUE

//shows ammo count
/obj/structure/interactive/mountable/browning/get_examine_list(var/mob/examiner)
	. = ..()
	if(stored_magazine)
		. += div("notice","它已装上弹匣，剩余弹药：[stored_magazine.get_ammo_count()]/[stored_magazine.bullet_count_max]发。")
	else
		. += div("warning","它没有装弹匣。")

//clickies by player on the gun
/obj/structure/interactive/mountable/browning/clicked_on_by_object(var/mob/activator,var/atom/object,location,control,params)
	if(istype(object,/obj/item/magazine/))
		INTERACT_CHECK
		INTERACT_CHECK_OBJECT
		INTERACT_DELAY(2)

		var/obj/item/magazine/M = object
		var/obj/item/weapon/ranged/bullet/magazine/W = stored_weapon

		if(!M.weapon_whitelist[W.type])
			activator.to_chat(span("warning","这座机枪阵地不兼容这种弹匣！"))
			return FALSE

		if(stored_magazine)
			activator.to_chat(span("notice","你更换了[src.name]的弹匣。"))
			stored_magazine.update_icon()
			stored_magazine.drop_item(get_turf(src))
			stored_magazine = null
		else
			activator.to_chat(span("notice","你为[src.name]装上了新弹匣。"))

		M.drop_item(src)
		stored_magazine = M
		play_sound(M.get_magazine_insert_sound(),get_turf(src),range_max=VIEW_RANGE*0.25)

		mag_check(src)

		return TRUE

	if(istype(object,/obj/item/browning_handle/))
		INTERACT_CHECK
		INTERACT_CHECK_OBJECT
		INTERACT_DELAY(5)
		var/obj/item/browning_handle/H = object
		H.drop_item(src)

		return TRUE

	if(activator.attack_flags & CONTROL_MOD_DISARM && is_inventory(object) && is_advanced(activator) && (get_dist(activator,src)<1))
		INTERACT_CHECK
		INTERACT_CHECK_OBJECT
		INTERACT_DELAY(5)
		activator.visible_message(span("notice","[activator.name]握住了握把……"),span("notice","你握住了握把……"))
		var/obj/hud/inventory/I = object
		I.add_object(stored_handle)

		return TRUE

	return ..()

//drops handles when moved off the gun
/obj/structure/interactive/mountable/browning/Uncrossed(atom/movable/O)
	if(is_advanced(O))
		var/mob/living/advanced/A = O
		var/obj/item/right_item = A.inventories_by_id[BODY_HAND_RIGHT_HELD]?.get_top_object()
		var/obj/item/left_item = A.inventories_by_id[BODY_HAND_LEFT_HELD]?.get_top_object()
		if(istype(left_item, /obj/item/browning_handle))
			left_item.drop_item(get_turf(src))
		if(istype(right_item, /obj/item/browning_handle))
			right_item.drop_item(get_turf(src))
		return ..()
