//Basically, polymers will function as your material replacement in case there's no required special material
//available at burgerstation/on you and you don't want to code one/search for one,
//hence they're also really fucking expensive.
//Idea and the concept of "sentient universal material " was taken from the Atomic Heart's idea of polymers, as well
//as Samosbor's idea of semi-sentient "selfbuilder" technology that could build entire blocks of so called Gigakhruschevka.

//basic material for most cheap crafting recipes, like Beta or Gamma ingredient, or additional smelting,
//so it should be widely available.
/obj/item/crafting/ingredient/polymer/alpha
	name = "阿尔法聚合物"
	desc = "谁能想到你的握把也有智能？"
	desc_extended = "金属盒内装着具有初步意识的聚合物，可变成任意形态。阿尔法型的智能和耐久性最弱，只能模拟精度要求不高的部件的形状和化学成分。"
	value = 1000
	crafting_id = "alpha"

//more specialised material meant to be used for some low-end equipment.
/obj/item/crafting/ingredient/polymer/beta
	name = "贝塔聚合物"
	desc = "谁能想到你的头盔也有智能？"
	desc_extended = "金属盒内装着具有初步意识的聚合物，可变成任意形态。贝塔型由革命军的一位首席科学家在起义初期研制，在智能和可模拟的化学成分种类上都超越了阿尔法型。"
	icon_state = "beta"
	value = 2000
	crafting_id = "beta"

//go-to material for most medium-grade crafts, like vests or such.
/obj/item/crafting/ingredient/polymer/gamma
	name = "伽马聚合物"
	desc = "谁能想到你的硬式宇航服也有智能？"
	desc_extended = "金属盒内装着具有初步意识的聚合物，可变成任意形态。伽马型用于制造危险环境防护装备、舱外活动装备，以及其他需要纳米级精度的物品。"
	icon_state = "gamma"
	value = 3000
	crafting_id = "gamma"

//High-grade material for most of the high-end crafts that don't involve boss materials.
/obj/item/crafting/ingredient/polymer/epsilon
	name = "艾普西龙聚合物"
	desc = "谁能想到你的核反应堆也有智能？"
	desc_extended = "金属盒内装着具有初步意识的聚合物，可变成任意形态。艾普西龙型很少用于不需要核工业级精度的领域，不过特别有钱的士兵常用它来定制装备。"
	icon_state = "epsilon"
	value = 4000
	crafting_id = "epsilon"

//this polymer below should be REALLY FUCKING RARE and LITERALLY ONLY DROPPED BY BOSSES, for boss-level equipment.
/obj/item/crafting/ingredient/polymer/omega
	name = "实验型欧米伽聚合物"
	desc = "谁能想到你的……宇宙也有智能？"
	desc_extended = "专用容器内装着具有完整意识的聚合物，可变成任意形态。欧米伽型是西塔聚合物改良版的早期原型；原来的西塔型曾失控摧毁一整座太空斯拉夫研究设施。理论上，正确使用它甚至能改写宇宙法则。用于制作神级装备。"
	icon_state = "omega"
	value = 6000
	value_burgerbux = 1 //no vendor and trash bullshit.
	crafting_id = "omega"
