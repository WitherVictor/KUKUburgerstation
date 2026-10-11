/obj/item/firing_pin/
	name = "击针"
	desc = "没错，这里也有这东西。"
	desc_extended = "枪械的击发组件，可以控制谁能开火、什么能触发开火、何时何地开火、为何开火以及如何开火。它也负责枪械的敌我识别设置。"
	var/iff_tag = null
	icon = 'icons/obj/item/firing_pins.dmi'
	icon_state = "normal"

	weight = 0.25

	rarity = RARITY_UNCOMMON

	value = 0

/obj/item/firing_pin/proc/can_shoot(var/mob/activator,var/obj/item/weapon,var/messages=TRUE)
	return TRUE

/obj/item/firing_pin/proc/on_shoot(var/mob/activator,var/obj/item/weapon)
	return TRUE

/obj/item/firing_pin/electronic
	name = "电子击针"

/obj/item/firing_pin/electronic/iff/can_shoot(var/mob/activator,var/obj/item/weapon,var/messages=TRUE)

	if(src.iff_tag)
		if(!is_living(activator))
			if(messages) activator.to_chat(span("danger","击针未检测到你的敌我识别信号，拒绝开火！"))
			return FALSE

		var/mob/living/L = activator

		if(L.iff_tag != src.iff_tag)
			if(messages) activator.to_chat(span("danger","击针无法识别你的敌我识别信号，拒绝开火！"))
			return FALSE

	. = ..()

/obj/item/firing_pin/electronic/iff/nanotrasen
	name = "纳米传讯电子击针"
	desc_extended = "纳米传讯规格的电子击针，配有纳米传讯敌我识别标记。禁止在教程区域开火。"
	iff_tag = "NanoTrasen"
	icon_state = "nanotrasen"

/obj/item/firing_pin/electronic/iff/nanotrasen/can_shoot(var/mob/activator,var/obj/item/weapon)

	var/area/A = get_area(activator)
	if(A.flags_area & FLAG_AREA_TUTORIAL)
		activator.to_chat(span("danger","[src.name]拒绝在此区域开火！"))
		return FALSE

	return TRUE

/obj/item/firing_pin/electronic/iff/nanotrasen/nyantrasen
	name = "喵米传讯电子击针"
	desc_extended = "纳米传讯规格的电子击针，配有纳米传讯敌我识别标记，禁止在教程区域开火。这枚似乎还装着某种扬声器……"
	iff_tag = "NanoTrasen"
	icon_state = "nanotrasen"
	value = 1000

/obj/item/firing_pin/electronic/iff/nanotrasen/nyantrasen/on_shoot(var/mob/activator,var/obj/item/weapon)
	if(activator && weapon)
		var/turf/T = get_turf(weapon)
		if(T) play_sound('sound/voice/catgirl/meow.ogg',T)
	return ..()

/obj/item/firing_pin/electronic/iff/nanotrasen/honkmother
	name = "鸣笛之母电子击针"
	desc_extended = "纳米传讯规格的电子击针，配有纳米传讯敌我识别标记，禁止在教程区域开火。这枚似乎还装着某种扬声器……"
	iff_tag = "NanoTrasen"
	icon_state = "nanotrasen"
	value = 666

/obj/item/firing_pin/electronic/iff/nanotrasen/honkmother/on_shoot(var/mob/activator,var/obj/item/weapon)
	if(activator && weapon)
		var/turf/T = get_turf(weapon)
		if(T) play_sound('sound/items/bikehorn.ogg',T)
	return ..()

/obj/item/firing_pin/electronic/iff/syndicate
	name = "辛迪加击针"
	desc_extended = "枪械的击发组件，只允许持有辛迪加敌我识别标记的使用者开火，并配合枪械的敌我识别系统避免击中同类标记持有者。"
	iff_tag = "Syndicate"
	icon_state = "syndicate"


/obj/item/firing_pin/electronic/iff/bone
	name = "骨制击针"
	desc_extended = "枪械的击发组件，只允许持有骷髅敌我识别标记的使用者开火，并配合枪械的敌我识别系统避免击中同类标记持有者。"
	iff_tag = "Skeleton"
	icon_state = "bone"


/obj/item/firing_pin/electronic/iff/revolutionary
	name = "革命军击针"
	desc_extended = "枪械的击发组件，只允许持有革命军敌我识别标记的使用者开火，并配合枪械的敌我识别系统避免击中同类标记持有者。"
	iff_tag = "Revolutionary"
	icon_state = "revolution"


/obj/item/firing_pin/electronic/iff/deathsquad
	name = "敢死队击针"
	desc_extended = "枪械的击发组件，只允许持有敢死队敌我识别标记的使用者开火，并配合枪械的敌我识别系统避免击中同类标记持有者。"
	iff_tag = "Deathsquad"
	icon_state = "deathsquad"

/obj/item/firing_pin/electronic/iff/space_cop
	name = "太空警察击针"
	desc_extended = "枪械的击发组件，只允许持有太空警察敌我识别标记的使用者开火，并配合枪械的敌我识别系统避免击中同类标记持有者。"
	iff_tag = "Space Cop"
	icon_state = "deathsquad"

/obj/item/firing_pin/electronic/iff/mercenary
	name = "佣兵击针"
	desc_extended = "枪械的击发组件，只允许持有佣兵敌我识别标记的使用者开火，并配合枪械的敌我识别系统避免击中同类标记持有者。"
	iff_tag = "Mercenary"
	icon_state = "deathsquad"
