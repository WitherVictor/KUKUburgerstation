/obj/item/clothing/uniform/miner
	name = "矿工制服"
	desc = "为矿工制作的轻度加固连体服。"
	desc_extended = "这件连体服能抵御恶劣环境，让你去干NT最危险、薪水也最低的工作。"
	icon = 'icons/obj/item/clothing/uniforms/miner.dmi'

	item_slot = SLOT_TORSO | SLOT_GROIN

	flags_clothing = FLAG_CLOTHING_NOBEAST_FEET

	defense_rating = list(
		BLADE = 20,
		BLUNT = 20,
		PIERCE = 20,
		HEAT = 20,
		COLD = 20,
		ARCANE = -20
	)

	value = 100


