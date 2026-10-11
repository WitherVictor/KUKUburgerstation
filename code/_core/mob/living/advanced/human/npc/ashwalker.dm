/mob/living/advanced/npc/ashwalker
	name = "灰烬行者村民"
	desc = "行走于灰烬之中。"
	desc_extended = "这些双足灰烬行者是纳米传讯雇用的蜥蜴人较为原始的近亲，常在熔岩遍布的地区狩猎，获取肉和皮革。它们敌视同族以外的一切生物。"

	dna = /dna/lizard
	ai = /ai/advanced/ashwalker

	species = "reptile"

	loadout = /loadout/ashwalker/
	loyalty_tag = "Ashwalker"
	iff_tag = "Ashwalker"

	level = 10

/mob/living/advanced/npc/ashwalker/Initialize()
	. = ..()
	drops_gold = RAND_PRECISE(0.5,1.25) * level * (1/CREDITS_PER_GOLD)

/mob/living/advanced/npc/ashwalker/female
	loadout = /loadout/ashwalker/female
	gender = FEMALE

//Hunter
/mob/living/advanced/npc/ashwalker/hunter
	name = "灰烬行者猎人"
	loadout = /loadout/ashwalker/hunter
	level = 20

/mob/living/advanced/npc/ashwalker/hunter/female
	loadout = /loadout/ashwalker/hunter/female
	gender = FEMALE

//Shaman
/mob/living/advanced/npc/ashwalker/shaman
	name = "灰烬行者萨满"
	loadout = /loadout/ashwalker/shaman
	level = 60

/mob/living/advanced/npc/ashwalker/shaman/female
	loadout = /loadout/ashwalker/shaman/female
	gender = FEMALE

//Warrior
/mob/living/advanced/npc/ashwalker/warrior
	name = "灰烬行者战士"
	loadout = /loadout/ashwalker/warrior
	level = 40

/mob/living/advanced/npc/ashwalker/warrior/female
	loadout = /loadout/ashwalker/warrior/female
	gender = FEMALE
