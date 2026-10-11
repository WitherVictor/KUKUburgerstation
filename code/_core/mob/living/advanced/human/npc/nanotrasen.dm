/mob/living/advanced/npc/nanotrasen
	name = "纳米传讯安保人员"
	desc = "不爱听从命令的安保队员。"
	desc_extended = "负责保卫空间站的低阶纳米传讯士兵。"
	ai = /ai/advanced/nanotrasen

	loadout = /loadout/nanotrasen/soldier

	dna = /dna/human

	level = 12

/mob/living/advanced/npc/nanotrasen/recruitable
	name = "纳米传讯安保新兵"
	desc = "居然真的听从命令的安保队员！"
	desc_extended = "负责协助高阶纳米传讯人员执行任务的低阶纳米传讯士兵。"

	dialogue_id = /dialogue/npc/soldier/
	loadout = /loadout/nanotrasen/recruit
	ai = /ai/advanced/nanotrasen

	dna = /dna/human

	level = 8


/mob/living/advanced/npc/nanotrasen/Finalize()
	. = ..()
	src.add_organ(/obj/item/organ/internal/implant/hand/left/iff/nanotrasen)
	src.add_organ(/obj/item/organ/internal/implant/head/loyalty/nanotrasen)


/mob/living/advanced/npc/nanotrasen/hanger_guard //For guarding the station against antags.
	name = "纳米传讯机库守卫"
	loadout = /loadout/nanotrasen/hanger_guard
	level = 40
	ai = /ai/advanced/guarding

/mob/living/advanced/npc/nanotrasen/hanger_guard/get_damage_received_multiplier(var/atom/attacker,var/atom/victim,var/atom/weapon,var/atom/hit_object,var/atom/blamed,var/damagetype/DT)
	return ..() * 0.5



/mob/living/advanced/npc/nanotrasen/hanger_guard/immortal
	name = "纳米传讯抵达区守卫"
	loadout = /loadout/nanotrasen/hanger_guard/approachable
	level = 80
	ai = /ai/advanced/guarding
	anchored = 2

/mob/living/advanced/npc/nanotrasen/hanger_guard/immortal/Finalize()
	. = ..()
	add_status_effect(IMMORTAL)



/mob/living/advanced/npc/nanotrasen/shaft_miner
	name = "矿工"
	desc = "有人没尽到自己的职责。"
	dialogue_id = null
	loadout = /loadout/shaft_miner

	level = 6
