/obj/item/powergem
	name = "能量宝石"
	desc = "充满力量的宝石。"
	desc_extended = "用于为魔法武器附加伤害的特殊宝石。用它点击魔法武器即可安装，可用撬棍取出。"


	icon = 'icons/obj/item/powergem.dmi'
	icon_state = "gem1"

	var/damage_type_to_add = ARCANE
	var/damage_to_add = 10

	value = -1
	can_save = FALSE

/obj/item/powergem/save_item_data(var/mob/living/advanced/player/P,var/save_inventory = TRUE,var/died=FALSE,var/loadout=FALSE)
	RUN_PARENT_SAFE
	SAVEVAR("rarity")
	SAVEVAR("icon_state")
	SAVEVAR("damage_type_to_add")
	SAVEVAR("damage_to_add")

/obj/item/powergem/load_item_data_pre(var/mob/living/advanced/player/P,var/list/object_data,var/loadout=FALSE)
	RUN_PARENT_SAFE
	LOADVAR("rarity")
	LOADVAR("icon_state")
	LOADVAR("damage_type_to_add")
	LOADVAR("damage_to_add")

/obj/item/powergem/Generate()

	icon_state = "gem[rand(1,5)]"

	damage_type_to_add = pick(ALL_DAMAGE - list(BLADE,BLUNT,PIERCE))
	rarity = pickweight(
		list(
			RARITY_COMMON = 100,
			RARITY_UNCOMMON = 50,
			RARITY_RARE = 25,
			RARITY_MYTHICAL = 12,
			RARITY_LEGENDARY = 6
		)
	)

	switch(rarity)
		if(RARITY_BROKEN)
			damage_to_add = rand(-20,-10)
		if(RARITY_COMMON)
			damage_to_add = rand(4,8)
		if(RARITY_UNCOMMON)
			damage_to_add = rand(9,14)
		if(RARITY_RARE)
			damage_to_add = rand(15,20)
		if(RARITY_MYTHICAL)
			damage_to_add = rand(21,29)
		if(RARITY_LEGENDARY)
			damage_to_add = rand(30,50)

	return ..()

/obj/item/powergem/get_examine_list(var/mob/examiner)

	. = ..()

	. += span("notice","为攻击附加[damage_to_add]点[get_powergem_damage_name()]伤害。")

/obj/item/powergem/proc/get_powergem_damage_name()
	var/list/damage_display_names = list(LASER = "激光",ARCANE = "奥术",HEAT = "高温",COLD = "寒冷",SHOCK = "电击",ACID = "酸蚀",BOMB = "爆炸",BIO = "生物武器",RAD = "辐射",HOLY = "神圣",DARK = "黑暗",FATIGUE = "疲劳",PAIN = "疼痛",ION = "离子",SANITY = "理智",MENTAL = "精神",BLADE = "切割",BLUNT = "钝击",PIERCE = "穿刺")
	return damage_display_names[damage_type_to_add] ? damage_display_names[damage_type_to_add] : damage_type_to_add


/obj/item/powergem/Finalize()

	var/list/rarity_display_names = list(RARITY_BROKEN = "破损",RARITY_COMMON = "普通",RARITY_UNCOMMON = "少见",RARITY_RARE = "稀有",RARITY_MYTHICAL = "神话",RARITY_LEGENDARY = "传奇")
	var/rarity_display = rarity_display_names[rarity] ? rarity_display_names[rarity] : rarity
	name = "[rarity_display][get_powergem_damage_name()]能量宝石"

	var/damage_to_color = list(
		LASER = COLOR_RED,
		ARCANE = COLOR_PURPLE,
		HEAT = COLOR_ORANGE,
		COLD = COLOR_CYAN,
		SHOCK = COLOR_BLUE,
		ACID = COLOR_GREEN_DARK,
		BOMB = COLOR_BROWN,
		BIO = COLOR_GREEN_LIGHT,
		RAD = COLOR_GREEN,
		HOLY = COLOR_YELLOW,
		DARK = COLOR_BLACK,
		FATIGUE = "#00FF00",
		PAIN = COLOR_WHITE,
		ION = "#0094FF",
		SANITY = COLOR_GREY_DARK
	)

	if(damage_type_to_add) color = damage_to_color[damage_type_to_add]

	var/glow_mod = clamp((damage_to_add/40)*TILE_SIZE*0.5,2,TILE_SIZE*0.5)
	var/glow_color = "#FFFFFF"

	switch(rarity)
		if(RARITY_UNCOMMON)
			glow_color = COLOR_UNCOMMON
		if(RARITY_RARE)
			glow_color = COLOR_RARE
		if(RARITY_MYTHICAL)
			glow_color = COLOR_MYTHICAL
		if(RARITY_LEGENDARY)
			glow_color = COLOR_LEGENDARY

	if(glow_mod > 0 && glow_color != "#FFFFFF")
		filters += filter(type="drop_shadow",x=0,y=0,size=glow_mod,offset=4,color=glow_color)

	// https://www.desmos.com/calculator/6ldvbumkps
	value = 1000 + (max(5,damage_to_add)**2.3)*2

	return ..()

/obj/item/powergem/update_overlays()
	. = ..()
	var/image/I = new(icon,icon_state)
	I.appearance_flags = src.appearance_flags
	I.blend_mode = BLEND_ADD
	I.plane = PLANE_LIGHTING
	add_overlay(I)
