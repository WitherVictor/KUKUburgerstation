/obj/structure/interactive/vending/old_ammo
	name = "古旧弹药售货机"
	desc = "这弹药种类可真够奇怪的……"
	desc_extended = "一台古旧的弹药售货机，保存得出奇完好。"
	icon_state = "liberationstation"

	stored_types = list()

/obj/structure/interactive/vending/old_ammo/Finalize()

	var/list/possible_ammo = (subtypesof(/obj/item/magazine/) - typesof(/obj/item/magazine/clip/)) - stored_types

	for(var/i=1,i<=12,i++)
		var/selection = pick(possible_ammo)
		possible_ammo -= selection
		CREATE(selection,src.loc)

	return ..()
