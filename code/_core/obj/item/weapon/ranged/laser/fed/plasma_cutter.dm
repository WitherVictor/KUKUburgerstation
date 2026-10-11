/obj/item/weapon/ranged/energy/fed/plasma_cutter
	name = "等离子切割器"
	desc = "喂料充能！"
	desc_extended = "先进采矿工具，利用佛隆产生的等离子体脉冲，最多可穿透4米岩石或其他敌人。对较小物体的效果不太好。"
	icon = 'icons/obj/item/weapons/ranged/laser/plasma_cutter.dmi'

	company_type = "NanoTrasen"

	value = 1400 //One hell of a mining tool go cry in the corner.

	shoot_sounds = list('sound/weapons/ranged/energy/plasma_cutter/shoot.ogg')

	projectile = /obj/projectile/bullet/laser/plasma_cutter
	ranged_damage_type = /damagetype/ranged/laser/plasma_cutter

	charge_per_feed = 100
	fed_item = list(/obj/item/material/ingot,/obj/item/material/ore)
	feed_delay = 5
	shoot_delay = 12

	projectile_speed = TILE_SIZE*0.5

	bullet_color = null

	rarity = RARITY_UNCOMMON

/obj/item/weapon/ranged/energy/fed/plasma_cutter/update_icon()

	. = ..()

	icon_state = initial(icon_state)

	if(get_ammo_count() < 1)
		icon_state = "[icon_state]_empty"
	else
		icon_state = "[icon_state]"
