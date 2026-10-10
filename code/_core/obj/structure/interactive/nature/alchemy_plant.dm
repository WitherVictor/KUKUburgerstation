/obj/structure/interactive/alchemy_plant
	//These "plants" dont consume reagents, and have no seed. Run much less code on think. No reagent containers allowed! Use a plant!
	name = "炼金植物"
	icon = 'icons/obj/structure/flora/alchemy_plant.dmi'
	icon_state = "error"
	desc = "总之就是某种山寨植物。"
	desc_extended = "某种野生植物。"
	var/grown = TRUE
	var/harvest_item //What do we get for harvesting the plant?
	var/obj/item/collect_item //What do we need to COLLECT FROM the plant?
	var/harvest_chance = 50 //Base chance of harvesting the plant, added to 50% of botany skill. always at least 10%
	var/great_success = 0 //Likelyness to NOT consume the plant on harvest.25% of botany is added to this. Max 75% chance, min 2.5%

/obj/structure/interactive/alchemy_plant/Destroy()
	SSbotany_alchemy.all_alchemy_plants -= src
	. = ..()

/obj/structure/interactive/alchemy_plant/proc/harvest(var/mob/living/advanced/caller)

	if(!grown)
		caller.to_chat(span("warning","[src.name]看起来还不能收获……"))
		return TRUE
	var/skill_power = caller.get_skill_power(SKILL_SURVIVAL,0,1,2)
	var/chance = prob(clamp((skill_power*0.50) + harvest_chance,10,100))
	if(!chance)
		caller.to_chat(span("warning","你手忙脚乱，把这次收获搞砸了！"))
		caller.add_skill_xp(SKILL_SURVIVAL,3)
		grown = FALSE
		update_sprite()
		return TRUE
	if(harvest_item)
		var/obj/item/NH = new harvest_item(caller.loc)
		INITIALIZE(NH)
		GENERATE(NH)
		FINALIZE(NH)
		if(prob(clamp((skill_power*0.25) + great_success,2.5,75)))
			caller.to_chat(span("notice","你小心地采集了[NH.name]，而且还能继续采集！"))
			caller.add_skill_xp(SKILL_SURVIVAL,10)
			return TRUE
		caller.to_chat(span("notice","你小心地采集了[NH.name]，将其采尽。"))
		caller.add_skill_xp(SKILL_SURVIVAL,5)
		grown = FALSE
		update_sprite()
	return TRUE

/obj/structure/interactive/alchemy_plant/on_destruction(var/damage = TRUE)
	. = ..()
	qdel(src)

/obj/structure/interactive/alchemy_plant/New(var/desired_loc)
	SSbotany_alchemy.all_alchemy_plants += src
	. = ..()

/obj/structure/interactive/alchemy_plant/proc/on_life(var/tick_rate = 1)
	if(!grown)
		if(prob(1))
			grown = TRUE
			update_sprite()

/obj/structure/interactive/alchemy_plant/update_sprite()

	if(grown)
		icon_state = "[initial(icon_state)]"
	else
		icon_state = "[initial(icon_state)]_h"


/obj/structure/interactive/alchemy_plant/clicked_on_by_object(var/mob/caller,var/atom/object,location,control,params)

	if(!is_advanced(caller))
		return ..()
	if(collect_item && !istype(object,collect_item))
		caller.to_chat(span("warning","你缺少合适的工具，无法在不损伤[src.name]的情况下采集！你需要[initial(collect_item.name)]！"))
		return ..()

	INTERACT_CHECK
	INTERACT_CHECK_OBJECT
	INTERACT_DELAY(5)

	harvest(caller)

	return TRUE

/obj/structure/interactive/alchemy_plant/forest_berry
	name = "森林浆果灌木"
	icon_state = "forest_berry"
	desc = "充满魔力！"
	desc_extended = "一大丛红色浆果灌木，果实蕴含治疗能量。也许能用于炼金。"
	harvest_item = /obj/item/crafting/ingredient/part/alchemy_plant/forest_berry
	collect_item = /obj/item/weapon/melee/tool/botany
	harvest_chance = 60
	great_success = 20

/obj/structure/interactive/alchemy_plant/forest_nut
	name = "森林坚果堆"
	icon_state = "forest_nut"
	desc = "充满魔力！"
	desc_extended = "一大堆散发着防护气息的坚果。也许能用于炼金。"
	harvest_item = /obj/item/crafting/ingredient/part/alchemy_plant/forest_nut
	collect_item = /obj/item/weapon/melee/tool/botany
	harvest_chance = 60
	great_success = 20

/obj/structure/interactive/alchemy_plant/snow_daisy
	name = "雪雏菊丛"
	icon_state = "snow_daisy"
	desc = "活木制造者。"
	desc_extended = "一丛蕴含充沛法力的纯白花朵。也许能用于炼金。"
	harvest_item = /obj/item/crafting/ingredient/part/alchemy_plant/snow_daisy
	collect_item = /obj/item/weapon/melee/tool/botany
	harvest_chance = 40
	great_success = 20

/obj/structure/interactive/alchemy_plant/space_cotton
	name = "太空棉花"
	icon_state = "space_cotton"
	desc = "总之就是些种族歧视的破梗。"
	desc_extended = "一种能长出合成布的棉花状植物。大概是晚熟种子，因为大多数不能立刻生长的种子都是次品。"
	harvest_item = /obj/item/crafting/ingredient/thread/synthcloth
	harvest_chance = 60
	great_success = 20

/obj/structure/interactive/alchemy_plant/devil_shroom
	name = "恶魔菇"
	icon_state = "devil_shroom"
	desc = "来自遥远的《环世界》。"
	desc_extended = "一种奇怪的蘑菇，能长出纤维状织物，极其坚韧而且防火。"
	harvest_item = /obj/item/crafting/ingredient/thread/devilstrand
	harvest_chance = 30
	great_success = 10
