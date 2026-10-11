/obj/item/attachment/undermount
	name = "下挂配件"

/obj/item/attachment/undermount/vertical_grip
	name = "垂直握把"
	desc = "牢牢握住。"
	desc_extended = "简单的枪管下挂垂直握把，减少移动散布与后坐散布，但会增加技能不足造成的散布。"
	icon_state = "vertical_grip"

	attachment_stats = list(
		movement_spread = 0.8,
		skill_spread = 1.2,
		heat_spread = 0.8,
		prone_mul = 1.5
	)

	value = 150

/obj/item/attachment/undermount/angled_grip
	name = "斜角握把"
	desc = "牢牢握住。"
	desc_extended = "特殊斜角握把，减轻技能不足造成的散布与后坐散布，代价是移动散布增加。"
	icon_state = "angled_grip"

	attachment_stats = list(
		movement_spread = 1.25,
		skill_spread = 0.9,
		heat_spread = 0.8,
	)

	value = 150

/obj/item/attachment/undermount/burst_adapter
	name = "点射增强器"
	icon_state = "burst_adapter"
	desc = "咻咻咻。"
	desc_extended = "复杂的枪管下挂机构，增加点射武器的连发次数，同时减少后坐和技能不足造成的散布，代价是移动散布增加。"

	attachment_stats = list(
		bursts_to_use = 3,
		shoot_delay = 0.75,
		heat_spread = 0.5,
		skill_spread = 0.75,
		movement_spread = 1.75,
	)

	value = 400

/obj/item/attachment/undermount/bipod
	name = "两脚架"
	desc = "稳稳架住。"
	desc_extended = "简单的两脚架，改善卧姿或依托掩体射击时的稳定性。武器会变得笨重，未卧倒时的基础散布及移动时的精度惩罚增加。"
	icon_state = "bipod"

	attachment_stats = list(
		prone_mod = 0.5,
		movement_spread = 1.5,
		static_spread = 2
	)

	value = 250



/obj/item/attachment/undermount/gun
	name = "下挂枪械"
	var/obj/item/weapon/ranged/stored_gun

/obj/item/attachment/undermount/gun/PreDestroy()
	QDEL_NULL(stored_gun)
	. = ..()

/obj/item/attachment/undermount/gun/clicked_on_by_object(var/mob/activator,var/atom/object,location,control,params)
	return stored_gun?.clicked_on_by_object(activator,object,location,control,params)

/obj/item/attachment/undermount/gun/Generate()
	if(stored_gun)
		stored_gun = new stored_gun(src)
		stored_gun.anchored = TRUE
		INITIALIZE(stored_gun)
		GENERATE(stored_gun)
		FINALIZE(stored_gun)
	. = ..()

/obj/item/attachment/undermount/gun/save_item_data(var/mob/living/advanced/player/P,var/save_inventory = TRUE,var/died=FALSE,var/loadout=FALSE)
	RUN_PARENT_SAFE
	SAVEATOM("stored_gun")

/obj/item/attachment/undermount/gun/load_item_data_pre(var/mob/living/advanced/player/P,var/list/object_data,var/loadout=FALSE)
	RUN_PARENT_SAFE
	LOADATOM("stored_gun")

/obj/item/attachment/undermount/gun/click_on_object_alt(var/mob/activator,var/atom/object,location,control,params)
	return stored_gun.click_on_object(activator,object,location,control,params)


/obj/item/attachment/undermount/gun/grenade_launcher
	name = "40mm下挂榴弹发射器"
	desc = "咚！"
	desc_extended = "紧凑的下挂榴弹发射器，可向中距离目标发射40mm榴弹。枪口前端增加的重量会妨碍移动射击。"
	icon_state = "grenade_launcher"

	stored_gun = /obj/item/weapon/ranged/bullet/revolver/grenade_launcher/undermount

	attachment_stats = list(
		movement_spread = 1.75
	)

	value = 1000

	rarity = RARITY_RARE


/obj/item/attachment/undermount/gun/built_in_shotgun
	name = "12号单管霰弹枪配件"
	desc = "咚！"
	desc_extended = ""
	icon_state = "s_shotgun"

	stored_gun = /obj/item/weapon/ranged/bullet/revolver/sbarrel/undermount

	attachment_stats = list(
		movement_spread = 1.5
	)

	value = 0

	removable = FALSE
