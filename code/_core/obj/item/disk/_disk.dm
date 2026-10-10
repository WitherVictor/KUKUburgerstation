/obj/item/disk/
	name = "数据磁盘"
	desc = "快把那张该死的磁——哦，算了。"
	desc_extended = "用于储存信息。不过这张是空白的，没什么用。"
	icon = 'icons/obj/item/disk.dmi'
	icon_state = "disk"

	var/list/data = null

	var/frame_color = "#00FF00"
	var/writing_color = "#FFFFFF"
	var/metal_color = "#FFFFFF"

	value = 20

	drop_sound = 'sound/items/drop/card.ogg'

	weight = 0.5

/obj/item/disk/New(var/desired_loc)
	. = ..()
	update_sprite()

/obj/item/disk/update_icon()

	icon = initial(icon)
	icon_state = initial(icon_state)

	var/icon/I = new(icon,"[icon_state]_frame")
	I.Blend(frame_color,ICON_MULTIPLY)
	var/icon/I2 = new(icon,"[icon_state]_writing")
	I2.Blend(writing_color,ICON_MULTIPLY)
	var/icon/I3 = new(icon,"[icon_state]_metal")
	I3.Blend(metal_color,ICON_MULTIPLY)
	I.Blend(I2,ICON_OVERLAY)
	I.Blend(I3,ICON_OVERLAY)
	icon = I

	return ..()


/obj/item/disk/rcd
	name = "快速建造装置蓝图磁盘"
	desc = "快把那张该死的磁——哦，算了。"
	desc_extended = "储存快速建造装置使用的蓝图。"
	frame_color = "#DEB63D"
	writing_color = "#004A7F"
	metal_color = "#BBC5C7"

	rarity = RARITY_UNCOMMON

/obj/item/disk/random/Generate()
	frame_color = random_color()
	writing_color = random_color()
	metal_color = random_color()
	return ..()

/obj/item/disk/rcd/metal_plating
	name = "快速建造装置蓝图磁盘（金属地板）"
	desc = "快把那张该死的磁——哦，算了。"
	desc_extended = "储存快速建造装置使用的蓝图。这张包含金属地板的设计图。"
	data = list(
		"name" = "steel_wall.turf",
		"effect" = /obj/effect/temp/construction/wall,
		"object" = /turf/simulated/floor/plating,
		"cost" = 500
	)

/obj/item/disk/rcd/metal_wall
	name = "快速建造装置蓝图磁盘（钢墙）"
	desc = "快把那张该死的磁——哦，算了。"
	desc_extended = "储存快速建造装置使用的蓝图。这张包含钢墙的设计图。"
	data = list(
		"name" = "plating.turf",
		"effect" = /obj/effect/temp/construction/wall,
		"object" = /turf/simulated/wall/metal,
		"cost" = 1000
	)

/obj/item/disk/rcd/conveyor
	name = "快速建造装置蓝图磁盘（传送带）"
	desc = "快把那张该死的磁——哦，算了。"
	desc_extended = "储存快速建造装置使用的蓝图。这张包含传送带的设计图。"
	data = list(
		"name" = "conveyor_belt.obj",
		"effect" = /obj/effect/temp/sparkles,
		"object" = /obj/structure/interactive/conveyor,
		"cost" = 500
	)

/obj/item/disk/rcd/light
	name = "快速建造装置蓝图磁盘（圆形灯）"
	desc = "快把那张该死的磁——哦，算了。"
	desc_extended = "储存快速建造装置使用的蓝图。这张包含圆形照明灯的设计图。"
	data = list(
		"name" = "circle_light.obj",
		"effect" = /obj/effect/temp/sparkles,
		"object" = /obj/structure/interactive/lighting/fixture/floor/stronger/rcd,
		"cost" = 100
	)

/obj/item/disk/rcd/tube_light
	name = "快速建造装置蓝图磁盘（灯管）"
	desc = "快把那张该死的磁——哦，算了。"
	desc_extended = "储存快速建造装置使用的蓝图。这张包含灯管的设计图。"
	data = list(
		"name" = "tube_light.obj",
		"effect" = /obj/effect/temp/sparkles,
		"object" = /obj/structure/interactive/lighting/fixture/tube/station,
		"cost" = 100
	)

/obj/item/disk/rcd/diverter
	name = "快速建造装置蓝图磁盘（气流分拣器）"
	desc = "快把那张该死的磁——哦，算了。"
	desc_extended = "储存快速建造装置使用的蓝图。这张包含气流分拣器的设计图。"
	data = list(
		"name" = "air_diverter.obj",
		"effect" = /obj/effect/temp/sparkles,
		"object" = /obj/structure/interactive/diverter,
		"cost" = 500
	)

/obj/item/disk/rcd/orestorage
	name = "快速建造装置蓝图磁盘（矿石仓）"
	desc = "快把那张该死的磁——哦，算了。"
	desc_extended = "储存快速建造装置使用的蓝图。这张包含矿石仓的设计图。"
	data = list(
		"name" = "ore_storage.obj",
		"effect" = /obj/effect/temp/sparkles,
		"object" = /obj/structure/interactive/ore_storage,
		"cost" = 2000
	)

/obj/item/disk/rcd/oresmelter
	name = "快速建造装置蓝图磁盘（熔炉）"
	desc = "快把那张该死的磁——哦，算了。"
	desc_extended = "储存快速建造装置使用的蓝图。这张包含熔炉的设计图。"
	data = list(
		"name" = "smelter.obj",
		"effect" = /obj/effect/temp/sparkles,
		"object" = /obj/structure/interactive/smelter,
		"cost" = 2000
	)

/obj/item/disk/rcd/stacker
	name = "快速建造装置蓝图磁盘（堆垛机）"
	desc = "快把那张该死的磁——哦，算了。"
	desc_extended = "储存快速建造装置使用的蓝图。这张包含堆垛机的设计图。"
	data = list(
		"name" = "stacker.obj",
		"effect" = /obj/effect/temp/sparkles,
		"object" = /obj/structure/interactive/stacker,
		"cost" = 2000
	)

/obj/item/disk/rcd/glass_window
	name = "快速建造装置蓝图磁盘（玻璃窗）"
	desc = "快把那张该死的磁——哦，算了。"
	desc_extended = "储存快速建造装置使用的蓝图。这张包含玻璃窗的设计图。"
	data = list(
		"name" = "glass_window.spawner",
		"effect" = /obj/effect/temp/sparkles,
		"object" = /obj/marker/spawning/window/rcd,
		"cost" = 1000
	)

/obj/item/disk/rcd/airlock
	name = "快速建造装置蓝图磁盘（气闸）"
	desc = "快把那张该死的磁——哦，算了。"
	desc_extended = "储存快速建造装置使用的蓝图。这张包含气闸的设计图。"
	data = list(
		"name" = "airlock.obj",
		"effect" = /obj/effect/temp/sparkles,
		"object" = /obj/structure/interactive/door/airlock,
		"cost" = 1000
	)

/obj/item/disk/rcd/flap
	name = "快速建造装置蓝图磁盘（橡胶门帘）"
	desc = "快把那张该死的磁——哦，算了。"
	desc_extended = "储存快速建造装置使用的蓝图。这张包含橡胶门帘的设计图。"
	data = list(
		"name" = "flap.obj",
		"effect" = /obj/effect/temp/sparkles,
		"object" = /obj/structure/interactive/plastic_flaps,
		"cost" = 1000
	)

/obj/item/disk/rcd/table
	name = "快速建造装置蓝图磁盘（桌子）"
	desc = "快把那张该死的磁——哦，算了。"
	desc_extended = "储存快速建造装置使用的蓝图。这张包含桌子的设计图。"
	data = list(
		"name" = "table.obj",
		"effect" = /obj/effect/temp/sparkles,
		"object" = /obj/structure/table,
		"cost" = 500
	)

/obj/item/disk/rcd/chair
	name = "快速建造装置蓝图磁盘（椅子）"
	desc = "快把那张该死的磁——哦，算了。"
	desc_extended = "储存快速建造装置使用的蓝图。这张包含椅子的设计图。"
	data = list(
		"name" = "chair.obj",
		"effect" = /obj/effect/temp/sparkles,
		"object" = /obj/structure/interactive/chair,
		"cost" = 250
	)

/obj/item/disk/nuke
	name = "核装置认证磁盘"
	desc = "快把那张该死的磁盘拿来！"
	desc_extended = "储存极其先进的4位加密代码。"
	frame_color = "#007F0E"
	writing_color = "#0094FF"
	metal_color = "#FFE38F"
	value_burgerbux = 1
	value = 10000

	rarity = RARITY_LEGENDARY
