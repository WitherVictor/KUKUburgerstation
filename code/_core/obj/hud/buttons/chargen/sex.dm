/obj/hud/button/chargen/sex/
	name = "更改生理性别"
	desc_extended = "点击这里更改角色的生理性别。注意，更改生理性别会清除你之前的外观修改。"
	icon_state = "sex_other"
	screen_loc = "CENTER+2,CENTER+2"
	user_colors = TRUE

	chargen_flags = CHARGEN_SEX

/obj/hud/button/chargen/sex/update_icon()

	icon_state = "sex_other"

	if(is_advanced(owner))
		var/mob/living/advanced/L = owner
		if(L.sex == MALE)
			icon_state = "sex_male"
		else if(L.sex == FEMALE)
			icon_state = "sex_female"

	. = ..()


/obj/hud/button/chargen/sex/clicked_on_by_object(var/mob/activator,var/atom/object,location,control,params)

	. = ..()


	if(. && is_advanced(activator))
		var/mob/living/advanced/A = activator
		var/desired_sex = A.sex == MALE ? FEMALE : MALE
		var/list/confirmation_choices = list("是" = "Yes","否" = "No")
		var/choice = input("确定要将生理性别改为[desired_sex == MALE ? "男性" : "女性"]吗？你的外观将恢复默认。","更改生理性别") in confirmation_choices

		if(choice && confirmation_choices[choice] == "Yes")
			A.perform_sexchange(desired_sex,TRUE,TRUE)
