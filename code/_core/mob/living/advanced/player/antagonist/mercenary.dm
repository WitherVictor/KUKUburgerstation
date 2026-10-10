var/global/list/possible_merc_loadouts = list(
	/loadout/mercenary/rat,
	/loadout/mercenary/virtual_suit,
	/loadout/mercenary/stealth_suit,
	/loadout/mercenary/olive_drab
)


/mob/living/advanced/player/antagonist/merc
	loadout_to_use = null //Chosen based on the above list

	known_cqc = list(
		/cqc/boss/fast_grab,
		/cqc/boss/grab_slam,
		/cqc/boss/staggering_punch,
		/cqc/boss/stunning_punch,
		/cqc/boss/disarm_theft,
		/cqc/boss/tactical_hug
	)


/mob/living/advanced/player/antagonist/merc/setup_appearance(var/set_default=FALSE)
	. = ..()
	src.add_organ(/obj/item/organ/internal/implant/hand/left/iff/merc)
	src.add_organ(/obj/item/organ/internal/implant/head/loyalty/merc)
	return.

/mob/living/advanced/player/antagonist/merc/prepare()

	loadout_to_use = pick(possible_merc_loadouts)
	possible_merc_loadouts -= loadout_to_use

	. = ..()

	if(length(SStext.first_codenames) && length(SStext.last_codenames))
		var/codename_first = pick(SStext.first_codenames)
		SStext.first_codenames -= codename_first
		var/codename_last = pick(SStext.last_codenames)
		SStext.last_codenames -= codename_last
		name = "[codename_first] [codename_last]"
	else
		name = "普通雇佣兵#[rand(1,90000)]"

	setup_name()

	to_chat(span("danger","你是一名受太阳系政府雇用、训练有素的雇佣兵，任务是以非致命手段向纳米传讯追缴欠税。"))
	to_chat(span("danger","若有队友，请与他们合作，使用富尔顿回收纳米传讯士兵和装备。回收士兵时，对方必须仍然活着并倒在地上。你配有致命和非致命装备，用于自卫。"))
	to_chat(span("danger","<h1>不建议杀害纳米传讯特工，因为这会被视为战争行为。如果我们发现你杀害纳米传讯士兵，就会停用你体内提供伤害抗性的纳米机械。</h1>"))

	do_say("; 我是[name]。让你久等了，嗯？")

/mob/living/advanced/player/antagonist/merc/setup_name() //Don't do anything special as it was already generated.
	return TRUE
