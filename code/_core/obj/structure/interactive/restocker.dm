/obj/structure/interactive/restocker
	name = "补给器"
	desc = "只要材料足够，就能补充物资。"
	icon = 'icons/obj/structure/vending.dmi'
	icon_state = "gear2"

	bullet_block_chance = 40

	collision_flags = FLAG_COLLISION_BARICADE
	collision_bullet_flags = FLAG_COLLISION_BULLET_ORGANIC

	layer = LAYER_OBJ_CRATE + 1

	density = TRUE
	anchored = FALSE

	pixel_y = 10

/obj/structure/interactive/restocker/ammo
	name = "便携库存旧式弹药补给器"
	desc = "警告：这里的弹匣可不是杂志。"
	desc_extended = "自动为弹匣补充廉价库存旧式弹药的机器。没有旧式弹药型号的弹匣会使用普通弹药。"
	icon = 'icons/obj/structure/vending.dmi'
	icon_state = "gear2_ammo"
	var/premium = FALSE //Is this a premium ammo restocker?
	var/currency_left = 0 //For premium ammo restockers

/obj/structure/interactive/restocker/ammo/clicked_on_by_object(var/mob/activator,var/atom/object,location,control,params)

	if(istype(object,/obj/item/magazine/))
		INTERACT_CHECK
		INTERACT_CHECK_OBJECT
		INTERACT_DELAY(5)
		var/obj/item/magazine/M = object
		var/obj/item/bullet_cartridge/bullet_to_create = premium || !M.ammo_surplus ? M.ammo : M.ammo_surplus
		if(!bullet_to_create)
			activator.to_chat(span("warning","系统中没有登记这个弹匣！"))
			return TRUE
		var/bullets_to_add = M.bullet_count_max - M.get_ammo_count()
		if(bullets_to_add <= 0)
			activator.to_chat(span("warning","[M.name]已经装满了！"))
			return TRUE
		if(M.next_regen > world.time)
			activator.to_chat(span("warning","这个弹匣刚补充过，请等待[CEILING(DECISECONDS_TO_SECONDS(M.next_regen-world.time),1)]秒！"))
			return TRUE
		if(premium)
			var/value_per_bullet = SSbalance.stored_value[bullet_to_create]
			if(value_per_bullet*bullets_to_add > currency_left)
				activator.to_chat(span("warning","[src.name]的信用点储备不足，无法完成操作！"))
				return TRUE
			currency_left -= value_per_bullet*bullets_to_add
		M.next_regen = world.time + SECONDS_TO_DECISECONDS(120)
		M.stored_bullets[bullet_to_create] += bullets_to_add
		M.update_sprite()
		activator.to_chat(span("notice","已向[M.name]补充[bullets_to_add]发[initial(bullet_to_create.name)]。"))
		return TRUE

	if(istype(object,/obj/item/powercell/))
		INTERACT_CHECK
		INTERACT_CHECK_OBJECT
		INTERACT_DELAY(5)
		if(!premium)
			activator.to_chat(span("warning","只有普通弹药补给器才能为电池充电，旧式弹药补给器不支持！"))
			return TRUE
		var/obj/item/powercell/C = object
		var/charge_to_add = C.charge_max - C.charge_current
		if(charge_to_add <= 0)
			activator.to_chat(span("warning","[C.name]的电量已经充满了！"))
			return TRUE
		if(premium)
			if(0.001*charge_to_add > currency_left)
				activator.to_chat(span("warning","[src.name]的信用点储备不足，无法完成操作！"))
				return TRUE
			currency_left -= 0.001*charge_to_add
		C.charge_current = C.charge_max
		activator.to_chat(span("notice","你迅速为[C.name]充满了电。"))
		C.update_sprite()
		return TRUE

	if(istype(object,/obj/item/bulletbox))
		INTERACT_CHECK
		INTERACT_CHECK_OBJECT
		INTERACT_DELAY(5)
		if(!premium)
			activator.to_chat(span("warning","只有普通弹药补给器才能补充弹药盒，旧式弹药补给器不支持！"))
			return TRUE
		var/obj/item/bulletbox/B = object
		var/obj/item/bullet_cartridge/bullet_to_create = initial(B.stored_bullet)
		if(!bullet_to_create)
			activator.to_chat(span("warning","这个弹药盒没有登记弹药型号！"))
			return TRUE
		if(B.stored_bullet && B.stored_bullet != bullet_to_create)
			activator.to_chat(span("warning","弹药盒内的弹药类型与登记的型号不符！"))
			return TRUE
		var/bullets_to_add = B.bullet_max - B.bullet_count
		if(bullets_to_add <= 0)
			activator.to_chat(span("warning","[B.name]已经装满了！"))
			return TRUE
		if(B.next_regen > world.time)
			activator.to_chat(span("warning","这个弹药盒刚补充过，请等待[CEILING(DECISECONDS_TO_SECONDS(B.next_regen-world.time),1)]秒！"))
			return TRUE
		if(premium)
			var/value_per_bullet = SSbalance.stored_value[bullet_to_create]
			if(value_per_bullet*bullets_to_add > currency_left)
				activator.to_chat(span("warning","[src.name]的信用点储备不足，无法完成操作！"))
				return TRUE
			currency_left -= value_per_bullet*bullets_to_add

		B.next_regen = world.time + SECONDS_TO_DECISECONDS(120)
		B.bullet_count += bullets_to_add
		activator.to_chat(span("notice","已向弹药盒补充[bullets_to_add]发[initial(bullet_to_create.name)]。"))
		return TRUE

	if(istype(object,/obj/item/clothing/belt/bandoliers)) //Allows bandolier type items to be restocked using a premium restocker
		INTERACT_CHECK
		INTERACT_CHECK_OBJECT
		INTERACT_DELAY(5)
		if(!premium)
			activator.to_chat(span("warning","只有普通弹药补给器才能补充弹药袋和弹药带，旧式弹药补给器不支持！"))
			return TRUE
		var/obj/item/clothing/belt/bandoliers/B = object
		var/obj/item/bullet_cartridge/bullet_to_create = premium || !B.bullet_type ? B.bullet_type_premium : B.bullet_type
		var/bullets_to_add = B.max_bullets - B.bullet_count
		if(B.can_be_restocked)
			if(bullets_to_add <= 0)
				activator.to_chat(span("warning","这条弹药带已经装满了！"))
				return TRUE
			if(B.next_regen > world.time)
				activator.to_chat(span("warning","这条弹药带刚补充过，请等待[CEILING(DECISECONDS_TO_SECONDS(B.next_regen-world.time),1)]秒！"))
				return TRUE
			if(premium)
				var/value_per_bullet = SSbalance.stored_value[bullet_to_create]
				if(value_per_bullet*bullets_to_add > currency_left)
					activator.to_chat(span("warning","[src.name]的信用点储备不足，无法完成操作！"))
					return TRUE
				else
					currency_left -= value_per_bullet*bullets_to_add
					if(!B.stored_bullets[bullet_to_create.type])
						B.stored_bullets[bullet_to_create.type] = bullets_to_add
						B.update_bullet_count()
					else
						B.stored_bullets[bullet_to_create.type] += bullets_to_add
						B.update_bullet_count()
		else
			activator.to_chat(span("warning","这条弹药带无法使用补给器补充！"))
			return TRUE
		B.next_regen = world.time + SECONDS_TO_DECISECONDS(120)
		B.update_icon()
		B.update_sprite()
		activator.to_chat(span("notice","已向弹药带补充[bullets_to_add]发子弹。"))

	return ..()

/obj/structure/interactive/restocker/ammo/premium
	name = "便携弹药补给器"
	desc = "警告：这里也没有高级杂志。"
	desc_extended = "自动为弹匣补充普通弹药的机器，也支持电池、弹药盒和可补充的弹药带。补充物资和充电会消耗机器储备的信用点。"
	icon = 'icons/obj/structure/vending.dmi'
	icon_state = "gear2_ammo_premium"
	premium = TRUE
	currency_left = 5000

/obj/structure/interactive/restocker/ammo/premium/get_examine_list(var/mob/examiner)
	. = ..()
	. += div("notice","这台补给器还剩价值[currency_left]信用点的补给储备。")

/obj/structure/interactive/restocker/ammo/premium/anchored
	name = "固定式弹药补给器"
	anchored = TRUE
	currency_left = 10000
