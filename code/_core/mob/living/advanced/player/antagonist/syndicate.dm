/mob/living/advanced/player/antagonist/syndicate
	loadout_to_use = /loadout/syndicate/player_antagonist

/mob/living/advanced/player/antagonist/syndicate/setup_iff()
	src.add_organ(/obj/item/organ/internal/implant/hand/left/iff/syndicate)
	src.add_organ(/obj/item/organ/internal/implant/head/loyalty/syndicate)
	src.add_organ(/obj/item/organ/internal/implant/groin/syndicate_explosive)
	return.

/mob/living/advanced/player/antagonist/syndicate/Finalize()
	. = ..()
	to_chat(span("danger","你是一名训练有素的辛迪加特工，任务是不惜一切代价破坏并消灭来袭的纳米传讯部队。"))
	to_chat(span("danger","若有队友，请与他们合作。你可以从出生点旁的咚克软件售货机购买装备，基地里也散放着一些额外装备。"))
	to_chat(span("danger","<h1>你的体内装有爆炸植入体，离开任务区域就会引爆。别被俘虏！</h1>"))

/mob/living/advanced/player/antagonist/syndicate/setup_name()
	. = ..()
	name = "特工[real_name]"
	return TRUE


/mob/living/advanced/player/antagonist/syndicate/species_initialize(var/set_default=FALSE)
	. = ..()
	known_languages[LANGUAGE_CODESPEAK] = TRUE
