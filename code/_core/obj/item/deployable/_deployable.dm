/obj/item/deployable
	name = "便携设施"
	desc = "快速展开，立即部署。"
	desc_extended = "展开后可部署一座设施。"
	var/obj/structure/structure_to_deploy //Store as a type. This should always be a structure.

	amount_max = 10
	amount_max_icon = 3

/obj/item/deployable/proc/get_deploy_time(var/mob/activator)
	return SECONDS_TO_DECISECONDS(3)

/obj/item/deployable/proc/pre_deploy(var/mob/activator,var/turf/T,var/obj/structure/S)
	S.dir = activator.dir
	INITIALIZE(S)
	FINALIZE(S)
	return TRUE

/obj/item/deployable/proc/post_deploy(var/mob/activator,var/turf/T,var/obj/structure/S)
	activator.visible_message(span("notice","[activator.name]部署了[S.name]。"),span("notice","你部署了[S.name]。"))
	return TRUE

/obj/item/deployable/proc/deploy(var/mob/activator,var/turf/T)

	var/obj/structure/S = new structure_to_deploy(T)
	pre_deploy(activator,T,S)
	post_deploy(activator,T,S)
	add_item_count(-1)

	return S

/obj/item/deployable/proc/can_deploy_to(var/mob/activator,var/turf/T)

	if(amount <= 0)
		qdel(src)
		return FALSE

	return T.can_construct_on(activator,structure_to_deploy)

/obj/item/deployable/click_on_object(var/mob/activator as mob,var/atom/object,location,control,params)

	if(object.plane >= PLANE_HUD)
		return ..()

	var/turf/T = get_turf(object)

	if(can_deploy_to(activator,T))
		INTERACT_CHECK
		INTERACT_CHECK_OBJECT
		INTERACT_DELAY(10)
		if(activator.loc != T)
			activator.face_atom(T) //Only face the atom if we're not on the tile.
		activator.visible_message(span("warning","[activator.name]开始部署[src.name]……"),span("notice","你开始部署[src.name]……"))
		PROGRESS_BAR(activator,src,get_deploy_time(activator),src::deploy(),activator,T)
		PROGRESS_BAR_CONDITIONS(activator,src,src::can_deploy_to(),activator,T)
		return TRUE

	return ..()

/obj/item/deployable/barricade
	name = "便携路障"
	desc = "你的主要防护来源。"
	desc_extended = "可展开部署的大型路障。"
	structure_to_deploy = /obj/structure/interactive/barricade/
	icon = 'icons/obj/item/deployable/barricade.dmi'
	value = 60

	weight = 10

	amount_max = 5

	size = SIZE_3

/obj/item/deployable/mountable/browning
	name = "勃朗宁野战架设套件"
	desc = "二战式作战。"
	desc_extended = "老式野战套件，让你架起自己的勃朗宁重机枪，尽情倾泻压制火力。不过枪架的转动范围似乎有限……"
	structure_to_deploy = /obj/structure/interactive/mountable/browning/
	icon = 'icons/obj/item/deployable/browning.dmi'
	dan_mode = TRUE
	dan_icon_state_back = "back"
	value = 8918
	weight = 58

	amount_max = 1

	size = SIZE_9

/obj/item/deployable/mountable/browning/get_deploy_time(var/mob/activator)
	return SECONDS_TO_DECISECONDS(10)

/obj/item/deployable/mob
	var/mob/living/mob_to_deploy

/obj/item/deployable/mob/can_deploy_to(var/mob/activator,var/turf/T)

	if(amount <= 0)
		qdel(src)
		return FALSE

	if(get_dist(activator,T) > 1)
		return FALSE

	var/mob/living/L = locate() in T.contents
	if(L)
		activator.to_chat(span("warning","[L.name]挡住了部署位置！"))
		return FALSE

	return TRUE

/obj/item/deployable/mob/pre_deploy(var/mob/activator,var/turf/T,var/mob/living/L)
	L.dir = activator.dir
	INITIALIZE(L)
	FINALIZE(L)
	return TRUE

/obj/item/deployable/mob/post_deploy(var/mob/activator,var/turf/T,var/mob/living/L)
	activator.visible_message(span("notice","[activator.name]部署了[L.name]。"),span("notice","你部署了[L.name]。"))
	return TRUE

/obj/item/deployable/mob/deploy(var/mob/activator,var/turf/T)
	var/mob/living/L = new mob_to_deploy(T)
	pre_deploy(activator,T,L)
	post_deploy(activator,T,L)
	add_item_count(-1)
	return L

/obj/item/deployable/mob/sentry
	name = "便携哨戒机枪"
	desc = "正在架设哨戒机枪！"
	desc_extended = "可由单人携带的小型哨戒机枪，向敌对目标发射轻武器弹药。不含电池和弹药。"
	mob_to_deploy = /mob/living/simple/turret/deployable
	icon = 'icons/mob/living/simple/turret_deployable_2.dmi'
	value = 750
	amount_max = 1
	weight = 20
	dan_mode = TRUE
	size = SIZE_8

	var/obj/item/powercell/stored_battery
	var/obj/item/magazine/stored_magazine

	rarity = RARITY_UNCOMMON

/obj/item/deployable/mob/sentry/pre_deploy(var/mob/activator,var/turf/T,var/mob/living/L)

	. = ..()

	var/mob/living/simple/turret/deployable/TD = L
	if(stored_battery)
		TD.stored_battery = stored_battery
		stored_battery.force_move(TD)
	if(stored_magazine)
		TD.stored_magazine = stored_magazine
		stored_magazine.force_move(TD)
	if(TD.ai)
		TD.ai.set_active(TRUE)

	if(is_living(activator))
		var/mob/living/C = activator
		if(C.loyalty_tag)
			TD.set_loyalty_tag(C.loyalty_tag)
		if(C.iff_tag)
			TD.set_iff_tag(C.iff_tag)

/obj/item/deployable/mob/sentry/save_item_data(var/mob/living/advanced/player/P,var/save_inventory = TRUE,var/died=FALSE,var/loadout=FALSE)
	RUN_PARENT_SAFE
	SAVEATOM("stored_battery")
	SAVEATOM("stored_magazine")

/obj/item/deployable/mob/sentry/load_item_data_pre(var/mob/living/advanced/player/P,var/list/object_data,var/loadout=FALSE)
	RUN_PARENT_SAFE
	LOADATOM("stored_battery")
	LOADATOM("stored_magazine")


/obj/item/deployable/barbed_wire
	name = "便携铁丝网"
	desc = "哎哟！"
	desc_extended = "古老而近乎折磨人的设计，用尽可能少的材料阻碍士兵和平民移动。"
	icon = 'icons/obj/structure/barbed_wire.dmi'
	icon_state = "inventory"

	structure_to_deploy = /obj/structure/interactive/barbed_wire

	weight = 5

	amount_max = 10

	value = 10

	size = SIZE_2




/obj/item/deployable/mob/cleaning_bot
	name = "便携清洁机器人"
	desc = "打扫干净！"
	desc_extended = "非常结实的小型清洁机器人，专门清扫房间（真的是打扫，不是拿霰弹枪清场）。"

	icon = 'icons/mob/living/simple/cleaner.dmi'
	icon_state = "off"

	mob_to_deploy = /mob/living/simple/bot/cleaner

	value = 500

	amount_max = 1

	size = SIZE_5
