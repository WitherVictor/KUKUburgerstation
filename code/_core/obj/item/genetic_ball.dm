#define GENETIC_INERT "purging"
#define GENETIC_UPGRADE "upgrading"
#define GENETIC_ADD "exalting"
#define GENETIC_SUBTRACT "splicing"
#define GENETIC_RANDOM "scrambling"

var/global/list/rarity_table = list(
	RARITY_COMMON = 12000,
	RARITY_UNCOMMON = 2400,
	RARITY_RARE = 1200,
	RARITY_MYTHICAL = 600,
	RARITY_LEGENDARY = 300
)

var/global/list/genetic_upgrade_table = list(
	GENETIC_ADD = 10000,
	GENETIC_RANDOM = 5000,
	GENETIC_SUBTRACT = 2500,
	GENETIC_UPGRADE = 1250
)

/obj/item/genetic_ball
	name = "基因编码球"
	desc = "这能出什么岔子呢？"
	desc_extended = "能改变基因特质的太空时代遗物。"

	icon = 'icons/obj/item/genetic_ball.dmi'
	icon_state = "ball"

	rarity = RARITY_BROKEN //Rarity is randomly generated.

	var/action_type = GENETIC_INERT

	var/should_generate = TRUE

	value = 0
	value_burgerbux = 1 //Not in normal loot rotation.

/obj/item/genetic_ball/save_item_data(var/save_inventory = TRUE)
	. = ..()
	SAVEVAR("action_type")
	SAVEVAR("rarity")

/obj/item/genetic_ball/load_item_data_pre(var/mob/living/advanced/player/P,var/list/object_data)
	. = ..()
	LOADVAR("action_type")
	LOADVAR("rarity")

var/global/list/rarity_to_number = list(
	RARITY_BROKEN = 0,
	RARITY_COMMON = 1,
	RARITY_UNCOMMON = 2,
	RARITY_RARE = 3,
	RARITY_MYTHICAL = 4,
	RARITY_LEGENDARY = 5
)

/obj/item/genetic_ball/click_self(var/mob/caller)

	if(is_living(caller))
		var/mob/living/L = caller
		do_upgrade(L)

	return TRUE

/obj/item/genetic_ball/click_on_object(var/mob/caller,var/atom/object,location,control,params)

	if(caller == object)
		click_self(caller)
		return TRUE


	. = ..()

/obj/item/genetic_ball/proc/get_genetic_rarity_name(var/desired_rarity)
	var/list/rarity_names = list(RARITY_BROKEN="破损",RARITY_COMMON="普通",RARITY_UNCOMMON="少见",RARITY_RARE="稀有",RARITY_MYTHICAL="神话",RARITY_LEGENDARY="传奇")
	return rarity_names[desired_rarity] ? rarity_names[desired_rarity] : desired_rarity

/obj/item/genetic_ball/proc/do_upgrade(var/mob/living/caller)

	if(action_type == GENETIC_INERT)
		if(length(caller.traits))
			caller.remove_all_traits()
		else
			caller.rarity = RARITY_COMMON
		return TRUE

	if(rarity_to_number[caller.rarity] > rarity_to_number[src.rarity])
		caller.to_chat(span("warning","无法使用[src.name]：你的基因稀有度高于这颗宝珠的稀有度。"))
		return FALSE

	caller.to_chat(span("notice","你尝试对自己使用[src.name]……"))

	switch(action_type)
		if(GENETIC_UPGRADE)
			if(caller.rarity == src.rarity)
				caller.to_chat(span("warning","无法使用[src.name]：你的基因稀有度已经是[get_genetic_rarity_name(src.rarity)]了！"))
				return FALSE
			caller.rarity = src.rarity
			caller.to_chat(span("notice","你的基因稀有度提升到了[get_genetic_rarity_name(caller.rarity)]。"))
		if(GENETIC_ADD)
			if(!caller.can_add_trait())
				caller.to_chat(span("warning","无法使用[src.name]：你的特质太多了！提升基因稀有度或移除正面特质，才能添加更多特质。"))
				return FALSE
			if(!caller.add_random_trait())
				caller.to_chat(span("warning","无法使用[src.name]：发生代码错误，请在GitHub上报告此问题。"))
				return FALSE
		if(GENETIC_RANDOM)
			caller.remove_all_traits()
			//We don't use add_random_trait() here because there is a chance it may add duplicate or same-category traits and cause spam messages.
			var/list/traits_to_add = list()
			var/list/existing_trait_categories = list()
			for(var/i=1,i<=get_trait_limit(caller.rarity),i++)
				var/random_trait = pick(SStraits.all_traits)
				var/trait/T = SStraits.all_traits[random_trait]
				if(traits_to_add[random_trait])
					continue
				if(T.category)
					if(existing_trait_categories[T.category])
						continue
					existing_trait_categories[T.category] = TRUE
				traits_to_add[random_trait] = TRUE
				caller.add_trait(random_trait)
		if(GENETIC_SUBTRACT)
			if(!length(caller.traits))
				caller.to_chat(span("warning","无法使用[src.name]：你没有可移除的特质！"))
				return FALSE
			if(!caller.remove_random_trait())
				caller.to_chat(span("warning","无法使用[src.name]：发生代码错误，请在GitHub上报告此问题。"))
				return FALSE

	qdel(src)

	return TRUE


/obj/item/genetic_ball/Finalize()

	. = ..()

	if(rarity == RARITY_BROKEN || action_type == GENETIC_INERT)
		name = "基因净化宝珠"
		desc_extended = "[initial(desc_extended)]这颗宝珠会移除你身上的所有基因特质。如果你没有基因特质，则会将你的基因稀有度降为普通。"
		rarity = RARITY_BROKEN
		action_type = GENETIC_INERT
		return .

	if(action_type == GENETIC_UPGRADE && rarity == RARITY_COMMON)
		rarity = RARITY_UNCOMMON

	var/list/action_names = list(GENETIC_INERT="净化",GENETIC_UPGRADE="晋升",GENETIC_ADD="增赋",GENETIC_SUBTRACT="剥离",GENETIC_RANDOM="重组")
	var/action_name = action_names[action_type] ? action_names[action_type] : action_type
	var/rarity_name = get_genetic_rarity_name(rarity)
	name = "[rarity_name]基因[action_name]宝珠"
	switch(action_type)
		if(GENETIC_ADD)
			desc_extended = "[initial(desc_extended)]这颗宝珠会在条件允许时为你添加一个随机特质。你的基因稀有度必须为[rarity_name]或更低，且仍有特质名额才能使用。"
		if(GENETIC_RANDOM)
			desc_extended = "[initial(desc_extended)]这颗宝珠会移除现有特质，并按特质上限尝试添加随机新特质；实际数量可能低于上限。你的基因稀有度必须为[rarity_name]或更低才能使用。"
		if(GENETIC_SUBTRACT)
			desc_extended = "[initial(desc_extended)]这颗宝珠会随机移除你的一个基因特质。你的基因稀有度必须为[rarity_name]或更低才能使用。"
		if(GENETIC_UPGRADE)
			desc_extended = "[initial(desc_extended)]这颗宝珠会将你的基因稀有度提升到[rarity_name]，从而允许更多特质。你的基因稀有度必须低于[rarity_name]才能使用。提升后，其他基因增赋、剥离和重组宝珠的稀有度也必须至少达到[rarity_name]；净化宝珠不受此限制。"

	value = 0
	switch(rarity_table)
		if(RARITY_BROKEN)
			value += 100
		if(RARITY_COMMON)
			value += 100
		if(RARITY_UNCOMMON)
			value += 400
		if(RARITY_RARE)
			value += 1600
		if(RARITY_MYTHICAL)
			value += 6400
		if(RARITY_LEGENDARY)
			value += 25600

	switch(action_type)
		if(GENETIC_ADD)
			value *= 1
		if(GENETIC_SUBTRACT)
			value *= 0.75
		if(GENETIC_RANDOM)
			value *= 0.5
		if(GENETIC_UPGRADE)
			value *= 2
		if(GENETIC_INERT)
			value *= 0.25

	value = CEILING(value,100)

	update_sprite()

/obj/item/genetic_ball/update_sprite()
	. = ..()
	color = "#FFFFFF"

/obj/item/genetic_ball/update_icon()
	. = ..()
	icon_state = "none"

/obj/item/genetic_ball/update_overlays()
	. = ..()
	if(action_type != GENETIC_INERT)
		var/image/I = new(initial(icon),"ball_detail")
		switch(action_type)
			if(GENETIC_ADD)
				I.color = COLOR_GREEN
			if(GENETIC_SUBTRACT)
				I.color = COLOR_RED
			if(GENETIC_RANDOM)
				I.color = COLOR_PURPLE
			if(GENETIC_UPGRADE)
				I.color = COLOR_GOLD
		add_overlay(I)

/obj/item/genetic_ball/update_underlays()
	. = ..()
	var/image/I = new(initial(icon),"ball")
	switch(rarity)
		if(RARITY_BROKEN)
			I.color = COLOR_BROKEN
		if(RARITY_COMMON)
			I.color = COLOR_COMMON
		if(RARITY_UNCOMMON)
			I.color = COLOR_UNCOMMON
		if(RARITY_RARE)
			I.color = COLOR_RARE
		if(RARITY_MYTHICAL)
			I.color = COLOR_MYTHICAL
		if(RARITY_LEGENDARY)
			I.color = RARITY_LEGENDARY
	add_underlay(I)





/obj/item/genetic_ball/Generate()

	if(should_generate)
		rarity = pickweight(rarity_table)
		action_type = pickweight(genetic_upgrade_table)

	. = ..()
