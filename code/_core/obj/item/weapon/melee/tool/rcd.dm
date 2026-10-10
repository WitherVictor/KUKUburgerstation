/obj/item/rcd
	name = "快速建造装置"
	desc = "快速建造物品。"
	desc_extended = "可快速建造复杂结构。需要先装入蓝图磁盘。"
	icon = 'icons/obj/item/weapons/melee/tools/rcd.dmi'

	var/obj/item/disk/rcd_disk

	var/matter_current = 0
	var/matter_max = 10000

	value = 50

	weight = 5

	rarity = RARITY_RARE

/obj/item/rcd/PreDestroy()
	QDEL_NULL(rcd_disk)
	. = ..()

/obj/item/rcd/save_item_data(var/mob/living/advanced/player/P,var/save_inventory = TRUE,var/died=FALSE,var/loadout=FALSE)
	RUN_PARENT_SAFE
	SAVEATOM("rcd_disk")
	SAVEVAR("matter_current")

/obj/item/rcd/load_item_data_pre(var/mob/living/advanced/player/P,var/list/object_data,var/loadout=FALSE)
	RUN_PARENT_SAFE
	LOADATOM("rcd_disk")
	LOADVAR("matter_current")


/obj/item/rcd/Finalize()
	. = ..()
	update_sprite()

/obj/item/rcd/Generate()
	matter_current = matter_max
	return ..()

/obj/item/rcd/proc/add_matter(var/matter_amount)
	matter_current = min(matter_current + matter_amount,matter_max)
	update_sprite()
	return matter_current

/obj/item/rcd/proc/spend_matter(var/matter_to_spend)
	if(matter_to_spend > matter_current)
		return FALSE
	matter_current -= matter_to_spend
	update_sprite()
	return TRUE

/obj/item/rcd/update_overlays()

	. = ..()

	var/charge_level = matter_current == 0 ? 0 : FLOOR(1+(matter_current/matter_max)*9, 1)
	if(charge_level)
		var/image/I = new/image(initial(icon),"charge_[charge_level]")
		add_overlay(I)


/obj/item/rcd/click_on_object(var/mob/activator as mob,var/atom/object,location,control,params)

	if(object.plane >= PLANE_HUD)
		return ..()

	if(object)

		INTERACT_CHECK
		INTERACT_CHECK_OBJECT
		INTERACT_DELAY(10)

		var/turf/T = get_turf(object)
		if(!rcd_disk)
			activator.to_chat(span("warning","错误：[src.name]中未装入建造磁盘！"))
			return TRUE
		var/list/data = rcd_disk.data
		if(!data || !data["object"] || !data["cost"] || !ispath(data["object"]))
			activator.to_chat(span("warning","错误：建造磁盘无效！"))
			return TRUE

		if(ispath(data["object"],/turf/) ? !T.can_construct_on(activator,/obj/structure/interactive/construction/girder/) : !T.can_construct_on(activator,data["object"]))
			return TRUE

		var/matter_cost = data["cost"]
		var/delay_time = 0

		if(matter_cost && !spend_matter(matter_cost))
			activator.to_chat(span("warning","建造材料不足！（现有[matter_current]，需要[matter_cost]。）"))
			return TRUE

		if(ispath(data["effect"]))
			var/obj/effect/temp/E = data["effect"]
			E = new E(T)
			INITIALIZE(E)
			E.alpha = 100
			E.color = "#00FF00"
			delay_time = E.duration

		spawn(delay_time)
			if(ispath(data["object"],/turf/))
				T.change_turf(data["object"])
				activator.to_chat(span("notice","你使用[src.name]建造了[T.name]。"))
			else
				var/atom/A = data["object"]
				A = new A(T)
				INITIALIZE(A)
				FINALIZE(A)
				activator.to_chat(span("notice","你使用[src.name]建造了[A.name]。"))

		return TRUE

	return ..()

/obj/item/rcd/proc/insert_disk(var/mob/activator,var/obj/item/disk/desired_disk,var/silent=FALSE)
	if(rcd_disk)
		if(activator && !silent) activator.to_chat(span("warning","[src.name]中已经装有[rcd_disk.name]！"))
		return null
	desired_disk.drop_item(src)
	rcd_disk = desired_disk
	if(activator && !silent) activator.visible_message(span("notice","[activator.name]将一张磁盘插入了[src.name]。"),span("notice","你将[rcd_disk.name]插入[src.name]，把数据载入快速建造装置。"))
	return rcd_disk

/obj/item/rcd/proc/eject_disk(var/mob/activator,var/silent=FALSE)
	if(!rcd_disk)
		activator.to_chat(span("warning","[src.name]中没有可弹出的磁盘！"))
		return null
	if(activator && !silent) activator.visible_message(span("notice","[activator.name]从[src.name]中取出了一张磁盘。"),span("notice","你从[src.name]中取出了[rcd_disk.name]。"))
	rcd_disk.drop_item(get_turf(src))
	. = rcd_disk
	rcd_disk = null

/obj/item/rcd/clicked_on_by_object(var/mob/activator as mob,var/atom/object,location,control,params) //The src was clicked on by the object

	if(is_inventory(object) && rcd_disk)
		INTERACT_CHECK
		INTERACT_CHECK_OBJECT
		INTERACT_DELAY(5)
		var/obj/hud/inventory/I = object
		var/obj/item/disk/ejected_disk = eject_disk(activator)
		I.add_object(ejected_disk)
		return TRUE

	if(istype(object,/obj/item/disk/) && is_inventory(object.loc))
		INTERACT_CHECK
		INTERACT_CHECK_OBJECT
		INTERACT_DELAY(5)
		var/obj/hud/inventory/I = object.loc
		var/obj/item/disk/D = object
		var/obj/item/disk/old_disk
		if(rcd_disk) old_disk = eject_disk(activator)
		if(!rcd_disk)
			insert_disk(activator,D)
			if(old_disk) I.add_object(old_disk)
		return TRUE

	return ..()
