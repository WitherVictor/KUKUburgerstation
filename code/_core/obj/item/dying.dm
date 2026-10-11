/obj/item/proc/get_dye_choices()
	var/list/part_names = list(
		"ankle"="脚踝","armor"="护甲","barrel"="枪管","base"="底色","blade"="刃身",
		"blouse"="女式衬衫","body"="主体","buckle"="搭扣","buckles"="搭扣组","chaps"="护腿",
		"chest"="胸部","core"="核心","design"="花纹","detail"="细节","ears"="耳部",
		"extra"="附加装饰","eyes"="眼睛","filter"="滤罐","frill"="褶边","helmet"="头盔",
		"inner"="内侧","kneepad"="护膝","kneepads"="护膝组","lightening"="闪电图案","logo"="标志",
		"logobg"="标志背景","outer"="外侧","pants"="裤子","pockets"="口袋","shield"="盾面",
		"shirt"="衬衫","shirt_tee"="T恤","shoulder"="肩部","shoulders"="双肩","skirt"="裙子",
		"sock"="袜身","sole"="鞋底","straps"="绑带","stripe"="单条纹","stripes"="条纹",
		"trim"="镶边","under"="底层","visor"="面罩","none"="无图案","nanotrasen"="纳米传讯标志",
		"syndicate"="辛迪加标志","mchonk"="麦鸣笛标志","heart"="爱心","happy"="笑脸","circle"="圆形",
		"blank"="空白","neutral"="平静表情","closed"="闭眼","plus"="加号","square"="方框",
		"target"="靶心","vertical"="竖线","horizontal"="横线","x"="叉号","bug"="虫子",
		"twoline"="双线","mark"="标记","0"="零","1"="图案1"
	)
	. = list()
	for(var/part in polymorphs)
		var/part_name = part_names[part] ? part_names[part] : part
		.["[part_name]（[length(.)+1]）"] = part

/obj/item/proc/dye_self(var/mob/activator,var/obj/item/D,var/dye_color,var/dye_strength=0.5)

	if(!dye_color)
		dye_color = "#FFFFFF"

	INTERACT_CHECK_NO_DELAY(src)
	INTERACT_CHECK_NO_DELAY(D)

	if(!dyeable)
		activator.to_chat(span("warning","[src.name]无法染色。"))
		return FALSE

	if(!can_save)
		activator.to_chat(span("warning","你无法给[src.name]染色！请尝试给这套服装的主体部分染色。"))
		return FALSE

	var/list/confirmation_labels = list("是"="Yes","否"="No","取消"="Cancel")
	var/choice
	if(length(polymorphs))
		if(length(polymorphs)>1)
			var/list/dye_choices = get_dye_choices()
			choice = input("你想给哪个部分染色？","染色选择") as null|anything in dye_choices
			choice = dye_choices[choice]
		else
			choice = input("确定要给[src.name]染色吗？","染色选择") as null|anything in confirmation_labels
			choice = confirmation_labels[choice]
			if(choice) choice = polymorphs[1]
		if(choice)
			INTERACT_CHECK_NO_DELAY(src)
			INTERACT_CHECK_NO_DELAY(D)
			polymorphs[choice] = blend_colors(polymorphs[choice] ? polymorphs[choice] : "#FFFFFF",dye_color,dye_strength)
			add_blend(
				"polymorph_[choice]",
				desired_color = polymorphs[choice],
			)
	else
		choice = input("确定要给[src.name]染色吗？","染色选择") as null|anything in confirmation_labels
		choice = confirmation_labels[choice]
		if(choice == "Yes")
			INTERACT_CHECK_NO_DELAY(src)
			INTERACT_CHECK_NO_DELAY(D)
			color = blend_colors(color ? color : "#FFFFFF",dye_color,dye_strength)
		else
			choice = null

	if(choice)
		activator.to_chat(span("notice","你给[src.name]染了色。"))
		update_sprite()
		if(is_inventory(src.loc))
			var/obj/hud/inventory/I = src.loc
			if(is_advanced(I.owner))
				src.handle_overlays(I.owner,update=TRUE)
		if(istype(src,/obj/item/clothing/))
			var/obj/item/clothing/C = src
			C.sync_additional_clothing()

		return TRUE
	else
		activator.to_chat(span("notice","你决定不给任何物品染色。"))

	return FALSE
