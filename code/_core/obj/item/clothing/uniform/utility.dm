/obj/item/clothing/uniform/utility
	name = "工作制服"
	desc = "简洁利落。"
	desc_extended = "低阶船员穿着的黑色连体服，看起来很酷。"
	icon = 'icons/obj/item/clothing/uniforms/util_gen.dmi'

	item_slot = SLOT_TORSO

	flags_clothing = FLAG_CLOTHING_NOBEAST_FEET

	defense_rating = list(
		BLADE = 20,
		BLUNT = 20,
		PIERCE = 20,
		COLD = 40,
		HEAT = -20
	)

	value = 50

/obj/item/clothing/uniform/utility/engineering
	name = "工程工作制服"
	desc = "3.6伦琴，不算好，也不算糟。"
	desc_extended = "带有工程部门配色标识的黑色连体服，看起来很酷。"
	icon = 'icons/obj/item/clothing/uniforms/util_engi.dmi'

	defense_rating = list(
		BLADE = 10,
		BLUNT = 10,
		PIERCE = 10,
		COLD = 20,
		HEAT = 40,
		RAD = 40
	)

	value = 50

/obj/item/clothing/uniform/utility/medical
	name = "医疗工作制服"
	desc = "嘿嘿，养猴子收器官。"
	desc_extended = "带有医疗部门配色标识的黑色连体服，看起来很酷。"
	icon = 'icons/obj/item/clothing/uniforms/util_med.dmi'

	defense_rating = list(
		BLADE = 10,
		BLUNT = 10,
		PIERCE = 10,
		COLD = 10,
		HEAT = 10,
		RAD = 10,
		BIO = 20
	)

	value = 50

/obj/item/clothing/uniform/utility/science
	name = "科研工作制服"
	desc = "走，去熔岩地带引爆极限威力炸弹！"
	desc_extended = "带有科研部门配色标识的黑色连体服，看起来很酷。"
	icon = 'icons/obj/item/clothing/uniforms/util_sci.dmi'

	defense_rating = list(
		BLADE = 10,
		BLUNT = 10,
		PIERCE = 10,
		COLD = 15,
		HEAT = 15,
		BOMB = 30,
		BIO = 20
	)

	value = 50

/obj/item/clothing/uniform/utility/supply
	name = "物资工作制服"
	desc = "*心怀恶意地订购武器。*"
	desc_extended = "带有物资部门配色标识的黑色连体服，看起来很酷。"
	icon = 'icons/obj/item/clothing/uniforms/util_sup.dmi' //yo

	defense_rating = list(
		BLADE = 20,
		BLUNT = 5,
		PIERCE = 5,
		COLD = 10,
		HEAT = 10,
		BOMB = 10,
		PAIN = 30
	)

	value = 50

/obj/item/clothing/uniform/utility/security
	name = "安保工作制服"
	desc = "救命啊，烂安保在打我！！！"
	desc_extended = "带有安保部门配色标识的黑色连体服，看起来很酷。"
	icon = 'icons/obj/item/clothing/uniforms/util_sec.dmi'

	defense_rating = list(
		BLADE = 25,
		BLUNT = 25,
		PIERCE = 25,
		COLD = 10,
		HEAT = 10,
		BOMB = 20,
		PAIN = 25
	)

	value = 50

/obj/item/clothing/uniform/utility/command
	name = "指挥工作制服"
	desc = "嗯，今天我打算没事就叫穿梭机。"
	desc_extended = "带有指挥部门配色标识的黑色连体服，看起来很酷。"
	icon = 'icons/obj/item/clothing/uniforms/util_cmd.dmi'

	defense_rating = list(
		BLADE = 25,
		BLUNT = 25,
		PIERCE = 25,
		COLD = 10,
		HEAT = 10,
		BOMB = 20,
		PAIN = 25
	)

	value = 50

