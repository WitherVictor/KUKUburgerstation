/mob/living/advanced/npc/goblin
	name = "地精"
	desc = "自公元前4506年起劫掠聚落。"

	ai = /ai/advanced
	dna = /dna/goblin

	species = "goblin"

	pixel_z = 1

	iff_tag = "Goblin"
	loyalty_tag = "Goblin"

	loadout = /loadout/goblin

	blood_type = /reagent/blood/goblin

	level = 4

/mob/living/advanced/npc/goblin/Initialize()
	. = ..()
	drops_gold = RAND_PRECISE(0.5,1.25) * level * (1/CREDITS_PER_GOLD)

/mob/living/advanced/npc/goblin/warrior
	name = "地精战士"
	loadout = /loadout/goblin/warrior
	health_base = 300
	stamina_base = 200
	mana_base = 100

	level = 16

/mob/living/advanced/npc/goblin/mage
	name = "地精法师"
	loadout = /loadout/goblin/mage
	health_base = 200
	stamina_base = 100
	mana_base = 300

	level = 17

/mob/living/advanced/npc/goblin/mage/wizard_federation
	name = "狂怒地精巫师学徒"
	iff_tag = "Wizard Federation"
	loyalty_tag = "Wizard Federation"

/mob/living/advanced/npc/goblin/archer
	name = "地精弓箭手"
	loadout = /loadout/goblin/archer
	health_base = 200
	stamina_base = 300
	mana_base = 100

	level = 14
