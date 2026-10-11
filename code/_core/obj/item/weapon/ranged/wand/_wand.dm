/obj/item/weapon/ranged/wand
	name = "魔杖"
	desc = "羽加迪姆勒维奥萨！"
	desc_extended = "充满魔力的魔杖，可镶嵌任意种类的法术宝石，强化并改善其力量。"
	icon_state = "inventory"

	company_type = "Wizard Federation"

	var/obj/item/weapon/ranged/spellgem/socketed_spellgem
	var/list/obj/item/supportgem/socketed_supportgems = list()

	automatic = TRUE

	var/wand_damage_multiplier = 1

	dan_mode = TRUE

	use_loyalty_tag = TRUE
	use_iff_tag = FALSE

	bypass_balance_check = TRUE

	var/sockets = 0
	var/sockets_max = 7 //Absolute max is 7.

	var/list/stored_socket_overlays = list()

	var/hovering = FALSE //Cosmetic socket effects.
	var/hovering_alpha = 0

	tier_type = "wand"

	size = SIZE_2
	weight = 8

/obj/item/weapon/ranged/wand/PreDestroy()
	QDEL_NULL(socketed_spellgem)
	QDEL_CUT(socketed_supportgems)
	QDEL_CUT(stored_socket_overlays)
	. = ..()

/obj/item/weapon/ranged/wand/MouseEntered(location,control,params)

	. = ..()

	if(!hovering && is_inventory(src.loc))
		hovering = TRUE
		START_THINKING(src)

/obj/item/weapon/ranged/wand/MouseExited(location,control,params)

	. = ..()

	if(hovering)
		hovering = FALSE
		START_THINKING(src)

/obj/item/weapon/ranged/wand/think()

	if(!is_inventory(src.loc))
		hovering = FALSE
		hovering_alpha = 0

	. = ..()

	if(hovering)
		hovering_alpha = min(hovering_alpha + 30,255)
	else
		hovering_alpha = max(hovering_alpha - 30,0)

	for(var/k in stored_socket_overlays)
		var/image/I = k
		I.alpha = hovering_alpha

	if(.)
		return .

	if(!hovering && hovering_alpha > 0)
		return TRUE

	if(hovering && hovering_alpha < 255)
		return TRUE

	return FALSE


/obj/item/weapon/ranged/wand/update_overlays()
	. = ..()

	for(var/k in stored_socket_overlays)
		var/obj/I = k
		vis_contents -= I
		qdel(I)
	stored_socket_overlays.Cut()

	for(var/i=1,i<=sockets,i++)
		var/x_offset = sin((i/sockets)*360)*14
		var/y_offset = cos((i/sockets)*360)*14
		var/obj/I = new(src)
		I.icon = 'icons/obj/item/spellgem.dmi'
		I.icon_state = "socket_backing"
		if(sockets == 1)
			I.pixel_x = -7
			I.pixel_y = 0
		else
			I.pixel_x = x_offset
			I.pixel_y = y_offset

		I.appearance_flags = RESET_COLOR | KEEP_TOGETHER | PIXEL_SCALE | RESET_ALPHA
		I.vis_flags = VIS_INHERIT_LAYER | VIS_INHERIT_PLANE | VIS_INHERIT_ID
		if(length(socketed_supportgems) >= i && socketed_supportgems[i])
			var/obj/item/supportgem/stored_gem = socketed_supportgems[i]
			var/image/G = new/image(stored_gem.icon,stored_gem.icon_state)
			G.appearance = stored_gem.appearance
			G.plane = FLOAT_PLANE
			G.layer = FLOAT_LAYER
			I.add_overlay(G)
			var/image/O = new/image('icons/obj/item/spellgem.dmi',"socket")
			I.add_overlay(O)
		add_vis_content(I)
		I.alpha = 0
		stored_socket_overlays += I

	var/obj/I = new(src)
	I.icon = 'icons/obj/item/spellgem.dmi'
	I.icon_state = "socket_backing"
	I.appearance_flags = RESET_COLOR | KEEP_TOGETHER | PIXEL_SCALE | RESET_ALPHA
	I.vis_flags = VIS_INHERIT_LAYER | VIS_INHERIT_PLANE | VIS_INHERIT_ID
	if(sockets == 1)
		I.pixel_x = 7
		I.pixel_y = 0
	if(socketed_spellgem)
		var/image/G = new/image(socketed_spellgem.icon,socketed_spellgem.icon_state)
		G.appearance = socketed_spellgem.appearance
		G.plane = FLOAT_PLANE
		G.layer = FLOAT_LAYER
		I.add_overlay(G)
		var/image/O = new/image('icons/obj/item/spellgem.dmi',"socket")
		I.add_overlay(O)
	add_vis_content(I)
	I.alpha = 0
	stored_socket_overlays += I

/obj/item/weapon/ranged/wand/Finalize()
	sockets = min(sockets,sockets_max)
	. = ..()
	update_sprite()
	socketed_spellgem?.update_attachment_stats()

/obj/item/weapon/ranged/wand/Initialize()
	. = ..()
	sockets_max = tier + 2
	if(sockets_max <= 2)
		sockets_max = 2

/obj/item/weapon/ranged/wand/Generate()
	. = ..()
	if(sockets == 0) //Sockets are given in the wild. Old function below
		// https://www.desmos.com/calculator/eomhtrxl2v
		var/diceroll = rand(1,1000)
		var/magic_number = (500/6)**1.25
		sockets = 1 + (diceroll/magic_number)**1.3
		sockets = FLOOR(sockets,1)

/obj/item/weapon/ranged/wand/get_base_value()
	. = initial(value)
	// https://www.desmos.com/calculator/bofczfvcar
	. += ((sockets*5)**3)*0.25 + (sockets**(sockets-1))*0.2
	. *= wand_damage_multiplier + wand_damage_multiplier**1.5
	. = CEILING(.,1)


/obj/item/weapon/ranged/wand/get_examine_list(var/mob/examiner)
	. = ..()
	. += div("notice","拥有<b>1</b>个法术宝石槽。")
	. += div("notice","拥有<b>[sockets]</b>个辅助宝石槽。")
	. += div("notice","此类魔杖使法术宝石的伤害提高[(wand_damage_multiplier-1)*100]%。")
	if(socketed_spellgem)
		. += div("notice","当前镶嵌的法术宝石：<b>[socketed_spellgem.name]</b>。")
	if(length(socketed_supportgems))
		var/list/support_gem_names = list()
		for(var/k in socketed_supportgems)
			var/obj/item/I = k
			support_gem_names += I.name
		if(socketed_spellgem)
			. += div("notice","另有辅助宝石：<b>[jointext(support_gem_names,"、")]</b>。")
		else
			. += div("notice","当前镶嵌的辅助宝石：<b>[jointext(support_gem_names,"、")]</b>。")


/obj/item/weapon/ranged/wand/save_item_data(var/mob/living/advanced/player/P,var/save_inventory = TRUE,var/died=FALSE,var/loadout=FALSE)
	RUN_PARENT_SAFE
	SAVEATOM("socketed_spellgem")
	SAVEVAR("sockets")
	SAVELISTATOM("socketed_supportgems")

/obj/item/weapon/ranged/wand/load_item_data_post(var/mob/living/advanced/player/P,var/list/object_data,var/loadout=FALSE)
	RUN_PARENT_SAFE
	LOADATOM("socketed_spellgem")
	LOADVAR("sockets")
	LOADLISTATOM("socketed_supportgems")

/obj/item/weapon/ranged/wand/shoot(var/mob/activator,var/atom/object,location,params,var/damage_multiplier=1,var/click_called=FALSE)
	if(!socketed_spellgem)
		return FALSE
	damage_multiplier *= src.get_quality_mod()
	return socketed_spellgem.shoot(activator,object,location,params,damage_multiplier,click_called)

/obj/item/weapon/ranged/wand/clicked_on_by_object(var/mob/activator,var/atom/object,location,control,params)

	if(is_inventory(object) && activator.attack_flags & CONTROL_MOD_DISARM)

		INTERACT_CHECK

		var/obj/hud/inventory/I = object

		var/list/objects_to_remove = socketed_supportgems + socketed_spellgem + "取消" //+no bitches

		INTERACT_CHECK
		INTERACT_DELAY(5)

		var/desired_removal = input("要取出哪颗宝石？","取出宝石","取消") as null|anything in objects_to_remove
		if(desired_removal == "取消" || !desired_removal)
			activator.to_chat(span("notice","你决定不取出任何宝石。"))
			return TRUE
		var/obj/item/G = desired_removal
		if(G.loc != src)
			activator.to_chat(span("warning","那颗宝石已经不在这里了！"))
			return TRUE
		if(G == socketed_spellgem)
			var/obj/item/weapon/ranged/spellgem/old_spellgem = G
			socketed_spellgem = null
			G.drop_item(get_turf(activator))
			I.add_object(G)
			activator.to_chat(span("notice","你从[src.name]中取出了[G.name]。"))
			update_sprite()
			old_spellgem.update_attachment_stats()
			return TRUE
		socketed_supportgems -= G
		G.drop_item(get_turf(activator))
		I.add_object(G)
		activator.to_chat(span("notice","你从[src.name]中取出了[G.name]。"))
		update_sprite()
		socketed_spellgem?.update_attachment_stats()
		return TRUE

	if(istype(object,/obj/item/weapon/ranged/spellgem/))
		INTERACT_CHECK
		INTERACT_DELAY(5)
		var/obj/item/weapon/ranged/spellgem/SG = object
		var/obj/hud/inventory/I //Hacky, but it werks.
		if(socketed_spellgem)
			I = SG.loc
			socketed_spellgem.drop_item(get_turf(src))
			socketed_spellgem.update_attachment_stats()
		if(I)
			I.add_object(socketed_spellgem)
			activator.to_chat(span("notice","你将[socketed_spellgem.name]换成了[SG.name]。"))
		else
			activator.to_chat(span("notice","你将[SG.name]镶入了[src.name]。"))
		socketed_spellgem = SG
		SG.drop_item(src)
		update_sprite()
		SG.update_attachment_stats()
		return TRUE

	if(istype(object,/obj/item/supportgem))
		INTERACT_CHECK
		INTERACT_DELAY(5)
		var/obj/item/supportgem/G = object
		if(length(socketed_supportgems) >= sockets)
			activator.to_chat(span("warning","没有足够的宝石槽来镶嵌[G.name]！"))
			return TRUE
		socketed_supportgems += G
		G.drop_item(src)
		activator.to_chat(span("notice","你将[G.name]镶入了[src.name]。"))
		update_sprite()
		socketed_spellgem?.update_attachment_stats()
		return TRUE



	. = ..()

/obj/item/weapon/ranged/wand/branch
	name = "树枝魔杖"
	icon = 'icons/obj/item/weapons/ranged/magic/wand/branch.dmi'

	wand_damage_multiplier = 1

	tier = 1

	value = 100

/obj/item/weapon/ranged/wand/crafted
	name = "手工魔杖"
	icon = 'icons/obj/item/weapons/ranged/magic/wand/crafted.dmi'

	wand_damage_multiplier = 1.1

	tier = 2

	value = 100

/obj/item/weapon/ranged/wand/quartz
	name = "石英魔杖"
	icon = 'icons/obj/item/weapons/ranged/magic/wand/quartz.dmi'

	wand_damage_multiplier = 1.2

	tier = 2

	value = 100

/obj/item/weapon/ranged/wand/twisted
	name = "扭曲魔杖"
	icon = 'icons/obj/item/weapons/ranged/magic/wand/twisted.dmi'

	wand_damage_multiplier = 1.3

	tier = 3


	value = 100

/obj/item/weapon/ranged/wand/profane
	name = "亵渎魔杖"
	icon = 'icons/obj/item/weapons/ranged/magic/wand/profane.dmi'

	wand_damage_multiplier = 1.4

	tier = 3

	value = 100

/obj/item/weapon/ranged/wand/sage
	name = "贤者魔杖"
	icon = 'icons/obj/item/weapons/ranged/magic/wand/sage.dmi'

	wand_damage_multiplier = 1.5

	tier = 3

	value = 100
