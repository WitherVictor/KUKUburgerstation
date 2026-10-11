/obj/item/grenade/fuse
	name = "引信式手榴弹"
	desc = "先启动，再投掷。"
	desc_extended = "采用非电子引信的手榴弹，以一次小型爆炸冲击触发内部装药。无法拆改。"
	max_containers = 0

	var/obj/item/device/fuse/fuse_type = /obj/item/device/fuse

/obj/item/grenade/fuse/Generate()
	. = ..()
	var/obj/item/device/fuse/T = new fuse_type(src)
	stored_trigger = T
	open = FALSE

/obj/item/grenade/fuse/trigger(var/mob/activator,var/atom/source,var/signal_freq,var/signal_code)
	. = ..()
	if(!src.reagents)
		return
	var/loyalty
	if(is_living(activator))
		var/mob/living/L = activator
		loyalty = L.loyalty_tag
	src.reagents.act_explode(activator,src,get_turf(src),1,loyalty)
	if(stored_trigger)
		qdel(stored_trigger)
		stored_trigger = null

/obj/item/grenade/fuse/he
	name = "\improper 高爆手榴弹"
	icon = 'icons/obj/item/grenade.dmi'
	icon_state = "he"
	desc_extended = "原始却有效的高爆手榴弹，设计用于消灭成群步兵。拔掉保险销，再投掷。"
	value = 1

/obj/item/grenade/fuse/he/Generate()
	stored_containers += new /obj/item/container/simple/beaker/tnt(src)
	return ..()

/obj/item/grenade/fuse/he/he
	name = "\improper 嘿嘿手榴弹"
	icon_state = "he"
	desc_extended = "原始却有效的高爆手榴弹，设计用于消灭成群步兵。拔掉保险销，再投掷。这枚似乎有点不对劲……"

	value_burgerbux = 1
	fuse_type = /obj/item/device/fuse/hehe



/obj/item/grenade/fuse/holy
	name = "\improper 神圣手榴弹"
	icon = 'icons/obj/item/grenade.dmi'
	icon_state = "holy"
	desc = "这可不是十字圣球。"
	desc_extended = "主如此说道：‘先拔出神圣的保险销，然后数到三，不多不少。你所数的数字应为三，而三应为你所数的数字。不可数到四，也不可停在二，除非紧接着数到三。五则绝对不可。当你数到第三个数字，也就是三时，便将安条克神圣手榴弹掷向你的敌人。他在吾眼中顽劣不堪，必将一命呜呼。’"
	value_burgerbux = 1
	value = 1
	fuse_type = /obj/item/device/fuse/holy

/obj/item/grenade/fuse/holy/Generate()
	stored_containers += new /obj/item/container/simple/beaker/large/potassium(src)
	stored_containers += new /obj/item/container/simple/beaker/large/water_holy(src)
	return ..()


/obj/item/grenade/fuse/fragmentation
	name = "\improper 破片手榴弹"
	icon = 'icons/obj/item/grenade.dmi'
	icon_state = "fragmentation"
	desc_extended = "原始却有效的低装药量手榴弹，依靠破片杀伤成群步兵。拔掉保险销，再投掷。"
	value = 1

/obj/item/grenade/fuse/fragmentation/Generate()
	stored_containers += new /obj/item/container/simple/beaker/tnt_fragments(src)
	return ..()


/obj/item/grenade/fuse/flashbang
	name = "\improper 闪光震撼弹"
	icon = 'icons/obj/item/grenade.dmi'
	icon_state = "flashbang"
	desc_extended = "原始却有效的微装药量手榴弹，用于以较低致命性震晕敌方战斗人员或使其丢下武器。拔掉保险销，再投掷。"
	value = 1


/obj/item/grenade/fuse/flashbang/Generate()
	stored_containers += new /obj/item/container/simple/beaker/flashbang(src)
	return ..()



