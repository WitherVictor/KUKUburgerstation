/obj/item/clothing/uniform/skirt
	name = "连衣裙"
	desc = "让你看起来像个该死的死宅。"
	icon = 'icons/obj/items/clothing/uniforms/poly_skirt.dmi'

	polymorphic = TRUE

	"primary" = "#FFFFFF"
	"secondary" = "#FFFFFF"
	"tertiary" = "#FFFFFF"

	defense_rating = list(
		BLADE = ARMOR_E,
		BLUNT = ARMOR_E,
		PIERCE = ARMOR_E,
		MAGIC = ARMOR_D,
		COLD = -ARMOR_D,
		HEAT = ARMOR_D
	)

	no_initial_blend = TRUE

	protected_limbs = list(BODY_TORSO,BODY_GROIN,BODY_ARM_LEFT,BODY_ARM_RIGHT)

	value = 10


/obj/item/clothing/uniform/skirt/random/on_spawn()
	"primary" = random_color()
	"secondary" = random_color()
	"tertiary" = random_color()
	return ..()
