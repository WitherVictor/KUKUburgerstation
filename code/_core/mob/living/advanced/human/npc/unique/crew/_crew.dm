/mob/living/advanced/npc/unique/crew
	name = "舰船船员"

/mob/living/advanced/npc/unique/crew/Initialize()
	. = ..()
	add_organ(/obj/item/organ/internal/implant/hand/left/iff)
	return ..()


/mob/living/advanced/npc/unique/crew/front_desk/
	name = "抵达区接待员"
	desc = "受过专业训练，能忍受新船员的各种胡扯。"
	species = "human"
	gender = FEMALE
	sex = FEMALE
	dialogue_id = /dialogue/tutorial/front_desk
	dir = SOUTH

	level = 1

/mob/living/advanced/npc/unique/crew/front_desk/Initialize()
	sex = pick(MALE,FEMALE)
	gender = sex
	. = ..()
	change_organ_visual("skin", desired_color = pick("#E0BCAA","#BC9E8F","#967F73","#7A675E"))
	change_organ_visual("hair_head", desired_color = "#FFFFFF", desired_icon_state = "none")
	update_all_blends()
	equip_loadout(/loadout/bartender)
