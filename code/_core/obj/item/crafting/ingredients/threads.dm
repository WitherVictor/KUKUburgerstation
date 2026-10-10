//Cloths are needed for clothing and armor crafting and vary by their uses and specialisations.
//That shit above is obvious af but yeah.

//Synthcloths are meant to be used for most general clothing crafts,
//as well as being the main ingredient for all of the light/medium vests' and low-end hardsuits' and NBCs' crafts.
/obj/item/crafting/ingredient/thread/synthcloth
	name = "合成布卷"
	desc = "太空级材料，造太空级袜子。"
	desc_extended = "一卷极其便宜、相较于价格却出奇耐用的合成布。从衬衫、内衣到防弹背心的衬垫，几乎什么都能用它制作。"
	value = 100
	crafting_id = "synthcloth"

/obj/item/crafting/ingredient/thread/synthcloth/rubber
	name = "橡胶涂层合成布卷"
	desc = "太空级材料，造宜家级防辐射服。"
	desc_extended = "一卷极其便宜、相较于价格却出奇耐用的合成布。从衬衫、内衣到防弹背心的衬垫，几乎什么都能用它制作。这卷布覆有橡胶并掺入了铅，可增强环境防护能力。"
	value = 150
	icon_state = "synthcloth_rubber"
	crafting_id = "synthcloth_rubber"

/obj/item/crafting/ingredient/thread/synthcloth/armor
	name = "装甲编织合成布卷"
	desc = "太空级材料，造气枪游戏级背心。"
	desc_extended = "一卷极其便宜、相较于价格却出奇耐用的合成布。从衬衫、内衣到防弹背心的衬垫，几乎什么都能用它制作。这卷布织入了纳米凯夫拉纤维，可增强防弹能力。"
	value = 150
	icon_state = "synthcloth_armor"
	crafting_id = "synthcloth_armor"

/obj/item/crafting/ingredient/thread/synthcloth/space
	name = "太空防护合成布卷"
	desc = "太空级材料，造民用级硬式宇航服。"
	desc_extended = "一卷极其便宜、相较于价格却出奇耐用的合成布。从衬衫、内衣到防弹背心的衬垫，几乎什么都能用它制作。这卷布经过太空环境及紫外线防护处理，可用于制作舱外活动装备。"
	value = 150
	icon_state = "synthcloth_space"
	crafting_id = "synthcloth_space"

//Devilstrands are meant to be used for most mid-level and specialised crafts, like SEVA NBCs and such,
//as well as being the material for most medium-heavy vests' and medium-end hardsuits' and NBCs' crafts.
/obj/item/crafting/ingredient/thread/devilstrand
	name = "恶魔布卷"
	desc = "没桌子就吃饭。"
	desc_extended = "一种地狱般的布状材料，似乎由遍布熔岩地带的奇怪孢子制成。常用于制作耐久要求高于合成布所能提供的装备。不燃烧。"
	value = 250
	icon_state = "devilstrand"
	crafting_id = "devilstrand"

/obj/item/crafting/ingredient/thread/devilstrand/rubber
	name = "橡胶涂层恶魔布卷"
	desc = "没穿核生化防护服就出门。"
	desc_extended = "一种地狱般的布状材料，似乎由遍布熔岩地带的奇怪孢子制成。常用于制作耐久要求高于合成布所能提供的装备。不燃烧。这卷布覆有橡胶并掺入了铅，可增强环境防护能力。"
	value = 400
	icon_state = "devilstrand_rubber"
	crafting_id = "devilstrand_rubber"

/obj/item/crafting/ingredient/thread/devilstrand/armor
	name = "装甲编织恶魔布卷"
	desc = "我的背心坏了。"
	desc_extended = "一种地狱般的布状材料，似乎由遍布熔岩地带的奇怪孢子制成。常用于制作耐久要求高于合成布所能提供的装备。不燃烧。这卷布织入了纳米凯夫拉纤维，可增强防弹能力。"
	value = 400
	icon_state = "devilstrand_armor"
	crafting_id = "devilstrand_armor"

/obj/item/crafting/ingredient/thread/devilstrand/space
	name = "太空防护恶魔布卷"
	desc = "太空！！！"
	desc_extended = "一种地狱般的布状材料，似乎由遍布熔岩地带的奇怪孢子制成。常用于制作耐久要求高于合成布所能提供的装备。不燃烧。这卷布经过太空环境及紫外线防护处理，可用于制作舱外活动装备。"
	value = 400
	icon_state = "devilstrand_space"
	crafting_id = "devilstrand_space"

//Durathread is meant to be used as a material for all high-level crafts, like Bags of Holding, jump boots (if we get those)
// and such, as well as being the material for most ultra-heavy vests' and high-end hardsuits' and NBCs' crafts.
/obj/item/crafting/ingredient/thread/durathread/
	name = "耐久布卷"
	desc = "就是变异棉花。"
	desc_extended = "由专门培育的变异棉花制成，原本打算直接取代合成布。由于生产与维护成本高得离谱，它并未像合成布那样普及，但作为优良防护材料占据了一席之地。"
	value = 500
	icon_state = "durathread"
	crafting_id = "durathread"

/obj/item/crafting/ingredient/thread/durathread/rubber
	name = "橡胶涂层耐久布卷"
	desc = "保证挡住切尔诺贝利石，否则退还你的辐射。"
	desc_extended = "由专门培育的变异棉花制成，原本打算直接取代合成布。由于生产与维护成本高得离谱，它并未像合成布那样普及，但作为优良防护材料占据了一席之地。这卷布覆有橡胶并掺入了铅，可增强环境防护能力。"
	value = 750
	icon_state = "durathread_rubber"
	crafting_id = "durathread_rubber"

/obj/item/crafting/ingredient/thread/durathread/armor
	name = "装甲编织耐久布卷"
	desc = "超越合金装备的织物。"
	desc_extended = "由专门培育的变异棉花制成，原本打算直接取代合成布。由于生产与维护成本高得离谱，它并未像合成布那样普及，但作为优良防护材料占据了一席之地。这卷布织入了纳米凯夫拉纤维，可增强防弹能力。"
	value = 750
	icon_state = "durathread_armor"
	crafting_id = "durathread_armor"

/obj/item/crafting/ingredient/thread/durathread/space
	name = "太空防护耐久布卷"
	desc = "因用于制作死亡小队的枕头而闻名。"
	desc_extended = "由专门培育的变异棉花制成，原本打算直接取代合成布。由于生产与维护成本高得离谱，它并未像合成布那样普及，但作为优良防护材料占据了一席之地。这卷布经过太空环境及紫外线防护处理，可用于制作舱外活动装备。"
	value = 750
	icon_state = "durathread_space"
	crafting_id = "durathread_space"
