/obj/item/device/radio/
	name = "无线电"
	desc = "远距离通讯，能出什么岔子呢？"
	desc_extended = "回收来的无线电内部电子组件，不知怎么被拆出了外壳，却仍能正常工作。"
	icon = 'icons/obj/item/radio_transmitter.dmi'
	icon_state = "inventory"

	var/frequency = RADIO_FREQ_COMMON //The broadcasting frequency of the radio.
	var/list/listening_frequencies = list() // The frequencies this radio is allowed to talk on. The above frequency is included.

	var/receiving = TRUE //Whether or not the radio can receive messages.
	var/broadcasting = FALSE //Whether or not the radio can broadcast messages without having to press the button.

	var/frequency_min = RADIO_FREQ_ALPHA
	var/frequency_max = RADIO_FREQ_MAX

	var/spam_fix_time = 0

	var/radio_sound = 'sound/items/radio.ogg'

	var/broadcasting_range = 5 //Range in tiles of which to broadcast sounds.
	var/listen_range = VIEW_RANGE //Range in tiles of which to recieve sounds. Set to 0 to ignore.

	listener = TRUE //This should always be true.

	value = 20

/obj/item/device/radio/get_examine_list(var/mob/examiner)
	. = ..()
	. += span("notice","ALT+单击可切换附近语音的自动广播。<br>使用鼠标滚轮切换频率。<br>在手中使用可开关接收器；CTRL+单击可设置监听频率。")

/obj/item/device/radio/Generate()
	. = ..()
	listening_frequencies = list(
		"[frequency]" = TRUE
	)

/obj/item/device/radio/save_item_data(var/mob/living/advanced/player/P,var/save_inventory = TRUE,var/died=FALSE,var/loadout=FALSE)
	RUN_PARENT_SAFE
	SAVEVAR("frequency")
	SAVELIST("listening_frequencies")

/obj/item/device/radio/load_item_data_post(var/mob/living/advanced/player/P,var/list/object_data,var/loadout=FALSE)
	RUN_PARENT_SAFE
	LOADVAR("frequency")
	LOADLIST("listening_frequencies")

/obj/item/device/radio/click_self(var/mob/activator,location,control,params)
	INTERACT_CHECK
	INTERACT_DELAY(1)

	if(activator.attack_flags & CONTROL_MOD_GRAB)

		var/list/possible_settings = list()

		for(var/k in listening_frequencies)
			var/frequency_string = frequency_to_display_name(text2num(k))
			if(frequency_to_name(text2num(k)) == "Unknown")
				frequency_string = "[text2num(k)*0.1] kHz"
			var/active = listening_frequencies[k] ? TRUE : FALSE
			possible_settings["[active ? "移除" : "添加"] [frequency_string]"] = k

		possible_settings["添加频率……"] = "Add..."
		possible_settings["取消"] = "Cancel"

		var/chosen_label = input("你想进行什么操作？","无线电设置","取消") as null|anything in possible_settings
		if(!chosen_label)
			return TRUE
		var/chosen_setting = possible_settings[chosen_label]
		if(chosen_setting == "Add...")
			var/desired_frequency = input("你想添加哪个频率？","添加频率","[RADIO_FREQ_COMMON]") as null|text
			if(!desired_frequency)
				return TRUE
			desired_frequency = text2num(desired_frequency)
			if(!desired_frequency || desired_frequency <= 0)
				activator.to_chat(span("warning","频率无效！"))
				return TRUE
			if(MODULUS(desired_frequency,1)) //Entered a correct frequency, however it needs to be multiplied to fit the current system.
				desired_frequency *= 10
			desired_frequency = round(desired_frequency,2) + 1
			if(desired_frequency > frequency_max)
				activator.to_chat(span("warning","输入频率（[desired_frequency*0.1] kHz）超过了这台无线电的最高频率（[frequency_max*0.1] kHz）！"))
				return TRUE
			if(desired_frequency < frequency_min)
				activator.to_chat(span("warning","输入频率（[desired_frequency*0.1] kHz）低于这台无线电的最低频率（[frequency_min*0.1] kHz）！"))
				return TRUE

		else if(chosen_setting == "Cancel")
			return TRUE
		else
			//We have an existing number. Toggle it.
			listening_frequencies[chosen_setting] = !listening_frequencies[chosen_setting]
			activator.to_chat(span("notice","[src.name]的监听列表已[listening_frequencies[chosen_setting] ? "添加" : "移除"]频率[text2num(chosen_setting)*0.1] kHz（[frequency_to_display_name(text2num(chosen_setting))]）。"))
		return TRUE

	if(activator.attack_flags & CONTROL_MOD_DISARM)
		broadcasting = !broadcasting
		activator.to_chat(span("notice","你将麦克风设为<b>[broadcasting ? "持续广播" : "仅在按键时广播"]</b>。"))
		return TRUE


	receiving = !receiving
	activator.to_chat(span("notice","你<b>[receiving ? "开启" : "关闭"]</b>了信号接收器。"))
	return TRUE

/obj/item/device/radio/mouse_wheel_on_object(var/mob/activator,delta_x,delta_y,location,control,params)

	INTERACT_CHECK

	var/fixed_delta = clamp(delta_y,-1,1)*2

	var/old_frequency = frequency

	frequency = 1 + FLOOR(frequency + fixed_delta,2)

	if(frequency > frequency_max) frequency = frequency_max
	if(frequency < frequency_min) frequency = frequency_min

	var/frequency_string = frequency_to_display_name(frequency)
	if(frequency_to_name(frequency) == "Unknown")
		frequency_string = null

	var/freq = frequency_string ? " (<b>[frequency_string]</b>)" : ""

	if(old_frequency == frequency)
		activator.to_chat(span("warning","频率似乎不能再[frequency == frequency_min ? "降低" : "提高"]了！"))
	else if(spam_fix_time <= world.time)
		activator.to_chat(span("notice","你将[src.name]的频率设为[frequency*0.1] kHz[freq]……"))
	else
		activator.to_chat(span("notice","……[frequency*0.1] kHz[freq]……"))

	spam_fix_time = world.time + 20

	return TRUE

/obj/item/device/radio/Finalize()
	. = ..()
	SSradio.all_radios += src

/obj/item/device/radio/PreDestroy()
	SSradio.all_radios -= src
	. = ..()

//Radio Data Format
/*

list(
	"speaker" = atom or text,
	"message" = text,
	"time" = time as time of day
	"source" = mob or radio
	"frequency" = number of the radio frequency
)
*/

/obj/item/device/radio/trigger(var/mob/activator,var/atom/source,var/signal_freq,var/signal_code)

	if(signal_freq == -1) //Sent
		for(var/k in SSradio.all_radios)
			var/obj/item/device/radio/S = k
			if(S == src)
				continue
			S.trigger(activator,src,frequency,signal_code)
	else //Recieved
		if(loc && signal_freq == frequency)
			loc.trigger(activator,src,signal_freq,signal_code)
			return TRUE

/obj/item/device/radio/on_listen(var/atom/speaker,var/datum/source,var/text,var/raw_text,var/language_text,var/talk_type,var/frequency, var/language = LANGUAGE_BASIC,var/talk_range=TALK_RANGE)
	if(talk_type == TEXT_RADIO) //Don't listen to other radio signals. This prevents spam.
		return FALSE
	if(listen_range > 0 && get_dist(source,src) > listen_range)
		return FALSE
	if(!broadcasting && !(frequency > 0)) //Dumb logic here, but it catches null as well as null (greater,less,equal) 0 is always 0.
		return FALSE
	if(frequency > 0 && (frequency < frequency_min || frequency > frequency_max))
		return FALSE
	use_radio(speaker,src,text,raw_text,language_text,talk_type,src.frequency,language,talk_range)
	. = ..()

/obj/item/device/radio/nanotrasen
	name = "\improper 纳米传讯站用无线电"

	frequency_min = RADIO_FREQ_ALPHA - 20
	frequency_max = RADIO_FREQ_SHIP + 20

	value = 15

/obj/item/device/radio/headset
	name = "耳机无线电"
	broadcasting_range = 1
	listen_range = 2

/obj/item/device/radio/headset/nanotrasen
	name = "\improper 纳米传讯耳机无线电"

	frequency_min = RADIO_FREQ_ALPHA - 20
	frequency_max = RADIO_FREQ_SHIP + 20

	value = 15

/obj/item/device/radio/headset/nanotrasen/medical
	name = "\improper 纳米传讯医疗耳机无线电"

	frequency_min = RADIO_FREQ_ALPHA - 20
	frequency_max = RADIO_FREQ_SHIP + 20

	value = 15

/obj/item/device/radio/headset/nanotrasen/medical/Generate()
	. = ..()
	listening_frequencies["[RADIO_FREQ_MEDICAL]"] = TRUE


/obj/item/device/radio/headset/mercenary
	name = "\improper 佣兵耳机无线电"

	frequency_min = RADIO_FREQ_MERCENARY_MIN
	frequency_max = RADIO_FREQ_COMMON

	can_save = FALSE

	value = 300

/obj/item/device/radio/headset/mercenary/Generate()
	. = ..()
	frequency = SSradio.radio_merc
	listening_frequencies = list(
		"[RADIO_FREQ_COMMON]" = TRUE,
		"[frequency]" = TRUE
	)

/obj/item/device/radio/headset/syndicate
	name = "\improper 辛迪加耳机无线电"

	frequency_min = RADIO_FREQ_SYNDICATE_MIN
	frequency_max = RADIO_FREQ_COMMON

	can_save = FALSE

	value = 300

/obj/item/device/radio/headset/syndicate/Generate()
	. = ..()
	frequency = SSradio.radio_syn
	listening_frequencies = list(
		"[RADIO_FREQ_COMMON]" = TRUE,
		"[frequency]" = TRUE
	)

/obj/item/device/radio/headset/revolutionary
	name = "\improper 革命者耳机无线电"

	frequency_min = RADIO_FREQ_REVOLUTIONARY_MIN
	frequency_max = RADIO_FREQ_COMMON

	can_save = FALSE

	value = 300

/obj/item/device/radio/headset/revolutionary/Generate()
	. = ..()
	frequency = SSradio.radio_rev
	listening_frequencies = list(
		"[RADIO_FREQ_COMMON]" = TRUE,
		"[frequency]" = TRUE
	)
