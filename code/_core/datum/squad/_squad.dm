#define SQUAD_PUBLIC "public"
#define SQUAD_FRIENDS_ONLY "friends"
#define SQUAD_INVITE_ONLY "invite"

#define SQUAD_MEMBERS_MAX 4

/squad/
	var/name = "小队名称"
	var/desc = "小队简介。"
	var/desc_extended = "小队详细说明。"
	var/access = SQUAD_INVITE_ONLY

	var/mob/living/advanced/player/leader = null
	var/list/mob/living/advanced/player/members = list()

	var/never_delete = FALSE

/squad/New(var/desired_loc)

	SSsquad.all_squads += src

	return ..()

/squad/PreDestroy()

	for(var/k in members)
		var/mob/living/advanced/player/P = k
		remove_member(P)

	remove_leader()

	SSsquad.all_squads -= src

	. = ..()



/squad/proc/add_member(var/mob/living/advanced/player/P)

	if(members[P])
		return FALSE

	if(length(members) > SQUAD_MEMBERS_MAX)
		return FALSE

	if(P.current_squad == src)
		return FALSE

	if(P.current_squad)
		P.current_squad.remove_member(P)

	members[P] = TRUE

	P.set_squad(src)

	for(var/k in members)
		var/mob/living/advanced/player/P2 = k
		P2.add_squad_button(P)

	P.to_chat(span("warning","你已加入小队\"[name]\"。"))

	return TRUE

/squad/proc/remove_member(var/mob/living/advanced/player/P)

	if(!members[P])
		return FALSE

	if(P == leader)
		remove_leader()

	P.unset_squad(src)

	members -= P

	P.to_chat(span("warning","你已离开[name]小队。"))

	for(var/k in members)
		var/mob/living/advanced/player/P2 = k
		P2.remove_squad_button(P)

	if(!never_delete && !length(members))
		qdel(src)

	return TRUE

/squad/proc/set_leader(var/mob/living/advanced/player/P)

	if(!members[P])
		return FALSE

	if(leader)

		if(leader == P)
			return FALSE

		remove_leader()

	leader = P

	P.to_chat(span("notice","你现在是[name]小队的队长。"))

	return TRUE

/squad/proc/remove_leader()

	if(!leader)
		return FALSE

	leader.to_chat(span("warning","你不再担任[name]小队的队长。"))

	leader = null

	return TRUE
