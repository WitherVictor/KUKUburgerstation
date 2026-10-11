#define RESEARCH_SCORES_QUADRANTS "data/server/highscores/quadrants.json"

SUBSYSTEM_DEF(research)
	name = "Research Subsystem"
	desc = "Constrols research."
	priority = SS_ORDER_CONFIG
	var/list/quadrant_high_scores = list(
		list("马库斯·伯格斯",80),
		list("佩德罗·约翰逊",50),
		list("有瑕之钻",100),
		list("巴尔·沙利兹",90),
		list("查德·雷霆巨屌",70),
		list("伊莉亚扎·马尔瓦尼",60),
		list("垃圾·麦垃圾",10)
	)
	var/research_points = 0

/subsystem/research/Initialize()
	var/quadrants_file = rustg_file_read(RESEARCH_SCORES_QUADRANTS)
	if(!quadrants_file)
		log_subsystem(name,"Found no quadrants high score file... creating new one.")
		sort_tim(quadrant_high_scores,/proc/cmp_highscore)
		quadrant_high_scores = quadrant_high_scores.Copy(1,min(length(quadrant_high_scores),5)+1)
		rustg_file_append(json_encode(quadrant_high_scores),RESEARCH_SCORES_QUADRANTS)
	else
		quadrant_high_scores = json_decode(quadrants_file)

	return ..()

/subsystem/research/proc/add_quadrants_score(var/mob/living/advanced/player/P ,var/score)
	quadrant_high_scores.Add(list(list(P.real_name,score)))
	sort_tim(quadrant_high_scores,/proc/cmp_highscore)
	quadrant_high_scores = quadrant_high_scores.Copy(1,min(length(quadrant_high_scores),5))
	rustg_file_write(json_encode(quadrant_high_scores),RESEARCH_SCORES_QUADRANTS)

	var/obj/item/currency/prize_ticket/PT = new(P.loc)
	PT.amount = CEILING(score,1)
	INITIALIZE(PT)
	GENERATE(PT)
	FINALIZE(PT)
	P.put_in_hands(PT)
	P.to_chat(span("notice","街机吐出了[PT.amount]张兑奖券！"))

	return FALSE

/proc/cmp_highscore(var/list/a,var/list/b)
	return b[2] - a[2]
