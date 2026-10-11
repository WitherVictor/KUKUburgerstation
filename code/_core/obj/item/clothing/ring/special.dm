/obj/item/clothing/ring/gold/ring_of_god
	name = "神之戒"
	desc_extended ="神亲手打造的华美神赐戒指，能够增强护甲。"
	armor = /armor/ring/god
	value_burgerbux = 1

/obj/item/clothing/ring/gold/wedding
	name = "婚戒"
	desc_extended = "爱爱。真哒爱爱。"
	armor = /armor/ring/wedding

//Horsemen rings
/obj/item/clothing/ring/horsemen/death
	name = "死亡之戒"
	desc = "我观看，见有一匹灰色马；骑在马上的，名字叫死亡……"
	desc_extended = "天启四骑士之一的戒指。"
	armor = /armor/ring/death

/obj/item/clothing/ring/horsemen/war
	name = "战争之戒"
	desc = "诸神黄昏已降临于你。"
	desc_extended = "天启四骑士之一的戒指。"
	armor = /armor/ring/war

/obj/item/clothing/ring/horsemen/conquest
	name = "征服之戒"
	desc = "我来，我见，我征服。"
	desc_extended = "天启四骑士之一的戒指。"
	armor = /armor/ring/conquest

/obj/item/clothing/ring/horsemen/famine
	name = "饥荒之戒"
	desc = "有零钱吗？"
	desc_extended = "天启四骑士之一的戒指。"
	armor = /armor/ring/famine

/obj/item/clothing/ring/copper/unarmed_booster
	name = "徒手之戒"
	desc = "献给一无所有之人。"
	desc_extended = "大幅提升徒手格斗技能的特殊戒指。"

	mob_values_add = list(
		SKILL_UNARMED = 25
	)

	rarity = RARITY_LEGENDARY

/obj/item/clothing/ring/copper/unarmed_booster/get_base_value()
	. = ..()
	. += 6000
