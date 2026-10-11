/obj/structure/sign/
	name = "告示牌"
	desc = "这牌子拦不住我，因为我不识字！"
	mouse_over_pointer = MOUSE_ACTIVE_POINTER
	icon = 'icons/obj/sign/signs.dmi'
	icon_state = ""
	plane = PLANE_WALL
	layer = LAYER_WALL_DECAL
	var/use_dir_offsets = FALSE

/obj/structure/sign/Initialize()
	try_attach_to()
	if(use_dir_offsets)
		setup_dir_offsets()
		dir = SOUTH
	return ..()

/obj/structure/sign/secure
	name = "管制区域"
	icon_state = "secure"
	desc_extended = "一块标示管制区域的告示牌。"

/obj/structure/sign/space
	name = "太空警告"
	icon_state = "space"
	desc_extended = "一块警告前方是太空的告示牌。"

/obj/structure/sign/closed
	name = "商店关闭"
	icon_state = "closed"
	desc_extended = "一块说明商店目前关闭的告示牌。也许将来会重新营业。"

/obj/structure/sign/fire
	name = "火灾警告"
	icon_state = "fire"
	desc_extended = "一块警告前方有火灾危险的告示牌。"

/obj/structure/sign/no_smoking
	name = "禁止吸烟"
	icon_state = "no_smoking"
	desc_extended = "一块标示禁烟区的告示牌。"

/obj/structure/sign/shock
	name = "触电危险"
	icon_state = "shock"
	desc_extended = "一块警告前方有触电危险的告示牌。"

/obj/structure/sign/pods
	name = "逃生舱"
	icon_state = "pods"
	desc_extended = "一块指示逃生舱方向的告示牌。"





#define SIGN_Y_OFFSET 8

/obj/structure/sign/department
	name = "部门指示牌"

//Part 1
/obj/structure/sign/department/a/med
	pixel_y = 0
	icon_state = "direction_med"

/obj/structure/sign/department/a/engineering
	pixel_y = SIGN_Y_OFFSET
	icon_state = "direction_eng"

/obj/structure/sign/department/a/supply
	pixel_y = -SIGN_Y_OFFSET
	icon_state = "direction_supply"

//Part 2
/obj/structure/sign/department/b/sci
	pixel_y = 0
	icon_state = "direction_sci"

/obj/structure/sign/department/b/sec
	pixel_y = SIGN_Y_OFFSET
	icon_state = "direction_sec"

/obj/structure/sign/department/b/evac
	pixel_y = -SIGN_Y_OFFSET
	icon_state = "direction_evac"

//Part 3
/obj/structure/sign/department/c/bridge
	pixel_y = 0
	icon_state = "direction_bridge"

/obj/structure/sign/department/c/infirm
	pixel_y = SIGN_Y_OFFSET
	icon_state = "direction_infirm"

/obj/structure/sign/department/c/other
	pixel_y = -SIGN_Y_OFFSET
	icon_state = "direction_other"



/obj/structure/sign/restroom/male
	icon_state = "male"
	desc_extended = "一块标示男卫生间的告示牌。"

/obj/structure/sign/restroom/female
	icon_state = "female"
	desc_extended = "一块标示女卫生间的告示牌。"

/obj/structure/sign/restroom/unisex
	icon_state = "unisex"
	desc_extended = "一块标示男女通用卫生间的告示牌。"
