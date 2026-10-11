/obj/item/weapon/melee/sword
	drop_sound = 'sound/items/drop/knife.ogg'

/obj/item/weapon/melee/sword/sabre

	name = "军刀"
	desc = "一把弯刀。弯的。刀。"
	desc_extended = "骑兵军刀，太阳系政府军的军士曾常用作武器，后来被能量剑取代。如今更多是礼服上的装饰。"

	icon = 'icons/obj/item/weapons/melee/swords/sabre.dmi'

	icon_state_worn = "worn"

	damage_type = /damagetype/melee/sword/sabre

	size = SIZE_3
	weight = 6

	can_wear = TRUE

	value = 140

	rarity = RARITY_COMMON


/obj/item/weapon/melee/sword/claymore
	name = "钢制双手大剑"
	desc = "看着它，你真想来一场十字军远征。"
	desc_extended = "基础款双手大剑，因中世纪欧洲骑士使用而闻名。它是邪秽教团之刃的无诅咒版本，也是纳尔西之域最常见的武器之一。"

	icon = 'icons/obj/item/weapons/melee/swords/claymore.dmi'

	damage_type = /damagetype/melee/sword/claymore

	size = SIZE_3
	weight = 6

	value = 120

	can_wear = TRUE

	rarity = RARITY_UNCOMMON

/obj/item/weapon/melee/sword/claymore/cult
	name = "邪教徒之剑"
	icon = 'icons/obj/item/weapons/melee/swords/cult.dmi'
	desc = "看着它，你真想来一场邪恶的十字军远征。"
	desc_extended = "基础款双手大剑，因中世纪欧洲骑士使用而闻名，如今受到了纳尔西魔法的诅咒。"

	damage_type = /damagetype/melee/sword/claymore/cult

	size = SIZE_3
	weight = 6

	value = 200

	rarity = RARITY_RARE

/obj/item/weapon/melee/spear
	name = "钢制短矛"
	desc = "乌嘎邦嘎。"
	desc_extended = "当地灰烬行者常用于狩猎和保卫聚落的短矛。投掷可造成大量伤害。"
	icon = 'icons/obj/item/weapons/melee/swords/spear.dmi'
	damage_type = /damagetype/melee/spear/basic/
	damage_type_thrown = /damagetype/melee/spear/basic/thrown

	size = SIZE_4

	value = 40

	attack_range = 1

	weight = 5

	rarity = RARITY_COMMON

/obj/item/weapon/melee/spear/clockwork
	name = "发条长矛"
	desc = "为了拉特瓦尔！"
	desc_extended = "极其锋利的黄铜合金长矛，不过投掷伤害没那么高。"
	icon = 'icons/obj/item/weapons/melee/swords/ratvar.dmi'
	damage_type = /damagetype/melee/spear/ratvar/

	size = SIZE_4

	value = 400

	attack_range = 2

	weight = 10

	rarity = RARITY_RARE

/obj/item/weapon/melee/spear/bone
	name = "歌利亚骨矛"
	desc = "尖头对准入侵者。"
	desc_extended = "用歌利亚的皮革、筋腱和骨头制成的锋利长矛。"
	icon = 'icons/obj/item/weapons/melee/polearms/bone_spear.dmi'
	damage_type = /damagetype/melee/spear/basic

	size = SIZE_4

	value = 400

	attack_range = 2

	weight = 10

	rarity = RARITY_RARE

	dan_mode = FALSE

	can_wield = TRUE

/obj/item/weapon/melee/sword/zweihander
	name = "双手巨剑"

	desc = "传奇之剑。"
	desc_extended = "这把钢剑以巨大的体积和重量弥补了朴素设计的不足。双手巨剑的模样令人胆寒，只有完全不顾自身安危的私人军事承包人员才会使用。"
	icon = 'icons/obj/item/weapons/melee/swords/zweihander.dmi'
	damage_type = /damagetype/melee/sword/zweihander

	size = SIZE_5

	value = 900

	attack_range = 2

	rarity = RARITY_RARE

/obj/item/weapon/melee/sword/zweihander/should_cleave(var/atom/attacker,var/atom/victim,var/list/params)

	if(wielded)
		return TRUE

	return ..()

/obj/item/weapon/melee/sword/curvedsword
	name = "钢制弯刀"
	desc = "弯曲的刀刃，不擅长突刺，却擅长快速劈砍。"
	desc_extended = "标准弯刀，可以快速挥动，保养得当时能保持极其锋利。"

	icon = 'icons/obj/item/weapons/melee/swords/curvedsword.dmi'

	dan_mode = TRUE

	damage_type = /damagetype/melee/sword/curvedsword

	size = SIZE_3
	weight = 5

	value = 500

	rarity = RARITY_RARE

/obj/item/weapon/melee/sword/skana
	name = "斯卡纳剑"
	desc = "经过太空化改造的轻型金属武士刀。"
	desc_extended = "类似武士刀的直剑，靠近剑尖处开始弯曲，极其锋利。"

	icon = 'icons/obj/item/weapons/melee/swords/skana.dmi'

	dan_mode = TRUE

	damage_type = /damagetype/melee/sword/skana

	size = SIZE_3
	weight = 4

	value = 180

	rarity = RARITY_UNCOMMON

/obj/item/weapon/melee/sword/gladius
	name = "罗马短剑"
	desc = "钢刃罗马短剑。"
	desc_extended = "轻型罗马短剑，配有青铜剑柄与钢制剑刃。"

	icon = 'icons/obj/item/weapons/melee/swords/gladius.dmi'

	dan_mode = TRUE

	damage_type = /damagetype/melee/sword/gladius

	size = SIZE_2
	weight = 4

	value = 200

	rarity = RARITY_COMMON

/obj/item/weapon/melee/sword/allium
	name = "阿利乌姆短剑"
	desc = "铜制阿利乌姆短剑。"
	desc_extended = "轻型铜制阿利乌姆短剑，比罗马短剑更适合突刺。"

	icon = 'icons/obj/item/weapons/melee/swords/allium.dmi'

	dan_mode = TRUE

	damage_type = /damagetype/melee/sword/allium

	size = SIZE_2
	weight = 5

	value = 150

	rarity = RARITY_COMMON
