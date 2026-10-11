/obj/item/tempering/luck
	name = "幸运四叶草"
	desc = "好运来了！"
	desc_extended = "非常稀有的四叶草。"
	icon_state = "luck"

	increase = 1
	minimum = 50
	maximum = 100

	temper_whitelist = /obj/item/

	value = 4000

	uses_left = 4

/obj/item/tempering/luck/get_examine_list(var/mob/examiner)
	. = ..()
	. += span("notice","使物品的幸运值提高[increase]个百分点，最低为[minimum]%，最高为[maximum]%。")

/obj/item/tempering/luck/can_temper(var/mob/activator,var/obj/item/I)

	if(I.luck >= maximum)
		activator.to_chat(span("warning","[I.name]无法继续强化！"))
		return FALSE

	. = ..()

/obj/item/tempering/luck/on_temper(var/mob/activator,var/obj/item/I)
	I.luck = clamp(I.luck + increase,minimum,maximum)
	. = ..()

/obj/item/tempering/luck/double
	name = "双生幸运四叶草"
	desc = "好运加倍！"
	desc_extended = "非常稀有的连体四叶草。"
	icon_state = "luck2"

	increase = 1
	minimum = 50
	maximum = 100

	value = 8000

	uses_left = 8
