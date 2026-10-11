/obj/item/supply_remote
	name = "空投舱遥控器"
	desc = "需要送货时就用它。"
	desc_extended = "用于向战场空投物资的专用遥控器。"
	icon = 'icons/obj/item/supply_remote.dmi'
	icon_state = "inventory"

	var/list/atom/movable/stored_object_types = list(/obj/structure/wip/meme)
	var/obj/structure/interactive/crate/closet/supply_pod/supply_pod_type = /obj/structure/interactive/crate/closet/supply_pod
	var/charges = 1

	value = 0

	weight = 4

	rarity = RARITY_RARE

/obj/item/supply_remote/save_item_data(var/mob/living/advanced/player/P,var/save_inventory = TRUE,var/died=FALSE,var/loadout=FALSE)
	RUN_PARENT_SAFE
	SAVEVAR("charges")

/obj/item/supply_remote/load_item_data_post(var/mob/living/advanced/player/P,var/list/object_data,var/loadout=FALSE)
	RUN_PARENT_SAFE
	LOADVAR("charges")

/obj/item/supply_remote/get_base_value()
	. = ..()
	. *= charges
	. += 100

/obj/item/supply_remote/click_on_object(var/mob/activator as mob,var/atom/object,location,control,params)

	if(!is_turf(object) && !isturf(object.loc))
		return TRUE

	INTERACT_CHECK
	INTERACT_DELAY(10)

	if(charges <= 0)
		activator.to_chat(span("warning","[src.name]的使用次数已耗尽！"))
		return TRUE

	var/turf/T = get_turf(object)
	var/area/A = T.loc

	if(A.flags_area & FLAG_AREA_NO_CONSTRUCTION)
		activator.to_chat(span("warning","无效的着陆区域！"))
		return TRUE

	charges--

	value = get_base_value()

	var/obj/structure/interactive/crate/closet/supply_pod/SP = new supply_pod_type(T)
	for(var/k in stored_object_types)
		var/atom/movable/M = new k(T)
		INITIALIZE(M)
		GENERATE(M)
		FINALIZE(M)
		M.force_move(SP)

	INITIALIZE(SP)
	FINALIZE(SP)

	return TRUE

/obj/item/supply_remote/drill
	name = "空投舱遥控器——采矿钻机"
	desc_extended = "用于向战场空投物资的专用遥控器。这款投送一台大型采矿钻机和两个采矿支架。"
	stored_object_types = list(
		/obj/structure/interactive/mining_drill,
		/obj/structure/interactive/mining_brace,
		/obj/structure/interactive/mining_brace
	)
	value = 1250

/obj/item/supply_remote/ore_box
	name = "空投舱遥控器——矿石箱"
	desc_extended = "用于向战场空投物资的专用遥控器。这款投送一个专门存放矿石的木箱。"
	stored_object_types = list(
		/obj/structure/interactive/ore_box
	)
	value = 500

/obj/item/supply_remote/ammo
	name = "空投舱遥控器——优质弹药补给器"
	desc_extended = "用于向战场空投物资的专用遥控器。这款投送一台优质弹药补给器。"
	stored_object_types = list(
		/obj/structure/interactive/restocker/ammo/premium
	)
	value = 2000

/*
/obj/item/supply_remote/mech/
	value = 1000


/obj/item/supply_remote/mech/ripley
	name = "drop pod remote - Ripley Mining Mech with Drill + Laser Gun"
	stored_object_types = list(/mob/living/vehicle/mech/modular/premade/ripley)
	value = 5000
*/

/obj/item/supply_remote/crates/nanotrasen
	name = "空投舱遥控器——4箱纳米传讯补给"
	stored_object_types = list(
		/obj/item/supply_crate/nanotrasen,
		/obj/item/supply_crate/nanotrasen,
		/obj/item/supply_crate/nanotrasen,
		/obj/item/supply_crate/nanotrasen
	)
	value = 2000

/obj/item/supply_remote/crates/syndicate
	name = "空投舱遥控器——4箱辛迪加补给"
	stored_object_types = list(
		/obj/item/supply_crate/syndicate,
		/obj/item/supply_crate/syndicate,
		/obj/item/supply_crate/syndicate,
		/obj/item/supply_crate/syndicate
	)
	value = 2000
	supply_pod_type = /obj/structure/interactive/crate/closet/supply_pod/syndicate

/obj/item/supply_remote/crates/slavic
	name = "空投舱遥控器——4箱斯拉夫补给"
	stored_object_types = list(
		/obj/item/supply_crate/slavic,
		/obj/item/supply_crate/slavic,
		/obj/item/supply_crate/slavic,
		/obj/item/supply_crate/slavic
	)
	value = 2000

/obj/item/supply_remote/crates/yankee
	name = "空投舱遥控器——4箱太阳系补给"
	stored_object_types = list(
		/obj/item/supply_crate/solarian,
		/obj/item/supply_crate/solarian,
		/obj/item/supply_crate/solarian,
		/obj/item/supply_crate/solarian
	)
	value = 2000

/obj/item/supply_remote/barbecue
	name = "空投舱遥控器——烧烤套件"
	desc_extended = "用于向战场空投酷炫必需品的专用遥控器。这款投送一个便携烧烤架。"
	stored_object_types = list(
		/obj/structure/table/cooking/barbecue
	)
	value = 500
