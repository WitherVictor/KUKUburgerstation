/obj/item/mech_part/arms
	name = "机甲臂部"
	desc = "比你的胳膊大。"
	desc_extended = "机甲使用的臂部组件，装上才能持用武器。"

	var/maximum_support = 0 //How much these arms can carry (SIZE LIMIT PER HAND)
	var/maximum_weapons = 1
	var/list/weapon_whitelist = list()


/obj/item/mech_part/arms/loader
	name = "装载型机甲臂部"
	icon_state = "loader_arms"

	weight = 20

	maximum_weapons = 2

	maximum_support = SIZE_4

	value = 400

/obj/item/mech_part/arms/combat
	name = "战斗型机甲臂部"
	icon_state = "combat_arms"

	weight = 20

	maximum_weapons = 2

	maximum_support = SIZE_4

	value = 400

/obj/item/mech_part/arms/light
	name = "轻型机甲臂部"
	icon_state = "light_arms"

	weight = 15

	maximum_weapons = 1

	maximum_support = SIZE_3

	value = 300

/obj/item/mech_part/arms/heavy
	name = "重型机甲臂部"
	icon_state = "heavy_arms"

	weight = 30

	maximum_weapons = 2

	maximum_support = SIZE_8

	value = 600
