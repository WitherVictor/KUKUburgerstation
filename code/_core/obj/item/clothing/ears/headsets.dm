/obj/item/clothing/ears/headset
	name = "通用耳机"
	desc = "; 救命，维护区！"
	desc_extended = "用来与同伴通信的耳机。"
	icon = 'icons/obj/item/clothing/ears/headset.dmi'

	var/obj/item/device/radio/stored_radio = /obj/item/device/radio/headset

	value = 1

/obj/item/clothing/ears/headset/get_examine_list(var/mob/examiner)
	. = ..()
	. += span("notice","说话时以英文分号';'开头，即可通过耳机发话。<br>使用鼠标滚轮切换频率。<br>拿在手中点击或使用，可开关信号接收器。<br>按住Alt点击可切换广播模式。")

/obj/item/clothing/ears/headset/Finalize()
	if(ispath(stored_radio))
		stored_radio = new stored_radio(src)
		INITIALIZE(stored_radio)
		GENERATE(stored_radio)
		FINALIZE(stored_radio)
	return ..()

/obj/item/clothing/ears/headset/PreDestroy()
	QDEL_NULL(stored_radio)
	. = ..()

/obj/item/clothing/ears/headset/click_self(var/mob/activator,location,control,params)
	return stored_radio.click_self(activator,location,control,params)

/obj/item/clothing/ears/headset/clicked_on_by_object(var/mob/activator as mob,var/atom/object,location,control,params)
	return stored_radio.clicked_on_by_object(activator,object,location,control,params)

/obj/item/clothing/ears/headset/mouse_wheel_on_object(var/mob/activator,delta_x,delta_y,location,control,params)
	return stored_radio.mouse_wheel_on_object(activator,delta_x,delta_y,location,control,params)

/obj/item/clothing/ears/headset/trigger(var/mob/activator,var/atom/source,var/signal_freq,var/signal_code)
	return stored_radio.trigger(activator,source,signal_freq,signal_code)

/obj/item/clothing/ears/headset/save_item_data(var/mob/living/advanced/player/P,var/save_inventory = TRUE,var/died=FALSE,var/loadout=FALSE)
	RUN_PARENT_SAFE
	SAVEATOM("stored_radio")

/obj/item/clothing/ears/headset/load_item_data_pre(var/mob/living/advanced/player/P,var/list/object_data,var/loadout=FALSE)
	RUN_PARENT_SAFE
	LOADATOM("stored_radio")

/obj/item/clothing/ears/headset/syndicate
	name = "辛迪加耳机"
	desc = "; 磁盘在谁手里？！"
	icon = 'icons/obj/item/clothing/ears/antag_headset.dmi'
	stored_radio = /obj/item/device/radio/headset/syndicate

	can_save = FALSE

	value = 1

/obj/item/clothing/ears/headset/mercenary
	name = "佣兵耳机"
	desc = "; 让你久等了，是吧？"
	icon = 'icons/obj/item/clothing/ears/antag_headset.dmi'
	stored_radio = /obj/item/device/radio/headset/mercenary

	can_save = FALSE

	value = 1


/obj/item/clothing/ears/headset/revolutionary
	name = "革命军耳机"
	desc = "; 为了革命！"
	icon = 'icons/obj/item/clothing/ears/antag_headset.dmi'
	stored_radio = /obj/item/device/radio/headset/revolutionary

	can_save = FALSE

	value = 1

/obj/item/clothing/ears/headset/nanotrasen
	stored_radio = /obj/item/device/radio/headset/nanotrasen
	value = 1

/obj/item/clothing/ears/headset/nanotrasen/medical
	name = "纳米传讯医疗耳机"
	desc = "; 打开制服传感器！"
	icon = 'icons/obj/item/clothing/ears/medical_headset.dmi'
	stored_radio = /obj/item/device/radio/headset/nanotrasen/medical


/obj/item/clothing/ears/headset/nanotrasen/cat
	name = "\improper 猫耳耳机"
	icon = 'icons/obj/item/clothing/hats/cat.dmi'
	desc = "; 救救喵！"
	desc_extended = "一对逼真的猫耳和一条尾巴，内嵌纳米传讯耳机。这可能是个错误。"
	stored_radio = /obj/item/device/radio/headset/nanotrasen

	no_initial_blend = TRUE

	dyeable = TRUE

	polymorphs = list(
		"outer" = "#FFFFFF",
		"inner" = "#FF8888"
	)

	worn_layer = LAYER_MOB_CLOTHING_HELMET + 0.01

	rarity = RARITY_UNCOMMON

	value = 1

/obj/item/clothing/ears/headset/nanotrasen/cat/get_base_value()
	. = ..()
	. += 5000
