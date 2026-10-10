//Miscellaneous parts that can't be listed anywhere.

//Scrap for really-really cheap crafting recipes, or for refining into steel/iron.
/obj/item/crafting/ingredient/part/scrap
	name = "废金属"
	desc = "结实的筒帽换两块精炼金属！"
	desc_extended = "一大堆未分类的废金属：金属棒、螺母、螺栓、管子等等。也许能用于制作。"
	value = 150
	crafting_id = "scrap"

//Electronic components for crafts of various electronic things.
/obj/item/crafting/ingredient/part/electronics
	name = "电子元件"
	desc = "经受过电子战的洗礼。"
	desc_extended = "各种类型和用途的电子零件混在一起：空白电路板、电容器、二极管、细电线等等。也许能用于制作电子设备。"
	icon_state = "electronics"
	value = 500
	crafting_id = "electronics"

//Duct tape for more DIY recipes, as well as Gauss mag crafts.
/obj/item/crafting/ingredient/part/tape
	name = "强力胶带"
	desc = "几乎什么都能修！"
	desc_extended = "来历不明的廉价灰色强力胶带，隐约散发着机油味。"
	icon_state = "tape"
	value = 100
	crafting_id = "tape"

//Air regulation system for all/most hardsuits',NBCs'/SEVAs' and other air-circulated suits' crafting recipes.
/obj/item/crafting/ingredient/part/air_regulator
	name = "空气调节系统"
	desc = "把二氧化碳留在里面，把氧气挡在外面。还是反过来来着……？"
	desc_extended = "相当复杂的太空级空气循环与过滤装置，常见于核生化防护服、硬式宇航服和机甲中，机甲使用的规格更大。用于制作上述装备。"
	icon_state = "air_regulator"
	value = 750
	crafting_id = "air_regulator"

//Phoron canister used for flammables and combustables. If it's space-age and volatile, this was used in its creation. (Also, muh flamethrower.)
/obj/item/crafting/ingredient/part/p_tank
	name = "佛隆气罐"
	desc = "保持密闭。"
	desc_extended = "一种储存气体、需要时再将其释放的气罐。这个装满了佛隆。"
	icon_state = "p_tank"
	value = 750
	crafting_id = "p_tank"
//Rub rub sandpaper.
/obj/item/crafting/ingredient/part/sandpaper
	name = "砂纸"
	desc = "粗糙又磨手。"
	desc_extended = "一张覆有粗糙砂粒的纸。可用于打磨金属。"
	icon_state = "sand_paper"
	value = 10
//Doesnt go boom
/obj/item/crafting/ingredient/part/gunpowder
	name = "火药"
	desc = "轰？"
	desc_extended = "包装精致的一包火药。"
	icon_state = "gunpowder"
	value = 5
	amount_max = 100
//Mold for casings, 
/obj/item/crafting/ingredient/part/casing_mold
	name = "弹壳模具"
	desc = "只差一点黄铜。"
	desc_extended = "用于制作弹壳的模具。"
	icon_state = "casing_mold"
	value = 100
	amount_max = 1
//the actual bullet casing.
/obj/item/crafting/ingredient/part/bullet_casings
	name = "弹壳"
	desc = "为什么什么口径都能用？因为这里什么型号都有。"
	desc_extended = "大量不同口径的弹壳。"
	icon_state = "bullet_casings"
	value = 25
	amount_max = 100
//box
/obj/item/crafting/ingredient/part/metal_box
	name = "空金属盒"
	desc = "一个空金属盒。"
	desc_extended = "一个空金属盒，太小了，只能装齿轮和零件。"
	icon_state = "box"
	value = 100
	amount_max = 100
