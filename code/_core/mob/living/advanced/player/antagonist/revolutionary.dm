/mob/living/advanced/player/antagonist/revolutionary
	loadout_to_use = /loadout/rev/player_antagonist/contractor

/mob/living/advanced/player/antagonist/revolutionary/setup_iff()
	. = ..()
	src.add_organ(/obj/item/organ/internal/implant/hand/left/iff/revolutionary)
	src.add_organ(/obj/item/organ/internal/implant/head/loyalty/revolutionary)
	//src.add_organ(/obj/item/organ/internal/implant/groin/syndicate_explosive)
	return.

/mob/living/advanced/player/antagonist/revolutionary/Finalize()
	. = ..()
	to_chat(span("danger","你是一名身手不凡的革命军战士，任务是不惜一切代价破坏并消灭来袭的纳米传讯部队。"))
	to_chat(span("danger","若有队友，请与他们合作。你可以从出生点旁的咚克软件售货机购买装备，基地里也散放着一些额外装备。"))
	//to_chat(span("danger","<h1>An explosive implant was implanted in your head that triggers when you leave the Area of Operations. Avoid getting captured if you can.</h1>"))

/mob/living/advanced/player/antagonist/revolutionary/setup_name()
	. = ..()
	name = "[real_name]同志"
	return TRUE

/mob/living/advanced/player/antagonist/revolutionary/species_initialize(var/set_default=FALSE)
	. = ..()
	known_languages[LANGUAGE_SLAVIC] = TRUE
