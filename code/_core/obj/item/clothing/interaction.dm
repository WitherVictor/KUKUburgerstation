/obj/item/clothing/click_on_object(var/mob/activator,var/atom/object,location,control,params) //When we attack something with the clothes

	if(is_advanced(activator) && activator == object) //Auto-equip.
		//No interaction delay needed.
		quick_equip(activator,ignore_held=TRUE,ignore_dynamic=TRUE)
		return TRUE

	return ..()


/obj/item/clothing/click_self(var/mob/activator,location,control,params)

	if(length(additional_clothing_stored) && is_advanced(activator) && is_inventory(src.loc))
		var/obj/hud/inventory/I = src.loc
		if(I.worn)
			INTERACT_CHECK
			INTERACT_DELAY(5)
			equip_additional_clothing(activator)
			return TRUE

	. = ..()

/obj/item/proc/quick_equip(var/mob/living/advanced/activator,var/ignore_hands = FALSE,var/ignore_worn=FALSE,var/ignore_held=FALSE,var/ignore_dynamic=FALSE,var/debug=FALSE,var/silent=FALSE)

	var/obj/hud/inventory/best_inventory_wear
	var/obj/hud/inventory/best_inventory_equip

	for(var/k in activator.inventories_by_id)
		var/obj/hud/inventory/I = activator.inventories_by_id[k]
		if(!I || I.qdeleting || !I.loc || I.loc.qdeleting || !I.allow_quick_equip)
			continue
		if((I.click_flags & (LEFT_HAND | RIGHT_HAND)) && ignore_hands)
			continue
		if(!ignore_worn && I.worn && (!best_inventory_wear || I.priority >= best_inventory_wear.priority) && can_be_worn(activator,I) && I.can_slot_object(src))
			best_inventory_wear = I
			continue
		if(I.should_add_to_advanced) //Non-dynamic
			if(!ignore_held && (!best_inventory_equip || I.priority >= best_inventory_equip.priority) && can_be_held(activator,I) && I.can_slot_object(src))
				best_inventory_equip = I
				continue
		else
			if(!ignore_dynamic && (!best_inventory_equip || I.priority >= best_inventory_equip.priority) && can_be_held(activator,I) && I.can_slot_object(src))
				best_inventory_equip = I
				continue

	if(best_inventory_wear)
		if(debug) log_debug("(WEAR) Best inventory found for [activator.get_debug_name()]: [best_inventory_wear.get_debug_name()].")
		return best_inventory_wear.add_object(src,silent=silent)

	if(best_inventory_equip)
		if(debug) log_debug("(EQUIP) Best inventory found for [activator.get_debug_name()]: [best_inventory_equip.get_debug_name()].")
		return best_inventory_equip.add_object(src,silent=silent)

	return FALSE


/obj/item/clothing/get_examine_list(var/mob/examiner)

	. = ..()

	if(speed_bonus != 0)
		if(speed_bonus > 0)
			. += div("notice","<b>速度加成：</b>[speed_bonus*100]%。")
		else
			. += div("notice","<b>速度降低：</b>[-speed_bonus*100]%。")

	var/armor/A = ARMOR(src.armor)
	if(A)
		var/list/defense_rating_to_print = A.defense_rating
		if(defense_rating_to_print && length(defense_rating_to_print) && protected_limbs && length(protected_limbs))
			var/list/armor_list = list()
			var/list/damage_display_names = list(BLADE = "切割",BLUNT = "钝击",PIERCE = "穿刺",LASER = "激光",ARCANE = "奥术",HEAT = "高温",COLD = "寒冷",SHOCK = "电击",ACID = "酸蚀",BOMB = "爆炸",BIO = "生物武器",RAD = "辐射",HOLY = "神圣",DARK = "黑暗",FATIGUE = "疲劳",PAIN = "疼痛",ION = "离子",SANITY = "理智",MENTAL = "精神",ALL = "全部",BRUTE = "物理",BURN = "灼烧",TOX = "毒素",OXY = "缺氧")
			for(var/damagetype in defense_rating_to_print)
				var/damage_rating = defense_rating_to_print[damagetype]
				var/damage_display_name = damage_display_names[damagetype] ? damage_display_names[damagetype] : damagetype
				if(IS_INFINITY(damage_rating))
					armor_list += "[damage_display_name]：免疫"
				else if(damage_rating)
					if(damage_rating > 0)
						damage_rating = FLOOR(damage_rating*get_quality_mod(),1)
					armor_list += "[damage_display_name]：[damage_rating]"
			var/list/limb_display_names = list(BODY_HEAD = "头部",BODY_FACE = "面部",BODY_NECK = "颈部",BODY_TORSO = "躯干",BODY_GROIN = "腹股沟",BODY_ARM_LEFT = "左臂",BODY_ARM_RIGHT = "右臂",BODY_HAND_LEFT = "左手",BODY_HAND_RIGHT = "右手",BODY_LEG_LEFT = "左腿",BODY_LEG_RIGHT = "右腿",BODY_FOOT_LEFT = "左脚",BODY_FOOT_RIGHT = "右脚",BODY_EYES = "眼睛",BODY_EYE_LEFT = "左眼",BODY_EYE_RIGHT = "右眼",BODY_EARS = "耳朵",BODY_EAR_LEFT = "左耳",BODY_EAR_RIGHT = "右耳",BODY_TAIL = "尾巴",BODY_WINGS = "翅膀",BODY_ANTENNAE = "触角")
			var/list/protected_limb_labels = list()
			for(var/limb_id in protected_limbs)
				protected_limb_labels += limb_display_names[limb_id] ? limb_display_names[limb_id] : limb_id
			. += div("notice","<b>护甲：</b>[jointext(armor_list,"、")]。")
			. += div("notice","<b>防护部位：</b>[jointext(protected_limb_labels,"、")]。")

