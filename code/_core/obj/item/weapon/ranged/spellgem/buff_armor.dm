/obj/item/weapon/ranged/spellgem/buff_armor
	name = "自身护甲强化法术宝石"
	desc = "一切魔法的源泉。"
	desc_extended = "充满纯粹奥术能量的魔法宝石，赋予使用者施放法术的能力，可镶入魔杖。这颗能暂时强化你的护甲。"
	icon_state = "protection"
	color = "#a7007d"

	use_loyalty_tag = FALSE
	use_iff_tag = FALSE
	has_quick_function = TRUE

	utilitygem = TRUE

	mana_cost_override = 60

	value = 800

	value_burgerbux = 1

/obj/item/weapon/ranged/spellgem/buff_armor/shoot(mob/caller, atom/object, location, params, damage_multiplier = 1, click_called)
	if(istype(caller,/mob/living))
		..()
		var/quality_bonus = get_quality_bonus(0.5,2)
		var/damage_multiplier_to_use = damage_multiplier * damage_mod
		damage_multiplier_to_use *= quality_bonus
		if(length(attachment_stats))
			MUL(damage_multiplier_to_use,attachment_stats["damage_multiplier"])
		var/mob/living/livingcaller = caller
		if(livingcaller.status_effects[TEMP_ARMOR])
			livingcaller.visible_message(span("warning","[livingcaller.name]失望地看着[src]。"),span("warning","法术消散了！"))
		else
			livingcaller.add_status_effect(TEMP_ARMOR,damage_multiplier_to_use * 10,SECONDS_TO_DECISECONDS(damage_multiplier_to_use * 30))
		return TRUE
	else
		CRASH("Nonliving atom [caller] is somehow using a [object], which shouldn't be possible!")
