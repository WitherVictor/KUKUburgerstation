/mob/living/advanced/npc/syndicate
	name = "辛迪加特工"
	desc = "辛迪加犯罪组织的成员。"
	ai = /ai/advanced/syndicate

	dialogue_id = /dialogue/npc/soldier

	combat_dialogue = /combat_dialogue/syndicate

	dna = /dna/human

	loadout = /loadout/syndicate

	level = 20

/mob/living/advanced/npc/syndicate/Finalize()
	. = ..()
	src.add_organ(/obj/item/organ/internal/implant/hand/left/iff/syndicate)
	src.add_organ(/obj/item/organ/internal/implant/head/loyalty/syndicate)


/mob/living/advanced/npc/syndicate/soldier
	name = "辛迪加士兵"
	loadout = /loadout/syndicate/soldier
	level = 30

/mob/living/advanced/npc/syndicate/shotgunnner
	name = "辛迪加枪手"
	loadout = /loadout/syndicate/shotgunnner
	level = 40

/mob/living/advanced/npc/syndicate/hardsuit
	name = "辛迪加特工"
	loadout = /loadout/syndicate/basic
	level = 60

	health_base = 100
	stamina_base = 100
	mana_base = 100

/mob/living/advanced/npc/syndicate/hardsuit/advanced
	name = "辛迪加资深特工"
	loadout = /loadout/syndicate/advanced
	level = 80

/mob/living/advanced/npc/syndicate/hardsuit/elite
	name = "辛迪加精英特工"
	loadout = /loadout/syndicate/elite
	level = 100

/mob/living/advanced/npc/syndicate/hardsuit/ultra
	name = "辛迪加究极特工"
	level = 120

	loadout = /loadout/syndicate/ultra

/mob/living/advanced/npc/syndicate/ultra/get_damage_received_multiplier(var/atom/attacker,var/atom/victim,var/atom/weapon,var/atom/hit_object,var/atom/blamed,var/damagetype/DT)
	. = ..()
	. *= 0.5

/mob/living/advanced/npc/syndicate/scientist
	name = "辛迪加科学家"

	loadout = /loadout/syndicate/scientist

	level = 20


/mob/living/advanced/npc/syndicate/wizard
	name = "辛迪加施法者"

	loadout = /loadout/syndicate/wizard

	level = 30

/mob/living/advanced/npc/syndicate/stress_test
	name = "stress test"
	ai = /ai/advanced/syndicate/stress_test
