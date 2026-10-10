/obj/hud/button/vr_spectate
	name = "旁观"


/obj/hud/button/vr_spectate/clicked_on_by_object(var/mob/caller,var/atom/object,location,control,params)
	. = ..()

	if(!SSvirtual_reality || !SSvirtual_reality.current_virtual_reality)
		return .

	if(!caller.client)
		return .

	if(!istype(caller,/mob/living))
		return .

	var/mob/living/L = caller

	var/virtual_reality/VR = SSvirtual_reality.current_virtual_reality

	var/list/team_list = VR.teams[L.loyalty_tag]
	if(!length(team_list))
		return FALSE
	team_list = team_list.Copy()
	team_list["取消"] = "Cancel"

	var/mob/living/desired_spectate = input("你想旁观谁？","旁观","取消") as null|anything in team_list
	if(!desired_spectate || team_list[desired_spectate] == "Cancel")
		return .

	if(!L.dead || desired_spectate.qdeleting)
		caller.to_chat(span("warning","旁观失败。"))
		return .

	L.client.spectate(desired_spectate)
