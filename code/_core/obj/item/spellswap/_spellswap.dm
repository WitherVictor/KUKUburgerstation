/obj/item/spellswap

	name = "法术替换器错误"
	icon = 'icons/obj/item/spellswap.dmi'
	icon_state = null

	var/obj/projectile/desired_projectile
	var/desired_sound
	var/list/damage_conversion = list() //As a ratio.

	value_burgerbux = 1

	rarity = RARITY_RARE


/obj/item/spellswap/click_on_object(var/mob/activator,var/atom/object,location,control,params)

	if(is_weapon(object))

		INTERACT_CHECK
		INTERACT_DELAY(10)


		var/obj/item/weapon/I = object

		var/list/spellswap_choices = list("是" = "Yes","否" = "No","取消" = "Cancel")
		var/desired_choice = input("确定使用[src.name]替换[I.name]的发射效果吗？此操作无法撤销。","法术替换","取消") as null|anything in spellswap_choices
		desired_choice = spellswap_choices[desired_choice]

		if(desired_choice != "Yes")
			activator.to_chat(span("notice","你决定不替换[I.name]的发射效果。"))
			return TRUE
		if(desired_projectile==null)
			if(I.stored_spellswap)
				I.stored_spellswap = src
				qdel(I.stored_spellswap)
				src.drop_item(I)
				I.damage_type = initial(I.damage_type)
			else
				activator.to_chat(span("notice", "没有可移除的法术！"))
				return TRUE
			activator.to_chat(span("notice","你使用[src.name]替换了[I.name]的发射效果。"))

			var/turf/T = get_turf(activator)
			play_sound(desired_sound,T)

			return TRUE

		if(I.stored_spellswap)
			qdel(I.stored_spellswap)

		src.drop_item(I)
		I.stored_spellswap = src

		activator.to_chat(span("notice","你使用[src.name]替换了[I.name]的发射效果。"))

		var/turf/T = get_turf(activator)
		play_sound(desired_sound,T)

		return TRUE

	. = ..()
