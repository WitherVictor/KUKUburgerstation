#define OVERDOSE_THRESHOLD_MEDICINE 30

/reagent/medicine/
	overdose_threshold = OVERDOSE_THRESHOLD_MEDICINE
	value = 1

	var/experience_per_unit = 0 //Medical XP per unit added.

	flags_flavor = FLAG_FLAVOR_MEDICINE

	blood_toxicity_multiplier = 1

/reagent/medicine/on_add_living(var/mob/living/L,var/reagent_container/container,var/amount_added=0,var/current_volume=0,var/mob/living/activator)

	. = ..()

	if(!L.dead && experience_per_unit*. > 0 && is_player(activator) && activator.client)
		activator.add_skill_xp(SKILL_MEDICINE,CEILING(experience_per_unit*.,1))

/reagent/medicine/on_overdose(var/mob/living/owner,var/reagent_container/container,var/metabolism_amount=0,var/starting_volume=0,var/multiplier=1)

	. = ..()

	if(owner)
		owner.tox_regen_buffer -= metabolism_amount //Deal tox damage.

/reagent/medicine/adrenaline
	name = "肾上腺素"
	desc = "加快心率。"
	color = "#880000"
	alpha = 225
	flavor = "纯粹的速度"
	metabolism_stomach = 5/60 // Lasts a minute per 5u
	metabolism_blood = 10/60 // Lasts a minute per 10u
	var/strength = 100

	experience_per_unit = 1

	value = 1

	particle_size = 0.5

	overdose_threshold = 20

	flags_metabolism = REAGENT_METABOLISM_STOMACH | REAGENT_METABOLISM_BLOOD

/reagent/medicine/adrenaline/on_add_living(var/mob/living/L,var/reagent_container/container,var/amount_added=0,var/current_volume=0)

	. = ..()

	if((container.flags_metabolism & (REAGENT_METABOLISM_BLOOD | REAGENT_METABOLISM_STOMACH)) && STATUS_EFFECT_MAGNITUDE(L,ADRENALINE) <= strength)
		L.add_status_effect(ADRENALINE,strength,-1)

/reagent/medicine/adrenaline/on_remove_living(var/mob/living/L,var/reagent_container/container)

	. = ..()

	if((container.flags_metabolism & (REAGENT_METABOLISM_BLOOD | REAGENT_METABOLISM_STOMACH)) && STATUS_EFFECT_MAGNITUDE(L,ADRENALINE) <= strength)
		L.remove_status_effect(ADRENALINE)

/reagent/medicine/adrenaline/epinephrine
	name = "急救肾上腺素"
	desc = "用于复苏濒死患者。"
	desc_extended = ""
	color = "#FFFFFF"
	alpha = 225
	flavor = "创可贴"
	strength = 50

	value = 0.75

	particle_size = 0.25

	flags_metabolism = REAGENT_METABOLISM_STOMACH | REAGENT_METABOLISM_BLOOD

/reagent/medicine/adrenaline/epinephrine/on_add_living(var/mob/living/L,var/reagent_container/container,var/amount_added=0,var/current_volume=0)

	. = ..()

	if(. + current_volume >= 10 && L.dead && (container.flags_metabolism & (REAGENT_METABOLISM_BLOOD | REAGENT_METABOLISM_STOMACH)))
		if(!L.check_death() && L.is_player_controlled() && !L.suicide)
			L.revive()
			L.visible_message(span("danger","[L.name]猛地恢复了生机！"))
		else
			L.visible_message(span("warning","[L.name]抽搐了一下，又瘫软了下去……"))

/reagent/medicine/health_potion
	name = "治疗药水"
	desc = "治疗物理和灼烧伤害，代谢迅速。"
	desc_extended = "口服效果同样好。"
	color = "#FF0000"
	alpha = 255

	flavor = "樱桃"

	metabolism_blood = 5
	metabolism_stomach = 5

	experience_per_unit = 3

	value = 1.25

	particle_size = 0.4

	flags_metabolism = REAGENT_METABOLISM_STOMACH | REAGENT_METABOLISM_BLOOD

/reagent/medicine/health_potion/on_metabolize_blood(var/mob/living/owner,var/reagent_container/container,var/amount_to_metabolize=0,var/starting_volume=0,var/multiplier=1)
	. = ..()
	owner.brute_regen_buffer += 2*.*multiplier
	owner.burn_regen_buffer += 2*.*multiplier
	owner.tox_regen_buffer += 2*.*multiplier

/reagent/medicine/health_potion/on_metabolize_stomach(var/mob/living/owner,var/reagent_container/container,var/amount_to_metabolize=0,var/starting_volume=0,var/multiplier=1)
	. = ..()
	owner.brute_regen_buffer += 3*.*multiplier
	owner.burn_regen_buffer += 3*.*multiplier
	owner.tox_regen_buffer += 3*.*multiplier

/reagent/medicine/stamina_potion
	name = "体力药水"
	desc = "恢复你的体力。真神奇！"
	desc_extended = "口服效果更好。"
	color = "#00FF00"
	alpha = 255

	flavor = "青柠"

	metabolism_blood = 5
	metabolism_stomach = 5

	experience_per_unit = 2

	value = 1

	particle_size = 0.5

	flags_metabolism = REAGENT_METABOLISM_STOMACH | REAGENT_METABOLISM_BLOOD

/reagent/medicine/stamina_potion/on_metabolize_blood(var/mob/living/owner,var/reagent_container/container,var/amount_to_metabolize=0,var/starting_volume=0,var/multiplier=1)
	. = ..()

	if(owner && owner.health)
		owner.stamina_regen_buffer += .*2*multiplier

/reagent/medicine/stamina_potion/on_metabolize_stomach(var/mob/living/owner,var/reagent_container/container,var/amount_to_metabolize=0,var/starting_volume=0,var/multiplier=1)
	. = ..()

	if(owner && owner.health)
		owner.stamina_regen_buffer += .*3*multiplier

/reagent/medicine/mana_potion
	name = "法力药水"
	desc = "恢复你的法力。太神奇了！"
	desc_extended = "口服效果更好。"
	color = "#0000FF"
	alpha = 255

	flavor = "蓝莓"

	metabolism_blood = 5
	metabolism_stomach = 5

	experience_per_unit = 2

	value = 1

	particle_size = 0.3

	flags_metabolism = REAGENT_METABOLISM_STOMACH | REAGENT_METABOLISM_BLOOD

/reagent/medicine/mana_potion/on_metabolize_blood(var/mob/living/owner,var/reagent_container/container,var/amount_to_metabolize=0,var/starting_volume=0,var/multiplier=1)
	. = ..()

	if(owner && owner.health)
		owner.mana_regen_buffer += .*2*multiplier

/reagent/medicine/mana_potion/on_metabolize_stomach(var/mob/living/owner,var/reagent_container/container,var/amount_to_metabolize=0,var/starting_volume=0,var/multiplier=1)
	. = ..()

	if(owner && owner.health)
		owner.mana_regen_buffer += .*3*multiplier

/reagent/medicine/antihol
	name = "解酒剂"
	desc = "快速清除体内的酒精。"
	desc_extended = "口服效果同样好。"
	alpha = 225

	color = "#999999"

	flavor = "苦草"

	metabolism_blood = 5
	metabolism_stomach = 1

	experience_per_unit = 2

	value = 1.25

	particle_size = 0.6

	flags_metabolism = REAGENT_METABOLISM_STOMACH | REAGENT_METABOLISM_BLOOD

/reagent/medicine/antihol/on_metabolize_blood(var/mob/living/owner,var/reagent_container/container,var/amount_to_metabolize=0,var/starting_volume=0,var/multiplier=1)

	. = ..()

	if(owner.health)
		if(owner.health.organic)
			owner.intoxication = max(0,owner.intoxication - .*10*multiplier)
		else
			owner.intoxication = owner.intoxication + .*10*multiplier

	for(var/reagent_id in container.stored_reagents)
		var/reagent/R = REAGENT(reagent_id)
		if(istype(R,/reagent/nutrition/ethanol))
			container.add_reagent(reagent_id,-.*3*multiplier)

/reagent/medicine/antihol/on_metabolize_stomach(var/mob/living/owner,var/reagent_container/container,var/amount_to_metabolize=0,var/starting_volume=0,var/multiplier=1)

	. = ..()

	if(owner.health)
		if(owner.health.organic)
			owner.intoxication = max(0,owner.intoxication - .*10*multiplier)
		else
			owner.intoxication = owner.intoxication + .*10*multiplier

	for(var/reagent_id in container.stored_reagents)
		var/reagent/R = REAGENT(reagent_id)
		if(istype(R,/reagent/nutrition/ethanol))
			container.add_reagent(reagent_id,-.*3*multiplier)

/reagent/medicine/purge
	name = "甘汞"
	desc = "快速清除体内的各种化学物质，但会造成与清除量相关的毒素伤害。注射效果更好。"
	color = "#315F77"
	alpha = 225
	flavor = "旧鞋"

	value = 2

	experience_per_unit = 2

	var/list/purge_blacklist = list()

	particle_size = 0.8

	flags_metabolism = REAGENT_METABOLISM_STOMACH | REAGENT_METABOLISM_BLOOD

/reagent/medicine/purge/on_metabolize_blood(var/mob/living/owner,var/reagent_container/container,var/amount_to_metabolize=0,var/starting_volume=0,var/multiplier=1)

	. = ..()

	for(var/reagent_id in container.stored_reagents)
		if(purge_blacklist[reagent_id])
			continue
		var/reagent/R = REAGENT(reagent_id)
		if(R.type == src.type)
			continue
		owner.tox_regen_buffer += container.add_reagent(reagent_id,-.*4*multiplier)

/reagent/medicine/purge/on_metabolize_stomach(var/mob/living/owner,var/reagent_container/container,var/amount_to_metabolize=0,var/starting_volume=0,var/multiplier=1)

	. = ..()

	for(var/reagent_id in container.stored_reagents)
		if(purge_blacklist[reagent_id])
			continue
		var/reagent/R = REAGENT(reagent_id)
		if(R.type == src.type)
			continue
		owner.tox_regen_buffer += container.add_reagent(reagent_id,-.*4*multiplier)

/reagent/medicine/charcoal
	name = "活性炭"
	desc = "清除体内毒物，并治疗少量毒素伤害。口服效果同样好。"
	color = "#404040"
	alpha = 255
	flavor = "旧鞋"

	var/list/purge_blacklist = list()

	experience_per_unit = 2

	value = 1.5

	particle_size = 1

	flags_metabolism = REAGENT_METABOLISM_STOMACH | REAGENT_METABOLISM_BLOOD

/reagent/medicine/charcoal/on_metabolize_blood(var/mob/living/owner,var/reagent_container/container,var/amount_to_metabolize=0,var/starting_volume=0,var/multiplier=1)

	. = ..()

	for(var/reagent_id in container.stored_reagents)
		if(purge_blacklist[reagent_id])
			continue
		var/reagent/R = REAGENT(reagent_id)
		if(!R.lethal)
			continue
		container.add_reagent(reagent_id,-.)
		owner.tox_regen_buffer += 3*.*multiplier

/reagent/medicine/charcoal/on_metabolize_stomach(var/mob/living/owner,var/reagent_container/container,var/amount_to_metabolize=0,var/starting_volume=0,var/multiplier=1)

	. = ..()

	for(var/reagent_id in container.stored_reagents)
		if(purge_blacklist[reagent_id])
			continue
		var/reagent/R = REAGENT(reagent_id)
		if(!R.lethal)
			continue
		container.add_reagent(reagent_id,-.*2*multiplier)
		owner.tox_regen_buffer += 2*.*multiplier


/reagent/medicine/mitogen
	name = "促生剂"
	desc = "使用者伤势越重效果越好的神奇药物，代价是一些毒素伤害。代谢迅速。"
	color = "#9400D3"
	alpha = 200

	flavor = "脂肪"

	metabolism_blood = 2
	metabolism_stomach = 0.2
	experience_per_unit = 4.5

	value = 0.75

	liquid = 0.5

	particle_size = 0.6

	flags_metabolism = REAGENT_METABOLISM_STOMACH | REAGENT_METABOLISM_BLOOD

/reagent/medicine/mitogen/on_metabolize_blood(var/mob/living/owner,var/reagent_container/container,var/amount_to_metabolize=0,var/starting_volume=0,var/multiplier=1)

	. = ..()

	if(owner.health)
		owner.brute_regen_buffer += 10*.*clamp(1 - owner.health.health_current/owner.health.health_max,0,1)*multiplier
		owner.tox_regen_buffer -= 0.1*.*multiplier

/reagent/medicine/mitogen/on_metabolize_stomach(var/mob/living/owner,var/reagent_container/container,var/amount_to_metabolize=0,var/starting_volume=0,var/multiplier=1)

	. = ..()

	if(owner.health)
		owner.brute_regen_buffer += 8*.*clamp(1 - owner.health.health_current/owner.health.health_max,0,1)*multiplier
		owner.tox_regen_buffer -= 0.1*.*multiplier



/reagent/medicine/nicotine
	name = "尼古丁"
	desc = "极易成瘾的杀虫剂，常见于虫无踪和太空香烟等日用品。"
	color = "#E2E2E2"
	alpha = 255
	flavor = "尼古丁"

	metabolism_stomach = 2/60 // Lasts a minute per 2u
	metabolism_blood = 2/60 // Lasts a minute per 2u
	metabolism_skin = 2/60 // Lasts a minute per 2u

	experience_per_unit = 0

	value = 1

	addiction_strength = 0.1
	addiction_threshold = 5
	addiction = /addiction/nicotine

	lethal = TRUE //For now...

	particle_size = 0.4

	flags_metabolism = REAGENT_METABOLISM_STOMACH | REAGENT_METABOLISM_BLOOD | REAGENT_METABOLISM_SKIN

/reagent/medicine/synthblood
	name = "合成血液"
	desc = "一种特殊合成血液，注射后可适配任何有机生物的血型。通常比直接使用真实血液更贵，不过也有一些化学用途。"
	color = "#D50052"
	alpha = 225
	flavor = "熔化的蜡泥"
	value = 2

	experience_per_unit = 2

	liquid = 0.25

	particle_size = 0.1

	flags_metabolism = REAGENT_METABOLISM_BLOOD

/reagent/medicine/synthblood/on_metabolize_blood(var/mob/living/owner,var/reagent_container/container,var/amount_to_metabolize=0,var/starting_volume=0,var/multiplier=1)
	. = ..()
	if(owner.blood_type && owner.health.organic)
		owner.blood_volume += .*0.75*multiplier

/reagent/medicine/rad_b_gone
	name = "辐无踪"
	desc = "由抗辐射药物组成的特殊混合剂，适用于受到严重辐照时。仅可注射。"
	color = "#BA7C00"
	alpha = 225
	flavor = "黏糊糊的脏东西"
	value = 0.75

	experience_per_unit = 1

	liquid = 0.5
	particle_size = 0.2

	overdose_threshold = 150

	flags_metabolism = REAGENT_METABOLISM_BLOOD

/reagent/medicine/rad_b_gone/on_metabolize_blood(var/mob/living/owner,var/reagent_container/container,var/amount_to_metabolize=0,var/starting_volume=0,var/multiplier=1)
	. = ..()
	owner.rad_regen_buffer += .*2*multiplier


/reagent/medicine/potassium_iodide
	name = "碘化钾"
	desc = "常见且便宜的药物，可防止持续辐射进一步造成伤害，但无法治愈已有伤害。"
	color = "#FFF4EC"
	alpha = 255
	flavor = "咸香蕉"
	value = 0.1

	metabolism_blood = 0.5
	metabolism_stomach = 0.5

	experience_per_unit = 0.5

	liquid = -0.5
	particle_size = 0.4

	flags_metabolism = REAGENT_METABOLISM_BLOOD

/reagent/medicine/potassium_iodide/on_metabolize_blood(var/mob/living/owner,var/reagent_container/container,var/amount_to_metabolize=0,var/starting_volume=0,var/multiplier=1)
	. = ..()
	if(owner.rad_regen_buffer < 0)
		owner.rad_regen_buffer = min(0,owner.rad_regen_buffer + 3*.*multiplier)

/reagent/medicine/space_prussian_blue
	name = "太空普鲁士蓝"
	desc = "一种较少见但价格低廉的颜料，既是优秀的染料，也能有效治疗摄入放射性物质造成的辐射中毒。仅口服时有效。"
	color = "#1D2A60"
	alpha = 255
	flavor = "咸香蕉"
	value = 1.3

	metabolism_blood = 0.5
	metabolism_stomach = 0.5

	experience_per_unit = 0.5

	liquid = -0.2
	particle_size = 0.5

	flags_metabolism = REAGENT_METABOLISM_STOMACH


/reagent/medicine/space_prussian_blue/on_metabolize_stomach(var/mob/living/owner,var/reagent_container/container,var/amount_to_metabolize=0,var/starting_volume=0,var/multiplier=1)

	. = ..()

	for(var/reagent_id in container.stored_reagents)
		var/reagent/R = REAGENT(reagent_id)
		if(!istype(R,/reagent/radioactive/))
			continue
		container.add_reagent(reagent_id,-.*10*multiplier)
