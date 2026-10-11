/obj/item/weapon/ranged/spellgem/clown_mending
	name = "自身反愈合法术宝石"
	desc = "一切魔法的源泉。"
	desc_extended = "充满纯粹奥术能量的魔法宝石，赋予使用者施放法术的能力，可镶入魔杖。这颗提供轻微的再生……效果？嘟嘟！"
	icon_state = "damage"
	color = "#ff0080"
	color_3 = "#fffb00"

	use_loyalty_tag = FALSE
	use_iff_tag = FALSE
	has_quick_function = TRUE

	utilitygem = TRUE

	mana_cost_override = 60

	value = 1200

	value_burgerbux = 1

/obj/item/weapon/ranged/spellgem/clown_mending/shoot(mob/caller, atom/object, location, params, damage_multiplier = 1, click_called)
	if(istype(caller,/mob/living))
		. = ..()
		var/quality_bonus = get_quality_bonus(0.5,2)
		var/damage_multiplier_to_use = damage_multiplier * damage_mod
		damage_multiplier_to_use *= quality_bonus
		if(length(attachment_stats))
			MUL(damage_multiplier_to_use,attachment_stats["damage_multiplier"])
		var/mob/living/livingcaller = caller
		if(livingcaller.status_effects[TEMP_REGEN])
			livingcaller.visible_message(span("warning","[livingcaller.name]失望地看着[src]。"),span("warning","法术消散了！"))
		else
			livingcaller.visible_message(span("warning","[livingcaller.name]的伤口开始愈合了？大概吧？"),span("warning","你感觉伤口正在愈合？大概吧？"))
			livingcaller.add_status_effect(TEMP_REGEN,-damage_multiplier_to_use,SECONDS_TO_DECISECONDS(damage_multiplier_to_use * 5))
	else
		CRASH("Nonliving atom [caller] is somehow using a [object], which shouldn't be possible!")
