/obj/item/spellswap/magic_missile
	name = "法术替换器™——魔法飞弹"
	desc_extended = "对武器使用，可将发射的子弹替换为魔法飞弹。由炽铅恶魔王子倾情奉上。"
	icon_state = "magic_missile"

	desired_projectile = /obj/projectile/magic/magic_missile
	desired_sound = list('sound/weapons/magic/magic_missile.ogg')
	damage_conversion = list(
		ARCANE = 0.9
	)

	value = 1000

/obj/item/spellswap/chaos
	name = "法术替换器™——混沌球"
	desc_extended = "对武器使用，可将发射的子弹替换为混沌球。由炽铅恶魔王子倾情奉上。"
	icon_state = "chaos"

	desired_projectile = /obj/projectile/magic/chaos
	desired_sound = list('sound/weapons/magic/chaos.ogg')
	damage_conversion = list(
		ARCANE = 0.45,
		DARK = 0.45
	)

	value = 1000

/obj/item/spellswap/fireball
	name = "法术替换器™——火球"
	desc_extended = "对武器使用，可将发射的子弹替换为火球。由炽铅恶魔王子倾情奉上。"
	icon_state = "fireball"

	desired_projectile = /obj/projectile/magic/fireball
	desired_sound = list('sound/weapons/magic/fireball.ogg')

	damage_conversion = list(
		ARCANE = 0.2,
		BOMB = 0.2,
		HEAT = 0.5
	)

	value = 1000

/obj/item/spellswap/flame
	name = "法术替换器™——烈焰"
	desc_extended = "对武器使用，可将发射的子弹替换为火焰弹。由炽铅恶魔王子倾情奉上。"
	icon_state = "flame"

	desired_projectile = /obj/projectile/magic/lesser_fire
	desired_sound = list('sound/weapons/magic/firestream.ogg')

	damage_conversion = list(
		ARCANE = 0.2,
		HEAT = 0.7
	)

	value = 1000

/obj/item/spellswap/frost
	name = "法术替换器™——寒霜"
	desc_extended = "对武器使用，可将发射的子弹替换为寒霜弹。由炽铅恶魔王子倾情奉上。"
	icon_state = "frost"

	desired_projectile = /obj/projectile/magic/frost
	desired_sound = list('sound/weapons/magic/frost.ogg')

	damage_conversion = list(
		ARCANE = 0.2,
		COLD = 0.7
	)

	value = 1000

/obj/item/spellswap/arcblade
	name = "法术替换器™——弧光刃"
	desc_extended = "对武器使用，可将发射的子弹替换为弧光刃。由炽铅恶魔王子倾情奉上。"
	icon_state = "arcblade"

	desired_projectile = /obj/projectile/magic/arcblade
	desired_sound = list('sound/weapons/magic/arc_blade.ogg')

	damage_conversion = list(
		ARCANE = 0.2,
		BLADE = 0.2,
		SHOCK = 0.5
	)

	value = 1000

/obj/item/spellswap/tesla
	name = "法术替换器™——特斯拉"
	desc_extended = "对武器使用，可将发射的子弹替换为特斯拉电球。由炽铅恶魔王子倾情奉上。"
	icon_state = "tesla"

	desired_projectile = /obj/projectile/magic/tesla
	desired_sound = list('sound/weapons/magic/zap.ogg')

	damage_conversion = list(
		ARCANE = 0.2,
		SHOCK = 0.7
	)

	value = 1000

/obj/item/spellswap/negate
	name= "法术替换器™——清除"
	desc_extended = "对武器使用，可将发射的子弹替换为……子弹？"

	desired_projectile = null
	value = 1000
