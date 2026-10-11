//Here be genetic powders

/power/
	var/name = "Power Name"
	var/desc = "Power Description"
	var/add_message
	var/remove_message

/power/proc/on_add(var/mob/living/owner)
	if(add_message) owner.to_chat(add_message)
	return TRUE


/power/proc/on_remove(var/mob/living/owner)
	if(remove_message) owner.to_chat(remove_message)
	return TRUE

/power/resist/
	var/list/bonus_defense = list()

/power/resist/on_add(var/mob/living/owner)
	owner.defense_bonuses["\ref[src]"] = bonus_defense
	return ..()

/power/resist/on_remove(var/mob/living/owner)
	owner.defense_bonuses -= "\ref[src]"
	return ..()

/power/resist/thick_skin
	name = "Thick Skin"
	desc = "Your skin is now considerably thicker. You still cry when Bambi's mom dies, though."
	add_message = "你感觉皮肤厚实了许多……"
	remove_message = "你感觉皮肤又变薄了。"
	bonus_defense = list(
		BLADE = 25,
		PIERCE = 25
	)

/power/resist/moist_skin
	name = "Moist Skin"
	desc = "Your skin is now considerably moist. Don't forget to drink plenty of water."
	add_message = "你感觉皮肤湿润了许多……"
	remove_message = "你的皮肤又开始干燥了。"
	bonus_defense = list(
		LASER = 25,
		HEAT = 25
	)

/power/resist/magically_mute
	name = "Magic Immune"
	desc = "You're completely immune to magic. As a consequence, magic spells do not work and the natural connection to this world makes leaves you physically vunerable."
	add_message = "你与魔法能量失去了联系……"
	remove_message = "你重新建立了与魔法的联系。"
	bonus_defense = list(
		ARCANE = INFINITY,
		BLADE = -50,
		PIERCE = -50,
		BLUNT = -50
	)

/power/resist/genetically_evil
	name = "Genetically Evil"
	desc = "Looks like evil is a gene. For whatever reason, you're significantly more in touch with the evil side than the good side."
	add_message = "你感觉自己变得邪恶了……"
	remove_message = "你感觉自己又恢复了中立。"
	bonus_defense = list(
		HOLY = -100,
		DARK = 50
	)

/power/resist/genetically_good
	name = "Genetically Good"
	desc = "Looks like goodness is a gene. For whatever reason, you're significantly more in touch with the good side than the evil side."
	add_message = "你感觉自己变得善良了……"
	remove_message = "你感觉自己又恢复了中立。"
	bonus_defense = list(
		HOLY = 50,
		DARK = -100
	)
