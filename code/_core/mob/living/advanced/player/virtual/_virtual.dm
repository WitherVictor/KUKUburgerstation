/mob/living/advanced/player/virtual
	name = "虚拟化身"
	allow_save = FALSE
	damage_received_multiplier = 0.25

/mob/living/advanced/player/virtual/initialize_attributes()

	if(!is_player(fallback_mob))
		return ..()

	var/mob/living/advanced/player/P = fallback_mob

	attributes = P.attributes

/mob/living/advanced/player/virtual/initialize_skills()

	if(!is_player(fallback_mob))
		return ..()

	var/mob/living/advanced/player/P = fallback_mob

	skills = P.skills

/mob/living/advanced/player/virtual/post_death()

	. = ..()

	if(SSvirtual_reality.current_virtual_reality)
		SSvirtual_reality.current_virtual_reality.player_post_death(src)



/mob/living/advanced/player/virtual/try_logout()

	if(!is_player(fallback_mob))
		return FALSE

	if(!istype(fallback_mob.loc,/obj/structure/interactive/vr_pod/))
		return FALSE

	var/list/exit_choices = list("是" = "Yes","否" = "No","取消" = "Cancel")
	var/choice = input("确定要退出虚拟现实吗？本轮虚拟现实结束前，你将无法再次进入。","退出虚拟现实回合","取消") as null|anything in exit_choices
	if(!choice || exit_choices[choice] != "Yes")
		return FALSE

	if(!is_player(fallback_mob))
		return FALSE

	if(!istype(fallback_mob.loc,/obj/structure/interactive/vr_pod/))
		return FALSE

	var/obj/structure/interactive/vr_pod/VR = fallback_mob.loc
	VR.exit_virtual_reality()

	return TRUE
