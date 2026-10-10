/obj/hud/button/chargen/species/
	name = "更改种族"
	desc_extended = "点击这里更改角色的种族。注意，更改种族会清除你之前的外观修改。"
	icon_state = "change_species"
	screen_loc = "CENTER+2,CENTER+0"

	user_colors = TRUE

	chargen_flags = CHARGEN_NONE

/obj/hud/button/chargen/species/clicked_on_by_object(var/mob/activator,var/atom/object,location,control,params)

	. = ..()

	if(. && is_advanced(activator))
		var/mob/living/advanced/A = activator

		var/list/species_choices = list("人类" = "Human","蜥蜴人" = "Lizard","半机械人" = "Cyborg","狄俄娜" = "Dionae","蛾人" = "Moth")
		var/species_choice = input("你想变成什么种族？") as null|anything in species_choices
		if(!species_choice)
			return TRUE

		var/list/choice_to_species = list(
			"Human" = "human",
			"Lizard" = "reptile_advanced",
			"Cyborg" = "cyborg",
			"Dionae" = "diona",
			"Moth" = "moth"
		)

		var/list/confirmation_choices = list("是" = "Yes","否" = "No")
		var/choice = input("确定要将种族改为[species_choice]吗？你的外观将恢复为该种族的默认外观。","更改种族") in confirmation_choices

		if(choice && confirmation_choices[choice] == "Yes")
			A.perform_specieschange(choice_to_species[species_choices[species_choice]],TRUE,TRUE)
