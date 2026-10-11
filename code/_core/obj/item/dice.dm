/obj/item/dice
	name = "骰子"
	desc = "献给喜欢玩游戏的人。"
	desc_extended = "制作完美、绝对均匀的骰子，不受外部因素影响。"
	icon = 'icons/obj/item/dice.dmi'
	icon_state = null

	var/max_states = 6

/obj/item/dice/update_underlays()
	var/image/I = new(icon,initial(icon_state))
	add_underlay(I)
	. = ..()

/obj/item/dice/update_icon()
	icon_state = "[initial(icon_state)]-[max_states]"
	. = ..()

/obj/item/dice/Finalize()
	. = ..()
	update_sprite()

/obj/item/dice/on_thrown(var/atom/owner,var/atom/hit_atom) //What happens after the person is thrown and it hits an object.
	roll_dice(owner)
	return ..()

/obj/item/dice/proc/on_result(var/mob/activator,var/chosen_number,var/silent=FALSE)

	if(!silent)
		if(activator)
			activator.visible_message(span("notice","[activator.name]掷出[src.name]，点数是[chosen_number]。"))
		else
			src.visible_message(span("notice","[src.name]滚动着停下，点数是[chosen_number]。"))

	return TRUE

/obj/item/dice/proc/roll_dice(var/mob/activator,var/silent=FALSE)

	var/chosen_number = rand(1,max_states)

	on_result(activator,chosen_number,silent)

	icon_state = "[initial(icon_state)]-[chosen_number]"

	return TRUE

/obj/item/dice/click_self(var/mob/activator,location,control,params)

	INTERACT_CHECK
	INTERACT_DELAY(10)

	roll_dice(activator)

	return TRUE


/obj/item/dice/d6
	name = "六面骰（d6）"
	icon_state = "d6"
	max_states = 6

	value = 20

/obj/item/dice/d6/black
	icon_state = "de6"

	value = 20

/obj/item/dice/d20
	name = "二十面骰（d20）"
	icon_state = "d20"
	max_states = 20

	value = 40

/obj/item/dice/d20/cursed
	name = "命运二十面骰（d20）"
	icon_state = "d20_cursed"
	max_states = 20
	var/used = 0

	value = 2000

	value_burgerbux = 1

	rarity = RARITY_LEGENDARY

/obj/item/dice/d20/cursed/update_icon()
	. = ..()
	if(!used) icon_state = "blank"

/obj/item/dice/d20/cursed/save_item_data(var/mob/living/advanced/player/P,var/save_inventory = TRUE,var/died=FALSE,var/loadout=FALSE)
	RUN_PARENT_SAFE
	SAVEVAR("used")

/obj/item/dice/d20/cursed/load_item_data_pre(var/mob/living/advanced/player/P,var/list/object_data,var/loadout=FALSE)
	RUN_PARENT_SAFE
	LOADVAR("used")

/obj/item/dice/d20/cursed/roll_dice(var/mob/activator,var/silent=FALSE)

	if(used)
		icon_state = "[initial(icon_state)]-[used]"
		return TRUE

	return ..()

/obj/item/dice/d20/cursed/on_result(var/mob/activator,var/chosen_number,var/silent=FALSE)

	if(!activator || silent || !is_living(activator) || !activator.client)
		return ..()

	var/mob/living/L = activator

	. = ..()

	if(qdeleting) return

	used = TRUE

	var/luck_to_add = (chosen_number - 10) * 5

	if(luck_to_add)
		if(luck_to_add < 0)
			L.to_chat(span("warning","糟糕。"))
		else
			L.to_chat(span("notice","太棒了！"))
		L.add_attribute_xp(ATTRIBUTE_LUCK,luck_to_add)
	else
		L.to_chat(span("notice","嗯？"))

	visible_message(span(luck_to_add >= 0 ? "notice" : "warning","[src.name]泛起微光……"))

/obj/item/dice/d2
	name = "二面骰（d2）"
	icon_state = "d2"
	max_states = 2

	value = 40

/obj/item/dice/d4
	name = "四面骰（d4）"
	icon_state = "d4"
	max_states = 4

	value = 40

/obj/item/dice/d8
	name = "八面骰（d8）"
	icon_state = "d8"
	max_states = 8

	value = 40

/obj/item/dice/d10
	name = "十面骰（d10）"
	icon_state = "d10"
	max_states = 10

	value = 40

/obj/item/dice/d00
	name = "十位骰（d00）"
	icon_state = "d00"
	max_states = 10

	value = 40

/obj/item/dice/d12
	name = "十二面骰（d12）"
	icon_state = "d12"
	max_states = 12

	value = 40
