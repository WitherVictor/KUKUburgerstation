/obj/item/fishing/rod
	name = "鱼竿"
	desc = "用它钓鱼！"
	desc_extended = "普通鱼竿，可在有鱼获的水域钓鱼。使用前需要装好浮漂、鱼线和适合该水域的鱼饵。"

	icon = 'icons/obj/item/fishing/rod.dmi'
	icon_state = "inventory"

	drop_sound = 'sound/items/drop/scrap.ogg'

	size = SIZE_3
	can_rename = TRUE

	weight = 5

	var/obj/item/fishing/lure/lure
	var/obj/item/fishing/line/line
	var/obj/item/fishing/bait/bait

	var/obj/effect/fishing_bob/fishing_bob
	var/obj/effect/alert/exclaim/fishing_alert

	var/turf/simulated/liquid/fishing_turf

	var/mob/last_activator

	var/snagged_fish
	var/catch_time

	var/next_tick = 0
	var/nospam
	var/compact = FALSE

	value = 200

	rarity = RARITY_UNCOMMON

/obj/item/fishing/rod/PreDestroy()
	QDEL_NULL(lure)
	QDEL_NULL(line)
	QDEL_NULL(bait)

	QDEL_NULL(fishing_bob)
	QDEL_NULL(fishing_alert)

	. = ..()


/obj/item/fishing/rod/Destroy()
	. = ..()
	fishing_turf = null
	last_activator = null



/obj/item/fishing/rod/save_item_data(var/mob/living/advanced/player/P,var/save_inventory = TRUE,var/died=FALSE,var/loadout=FALSE)
	RUN_PARENT_SAFE
	SAVEATOM("lure")
	SAVEATOM("line")
	SAVEATOM("bait")

/obj/item/fishing/rod/load_item_data_pre(var/mob/living/advanced/player/P,var/list/object_data,var/loadout=FALSE)
	RUN_PARENT_SAFE
	LOADATOM("lure")
	LOADATOM("line")
	LOADATOM("bait")

/obj/item/fishing/rod/get_value()
	. = ..()
	if(line) . += line.get_value()
	if(lure) . += lure.get_value()
	if(bait) . += bait.get_value()

/obj/item/fishing/rod/update_overlays()
	. = ..()
	if(line && !compact)
		var/obj/item/fishing/line/L = line
		var/image/I = new/image('icons/obj/item/fishing/rod.dmi',"string")
		I.color = L.color
		add_overlay(I)

/obj/item/fishing/rod/clicked_on_by_object(var/mob/activator,var/atom/object,location,control,params)

	if(fishing_turf) //Don't do anything while fishing.
		return ..()



	if(is_inventory(object))
		var/mob/living/advanced/C = activator
		var/obj/item/object_removed
		if(bait)
			object_removed = bait
			bait = null
		else if(lure)
			object_removed = lure
			lure = null
		else if(line)
			object_removed = line
			line = null
			update_sprite()
		if(!object_removed)
			activator.to_chat(span("notice","[src.name]上没有可取下的配件。"))
			return TRUE
		activator.to_chat(span("notice","你取下了[object_removed.name]。"))
		object_removed.drop_item(get_turf(src))
		C.put_in_hands(object_removed,params)
		return TRUE

	if(is_item(object))
		if(istype(object,/obj/item/fishing/line/))
			var/obj/item/fishing/line/P = object
			if(line)
				activator.to_chat(span("notice","你将[line.name]换成了[P.name]。"))
				line.drop_item(get_turf(activator))
				line = null
			else
				activator.to_chat(span("notice","你将[P.name]装到了[src.name]上。"))

			line = P
			P.drop_item(src)
			update_sprite()
			return TRUE

		if(istype(object,/obj/item/fishing/lure/))
			var/obj/item/fishing/lure/P = object
			if(lure)
				activator.to_chat(span("notice","你将[lure.name]换成了[P.name]。"))
				lure.drop_item(get_turf(activator))
				lure = null
			else
				activator.to_chat(span("notice","你将[P.name]装到了[src.name]上。"))

			lure = P
			P.drop_item(src)
			return TRUE

		if(istype(object,/obj/item/fishing/bait/))
			var/obj/item/fishing/bait/P = object
			if(bait)
				activator.to_chat(span("notice","你将[bait.name]换成了[P.name]。"))
				bait.drop_item(get_turf(activator))
				bait = null
			else
				activator.to_chat(span("notice","你将[P.name]挂到了[src.name]上。"))

			bait = P
			P.drop_item(src)
			return TRUE

	return ..()

/obj/item/fishing/rod/think()

	if(next_tick <= world.time)
		next_tick = world.time + SECONDS_TO_DECISECONDS(1)
		if(snagged_fish)
			var/time_since_snag = world.time - catch_time
			if(!is_inventory(src.loc) || time_since_snag >= snagged_fish) //Too slow...
				snagged_fish = null
				if(line.break_on_failure > 0 && rand(0,100) <= line.break_on_failure) //Bad line.
					last_activator?.to_chat(span("danger","太慢了……你的[line.name]断了，[bait.name]和[lure.name]也丢了！"))
					QDEL_NULL(line)
					QDEL_NULL(bait)
					QDEL_NULL(lure)
					QDEL_NULL(fishing_bob)
					QDEL_NULL(fishing_alert)
					update_sprite()
					fishing_turf = null
					return FALSE

				if(!bait.nice_bait) //Fish stole your bait!
					last_activator?.to_chat(span("warning","太慢了……鱼偷走了你的[bait.name]！"))
					snagged_fish = null
					fishing_turf = null
					QDEL_NULL(fishing_bob)
					QDEL_NULL(fishing_alert)
					bait.add_item_count(-1)
					if(bait.qdeleting)
						bait = null
					return FALSE

				last_activator?.to_chat(span("warning","太慢了……鱼跑掉了……"))
				snagged_fish = null

		else if(fishing_turf)
			if(!is_inventory(src.loc))
				fishing_turf = null
				last_activator = null
				QDEL_NULL(fishing_bob)
			else if(prob(5 + lure.chance_bonus) && nospam <= world.time)
				fishing_alert = new(fishing_turf)
				snagged_fish = rand(5,20) + lure.time_bonus
				catch_time = world.time
				if(lure.catchsound)
					play_sound(lure.catchsound,get_turf(lure),range_min=VIEW_RANGE*0.5,range_max=VIEW_RANGE)
				animate(fishing_bob,pixel_y=-10,pixel_x=rand(-4,4),time=5)
				animate(fishing_bob,pixel_y=0,pixel_x=rand(-2,2),time=10)


	return ..()


/obj/item/fishing/rod/click_on_object(var/mob/activator as mob,var/atom/object,location,control,params)


	INTERACT_CHECK

	if(object.plane >= PLANE_HUD)
		return ..()

	if(fishing_turf)
		if(snagged_fish) //Caught something!
			var/mob/living/C = activator
			var/turf/T = get_step(C,C.dir)
			if(!is_floor(T))
				T = get_turf(C)
			var/score_add = (20/snagged_fish)
			var/score_mul = 1.5 - ((world.time - catch_time)/snagged_fish)
			var/score_total = (score_add + lure.rarity_bonus)*score_mul

			var/list/spawned_loot = SPAWN_LOOT(fishing_turf.fishing_rewards,T,score_total)

			activator.visible_message(
				span("notice","[activator.name]用[src.name]收线了！"),
				span("notice","你用[src.name]收线了！")
			)

			if(length(spawned_loot))
				var/list/object_names = list()
				for(var/k in spawned_loot)
					var/atom/movable/M = k
					object_names += M.name
				activator.to_chat(span("notice","你钓到了[jointext(object_names,"、")]！"))
			else
				activator.to_chat(span("notice","你什么也没钓到，至少鱼饵还在……"))

			STOP_THINKING(src)
			fishing_turf = null
			nospam = null
			snagged_fish = null
			QDEL_NULL(fishing_bob)
			QDEL_NULL(fishing_alert)
			return TRUE
		else //Reel it in without catching anything.
			STOP_THINKING(src)
			fishing_turf = null
			nospam = null
			QDEL_NULL(fishing_bob)
			activator.visible_message(span("notice","[activator]用[src.name]收线了。"),span("notice","你用[src.name]收线了。"))
			return TRUE

	if(istype(object,/turf/simulated/liquid/))
		if(compact)
			activator.to_chat(span("notice","请先展开鱼竿！"))
			return TRUE
		var/turf/simulated/liquid/H = object
		if(!H.fishing_rewards)
			activator.to_chat(span("warning","这里似乎没有鱼……"))
			return TRUE
		if(!line || !lure || !bait)
			activator.to_chat(span("warning","你需要装好鱼线、浮漂和鱼饵才能使用[src.name]！"))
			return TRUE
		if(H.fishing_rewards != bait.valid_loot_type)
			activator.to_chat(span("warning","这种鱼饵似乎不适合这里……"))
			return TRUE
		if(!line.lavaproof && istype(object,/turf/simulated/liquid/lava))
			activator.to_chat(span("warning","在岩浆中钓鱼需要耐岩浆鱼线！"))
			return TRUE
		INTERACT_CHECK
		INTERACT_DELAY(5)
		fishing_turf = H
		last_activator = activator
		activator.visible_message(span("notice","[activator]用[src.name]向[fishing_turf.name]抛竿了。"),span("notice","你用[src.name]向[fishing_turf.name]抛竿了。"))
		fishing_bob = new(fishing_turf)
		fishing_bob.icon_state = "[lure.bob_icon_state]_out"
		animate(fishing_bob,pixel_x=rand(-10,10),pixel_y=rand(-10,10),time=50)
		nospam = world.time + SECONDS_TO_DECISECONDS(1)
		START_THINKING(src)
		return TRUE

	return ..()

/obj/item/fishing/rod/get_examine_list(var/mob/living/advanced/activator)

	. = ..()

	if(line) . += span("notice","已装鱼线：[line.name]。")
	else . += span("notice","未装鱼线。")
	if(lure) . += span("notice","已装浮漂：[lure.name]。")
	else . += span("notice","未装浮漂。")
	if(bait) . += span("notice","已挂鱼饵：[bait.name]。")
	else . += span("notice","未挂鱼饵。")

/obj/item/fishing/rod/telescopic
	name = "伸缩鱼竿"
	desc = "鲈鱼高手认证！"
	desc_extended = "可收缩的鱼竿，可在有鱼获的水域钓鱼。使用前需要展开，并装好浮漂、鱼线和适合该水域的鱼饵。"
	value = 2000
	icon = 'icons/obj/item/fishing/rodtelescopic.dmi'
	compact = TRUE
	size = SIZE_1

	rarity = RARITY_RARE

/obj/item/fishing/rod/telescopic/click_self(var/mob/activator,location,control,params)
	INTERACT_CHECK
	INTERACT_DELAY(5)
	if(fishing_turf)
		return TRUE
	compact = !compact
	update_sprite()
	play_sound('sound/items/drop/accessory.ogg',get_turf(src),range_max=VIEW_RANGE*0.2)
	return TRUE

/obj/item/fishing/rod/telescopic/save_item_data(var/mob/living/advanced/player/P,var/save_inventory = TRUE,var/died=FALSE,var/loadout=FALSE)
	RUN_PARENT_SAFE
	SAVEVAR("compact")

/obj/item/fishing/rod/telescopic/load_item_data_pre(var/mob/living/advanced/player/P,var/list/object_data,var/loadout=FALSE)
	RUN_PARENT_SAFE
	LOADVAR("compact")

/obj/item/fishing/rod/telescopic/update_icon()

	if(!compact)
		icon_state = "[initial(icon_state)]_out"
		icon_state_held_left = "[initial(icon_state_held_left)]_out"
		icon_state_held_right = "[initial(icon_state_held_right)]_out"
		size = SIZE_3
	else
		icon_state = initial(icon_state)
		icon_state_held_left = initial(icon_state_held_left)
		icon_state_held_right = initial(icon_state_held_right)
		size = SIZE_1
	update_held_icon()

	return ..()
