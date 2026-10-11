/obj/item/magazine/clip/
	name = "武器弹夹"
	desc = "把这些留在战场上，军士长也不会找你麻烦。"
	desc_extended = "装有远程武器弹药，使用时请确认口径匹配。"

/obj/item/magazine/clip/click_on_object(var/mob/activator as mob,var/atom/object,location,control,params)

	if(is_ranged_bullet_weapon(object))
		INTERACT_CHECK
		INTERACT_CHECK_OBJECT
		INTERACT_DELAY(1)
		var/obj/item/weapon/ranged/bullet/G = object
		if(!G.open)
			activator.to_chat(span("warning","需要先打开[G.name]，才能装入[src.name]！"))
			return FALSE
		var/insert_count = 0
		for(var/k in src.stored_bullets)
			var/bullet_count = src.stored_bullets[k]
			for(var/i=1,i<=bullet_count,i++)
				var/obj/item/bullet_cartridge/B = k
				if(!G.can_load_stored(activator,B))
					return TRUE
				var/target_point = get_first_missing_value(G.stored_bullets)
				if(target_point == 0)
					return TRUE
				src.stored_bullets[B] -= 1
				if(src.stored_bullets[B] <= 0)
					src.stored_bullets -= B
				B = new B
				INITIALIZE(B)
				B.amount = 1
				FINALIZE(B)
				G.stored_bullets[target_point] = B
				insert_count += 1
		if(insert_count)
			activator.to_chat(span("notice","你向[object.name]装入了[insert_count]发弹药。"))
			G.update_sprite()
			update_sprite()
			return TRUE
		else
			activator.to_chat(span("warning","无法用[src.name]给[object.name]装填弹药！"))
		return TRUE

	. = ..()

