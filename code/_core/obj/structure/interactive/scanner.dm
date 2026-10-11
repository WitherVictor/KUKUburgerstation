/obj/structure/interactive/scanner
	name = "全身扫描仪"
	desc = "你。休想。通过。"
	desc_extended = "极其侵犯隐私的全身扫描仪，会神奇地按照内置规则阻止通行。"
	icon = 'icons/obj/structure/scanner.dmi'
	icon_state = "pad"

	density = TRUE

	desired_light_power = 0.25
	desired_light_range = 2
	desired_light_color = "#00FF00"

/obj/structure/interactive/scanner/abnormality
	name = "异常体扫描仪"

/obj/structure/interactive/scanner/abnormality/Cross(atom/movable/O,atom/oldloc)

	if(!istype(O,/obj/structure/interactive/the_curse))
		return FALSE

	return ..()

/obj/structure/interactive/scanner/iff
	name = "\improper 敌我识别全身扫描仪"
	desc = "你。休想。通过。除非满足条件。"
	desc_extended = "极其侵犯隐私的全身扫描仪，会按内置规则阻止通行。这台会拦下没有敌我识别标记的生物。"

/obj/structure/interactive/scanner/iff/Cross(atom/movable/O,atom/oldloc)

	if(is_living(O))
		var/mob/living/L = O
		if(!L.iff_tag)
			L.to_chat(span("warning","屏障挡住了你的去路！"))
			src.do_say("未检测到敌我识别植入体。")
			return FALSE

	if(istype(O,/obj/structure/interactive/crate))
		for(var/mob/living/L in O.contents)
			if(!src.Cross(L,src.loc))
				return FALSE

	return ..()

/obj/structure/interactive/scanner/iff_nanotrasen
	name = "\improper 纳米传讯敌我识别全身扫描仪"
	desc = "你。休想。通过。除非满足条件。"
	desc_extended = "极其侵犯隐私的全身扫描仪，会按内置规则阻止通行。这台会拦下没有纳米传讯敌我识别标记的生物。"

/obj/structure/interactive/scanner/iff_nanotrasen/Cross(atom/movable/O,atom/oldloc)

	if(is_living(O))
		var/mob/living/L = O
		if(!L.iff_tag || L.iff_tag != "NanoTrasen")
			L.to_chat(span("warning","屏障挡住了你的去路！"))
			src.do_say("未检测到敌我识别植入体。")
			return FALSE

	if(istype(O,/obj/structure/interactive/crate))
		for(var/mob/living/L in O.contents)
			if(!src.Cross(L,src.loc))
				return FALSE

	return ..()



/obj/structure/interactive/scanner/iff_reverse
	name = "\improper 反敌我识别全身扫描仪"
	desc = "你。休想。通过。除非满足条件。"
	desc_extended = "极其侵犯隐私的全身扫描仪，会按内置规则阻止通行。这台会拦下带有敌我识别标记的人形生物。"

/obj/structure/interactive/scanner/iff_reverse/Cross/(var/atom/movable/M)

	if(is_advanced(M))
		var/mob/living/advanced/A = M
		if(A.iff_tag)
			A.to_chat(span("warning","屏障挡住了你的去路！"))
			src.do_say("检测到敌我识别植入体。你的雇佣关系尚未结束。")
			return FALSE

	return ..()

/obj/structure/interactive/scanner/living
	name = "门禁安全扫描仪"
	desc = "别堵门！"
	desc_extended = "检测所在格内是否有生物的通用近距扫描仪。"
	icon_state = "door"

	plane = PLANE_MOVABLE

	desired_light_power = 0

/obj/structure/interactive/scanner/living/trigger(var/mob/activator,var/atom/source,var/signal_freq,var/signal_code)

	for(var/mob/living/L in loc.contents)
		source.trigger(L,src,signal_freq,signal_code)
		flick("door_bad",src)
		return FALSE

	flick("door_good",src)

	return TRUE



/obj/structure/interactive/scanner/anti_dead
	name = "\improper 活体扫描仪"
	desc = "你。休想。通过。除非满足条件。"
	desc_extended = "极其侵犯隐私的全身扫描仪，会按内置规则阻止通行。这台只允许尚未死亡的生物通过。"

/obj/structure/interactive/scanner/anti_dead/Cross/(var/atom/movable/M)

	if(!is_living(M))
		return FALSE
	var/mob/living/L = M
	if(L.dead)
		return FALSE

	return ..()


/obj/structure/interactive/scanner/crate_only
	name = "\improper 货箱扫描仪"
	desc = "你。休想。通过。除非满足条件。"
	desc_extended = "极其侵犯隐私的全身扫描仪，会按内置规则阻止通行。这台只允许安全货箱通过。"

/obj/structure/interactive/scanner/crate_only/Cross/(var/atom/movable/M)

	if(!istype(M,/obj/structure/interactive/crate/secure))
		return FALSE

	return ..()



/obj/structure/interactive/scanner/cop
	name = "警察扫描仪"
	desc = "别堵门！"
	desc_extended = "检测阵营身份、只允许太空警察通过的门禁扫描仪。"
	icon_state = "door"

	plane = PLANE_MOVABLE

	desired_light_power = 0

/obj/structure/interactive/scanner/cop/Cross/(var/atom/movable/M)

	if(!is_living(M))
		return FALSE

	var/mob/living/L = M
	if(L.loyalty_tag != "Space Cop")
		return FALSE

	return ..()


/obj/structure/interactive/scanner/rich
	name = "富人扫描仪"
	desc = "穷人走开。"
	desc_extended = "门禁近距扫描仪，阻止持有信用点少于20,000的玩家进入。或者离开……"
	icon_state = "door"

/obj/structure/interactive/scanner/rich/Cross/(var/atom/movable/M)

	if(!is_player(M))
		return FALSE

	var/mob/living/advanced/player/P = M

	if(!P.client || P.currency < 20000)
		P.to_chat(span("warning","你太穷，无法通过富人扫描仪……"))
		return FALSE

	return ..()
