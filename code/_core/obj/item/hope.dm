/obj/item/hope
	name = "希望信标"
	desc = "绝境中的希望。"
	desc_extended = "神奇的信标，可复活由玩家控制的类人生物并使其恢复健康。对遗体使用即可复活；复活后信标会显示耗尽状态，约15分钟后提示恢复就绪。"

	rarity = RARITY_MYTHICAL

	icon = 'icons/obj/item/hope.dmi'
	icon_state = "inventory"

	var/next_resurrect = 0

	value = 8000

/obj/item/hope/save_item_data(var/mob/living/advanced/player/P,var/save_inventory = TRUE,var/died=FALSE,var/loadout=FALSE)
	RUN_PARENT_SAFE
	SAVEVAR("next_resurrect")

/obj/item/hope/load_item_data_pre(var/mob/living/advanced/player/P,var/list/object_data,var/loadout=FALSE)
	RUN_PARENT_SAFE
	LOADVAR("next_resurrect")

/obj/item/hope/Finalize()
	. = ..()
	check_resurrection(make_sound=FALSE)

/obj/item/hope/update_sprite()
	. = ..()
	icon_state = initial(icon_state)
	if(next_resurrect > world.realtime)
		icon_state = "[icon_state]_drained"

/obj/item/hope/proc/check_resurrection(var/make_sound=TRUE)

	if(next_resurrect <= world.realtime)
		update_sprite()
		if(make_sound)
			var/turf/T = get_turf(src)
			T.visible_message(span("notice","[src.name]发出清脆的铃声，提示已经恢复就绪。"))
			play_sound('sound/weapons/magic/creation.ogg',T)
	else
		CALLBACK("\ref[src]_check_ressurection",SECONDS_TO_DECISECONDS(60),src,src::check_resurrection())

/obj/item/hope/click_on_object(var/mob/activator,var/atom/object,location,control,params)

	if(!is_advanced(object))
		return ..()

	INTERACT_CHECK
	INTERACT_DELAY(10)

	var/mob/living/advanced/A = object

	if(!A.dead || !A.is_player_controlled())
		activator.to_chat(span("warning","你似乎无法对[A.name]使用它……"))
		return FALSE

	A.resurrect()

	play_sound('sound/weapons/magic/heal.ogg',get_turf(object))

	A.visible_message(
		span("notice","[activator.name]用[src.name]复活了[A.name]！"),
		span("notice","[activator.name]用[src.name]复活了你！")
	)

	next_resurrect = world.realtime + SECONDS_TO_DECISECONDS(60)*15 //15 minutes.

	update_sprite()
	check_resurrection()

	return TRUE
