/obj/item/clothing/mask/paper
	name = "纸面具"
	icon = 'icons/obj/item/clothing/masks/paper.dmi'
	desc = "送给特别的人，比如你！"
	desc_extended = "拿在手中时按住Alt点击，可更换图案。"

	size = SIZE_2
	weight = 0

	value = 1

	dyeable = TRUE

	polymorphs = list(
		"base" = COLOR_WHITE,
		"1" = "#000000"
	)

/obj/item/clothing/mask/paper/Finalize()
	. = ..()
	update_sprite()

/obj/item/clothing/mask/paper/click_self(var/mob/activator,location,control,params)
	var/mob/C = activator
	if(C.attack_flags & CONTROL_MOD_DISARM && istype(src.loc,/obj/hud/inventory/organs/))
		INTERACT_CHECK
		var/list/design_options = list("标志" = "Logo")
		var/choice = input("你想更换[src.name]的哪个部分？","选择图案") as null|anything in design_options //removing this would make this not work
		choice = design_options[choice]
		if(choice == "Logo")
			var/logomenu = list( //lazy names, but...
				"blank" = 0,
				"neutral" = 1,
				"eyes" = 2,
				"closed" = 2,
				"heart" = 4,
				"0" = 5,
				"plus" = 6,
				"square" = 7,
				"target" = 8,
				"vertical" = 9,
				"horizontal" = 10,
				"x" = 11,
				"bug" = 12,
				"twoline" = 13,
				"mark" = 14
			)
			INTERACT_CHECK
			var/list/logo_options = list(
				"空白" = "blank",
				"平静表情" = "neutral",
				"眼睛" = "eyes",
				"闭眼" = "closed",
				"爱心" = "heart",
				"零" = "0",
				"加号" = "plus",
				"方框" = "square",
				"靶心" = "target",
				"竖线" = "vertical",
				"横线" = "horizontal",
				"叉号" = "x",
				"虫子" = "bug",
				"双线" = "twoline",
				"标记" = "mark"
			)
			choice = input("你想换成什么图案？","选择图案") as null|anything in logo_options
			choice = logo_options[choice]
			if(choice && (choice in logomenu))
				INTERACT_CHECK
				polymorphs = list(
				"base" = COLOR_WHITE, //removing the colors from this would be a Bad Idea, and there's no point of reference for the colors
				"[choice]" = "#000000"

				)
				activator.to_chat(span("notice","你更换了[src.name]的图案。"))
				update_icon() //what it doesn't do is remove the previous polymorphs until re-cryo. While the designs CAN look cool, this is unintended.
		else
			activator.to_chat(span("notice","你决定不更换[src.name]的图案。"))
			return TRUE
		update_sprite()
		return TRUE

	return ..()
