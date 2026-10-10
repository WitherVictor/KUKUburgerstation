/plant_type/
	var/name = "植物名称"
	var/desc = "植物说明"

	var/plant_icon = 'icons/obj/structure/botany.dmi'
	var/plant_icon_state = ""
	var/plant_icon_state_override //Set to something to override the grown icon state.
	var/plant_icon_count = 1

	var/seed_icon = 'icons/obj/item/seed.dmi'
	var/seed_icon_state = ""

	var/harvest_icon = 'icons/obj/item/consumable/food/plants.dmi'
	var/harvest_icon_state = ""

	var/typical_volume = 10

	var/list/reagents = list()

	var/list/allowed_turfs = list(
		/turf/simulated/floor/colored/dirt = 0.75,
		/turf/simulated/floor/colored/dirt/soil = 1,
		/turf/simulated/floor/colored/dirt/soil/rich = 1.5
	)

	var/value = 1 //Automatically calculated in SSBotany.

	var/can_slice = FALSE

/plant_type/nitrogen_flower
	name = "液氮花"
	desc = "一朵极寒的花，内部充满液氮。"
	plant_icon_state = "nitrogen"
	harvest_icon_state = "nitrogen_flower"
	seed_icon_state = "seed"

	plant_icon_count = 4
	reagents = list(
		/reagent/nitrogen = 1,
	)

	typical_volume = 10


/plant_type/oxygen_fruit
	name = "液氧果"
	desc = "一种形似西瓜的极寒植物，内部充满液氧。"
	plant_icon_state = "oxygen"
	harvest_icon_state = "oxygen_fruit"
	seed_icon_state = "seed"

	plant_icon_count = 4
	reagents = list(
		/reagent/fuel/oxygen = 1,
	)

	typical_volume = 15

/plant_type/wheat
	name = "小麦"
	desc = "万物的主食。"
	plant_icon_state = "wheat"
	harvest_icon_state = "wheat"
	seed_icon_state = "wheat"
	plant_icon_count = 6
	reagents = list(
		/reagent/nutrition/wheat_grain = 1,
	)

	typical_volume = 20


/plant_type/sugarcane
	name = "甘蔗茎"
	desc = "某种健康糖？谁知道呢。"
	plant_icon_state = "sugarcane"
	harvest_icon_state = "sugarcane"
	seed_icon_state = "sugarcane"
	plant_icon_count = 3
	reagents = list(
		/reagent/nutrition/sugar/cane = 1,
	)

	typical_volume = 10


/plant_type/liberty_cap
	name = "自由帽菇"
	desc = "让你感受自由的魔法蘑菇。"
	plant_icon_state = "liberty"
	harvest_icon_state = "liberty_cap"
	seed_icon_state = "liberty"
	plant_icon_count = 2
	reagents = list(
		/reagent/drug/liberty_dust = 1,
	)

	typical_volume = 10


/plant_type/chanterelle
	name = "鸡油菌"
	desc = "一种安全可食用的蘑菇。"
	plant_icon_state = "chanter"
	harvest_icon_state = "chanterelle"
	seed_icon_state = "chanterelle"
	plant_icon_count = 2
	reagents = list(
		/reagent/nutrition/chanterelle = 1,
	)

	typical_volume = 15


/plant_type/destroying_angel
	name = "毁灭天使菇"
	desc = "一种剧毒的白色蘑菇。"
	plant_icon_state = "destroying_angel"
	harvest_icon_state = "destroying_angel"
	seed_icon_state = "destroying_angel"
	plant_icon_count = 2
	reagents = list(
		/reagent/toxin/angel_toxin = 1,
	)

	typical_volume = 20


/plant_type/fly_amanita
	name = "毒蝇伞"
	desc = "一种有毒、能致幻的蘑菇。"
	plant_icon_state = "amanita"
	harvest_icon_state = "fly_amanita"
	seed_icon_state = "fly_amanita"
	plant_icon_count = 2
	reagents = list(
		/reagent/toxin/fly_amanita_toxin = 0.25,
		/reagent/drug/space = 0.75
	)

	typical_volume = 10


/plant_type/glowshroom
	name = "荧光菇"
	desc = "一种会发光、具有放射性的蘑菇。"
	plant_icon_state = "glowshroom"
	harvest_icon_state = "glowshroom"
	seed_icon_state = "glowshroom"
	plant_icon_count = 3
	reagents = list(
		/reagent/radioactive/radium = 1,
	)

	typical_volume = 10

/plant_type/glowcap
	name = "荧光伞菇"
	desc = "一种会发光、具有放射性的蘑菇。"
	plant_icon_state = "glowcap"
	harvest_icon_state = "glowcap"
	seed_icon_state = "glowcap"
	plant_icon_count = 4
	reagents = list(
		/reagent/radioactive/radium = 1,
	)

	typical_volume = 10

/plant_type/tomato
	name = "番茄"
	desc = "经典的红番茄植株。"
	plant_icon_state = "tomato"
	harvest_icon_state = "tomato"
	seed_icon_state = "tomato"
	plant_icon_count = 6
	reagents = list(
		/reagent/nutrition/tomato = 1,
	)

	typical_volume = 15

	can_slice = TRUE

/plant_type/lettuce
	name = "生菜"
	desc = "一丛生菜。"
	plant_icon_state = "lettuce"
	harvest_icon_state = "lettuce"
	seed_icon_state = "lettuce"
	plant_icon_count = 1
	reagents = list(
		/reagent/nutrition/lettuce = 1,
	)

	typical_volume = 30

	can_slice = TRUE

/plant_type/cabbage
	name = "卷心菜"
	desc = "一丛卷心菜。"
	plant_icon_state = "cabbage"
	harvest_icon_state = "cabbage"
	seed_icon_state = "cabbage"
	plant_icon_count = 1
	reagents = list(
		/reagent/nutrition/cabbage = 1,
	)

	typical_volume = 30

/plant_type/poppy
	name = "食籽罂粟"
	desc = "会结出罂粟籽的花。"
	plant_icon_state = "poppy"
	harvest_icon_state = "poppy"
	seed_icon_state = "poppy"
	plant_icon_count = 3
	reagents = list(
		/reagent/nutrition/flower_petal = 0.75,
		/reagent/nutrition/poppy_seed/raw = 0.25
	)

	typical_volume = 10

/plant_type/cannabis
	name = "大麻"
	desc = "绿色的好东西。"
	plant_icon_state = "cannabis"
	harvest_icon_state = "cannabis"
	seed_icon_state = "cannabis"
	plant_icon_count = 1
	reagents = list(
		/reagent/nutrition/lipolicide = 0.5,
		/reagent/drug/space = 0.5
	)

	typical_volume = 10

/plant_type/cannabis/life
	name = "生命大麻"
	desc = "白色的好东西。"
	plant_icon_state = "whitecannabis"
	harvest_icon_state = "whitecannabis"
	seed_icon_state = "whitecannabis"
	reagents = list(
		/reagent/nutrition/lipolicide = 0.25,
		/reagent/medicine/omnizine = 0.5,
		/reagent/drug/space = 0.25
	)

/plant_type/cannabis/death
	name = "死亡大麻"
	desc = "黑色的坏东西。"
	plant_icon_state = "blackcannabis"
	harvest_icon_state = "blackcannabis"
	seed_icon_state = "blackcannabis"
	reagents = list(
		/reagent/nutrition/lipolicide = 0.25,
		/reagent/toxin/angel_toxin = 0.5,
		/reagent/drug/space = 0.25
	)

/plant_type/corn
	name = "玉米"
	desc = "我知道你种它是为了什么，你这个怪物。"
	plant_icon_state = "corn"
	harvest_icon_state = "corn"
	seed_icon_state = "corn"
	plant_icon_count = 3
	reagents = list(
		/reagent/nutrition/corn = 1,
	)

	typical_volume = 10

/plant_type/potato
	name = "土豆"
	desc = "许多国家的主食。能吃，能酿酒，还能收藏？"
	plant_icon_state = "potato"
	harvest_icon_state = "potato"
	seed_icon_state = "potato"
	plant_icon_count = 4
	reagents = list(
		/reagent/nutrition/potato = 0.7,
		/reagent/iron = 0.3
	)

	typical_volume = 10

/plant_type/cactus_fruit
	name = "仙人掌果"
	desc = "熔岩地带原生的带刺植物，含有仙人掌汁。"
	plant_icon_state = "cactus"
	harvest_icon_state = "cactus"
	seed_icon_state = "cactus"
	plant_icon_count = 2
	reagents = list(
		/reagent/nutrition/water = 0.25,
		/reagent/medicine/omnizine = 0.25,
		/reagent/nutrition/cactus = 0.5
	)

	typical_volume = 50

/plant_type/chili
	name = "辣椒"
	desc = "你为什么要吃这种辣得脸疼的植物？"
	plant_icon_state = "chili"
	harvest_icon_state = "chilipepper"
	seed_icon_state = "chili"
	plant_icon_count = 1
	reagents = list(
		/reagent/nutrition/capsaicin = 1
	)

	typical_volume = 10

/plant_type/chili/ghost
	name = "魔鬼椒"
	desc = "你为什么要吃这种辣得灵魂都疼的植物？"
	plant_icon_state = "chili"
	harvest_icon_state = "icepepper"
	seed_icon_state = "chili_ghost"
	plant_icon_count = 1
	reagents = list(
		/reagent/nutrition/capsaicin = 0.9,
		/reagent/medicine/adrenaline = 0.1
	)

	typical_volume = 10

/plant_type/polypore_mushroom
	name = "多孔菌"
	desc = "一种奇怪的灰色蘑菇，人们采集它的外皮。"
	plant_icon_state = "polypore"
	harvest_icon_state = "polypore"
	seed_icon_state = "polypore"
	plant_icon_count = 2
	reagents = list(
		/reagent/nutrition/water = 0.25,
		/reagent/medicine/omnizine = 0.25,
		/reagent/nutrition/cactus = 0.5
	)

	typical_volume = 50


/plant_type/porcini_mushroom
	name = "牛肝菌"
	desc = "一种奇怪的灰色蘑菇，带有叶状结构，人们采集它的叶状部分。"
	plant_icon_state = "porcini"
	harvest_icon_state = "porcini"
	seed_icon_state = "porcini"
	plant_icon_count = 2
	reagents = list(
		/reagent/medicine/nicotine = 0.2,
		/reagent/medicine/omnizine = 0.3,
		/reagent/nutrition/porcini = 0.5
	)

	typical_volume = 20

/plant_type/inocybe_mushroom
	name = "丝盖伞"
	desc = "一种细长的灰色蘑菇，人们采集它的菌盖。"
	plant_icon_state = "inocybe"
	harvest_icon_state = "inocybe"
	seed_icon_state = "inocybe"
	plant_icon_count = 2
	reagents = list(
		/reagent/drug/space = 0.5,
		/reagent/toxin/polypnium_toxin = 0.5
	)

	typical_volume = 20

/plant_type/embershroom_mushrrom
	name = "余烬蘑菇"
	desc = "一种细长的深色蘑菇，人们采集它的菌柄。"
	plant_icon_state = "ember"
	harvest_icon_state = "ember"
	seed_icon_state = "ember"
	plant_icon_count = 2
	reagents = list(
		/reagent/drug/space = 0.25,
		/reagent/tinea_luxor = 0.50,
		/reagent/medicine/vitamins = 0.25
	)

	typical_volume = 20

/plant_type/forest_berry
	name = "森林浆果灌木"
	desc = "充满魔力！"
	plant_icon_state = "forest_berry"
	harvest_icon_state = "forest_berry"
	seed_icon_state = "seed"
	plant_icon_count = 1
	reagents = list(
		/reagent/medicine/health_potion = 1,
	)
	typical_volume = 2

/plant_type/forest_nut
	name = "森林坚果灌木"
	desc = "充满魔力！"
	plant_icon_state = "forest_nut"
	harvest_icon_state = "forest_nut"
	seed_icon_state = "seed"
	plant_icon_count = 1
	reagents = list(
		/reagent/drug/armotol = 1,
	)
	typical_volume = 2

/plant_type/snow_daisy
	name = "雪雏菊丛"
	desc = "活木制造者。"
	plant_icon_state = "snow_daisy"
	harvest_icon_state = "snow_daisy"
	seed_icon_state = "seed"
	plant_icon_count = 1
	reagents = list(
		/reagent/medicine/mana_potion = 1,
	)
	typical_volume = 2

/plant_type/space_cotton
	name = "太空棉花"
	desc = "总之就是些种族歧视的破梗。"
	plant_icon_state = "space_cotton"
	harvest_icon_state = "space_cotton"
	seed_icon_state = "seed"
	plant_icon_count = 1
	reagents = list(
		/reagent/nitrogen = 0.5,
		/reagent/carbon = 0.5,
	)
	typical_volume = 2

/plant_type/devil_shroom
	name = "恶魔菇"
	desc = "来自遥远的《环世界》。"
	plant_icon_state = "devil_shroom"
	harvest_icon_state = "devil_shroom"
	seed_icon_state = "seed"
	plant_icon_count = 1
	reagents = list(
		/reagent/toxin/mercury = 0.5,
		/reagent/toxin/sulfur_dioxide = 0.5,
	)
	typical_volume = 2
/*
    //Just incase anyone needs it
/plant_type/template
	name = "Change"
	desc = "Change"
	plant_icon_state = "Change"
	harvest_icon_state = "Change"
	seed_icon_state = "Change"
    plant_icon_count = 4
	reagents = list(
		/reagent/nitrogen = 1,
	)
	typical_volume = 10
*/

/*
/plant_type/herb_red
	name = "Red Herb"
	desc = "A red herb. Harvested for its healing properties."
	plant_icon_state = "rherb"
	harvest_icon_state = "rherb"
	seed_icon_state = "rherb"
	plant_icon_count = 2
	reagents = list(
		/reagent/medicine/health_potion = 0.5,
		/reagent/medicine/vitamins = 0.5
	)

	typical_volume = 12


/plant_type/herb_blue
	name = "blue Herb"
	desc = "A blue herb. Often used by mages."
	plant_icon_state = "bherb"
	harvest_icon_state = "bherb"
	seed_icon_state = "bherb"
	plant_icon_count = 2
	reagents = list(
		/reagent/medicine/mana_potion = 0.5,
		/reagent/medicine/vitamins = 0.5
	)

	typical_volume = 12

/plant_type/herb_green
	name = "green Herb"
	desc = "A green herb. Full of stamina juice. Yum!"
	plant_icon_state = "gherb"
	harvest_icon_state = "gherb"
	seed_icon_state = "gherb"
	plant_icon_count = 3
	reagents = list(
		/reagent/medicine/stamina_potion = 0.5,
		/reagent/medicine/vitamins = 0.5
	)

	typical_volume = 12
*/ //decided against these personally, but they are there if needed
