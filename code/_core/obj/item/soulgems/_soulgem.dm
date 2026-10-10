/obj/item/soulgem
	name = "蓝空间宝石"
	desc = "容纳低等生物的灵魂。别和蓝空间水晶搞混了。"
	desc_extended = "用于物品附魔，或为法杖补充魔力。"
	icon = 'icons/obj/item/soulgem.dmi'
	icon_state = "common"

	var/total_charge = 0
	var/total_capacity = 0
	var/do_not_consume = FALSE //Does this get consumed? Or merely emptied on craft. Only used for Azuras Star

	weight = 1

	rarity = RARITY_COMMON

	var/mob/living/stored_soul_path
	var/soul_gives_xp = TRUE

/obj/item/soulgem/save_item_data(var/mob/living/advanced/player/P,var/save_inventory = TRUE,var/died=FALSE,var/loadout=FALSE)
	RUN_PARENT_SAFE
	SAVEVAR("total_charge")
	SAVEVAR("soul_gives_xp")
	SAVEPATH("stored_soul_path")

/obj/item/soulgem/load_item_data_pre(var/mob/living/advanced/player/P,var/list/object_data,var/loadout=FALSE)
	RUN_PARENT_SAFE
	LOADVAR("total_charge")
	LOADVAR("soul_gives_xp")
	LOADPATH("stored_soul_path")

/obj/item/soulgem/Finalize()
	. = ..()

	if(!total_capacity) //In case of errors.
		if(total_charge)
			total_capacity = total_charge
		else
			total_capacity = SOUL_SIZE_COMMON

	update_sprite()

//https://www.desmos.com/calculator/vjla2nxgnn

/obj/item/soulgem/get_base_value()
	. = ..()
	. = (300 + (total_capacity * ( 100 / (SOUL_SIZE_GODLY+300) ))**2)
	. = CEILING(.,500)
	if(do_not_consume)
		. *= 3

/obj/item/soulgem/get_value()
	. = ..()
	. = (300 + (total_charge * ( 100 / (SOUL_SIZE_GODLY+300) ))**2)*2
	. = CEILING(.,1)

/obj/item/soulgem/get_examine_list(var/mob/activator)
	. = ..()
	. += span("notice","其中的灵魂共提供[total_charge]点能量。")
	if(total_charge)
		if(stored_soul_path)
			. += span("notice","投掷它会[do_not_consume ? "" : "使宝石碎裂，并"]释放出受你控制的[initial(stored_soul_path.name)]。")
			. += span("notice","可以用灵魂宝石重新捕获灵魂，不会受到惩罚。")
		else
			. += span("warning","虽然它有能量，但里面没有完整灵魂，投掷后不会释放仆从。")

/obj/item/soulgem/on_thrown(var/atom/owner,var/atom/hit_atom) //What happens after the soulgem is thrown and it hits an object.

	. = ..()

	if(is_living(owner) && total_charge > 0 && hit_atom && stored_soul_path)
		var/mob/living/master = owner
		var/turf/T = is_turf(hit_atom) ? hit_atom : get_turf(hit_atom)
		if(T)
			var/mob/living/mob_to_spawn = stored_soul_path
			mob_to_spawn = new mob_to_spawn(T)
			mob_to_spawn.soul_size = total_charge
			src.total_charge = 0
			src.stored_soul_path = null
			INITIALIZE(mob_to_spawn)
			GENERATE(mob_to_spawn)
			master.add_minion(mob_to_spawn)
			FINALIZE(mob_to_spawn)
			if(master.ckey)
				master.add_skill_xp(SKILL_SUMMONING,CEILING(mob_to_spawn.soul_size*0.02,1))
			if(do_not_consume)
				mob_to_spawn.visible_message(span("notice","[src.name]隐去身形，释放出了[mob_to_spawn.name]！"))
				if(is_advanced(master))
					var/mob/living/advanced/A = master
					src.quick_equip(A,ignore_worn=TRUE,ignore_dynamic=TRUE,silent=TRUE)
				update_sprite()
			else
				mob_to_spawn.visible_message(span("notice","[src.name]碎裂，释放出了[mob_to_spawn.name]！"))
				qdel(src)



/obj/item/soulgem/update_sprite()
	. = ..()
	name = initial(name)
	icon = initial(icon)
	if(do_not_consume)
		name = "不碎[name]"
		icon_state = "azuras"
		rarity = RARITY_LEGENDARY
	else
		switch(total_capacity)
			if(0 to SOUL_SIZE_COMMON)
				name = "普通[name]"
				icon_state = "common"
				rarity = RARITY_COMMON
			if(SOUL_SIZE_COMMON to SOUL_SIZE_UNCOMMON)
				name = "少见[name]"
				icon_state = "uncommon"
				rarity = RARITY_UNCOMMON
			if(SOUL_SIZE_UNCOMMON to SOUL_SIZE_RARE)
				name = "稀有[name]"
				icon_state = "rare"
				rarity = RARITY_RARE
			if(SOUL_SIZE_RARE to SOUL_SIZE_MYSTIC)
				name = "神秘[name]"
				icon_state = "mystic"
				rarity = RARITY_MYTHICAL
			if(SOUL_SIZE_MYSTIC to INFINITY)
				name = "神级[name]"
				icon_state = "godly"
				rarity = RARITY_LEGENDARY
	if(total_charge > 0)
		switch(total_charge)
			if(0 to SOUL_SIZE_COMMON)
				name = "[name]（普通灵魂）"
			if(SOUL_SIZE_COMMON to SOUL_SIZE_UNCOMMON)
				name = "[name]（少见灵魂）"
			if(SOUL_SIZE_UNCOMMON to SOUL_SIZE_RARE)
				name = "[name]（稀有灵魂）"
			if(SOUL_SIZE_RARE to SOUL_SIZE_MYSTIC)
				name = "[name]（神秘灵魂）"
			if(SOUL_SIZE_MYSTIC to INFINITY)
				name = "[name]（神级灵魂）"
		icon_state = "[icon_state]_1"
	else
		name = "[name]（空）"



/obj/item/soulgem/click_on_object(var/mob/activator as mob,var/atom/object,location,control,params)

	//Capture Minions
	if(is_living(object))

		INTERACT_CHECK
		INTERACT_CHECK_OBJECT
		INTERACT_DELAY(1)

		var/mob/living/L = object
		if(L.minion_master != activator)
			return TRUE
		if(L.qdeleting)
			return TRUE
		if(total_charge != 0)
			activator.to_chat(span("warning","捕获灵魂需要空的灵魂宝石！"))
			return TRUE
		if(initial(L.soul_size) > src.total_capacity)
			activator.to_chat(span("warning","这个灵魂太强大，[src.name]容纳不下！"))
			return TRUE
		total_charge = min(L.soul_size,total_capacity)
		stored_soul_path = L.type
		soul_gives_xp = FALSE
		qdel(L)
		update_sprite()
		return TRUE

	//Capture Souls
	if(istype(object,/obj/effect/temp/soul))

		INTERACT_CHECK
		INTERACT_CHECK_OBJECT
		INTERACT_DELAY(1)

		if(total_charge != 0)
			activator.to_chat(span("warning","捕获灵魂需要空的灵魂宝石！"))
			return TRUE

		var/obj/effect/temp/soul/S = object
		if(S.qdeleting || !S.soul_size)
			return TRUE

		if(S.soul_size > src.total_capacity)
			activator.to_chat(span("warning","这个灵魂太强大，[src.name]容纳不下！"))
			return TRUE

		total_charge = min(S.soul_size,total_capacity)
		activator.visible_message(span("danger","[activator.name]用[src.name]捕获了[S.name]！"),span("warning","你用[src.name]捕获了[S.name]！"))
		if(is_living(activator))
			var/mob/living/L = activator
			L.add_skill_xp(SKILL_SUMMONING,CEILING(S.soul_size*0.01,1))
		stored_soul_path = S.soul_path
		soul_gives_xp = TRUE
		qdel(S)
		update_sprite()

		return TRUE

	if(istype(object,/obj/item/weapon/ranged/magic/staff/))

		INTERACT_CHECK
		INTERACT_CHECK_OBJECT
		INTERACT_DELAY(1)

		var/obj/item/weapon/ranged/magic/staff/S = object
		if(total_charge)
			activator.visible_message(span("notice","[activator.name]用[src.name]为[S.name]补充了魔力。"),span("notice","你用[src]为[S]补充了魔力。"))
			S.total_charge += total_charge
			total_charge -= total_charge
			if(soul_gives_xp && is_living(activator))
				var/mob/living/L = activator
				L.add_skill_xp(SKILL_SUMMONING,CEILING(total_charge*0.0025,1))
			if(!do_not_consume && total_charge <= 0)
				activator.to_chat(span("warning","[src]碎裂了！"))
				qdel(src)
			else
				stored_soul_path = null
		else
			activator.to_chat(span("warning","[src]已经没有能量了！"))
		update_sprite()

		return TRUE

	return ..()


/obj/item/soulgem/common
	total_capacity = SOUL_SIZE_COMMON
	value = 1

/obj/item/soulgem/common/filled/Generate()
	. = ..()
	total_charge = total_capacity

/obj/item/soulgem/uncommon
	total_capacity = SOUL_SIZE_UNCOMMON
	value = 1

/obj/item/soulgem/uncommon/filled/Generate()
	. = ..()
	total_charge = total_capacity

/obj/item/soulgem/rare
	total_capacity = SOUL_SIZE_RARE
	value = 1

/obj/item/soulgem/rare/filled/Generate()
	. = ..()
	total_charge = total_capacity

/obj/item/soulgem/mystic
	total_capacity = SOUL_SIZE_MYSTIC
	value = 1

/obj/item/soulgem/mystic/filled/Generate()
	. = ..()
	total_charge = total_capacity

/obj/item/soulgem/godly
	total_capacity = SOUL_SIZE_GODLY
	value = 1

/obj/item/soulgem/godly/filled/Generate()
	. = ..()
	total_charge = total_capacity

/obj/item/soulgem/azuras_star
	total_capacity = SOUL_SIZE_MYSTIC
	do_not_consume = TRUE
	value_burgerbux = 1
	value = 1
