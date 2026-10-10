/mob/living/advanced/proc/get_flavortext()

	var/species/S = SPECIES(species)

	var/strength = get_attribute_level(ATTRIBUTE_STRENGTH)
	var/vitality = get_attribute_level(ATTRIBUTE_VITALITY)
	var/fortitude = get_attribute_level(ATTRIBUTE_FORTITUDE)

	var/intelligence = get_attribute_level(ATTRIBUTE_INTELLIGENCE)
	var/wisdom = get_attribute_level(ATTRIBUTE_WISDOM)
	var/willpower = get_attribute_level(ATTRIBUTE_WILLPOWER)

	var/dexterity = get_attribute_level(ATTRIBUTE_DEXTERITY)
	var/resilience = get_attribute_level(ATTRIBUTE_RESILIENCE)
	var/endurance = get_attribute_level(ATTRIBUTE_ENDURANCE)

	var/weight_muscle = 20 + strength*1.2 + vitality*0.25 - intelligence*0.2 + resilience*0.5
	var/weight_fat = 60 + strength*0.3 - intelligence*0.2 - willpower*0.1 - wisdom*0.1 - dexterity*0.1 - endurance*0.5 + resilience*0.5
	var/weight_total = weight_fat + weight_muscle
	var/height = 140 + strength*0.1 + fortitude*0.2 + vitality*0.05
	var/masculinity = strength*0.75 + endurance*0.25 - intelligence*0.5 - dexterity*0.1 //Negative values are feminine.

	//Sexism and stereotypes ahoy
	if(gender == MALE)
		masculinity += 15
		height += 10
	else
		masculinity -= 25
		weight_fat *= 1.1
		weight_muscle *= 0.9

	if(sex == MALE)
		masculinity += 25
		height += 20
	else
		masculinity -= 45
		weight_fat *= 1.2
		weight_muscle *= 0.8

	var/returning_text = "你看到一名"

	switch(height)
		if(-INFINITY to 130)
			returning_text += "极其矮小"
		if(130 to 150)
			returning_text += "十分矮小"
		if(150 to 170)
			returning_text += "矮小"
		if(170 to 180)
			returning_text += "比较高挑"
		if(180 to 190)
			returning_text += "高挑"
		if(190 to 200)
			returning_text += "十分高挑"
		if(200 to INFINITY)
			returning_text += "极其高大"

	switch(height/weight_total)
		if(-INFINITY to 0.5)
			returning_text += "，却"
		if(0.5 to 1.5)
			returning_text += "，而且"
		if(1.5 to INFINITY)
			returning_text += "，却"

	switch(weight_total)
		if(-INFINITY to 40)
			returning_text += "骨瘦如柴"
		if(40 to 60)
			returning_text += "瘦削"
		if(60 to 80)
			returning_text += "身形轻盈"
		if(80 to 110)
			returning_text += "体格中等"
		if(110 to 130)
			returning_text += "体格壮硕"
		if(130 to INFINITY)
			returning_text += "体格宽厚"

	returning_text += "的[S.name]。"

	return returning_text

