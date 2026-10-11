/obj/item/tempering/quality
	name = "品质改良用品"
	desc = "你不该看到这个……"
	desc_extended = "请将此问题报告给Burger。"
	has_quick_function = TRUE
	var/item_type_name = "物品"

	var/increase_maximum = 0

/obj/item/tempering/quality/quick(var/mob/activator,var/atom/object,location,params)

	if(!is_advanced(activator) || !is_inventory(src.loc))
		return FALSE

	var/mob/living/advanced/A = activator

	return A.put_in_hands(src,params)

/obj/item/tempering/quality/can_temper(var/mob/activator,var/obj/item/I)

	if(!I.can_adjust_quality())
		activator.to_chat(span("warning","[I.name]无法强化！"))
		return FALSE

	if(increase_maximum)
		if(I.quality_max >= 200 && I.quality >= I.quality_max)
			activator.to_chat(span("warning","[I.name]无法继续强化！"))
			return FALSE
	else
		if(I.quality >= I.quality_max)
			activator.to_chat(span("warning","[I.name]无法继续修复！"))
			return FALSE

	return ..()

/obj/item/tempering/quality/get_examine_list(var/mob/examiner)
	. = ..()
	. += span("notice","使[item_type_name]的品质提高[increase]个百分点，至少恢复至[minimum]%。")
	if(increase_maximum > 0)
		. += span("notice","使[item_type_name]的品质上限提高[increase_maximum]个百分点，最高为200%。")


/obj/item/tempering/quality/on_temper(var/mob/activator, var/obj/item/I)

	if(increase_maximum > 0)
		I.adjust_quality_max(increase_maximum)

	if((I.quality + increase) < minimum)
		I.set_quality(minimum)
	else
		I.adjust_quality(increase)

	return ..()

/obj/item/tempering/quality/general
	name = "高级维修包"
	desc = "装备就是你的命，保养好它！"
	desc_extended = "一套包含废料、工具和通用材料的用品，可用于维护各类物品。"
	icon_state = "repair_kit"

	increase = 25
	minimum = 50

	temper_whitelist = /obj/item

	value = 400

/obj/item/tempering/quality/melee
	name = "厨师磨刀石"
	desc = "保持锋利！"
	desc_extended = "特殊磨刀石，可提高近战武器、徒手武器和投掷武器的品质及品质上限。连没有刃口的物品也能用！"
	icon_state = "whetstone"

	increase = 5
	minimum = 100
	increase_maximum = 5

	temper_whitelist = list(/obj/item/weapon/melee, /obj/item/weapon/unarmed, /obj/item/weapon/ranged/thrown)

	value = 500

/obj/item/tempering/quality/clothing
	name = "护甲匠耐久布"
	desc = "做好防护！"
	desc_extended = "一块稀有的耐久布，可提高服装的品质及品质上限。"
	icon_state = "durathread"

	increase = 5
	minimum = 100
	increase_maximum = 5

	temper_whitelist = /obj/item/clothing
	value = 750

/obj/item/tempering/quality/ranged

/obj/item/tempering/quality/ranged/projectile
	name = "士兵备用黄铜零件"
	desc = "保持领先！"
	desc_extended = "一套从发条教徒那里偷来的备用黄铜零件，可提高非能量类远程武器的品质及品质上限。"
	icon_state = "brass_box"

	increase = 5
	minimum = 100
	increase_maximum = 5

	temper_whitelist = list(
		/obj/item/weapon/ranged/bullet,
		/obj/item/weapon/ranged/reagent_ammo,
		/obj/item/weapon/ranged/bow,
	)
	value = 1000

/obj/item/tempering/quality/ranged/energy
	name = "外星聚焦装置"
	desc = "保持领先！"
	desc_extended = "由钻石和外星合金制成的聚焦晶体，稀有、奇异又昂贵，可提高远程能量武器的品质及品质上限。"
	icon_state = "focusing_crystal"

	increase = 10
	minimum = 100
	increase_maximum = 5

	temper_whitelist = /obj/item/weapon/ranged/energy
	value = 3000

/obj/item/tempering/quality/ranged/magic
	name = "巫师宝石晶体"
	desc = "保持领先！"
	desc_extended = "蕴含魔力的佛隆复合晶体，可提高法术宝石、辅助宝石和魔杖的品质及品质上限。"
	icon_state = "gem_fuel"

	increase = 5
	minimum = 100
	increase_maximum = 5

	temper_whitelist = list(/obj/item/weapon/ranged/spellgem, /obj/item/weapon/ranged/wand, /obj/item/supportgem)
	value = 1250
