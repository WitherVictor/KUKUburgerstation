/obj/item/instrument/
	name = "钢琴"
	desc = "本品不附赠才华。"
	desc_extended = "可在/tg/ Station维基找到乐谱。"
	var/song/current_song = /song/
	var/instrument_type = "piano"

	value = 1000

/obj/item/instrument/New(var/desired_loc)
	. = ..()
	current_song = new current_song(src)
	current_song.instrument_directory = instrument_type
	
/obj/item/instrument/click_self(var/mob/caller,location,control,params)
	if(caller && current_song)
		current_song.interact(caller)
	return TRUE

/obj/item/instrument/clicked_on_by_object(var/mob/caller,var/atom/object,location,control,params)

	if(anchored)

		INTERACT_CHECK

		if(caller && current_song)
			current_song.interact(caller)

		return TRUE

	return ..()

/obj/item/instrument/accordion
	name = "手风琴"
	desc = "清除烤肉。"
	desc_extended = "可在/tg/ Station维基找到乐谱。"
	icon = 'icons/obj/item/instrument/accordion.dmi'
	instrument_type = "accordion"
	value = 400

/obj/item/instrument/banjo
	name = "班卓琴"
	desc = "用来赶走泥沼蟹。"
	desc_extended = "可在/tg/ Station维基找到乐谱。"
	icon = 'icons/obj/item/instrument/banjo.dmi'
	instrument_type = "banjo"
	value = 400

/obj/item/instrument/bikehorn
	name = "自行车喇叭"
	desc = "嘟！"
	desc_extended = "可在/tg/ Station维基找到乐谱。"
	icon = 'icons/obj/item/instrument/bikehorn.dmi'
	instrument_type = "bikehorn"
	value = 300

/obj/item/instrument/eguitar
	name = "电吉他"
	desc = "想让台下朝你扔内裤？这可是经久不衰的经典。"
	desc_extended = "可在/tg/ Station维基找到乐谱。"
	icon = 'icons/obj/item/instrument/eguitar.dmi'
	instrument_type = "eguitar"
	value = 600

/obj/item/instrument/glockenspiel
	name = "钟琴"
	desc = "D, D, D, A, G#, G, F, D, G, F"
	desc_extended = "可在/tg/ Station维基找到乐谱。"
	icon = 'icons/obj/item/instrument/glockenspiel.dmi'
	instrument_type = "glockenspiel"
	value = 500

/obj/item/instrument/guitar
	name = "吉他"
	desc = "咿——哈——！"
	desc_extended = "可在/tg/ Station维基找到乐谱。"
	icon = 'icons/obj/item/instrument/guitar.dmi'
	instrument_type = "guitar"
	value = 400

/obj/item/instrument/harmonica
	name = "口琴"
	desc = "满腹忧愁的工人阶级男人最爱的乐器。"
	desc_extended = "可在/tg/ Station维基找到乐谱。"
	icon = 'icons/obj/item/instrument/harmonica.dmi'
	instrument_type = "harmonica"
	value = 300

/obj/item/instrument/piano
	name = "钢琴"
	desc = "本品不附赠才华。"
	desc_extended = "可在/tg/ Station维基找到乐谱。"
	icon = 'icons/obj/item/instrument/piano.dmi'
	instrument_type = "piano"
	anchored = TRUE
	value = 1000

/obj/item/instrument/recorder
	name = "竖笛"
	desc = "主要用来把好歌翻吹成难听的搞笑版本。"
	desc_extended = "可在/tg/ Station维基找到乐谱。"
	icon = 'icons/obj/item/instrument/recorder.dmi'
	instrument_type = "recorder"
	value = 300

/obj/item/instrument/saxophone
	name = "萨克斯管"
	desc = "心怀愧疚，脚步再也踩不准节拍。"
	desc_extended = "可在/tg/ Station维基找到乐谱。"
	icon = 'icons/obj/item/instrument/saxophone.dmi'
	instrument_type = "saxophone"
	value = 500

/obj/item/instrument/trombone
	name = "长号"
	desc = "很适合骷髅演奏的乐器。"
	desc_extended = "可在/tg/ Station维基找到乐谱。"
	icon = 'icons/obj/item/instrument/trombone.dmi'
	instrument_type = "trombone"
	value = 500

/obj/item/instrument/violin
	name = "小提琴"
	desc = "虽不是世上最小的小提琴，拿来表达同情也够用了。"
	desc_extended = "可在/tg/ Station维基找到乐谱。"
	icon = 'icons/obj/item/instrument/violin.dmi'
	instrument_type = "violin"
	value = 500

/obj/item/instrument/xylophone
	name = "木琴"
	desc = "就像幼儿园里那样！"
	desc_extended = "可在/tg/ Station维基找到乐谱。"
	icon = 'icons/obj/item/instrument/xylophone.dmi'
	instrument_type = "xylophone"
	anchored = TRUE
	value = 300

