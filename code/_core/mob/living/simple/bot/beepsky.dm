/mob/living/simple/bot/securitron/captain
	name = "比普斯基船长"
	desc = "他现在是船长了。"
	desc_extended = "一台有名有姓的安保机器人。它按程序用蓝空间电击警棍对付捣乱的乘客，守卫穿梭机。它的电路和轮子都有点松……"
	icon = 'icons/mob/living/simple/beepsky.dmi'
	icon_state = "captain"

	health = null //immortal

	ai = /ai/doorman

	damage_type = /damagetype/npc/captain_beepsky

	iff_tag = "NanoTrasen"
	loyalty_tag = "NanoTrasen"

	size = SIZE_BOSS

	enable_medical_hud = FALSE
	enable_security_hud = FALSE

/mob/living/simple/bot/securitron/captain/can_be_grabbed(var/atom/grabber,var/messages=FALSE)

	if(messages && is_living(grabber))
		var/mob/living/L = grabber
		L.to_chat(span("warning","比普斯基瞬间挣脱了你的抓握！"))

	return FALSE
