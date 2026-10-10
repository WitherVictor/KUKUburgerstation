/mob/living/advanced/player/antagonist/wizard
	loadout_to_use = /loadout/wizard_federation
	loyalty_tag = "Wizard Federation"
	iff_tag = "Wizard Federation"

/mob/living/advanced/player/antagonist/wizard/setup_iff()
	return TRUE

/mob/living/advanced/player/antagonist/wizard/Finalize()
	. = ..()
	to_chat(span("danger","向你致意！你是来自巫师联邦的巫师。"))
	to_chat(span("danger","你的任务是捉弄船员，甚至要胜过鸣笛之母。去售货机购买道具，与队友合作，完成史上最伟大的恶作剧！"))

/mob/living/advanced/player/antagonist/wizard/setup_name()
	. = ..()
	name = "全能强大的大巫师小[real_name]"
