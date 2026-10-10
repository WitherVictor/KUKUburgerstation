/obj/item/analyzer/genetic
	name = "基因分析仪"
	desc = "别动，让我看看你的基因！"
	desc_extended = "一种手持便携基因分析仪，可显示目标的主要基因特征。"

	icon = 'icons/obj/item/analyzers/genetic.dmi'
	icon_state = "inventory"
	value = 300

/obj/item/analyzer/genetic/can_be_scanned(var/mob/caller,var/atom/target)

	if(get_dist(caller,target) > 1)
		caller.to_chat(span("warning","你离得太远了！"))
		return FALSE

	return is_living(target)


/obj/item/analyzer/genetic/on_scan(var/mob/caller,var/atom/target,location,control,params)

	caller.to_chat(span("notice bold underline","[target.name]的特质："))

	var/list/list_to_print = list()
	var/mob/living/L = target
	for(var/k in L.traits)
		var/trait/T = TRAIT(k)
		list_to_print += T.name

	caller.to_chat(span("notice",english_list(list_to_print,"无","和","、")))

	return TRUE
