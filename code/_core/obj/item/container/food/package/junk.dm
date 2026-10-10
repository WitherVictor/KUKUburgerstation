/obj/item/container/edible/package/junkfood
	name = "垃圾食品"
	icon = 'icons/obj/item/consumable/food/processed.dmi'

/obj/item/container/edible/package/junkfood/chips
	name = "薯薯脆片"
	desc = "嗯，一股平庸的味道！"
	desc_extended = "原味，跟吃它的人一样平淡无奇。"
	icon_state = "chips"
	value = 1

/obj/item/container/edible/package/junkfood/chips/Initialize()
	name = pick("薯薯脆片","脆脆薯片")
	return ..()

/obj/item/container/edible/package/junkfood/chips/Generate()
	reagents.add_reagent(/reagent/nutrition/junk/chips,20)
	reagents.add_reagent(/reagent/salt,10)
	return ..()


/obj/item/container/edible/package/junkfood/candy
	name = "再来一根巧克力棒"
	desc = "牛轧糖，爱它就吃了它。"
	desc_extended = "其实相当不错的巧克力棒。"
	icon_state = "candy"
	value = 1

/obj/item/container/edible/package/junkfood/candy/Generate()
	reagents.add_reagent(/reagent/nutrition/junk/chocolate,10)
	reagents.add_reagent(/reagent/nutrition/sugar,5)
	return ..()



/obj/item/container/edible/package/junkfood/jerky
	name = "求救牌肉干"
	desc = "给你加油站的感觉。"
	desc_extended = "一包肉干。不知为何，加油站的小卖部总能见到它。"
	icon_state = "jerky"
	value = 1

/obj/item/container/edible/package/junkfood/jerky/Generate()
	reagents.add_reagent(/reagent/nutrition/junk/jerky,15)
	reagents.add_reagent(/reagent/salt,5)
	return ..()

/obj/item/container/edible/package/junkfood/raisins
	name = "四不牌葡萄干"
	desc = "管理员快来救命啊。"
	desc_extended = "这个葡萄干品牌的吉祥物叫“葡萄干拉屎怪”，已连续75年被评为最不受欢迎的吉祥物。"
	icon_state = "raisins"
	value = 1

/obj/item/container/edible/package/junkfood/raisins/Generate()
	reagents.add_reagent(/reagent/nutrition/junk/raisins,10)
	reagents.add_reagent(/reagent/salt,5)
	reagents.add_reagent(/reagent/nutrition/sugar,5)
	return ..()


/obj/item/container/edible/package/junkfood/cake
	name = "太空奶油蛋糕"
	desc = "它大概比你还能活。"
	desc_extended = "虽然是垃圾食品，有些人却把这种奶油蛋糕看得非常重要。"
	icon_state = "cake"
	value = 1

/obj/item/container/edible/package/junkfood/cake/Generate()
	reagents.add_reagent(/reagent/nutrition/junk/cake,10)
	reagents.add_reagent(/reagent/nutrition/junk/cream_filling,5)
	reagents.add_reagent(/reagent/nutrition/sugar,5)
	return ..()


/obj/item/container/edible/package/junkfood/syndicate
	name = "辛迪小蛋糕"
	desc = "嗯，一股背叛的味道！"
	desc_extended = "传说这款辛迪加产品之所以能在这里出售，是因为杰克·特拉森实在吃不够。"
	icon_state = "syndicate"
	value = 1

/obj/item/container/edible/package/junkfood/syndicate/Generate()
	reagents.add_reagent(/reagent/nutrition/junk/cake,10)
	reagents.add_reagent(/reagent/medicine/omnizine,10)
	return ..()

/obj/item/container/edible/package/junkfood/cheese_chips
	name = "鸣笛奶酪脆片"
	desc = "让你的嘴里响遍喇叭声的奶酪零食。"
	desc_extended = "不知为何采用小丑品牌包装的奶酪脆片。"
	icon_state = "cheesie_honkers"
	value = 1

/obj/item/container/edible/package/junkfood/cheese_chips/Generate()
	reagents.add_reagent(/reagent/nutrition/junk/chips,10)
	reagents.add_reagent(/reagent/salt,5)
	reagents.add_reagent(/reagent/nutrition/junk/cheese_powder,15)
	return ..()


/obj/item/container/edible/package/junkfood/halloween
	icon = 'icons/obj/item/consumable/food/candy.dmi'
	packaging = /obj/item/trash/candy
	value = 1

/obj/item/container/edible/package/junkfood/halloween/update_icon()
	icon_state = initial(icon_state)
	if(!packaging)
		icon_state = "[icon_state]_open"
	return ..()


/obj/item/container/edible/package/junkfood/halloween/unwrap(var/mob/activator,var/obj/hud/inventory/I)

	. = ..()

	if(.) update_sprite()


/obj/item/container/edible/package/junkfood/halloween/create_packaging()
	var/obj/item/trash/T = ..()
	T.icon = icon
	T.icon_state = "[initial(icon_state)]_trash"
	return T

/obj/item/container/edible/package/junkfood/halloween/credit
	name = "百信用点巧克力棒"
	icon_state = "100_credit_bar"
	value = 1

/obj/item/container/edible/package/junkfood/halloween/credit/Generate()
	reagents.add_reagent(/reagent/nutrition/junk/chocolate,5)
	reagents.add_reagent(/reagent/nutrition/sugar/caramel,3)
	reagents.add_reagent(/reagent/nutrition/sugar,2)
	reagents.add_reagent(/reagent/nutrition/junk/crisp_rice,5)
	return ..()

/obj/item/container/edible/package/junkfood/halloween/coconut_joy
	name = "椰子乐巧克力棒"
	icon_state = "coconut_joy"
	value = 1

/obj/item/container/edible/package/junkfood/halloween/coconut_joy/Generate()
	reagents.add_reagent(/reagent/nutrition/junk/chocolate,6)
	reagents.add_reagent(/reagent/nutrition/sugar,5)
	reagents.add_reagent(/reagent/nutrition/coconut,4)
	return ..()

/obj/item/container/edible/package/junkfood/halloween/hurr_bar
	name = "呃呃巧克力棒"
	icon_state = "hurr_bar"
	value = 1

/obj/item/container/edible/package/junkfood/halloween/hurr_bar/Generate()
	reagents.add_reagent(/reagent/nutrition/junk/chocolate,5)
	reagents.add_reagent(/reagent/nutrition/sugar,10)
	return ..()


/obj/item/container/edible/package/junkfood/halloween/candy_bar
	name = "欢笑巧克力棒"
	icon_state = "candy_bar"
	value = 1

/obj/item/container/edible/package/junkfood/halloween/candy_bar/Generate()
	reagents.add_reagent(/reagent/nutrition/junk/chocolate,5)
	reagents.add_reagent(/reagent/nutrition/nut,5)
	reagents.add_reagent(/reagent/nutrition/sugar/caramel,5)
	return ..()


/obj/item/container/edible/package/junkfood/halloween/kit_catgirl_metaclique_bar
	name = "猫娘小圈子威化棒"
	icon_state = "kit_catgirl_metaclique_bar"
	value = 1

/obj/item/container/edible/package/junkfood/halloween/kit_catgirl_metaclique_bar/Generate()
	reagents.add_reagent(/reagent/nutrition/junk/chocolate,5)
	reagents.add_reagent(/reagent/nutrition/junk/wafer,10)
	return ..()


/obj/item/container/edible/package/junkfood/halloween/twink_bar
	name = "小鲜肉巧克力棒"
	icon_state = "twink_bar"
	value = 1

/obj/item/container/edible/package/junkfood/halloween/twink_bar/Generate()
	reagents.add_reagent(/reagent/nutrition/junk/chocolate,5)
	reagents.add_reagent(/reagent/nutrition/junk/cookie,7)
	reagents.add_reagent(/reagent/nutrition/sugar/caramel,7)
	return ..()

/* why
/obj/item/container/edible/package/junkfood/halloween/elon_musk_bar
	name = "elon \"husky musk\" bar"
	icon_state = "elon_musk_bar"

/obj/item/container/edible/package/junkfood/halloween/elon_musk_bar/Generate()
	reagents.add_reagent(/reagent/nutrition/junk/chocolate,5)
	reagents.add_reagent(/reagent/nutrition/junk/nougat,10)
	return ..()
*/

/obj/item/container/edible/package/junkfood/halloween/malf_way
	name = "失控之路巧克力棒"
	icon_state = "malf_way"
	value = 1

/obj/item/container/edible/package/junkfood/halloween/malf_way/Generate()
	reagents.add_reagent(/reagent/nutrition/junk/chocolate,5)
	reagents.add_reagent(/reagent/nutrition/junk/nougat,10)
	return ..()

/obj/item/container/edible/package/junkfood/halloween/triggerfinger
	name = "扳机指巧克力棒"
	icon_state = "triggerfinger"
	value = 1

/obj/item/container/edible/package/junkfood/halloween/triggerfinger/Generate()
	reagents.add_reagent(/reagent/nutrition/junk/chocolate,5)
	reagents.add_reagent(/reagent/nutrition/nut/butter,5)
	reagents.add_reagent(/reagent/nutrition/sugar,5)
	return ..()
