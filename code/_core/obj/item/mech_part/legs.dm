/obj/item/mech_part/legs

	name = "机甲腿部"
	desc = "踏！"
	desc_extended = "机甲使用的移动组件，装上才能四处行走。"

	var/maximum_support = 100 //How much these legs can support. Does not count towards itself.

/obj/item/mech_part/legs/loader
	name = "装载型机甲腿部"
	icon_state = "loader_legs"

	weight = 30

	maximum_support = 75

	//Arms: 20
	//Legs: 30
	//Body: 40
	//Head: 10

	value = 30 * 20

/obj/item/mech_part/legs/combat
	name = "战斗型机甲腿部"
	icon_state = "combat_legs"

	weight = 30

	maximum_support = 75

	//Arms: 20
	//Legs: 30
	//Body: 40
	//Head: 10

	value = 30 * 20

/obj/item/mech_part/legs/light
	name = "轻型机甲腿部"
	icon_state = "light_legs"

	weight = 20

	maximum_support = 50

	//Arms: 10
	//Legs: 15
	//Body: 20
	//Head: 5

	value = 20*20

/obj/item/mech_part/legs/heavy
	name = "重型机甲腿部"
	icon_state = "heavy_legs"

	weight = 50

	maximum_support = 100

	//Arms: 40
	//Legs: 60
	//Body: 60
	//Head: 20

	value = 50*20

/obj/item/mech_part/legs/tracks
	name = "机甲履带底盘"
	desc = "踏？"
	icon_state = "tracks"

	weight = 60

	maximum_support = 150

	value = 60 * 20

/obj/item/mech_part/legs/spiderlegs
	name = "蛛形机甲腿部"
	icon_state = "spiderlegs"

	weight = 20

	maximum_support = 50

	value = 20 * 20
