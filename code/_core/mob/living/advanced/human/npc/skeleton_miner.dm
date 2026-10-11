/mob/living/advanced/npc/skeleton_miner
	name = "骷髅矿工仆从"
	desc = "累得只剩骨头了。"
	desc_extended = "一具被魔法复生的骷髅，被迫永远在辛迪加的佛隆矿场劳作。"

	species = "skeleton"
	sex = MALE
	gender = MALE
	loadout = /loadout/skeleton_miner


	loyalty_tag = "Syndicate"
	iff_tag = "Syndicate"
	ai = /ai/advanced/skeleton

	level = 12

/mob/living/advanced/npc/skeleton_miner/shovel
	loadout = /loadout/skeleton_miner/shovel

/mob/living/advanced/npc/skeleton_miner/pickaxe
	loadout = /loadout/skeleton_miner/pickaxe

/mob/living/advanced/npc/skeleton_miner/torch
	loadout = /loadout/skeleton_miner/torch
