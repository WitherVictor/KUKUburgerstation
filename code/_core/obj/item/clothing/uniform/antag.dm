/obj/item/clothing/uniform/antag
	name = "玩家反派制服"
	desc = "糟了，要有人破防了。"
	desc_extended = "反派穿的一套反派制服。"
	icon = 'icons/obj/item/clothing/uniforms/util_gen.dmi'


	item_slot = SLOT_TORSO | SLOT_GROIN

	flags_clothing = FLAG_CLOTHING_NOBEAST_FEET

	defense_rating = list(
		BLADE = 20,
		BLUNT = 20,
		PIERCE = 20,
		COLD = 40,
		HEAT = -20
	)

	value = 50

/obj/item/clothing/uniform/antag/syndicate
	name = "辛迪加作战服"
	desc = "威士忌，回声，威士忌。"
	desc_extended = "辛迪加高级战斗人员穿着的作战服。"
	icon = 'icons/obj/item/clothing/uniforms/syndie_antag.dmi'
	value = 250

/obj/item/clothing/uniform/antag/rev
	name = "革命军作战服"
	desc = "政委说了，我们不准死。"
	desc_extended = "革命军高级战斗人员穿着的斯拉夫风格作战服。"
	icon = 'icons/obj/item/clothing/uniforms/rev_antag.dmi'
	value = 250

/obj/item/clothing/uniform/antag/rev/officer
	name = "革命军军官制服"
	desc = "红色恐怖。"
	desc_extended = "革命军军官穿着的斯拉夫风格制服。"
	icon = 'icons/obj/item/clothing/uniforms/revficer.dmi'
