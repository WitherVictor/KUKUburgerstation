/mob/abstract/observer/verb/adjust_darkvision()
	set name = "Adjust Darkvision"
	set category = "Game"

	var/desired_value = input("你希望将夜视强度设为多少？（0 至 255，数值越高，视野越清晰。）","调整夜视",255 - plane_master_lighting.alpha) as null|num

	if(isnum(desired_value))
		plane_master_lighting.alpha = clamp(255 - desired_value,0,255)

