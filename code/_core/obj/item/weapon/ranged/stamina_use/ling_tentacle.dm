/obj/item/weapon/ranged/stamina_use/tentacle
	name = "触手"

	desc = "救命，维护区！"
	desc_extended = "恶心的触手。<br>在手中使用可切换模式：把自己拉到敌人身边，或把敌人拉到自己身边。"
	icon = 'icons/obj/item/weapons/ranged/ling_tentacle.dmi'

	cost_stamina = 10

	shoot_delay = 15

	projectile = /obj/projectile/bio/tentacle
	ranged_damage_type = /damagetype/ranged/ling_tentacle/warp
	var/alt_ranged_damage_type = /damagetype/ranged/ling_tentacle/pull

	value = 0
	value_burgerbux = 1

	drop_sound = 'sound/items/drop/axe.ogg'

	size = SIZE_4
	weight = 6
	var/toggle = FALSE

	company_type = "Hell"

	can_save = FALSE

/obj/item/weapon/ranged/stamina_use/tentacle/update_icon()

	if(toggle)
		ranged_damage_type = alt_ranged_damage_type

	else
		ranged_damage_type = initial(ranged_damage_type)

	return ..()

/obj/item/weapon/ranged/stamina_use/tentacle/click_self(var/mob/activator,location,control,params)
	INTERACT_CHECK
	INTERACT_DELAY(1)
	toggle = !toggle
	update_icon()
	if(toggle)
		activator.to_chat(span("notice","现在会把敌人拉到你身边。"))
	else
		activator.to_chat(span("notice","现在会把你拉到敌人身边。"))
	return TRUE
