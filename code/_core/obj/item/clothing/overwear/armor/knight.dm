/obj/item/clothing/overwear/armor/knight
	name = "重型骑士护甲"
	desc = "重装翻滚模式，启动！"
	desc_extended = "衬垫厚实的钢制护甲，能有效抵御各类物理伤害，但会让行动变得困难。"
	icon = 'icons/obj/item/clothing/suit/knight_blank.dmi'
	worn_layer = LAYER_MOB_CLOTHING_HARDSUIT


	protected_limbs = list(BODY_TORSO,BODY_GROIN,BODY_ARM_LEFT,BODY_ARM_RIGHT,BODY_HAND_LEFT,BODY_HAND_RIGHT,BODY_LEG_LEFT,BODY_LEG_RIGHT)

	hidden_organs = list(
		BODY_TORSO = TRUE,
		BODY_GROIN = TRUE,
		BODY_ARM_RIGHT = TRUE,
		BODY_ARM_LEFT = TRUE,
		BODY_HAND_RIGHT = TRUE,
		BODY_HAND_LEFT = TRUE,
		BODY_LEG_RIGHT = TRUE,
		BODY_LEG_LEFT = TRUE,
		BODY_FOOT_RIGHT = TRUE,
		BODY_FOOT_LEFT = TRUE
	)

	armor = /armor/steel

	size = SIZE_6

	value = 150

	rarity = RARITY_UNCOMMON

/obj/item/clothing/overwear/armor/knight/red
	name = "红色重型骑士护甲"
	icon = 'icons/obj/item/clothing/suit/knight_red.dmi'

/obj/item/clothing/overwear/armor/knight/blue
	name = "蓝色重型骑士护甲"
	icon = 'icons/obj/item/clothing/suit/knight_blue.dmi'

/obj/item/clothing/overwear/armor/knight/green
	name = "绿色重型骑士护甲"
	icon = 'icons/obj/item/clothing/suit/knight_green.dmi'

/obj/item/clothing/overwear/armor/knight/yellow
	name = "黄色重型骑士护甲"
	icon = 'icons/obj/item/clothing/suit/knight_yellow.dmi'

/obj/item/clothing/overwear/armor/knight/special
	name = "超重型骑士护甲"
	desc = "穿着它翻滚，大概会把全身骨头都压断。"
	desc_extended = "一套完全由钢制成的巨型护甲，几乎能抵御各种物理伤害，但行动极为困难。而且，穿着就像待在烤箱里。"
	icon = 'icons/obj/item/clothing/suit/knight_special.dmi'

	armor = /armor/steel/heavy

	size = SIZE_7

	value = 1000

	value_burgerbux = 1

	rarity = RARITY_MYTHICAL

/obj/item/clothing/overwear/armor/knight/templar
	name = "圣殿骑士护甲"
	desc = "去他妈的精灵。"
	desc_extended = "过去是不懂宗教的佣兵在穿，现在则常被同样不懂宗教的角色扮演爱好者穿着。"
	icon = 'icons/obj/item/clothing/suit/knight_templar.dmi'

	armor = /armor/steel/holy

	size = SIZE_5


	value = 200

/obj/item/clothing/overwear/armor/knight/battlemage
	name = "战斗法师护甲"
	desc = "保护你脆弱的巫师之躯。"
	desc_extended = "巫师联邦中还没到七十岁的成员使用的护甲。"
	icon = 'icons/obj/item/clothing/suit/knight_battlemage.dmi'

	armor = /armor/steel/arcane

	size = SIZE_6

	value = 300

	value_burgerbux = 1

/obj/item/clothing/overwear/armor/knight/daddy
	name = "巨人父亲护甲"

	desc = "传说永不落幕。"
	desc_extended = "与你的混沌双手巨剑相配的护甲。"
	icon = 'icons/obj/item/clothing/suit/knight_daddy.dmi'

	armor = /armor/steel/heavy

	size = SIZE_7

	value = 4000

	rarity = RARITY_MYTHICAL

/obj/item/clothing/overwear/armor/knight/clockwork
	name = "发条护甲"

	desc = "赞美拉特瓦尔。"
	desc_extended = "一套青铜板甲。"
	icon = 'icons/obj/item/clothing/suit/clockwork.dmi'

	armor = /armor/brass

	size = SIZE_6

	value = 900

	rarity = RARITY_RARE

/obj/item/clothing/overwear/armor/knight/magnus
	name = "马格努斯护甲"
	icon = 'icons/obj/item/clothing/suit/magnus.dmi'

	armor = /armor/steel/arcane/light

	protected_limbs = list(BODY_TORSO,BODY_GROIN)

	size = SIZE_5

	value = 300

	rarity = RARITY_MYTHICAL

/obj/item/clothing/overwear/armor/knight/magnus/red
	color = COLOR_RED

/obj/item/clothing/overwear/armor/knight/magnus/gold
	color = COLOR_GOLD

/obj/item/clothing/overwear/armor/knight/goblin
	name = "地精骑士胸甲"
	desc = "裤子呢？"
	desc_extended = "一套没有裤装的骑士护甲，很适合矮小的地精。"
	icon = 'icons/obj/item/clothing/suit/goblin.dmi'

	armor = /armor/steel

	protected_limbs = list(BODY_TORSO,BODY_GROIN,BODY_ARM_LEFT,BODY_ARM_RIGHT,BODY_HAND_LEFT,BODY_HAND_RIGHT)

	size = SIZE_4

	hidden_organs = list(
		BODY_TORSO = TRUE,
		BODY_GROIN = TRUE,
		BODY_ARM_RIGHT = TRUE,
		BODY_ARM_LEFT = TRUE,
		BODY_HAND_RIGHT = TRUE,
		BODY_HAND_LEFT = TRUE
	)


/obj/item/clothing/overwear/armor/knight/runic
	name = "符文板甲"
	desc = "免费给护甲镶边，把精金装备交给我，包你放心。"
	desc_extended = "用符文金属制成的板甲，防护出色。"
	icon = 'icons/obj/item/clothing/suit/runic.dmi'

	worn_layer = LAYER_MOB_CLOTHING_ARMOR

	armor = /armor/steel/runic

	size = SIZE_4

	protected_limbs = list(BODY_TORSO,BODY_GROIN,BODY_ARM_LEFT,BODY_ARM_RIGHT)

	hidden_organs = list(
		BODY_TORSO = TRUE,
		BODY_GROIN = TRUE
	)

	rarity = RARITY_MYTHICAL
