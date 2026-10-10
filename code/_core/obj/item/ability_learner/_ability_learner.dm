/obj/item/ability_learner

	name = "能力卷轴"
	desc = "终于让我找到了。"
	desc_extended = "错误。"

	icon = 'icons/obj/item/books.dmi'
	icon_state = "scroll"

	rarity = RARITY_UNCOMMON

	var/ability/stored_ability

/obj/item/ability_learner/Finalize()
	. = ..()
	if(!stored_ability)
		log_error("Warning: Tried creating an empty [src.get_debug_name()]!")
		qdel(src)
	update_sprite()

/obj/item/ability_learner/get_base_value()
	if(!stored_ability)
		return 0
	. = ..()

/obj/item/ability_learner/update_sprite()
	. = ..()
	if(name == "能力卷轴")
		name = "能力卷轴：[initial(stored_ability.name)]"
		desc_extended = initial(stored_ability.desc)

/obj/item/ability_learner/update_overlays()
	. = ..()
	if(icon_state == "scroll" && stored_ability)
		var/image/I = new/image(initial(stored_ability.icon),initial(stored_ability.icon_state))
		var/matrix/M = matrix()
		M.Scale(0.75,0.75)
		I.transform = M
		add_overlay(I)

/obj/item/ability_learner/click_self(var/mob/activator)

	INTERACT_CHECK
	INTERACT_DELAY(10)

	PROGRESS_BAR(activator,src,30,src::learn(),activator)
	PROGRESS_BAR_CONDITIONS(activator,src,src::can_learn(),activator)

	activator.to_chat(span("notice","你研读[src.name]，开始学习[initial(stored_ability.name)]……"))

	return TRUE


/obj/item/ability_learner/proc/can_learn(var/mob/living/advanced/A)

	if(!A.loc || !is_inventory(src.loc))
		return FALSE

	var/obj/hud/inventory/I = src.loc
	if(I.owner != A)
		return FALSE

	if(!I.click_flags)
		return FALSE

	return TRUE


/obj/item/ability_learner/proc/learn(var/mob/living/advanced/A)

	if(!stored_ability || !A.ckey) //Something went wrong.
		return FALSE

	var/savedata/client/globals/GD = GLOBALDATA(A.ckey)

	if(!GD.loaded_data["unlocked_abilities"])
		GD.loaded_data["unlocked_abilities"] = list()
	else if("[stored_ability]" in GD.loaded_data["unlocked_abilities"]) //stored_ability is a path.
		A.to_chat(span("warning","你已经学会了[initial(stored_ability.name)]！"))
		return FALSE

	GD.loaded_data["unlocked_abilities"] += "[stored_ability]" //stored_ability is a path.
	A.to_chat(span("notice","你从[src.name]中学会了[initial(stored_ability.name)]的全部内容，随后卷轴化为尘埃……"))
	stored_ability = null
	qdel(src)

	return TRUE
