/obj/item/radio
	name = "无线电对讲机"
	desc = "; 通信瘫痪了"
	desc_extended = "小巧的站内中继对讲机，用于常规耳机通信失效的时候。"
	icon = 'icons/obj/item/radio.dmi'
	icon_state = "inventory"

	var/obj/item/device/radio/stored_radio = /obj/item/device/radio/headset/nanotrasen

	value = 20

	weight = 1

/obj/item/radio/get_examine_list(var/mob/examiner)
	. = ..()
	. += span("notice","按住Alt点击，可切换附近语音的自动广播。<br>使用鼠标滚轮切换频率。<br>拿在手中使用，可开关信号接收器。")

/obj/item/radio/PreDestroy()
	QDEL_NULL(stored_radio)
	. = ..()

/obj/item/radio/Generate()
	stored_radio = new stored_radio(src)
	INITIALIZE(stored_radio)
	GENERATE(stored_radio)
	FINALIZE(stored_radio)
	return ..()

/obj/item/radio/click_self(var/mob/activator,location,control,params)
	return stored_radio.click_self(activator,location,control,params)

/obj/item/radio/clicked_on_by_object(var/mob/activator as mob,var/atom/object,location,control,params)
	return stored_radio.clicked_on_by_object(activator,object,location,control,params)

/obj/item/radio/mouse_wheel_on_object(var/mob/activator,delta_x,delta_y,location,control,params)
	return stored_radio.mouse_wheel_on_object(activator,delta_x,delta_y,location,control,params)

/obj/item/radio/trigger(var/mob/activator,var/atom/source,var/signal_freq,var/signal_code)
	return stored_radio.trigger(activator,source,signal_freq,signal_code)

/obj/item/radio/save_item_data(var/mob/living/advanced/player/P,var/save_inventory = TRUE,var/died=FALSE,var/loadout=FALSE)
	RUN_PARENT_SAFE
	SAVEATOM("stored_radio")

/obj/item/radio/load_item_data_pre(var/mob/living/advanced/player/P,var/list/object_data,var/loadout=FALSE)
	RUN_PARENT_SAFE
	LOADATOM("stored_radio")
