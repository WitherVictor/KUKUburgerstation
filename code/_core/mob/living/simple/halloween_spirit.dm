/mob/living/simple/halloween_spirit
	name = "幻影"
	desc = "别想歪了，说的是这个。"
	desc_extended = "极其阴森的幽灵，存在的唯一目的就是咬你的脚踝。"
	icon = 'icons/mob/living/simple/spooky.dmi'
	icon_state = "red"
	damage_type = /damagetype/melee/sword/claymore/cult


	health_base = 50
	stamina_base = 100
	mana_base = 100

	value = 100

	ai = /ai/

	stun_angle = 0

	armor = /armor/default_organic

	size = SIZE_ANIMAL

	movement_delay = DECISECONDS_TO_TICKS(2)

	loyalty_tag = "Ghost"
	iff_tag = "Ghost"

	blood_type = null

	level = 8

/mob/living/simple/halloween_spirit/blue
	icon_state = "blue"
