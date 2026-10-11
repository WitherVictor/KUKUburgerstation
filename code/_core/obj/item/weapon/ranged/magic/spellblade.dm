/obj/item/weapon/ranged/magic/spellblade/
	name = "法术之刃"
	var/active = FALSE
	var/damagetype/damage_type_on

	override_icon_state = TRUE
	override_icon_state_held = TRUE

/obj/item/weapon/ranged/magic/spellblade/update_icon() //Stolen from energy sword code.

	if(active)
		icon_state = "[initial(icon_state)]_on"
		icon_state_held_left = "[initial(icon_state_held_left)]_on"
		icon_state_held_right = "[initial(icon_state_held_right)]_on"
		dan_icon_state = "[initial(dan_icon_state)]_on"
		dan_icon_state_wielded = "[initial(dan_icon_state_wielded)]_on"
		dan_icon_state_back = "[initial(dan_icon_state_back)]_on"
		damage_type = damage_type_on
	else
		icon_state = initial(icon_state)
		icon_state_held_left = initial(icon_state_held_left)
		icon_state_held_right = initial(icon_state_held_right)
		dan_icon_state = initial(dan_icon_state)
		dan_icon_state_wielded = initial(dan_icon_state_wielded)
		dan_icon_state_back = initial(dan_icon_state_back)
		damage_type = initial(damage_type)

	update_held_icon()

	return ..()


/obj/item/weapon/ranged/magic/spellblade/click_self(var/mob/activator,location,control,params)

	INTERACT_CHECK
	INTERACT_DELAY(1)

	active = !active

	if(active)
		activator.to_chat(span("notice","你激活了[src.name]。"))
	else
		activator.to_chat(span("notice","你关闭了[src.name]。"))

	update_sprite()

	return TRUE

/obj/item/weapon/ranged/magic/spellblade/shoot(var/mob/activator,var/atom/object,location,params,var/damage_multiplier=1,var/click_called=FALSE)

	if(get_dist(activator,object) <= 1)
		return FALSE

	if(!active)
		return FALSE

	. = ..()

	if(.)
		src.attack_next = world.time + shoot_delay


/obj/item/weapon/ranged/magic/spellblade/can_gun_shoot(var/mob/activator,var/atom/object,location,params,var/check_time=TRUE,var/messages=TRUE)
	if(activator.attack_next > world.time)
		return FALSE
	if(!active)
		return FALSE
	return ..()


/obj/item/weapon/ranged/magic/spellblade/runesword
	name = "符文剑"
	desc = "这把剑专为懒得走到别人面前再捅的人打造。"
	desc_extended = "久远年代里由矮人符文工匠锻造的力场剑，能发射强力远程光束。"
	icon = 'icons/obj/item/weapons/ranged/magic/runesword.dmi'
	icon_state = "inventory"

	projectile_speed = TILE_SIZE*0.25 - 1

	projectile = /obj/projectile/magic/blade
	damage_type = /damagetype/melee/sword/spellblade
	damage_type_on = /damagetype/melee/sword/spellblade
	ranged_damage_type = /damagetype/ranged/magic/spellblade

	size = SIZE_4
	weight = 20

	shoot_delay = SECONDS_TO_DECISECONDS(3)

	shoot_sounds = list('sound/weapons/ranged/energy/freeze_gun/shoot1.ogg')

	value = 4000

	value_burgerbux = 1

	rarity = RARITY_RARE

