/obj/item/clothing/belt/damage_deferal_shield
	name = "外星便携护盾"
	desc = "献给立志成为超级士兵的人。"
	desc_extended = "采用外星技术的腰带式减伤系统，内置微型聚变反应堆，将大部分致命动能从使用者身上偏转开。 \
	运行时需要消耗惊人的能量，因此检测到首次命中后才会自动启动；承受200点伤害、经过8秒或使用者手动关闭时停机。 \
	再次使用前需要冷却10秒。"

	icon = 'icons/obj/item/clothing/belts/damage_deferal.dmi'
	worn_layer = LAYER_MOB_CLOTHING_COAT_OVER
	dyeable = FALSE

	value = 1800
	size = SIZE_4
	weight = 30

	can_negate_damage = TRUE

	var/damage_limit = 200
	var/active_time = SECONDS_TO_DECISECONDS(8) //How long the shield stays active for.
	var/cooldown_time = SECONDS_TO_DECISECONDS(10) //How long it takes for the shield to reactivate.

	var/obj/effect/shield_overlay

	protected_limbs = TARGETABLE_LIMBS

	uses_until_condition_fall = 1000

	contraband = TRUE

	rarity = RARITY_MYTHICAL

/obj/item/clothing/belt/damage_deferal_shield/use_condition(var/amount_to_use=1)
	if(!CALLBACK_EXISTS("\ref[src]_disable_shield"))
		return FALSE
	. = ..()


/obj/item/clothing/belt/damage_deferal_shield/on_equip(var/atom/old_location,var/silent=FALSE)
	. = ..()
	var/obj/hud/inventory/I = loc
	if(I.worn && is_advanced(I.owner))
		HOOK_ADD("post_move","\ref[src]_shield_post_move",I.owner,src,src::owner_post_move())

/obj/item/clothing/belt/damage_deferal_shield/on_unequip(var/obj/hud/inventory/old_inventory,var/silent=FALSE) //When the object is dropped from the old_inventory
	. = ..()
	if(old_inventory.worn && is_advanced(old_inventory.owner))
		HOOK_REMOVE("post_move","\ref[src]_shield_post_move",old_inventory.owner)

/obj/item/clothing/belt/damage_deferal_shield/proc/owner_post_move(var/mob/living/advanced/owner,var/atom/old_loc)
	shield_overlay.glide_size = owner.glide_size
	shield_overlay.force_move(owner.loc)
	return TRUE

/obj/item/clothing/belt/damage_deferal_shield/New(var/desired_loc)
	. = ..()
	shield_overlay = new(src)
	shield_overlay.mouse_opacity = 0
	shield_overlay.icon = icon
	shield_overlay.icon_state = "overlay"
	shield_overlay.alpha = 0

/obj/item/clothing/belt/damage_deferal_shield/PreDestroy()
	CALLBACK_REMOVE("\ref[src]_disable_shield")
	CALLBACK_REMOVE("\ref[src]_cooldown_end")
	CALLBACK_REMOVE("\ref[src]_shield_beep")
	QDEL_NULL(shield_overlay)
	. = ..()

/obj/item/clothing/belt/damage_deferal_shield/click_self(var/mob/activator,location,control,params)

	if(CALLBACK_EXISTS("\ref[src]_disable_shield"))
		activator.to_chat(span("notice","你关闭了[src.name]，手动让护盾进入冷却。"))
		CALLBACK_REMOVE("\ref[src]_disable_shield")
		disable_shield()
	else if(CALLBACK_EXISTS("\ref[src]_cooldown_end"))
		activator.to_chat(span("warning","界面闪烁着错误提示：护盾仍在冷却！"))
	else
		activator.to_chat(span("notice","你开启了[src.name]，激活护盾。"))
		CALLBACK("\ref[src]_disable_shield",active_time,src,src::disable_shield()) //Activate the shield!

	update_sprite()

	return TRUE

/obj/item/clothing/belt/damage_deferal_shield/update_sprite()

	. = ..()

	icon = initial(icon)
	icon_state = initial(icon_state)

	if(CALLBACK_EXISTS("\ref[src]_cooldown_end")) //Shield that is cooling down.
		icon_state = "[icon_state]_cooling"
	else if(CALLBACK_EXISTS("\ref[src]_disable_shield")) //Active shield.
		icon_state = "[icon_state]_active"

/obj/item/clothing/belt/damage_deferal_shield/proc/disable_shield()
	damage_limit = initial(damage_limit)
	CALLBACK("\ref[src]_cooldown_end",cooldown_time,src,src::cooldown_end())
	shield_beep()
	update_sprite()
	return TRUE

/obj/item/clothing/belt/damage_deferal_shield/proc/shield_beep()
	if(!CALLBACK_EXISTS("\ref[src]_cooldown_end")) //Only beep if there is a cooldown.
		return FALSE
	play_sound('sound/effects/shield_beep.ogg',get_turf(src))
	CALLBACK("\ref[src]_shield_beep",SECONDS_TO_DECISECONDS(1),src,src::shield_beep())
	return TRUE


/obj/item/clothing/belt/damage_deferal_shield/proc/cooldown_end()
	play_sound('sound/effects/shield_recharge.ogg',get_turf(src))
	update_sprite()
	return TRUE

/obj/item/clothing/belt/damage_deferal_shield/negate_damage(var/atom/attacker,var/atom/victim,var/atom/weapon,var/atom/hit_object,var/atom/blamed,var/damage_dealt=0)

	if(damage_dealt <= 0) //The damage doesn't exist for some reason.
		return FALSE

	if(damage_limit <= 0) //No damage can be protected!
		return FALSE

	if(CALLBACK_EXISTS("\ref[src]_cooldown_end")) //Cooling down, can't do anything right now.
		return FALSE

	if(!CALLBACK_EXISTS("\ref[src]_disable_shield")) //The shield is not active.
		CALLBACK("\ref[src]_disable_shield",active_time,src,src::disable_shield()) //Activate the shield!
		return FALSE

	animate(shield_overlay,alpha=clamp(damage_dealt+100,100,255),time=0,flags=ANIMATION_END_NOW )
	animate(alpha=0,time=5)

	damage_limit -= damage_dealt

	if(damage_limit <= 0)
		CALLBACK_REMOVE("\ref[src]_disable_shield")
		disable_shield()
		return FALSE

	return TRUE


