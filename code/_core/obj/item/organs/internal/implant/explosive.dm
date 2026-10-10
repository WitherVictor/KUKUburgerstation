/obj/item/organ/internal/implant/groin/syndicate_explosive
	name = "爆炸植入体"
	desc = "此处应有高潮笑话。"
	desc_extended = "一种为辛迪加特工设计的特殊植入体，使用者离开作战区域时便会爆炸，用于防止背叛辛迪加或被俘。"
	has_life = TRUE
	var/warnings_left = 5

	value = 0

/obj/item/organ/internal/implant/groin/syndicate_explosive/on_life()

	. = ..()

	if(!is_advanced(loc))
		return .

	var/mob/living/advanced/A = loc
	if(A.dead)
		return .

	var/turf/T = get_turf(src)
	var/area/R = T ? T.loc : null
	if(R && R.area_identifier == "Burgerstation")
		switch(warnings_left)
			if(5)
				A.to_chat(span("danger","[src.name]开始发出不怀好意的哔声！快回任务区域！"))
			if(3)
				A.to_chat(span("danger","你能感觉到[src.name]正在启动微型铀爆炸装药！快回任务区域！"))
			if(2)
				A.to_chat(span("danger","你真的该回任务区域了，否则你的[src.name]就要爆炸了！"))
			if(1)
				A.to_chat(span("danger","大事不妙！你确信[src.name]越来越烫了！立刻回到任务区域！"))
			if(0)
				A.to_chat(span("danger","哦，操——"))
		if(warnings_left <= 0)
			A.health.adjust_loss_smart(brute=100,burn=100)
			explode(T,40,A,src)
			A.smite()
		else
			play_sound('sound/effects/terminal_alert.ogg',T)
			warnings_left--
	else
		warnings_left = initial(warnings_left)

