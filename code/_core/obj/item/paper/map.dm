/obj/item/map/
	name = "电子地图"
	desc = "唔。"
	desc_extended = "一种特殊电子设备，可以显示使用者当前位置的数字地图。"
	icon = 'icons/obj/item/map.dmi'
	icon_state = "inventory"
	value = 100

/obj/item/map/click_self(var/mob/caller)

	var/obj/hud/button/map_background/M_control = locate() in caller.buttons

	if(M_control)
		M_control.update_owner(null)
		caller.to_chat(span("notice","你收起了地图。"))
	else
		M_control = new(caller)
		M_control.update_owner(caller)
		caller.to_chat(span("notice","你打开了地图。"))

	return TRUE
