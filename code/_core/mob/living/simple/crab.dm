/mob/living/simple/crab
	name = "螃蟹"
	desc = "长官，快看！免费的螃蟹！"
	desc_extended = "一只无害的小动物。至少看起来如此。"
	icon = 'icons/mob/living/simple/crab.dmi'
	icon_state = "crab"
	damage_type = /damagetype/npc/crab


	health_base = 50
	stamina_base = 25
	mana_base = 25

	value = 25

	butcher_contents = list(
		/obj/item/container/edible/dynamic/fish/raw_crab/,
		/obj/item/container/edible/dynamic/fish/raw_crab/
	)

	ai = /ai/

	stun_angle = 180

	armor = /armor/chitin

	size = SIZE_ANIMAL

	movement_delay = DECISECONDS_TO_TICKS(6)

	loyalty_tag = "Crab"
	iff_tag = "Crab"

	blood_type = /reagent/blood/crab
	blood_volume = 200

	level = 3

/mob/living/simple/crab/post_death()
	..()
	icon_state = "[initial(icon_state)]_dead"
	update_sprite()

/mob/living/simple/crab/passive
	ai = /ai/passive/crab
	can_attack_while_moving = FALSE

/mob/living/simple/crab/king
	name = "蟹王"
	desc = "这么大的螃蟹，肯定是某个疯子的杰作。"
	desc_extended = "一只凶猛的蟹王，长着巨大而锋利的蟹钳，厚重的外壳能抵挡魔法和子弹。想敲开这只蟹，恐怕得贴身搏斗。"
	boss_icon_state = "crab_king"
	icon = 'icons/mob/living/simple/crab_king.dmi'
	icon_state = "king"

	health_base = 4000
	stamina_base = 1000
	mana_base = 100

	pixel_y = -8
	pixel_x = -32

	ai = /ai/



	butcher_contents = list(
		/obj/item/container/edible/dynamic/fish/raw_crab/,
		/obj/item/container/edible/dynamic/fish/raw_crab/,
		/obj/item/container/edible/dynamic/fish/raw_crab/,
		/obj/item/container/edible/dynamic/fish/raw_crab/,
		/obj/item/container/edible/dynamic/fish/raw_crab/,
		/obj/item/container/edible/dynamic/fish/raw_crab/,
		/obj/item/container/edible/dynamic/fish/raw_crab/
	)


	object_size = 2

	boss = TRUE
	force_spawn = TRUE
	boss_music = /track/crab_rave

	damage_type = /damagetype/npc/crab_king

	armor = /armor/chitin/heavy

	fatigue_mul = 0

	status_immune = list(
		STUN = TRUE,
		SLEEP = TRUE,
		PARALYZE = TRUE,
		STAMCRIT = TRUE,
		STAGGER = TRUE,
		CONFUSED = TRUE,
		CRIT = TRUE,
		REST = TRUE,
		ADRENALINE = TRUE,
		DISARM = TRUE,
		DRUGGY = TRUE,
		FIRE = TRUE,
		GRAB = TRUE
	)

	enable_medical_hud = FALSE
	enable_security_hud = FALSE

	movement_delay = DECISECONDS_TO_TICKS(3)

	soul_size = SOUL_SIZE_RARE


/mob/living/simple/crab/king/Cross(atom/movable/O)

	if(istype(O,/mob/living/simple/crab/))
		return TRUE

	return ..()
