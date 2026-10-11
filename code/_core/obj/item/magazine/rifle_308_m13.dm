/obj/item/magazine/m13_762
	name = "\improper 7.62mm漏夹"
	desc = "这是弹夹，不是弹匣！"
	desc_extended = "装有远程武器弹药，使用时请确认口径匹配。"
	icon = 'icons/obj/item/magazine/308_clip.dmi'
	icon_state = "bullet"
	bullet_count_max = 8

	weapon_whitelist = list(
		/obj/item/weapon/ranged/bullet/magazine/rifle/m13 = TRUE
	)

	ammo = /obj/item/bullet_cartridge/rifle_308
	ammo_surplus = /obj/item/bullet_cartridge/rifle_308/surplus

	bullet_length_min = 46
	bullet_length_best = 51
	bullet_length_max = 52

	bullet_diameter_min = 7.6
	bullet_diameter_best = 7.62
	bullet_diameter_max = 7.7

	size = SIZE_2

	icon_states = 4

	value = 10


/obj/item/magazine/m13_762/click_on_object(var/mob/activator as mob,var/atom/object,location,control,params)

	if(istype(object,/obj/item/weapon/ranged/bullet/magazine/rifle/m13))
		var/obj/item/weapon/ranged/bullet/magazine/rifle/m13/W = object
		if(W.stored_magazine)
			activator.to_chat(span("notice","[W.name]里已经装有弹夹了！"))
			return TRUE
		src.drop_item(W)
		W.stored_magazine = src
		W.open = FALSE
		play_sound(get_magazine_insert_sound(),get_turf(src),range_max=VIEW_RANGE*0.25)
		W.load_new_bullet_from_magazine(activator)
		W.update_sprite()

		return TRUE

	. = ..()


