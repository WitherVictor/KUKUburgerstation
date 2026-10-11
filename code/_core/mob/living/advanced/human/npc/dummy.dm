/mob/living/advanced/npc/dummy
	name = "练习靶人"
	desc = "这是个假人，笨蛋。"
	desc_extended = "纳米传讯的标准训练假人，用来教新兵开枪，更重要的是教他们如何瞄准。"
	ai = null

	species = "dummy"

	health = /health/mob/living/advanced/dummy

	blood_type = null

	anchored = TRUE

	reagents = null

	level = 1

/mob/living/advanced/npc/dummy/Finalize()
	. = ..()
	add_status_effect(IMMORTAL)
	add_status_effect(DUMMY)

/mob/living/advanced/npc/dummy/add_organ(var/obj/item/organ/O)
	O = new O(src)
	O.health = /health/obj/item/organ/dummy
	return attach_organ(O)

/mob/living/advanced/npc/dummy/get_xp_multiplier()
	return 0.1

/mob/living/advanced/npc/dummy/armor
	name = "披甲练习靶人"
	loadout = /loadout/dummy

/mob/living/advanced/npc/dummy/armor_heavy
	name = "重甲练习靶人"
	loadout = /loadout/dummy/heavy
