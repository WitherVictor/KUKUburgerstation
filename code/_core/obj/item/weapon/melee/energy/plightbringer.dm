/obj/item/weapon/melee/energy/plightbringer
	name = "\improper 苦难使者之剑"
	desc = "带有装饰剑柄的大型黑钢直剑。"
	desc_extended = "装饰华丽的大型黑钢直剑。黑钢比多数金属更能承载法术与魔力灌注，却难以保持锋利。因此，这种金属武器最常见的使用者是战斗法师。"
	icon = 'icons/obj/item/weapons/melee/swords/plightbringer.dmi'

	value = 2500


	damage_type = /damagetype/melee/sword/plightbringer
	damage_type_on = /damagetype/melee/sword/plightbringer/on

	size = SIZE_4
	weight = 25

	rarity = RARITY_MYTHICAL

/obj/item/weapon/melee/energy/plightbringer/click_self(var/mob/activator,location,control,params)

	. = ..()

	if(.)
		SPAM_CHECK(20)
		if(enabled)
			play_sound('sound/weapons/magic/ash.ogg',get_turf(src),range_max=VIEW_RANGE)
		else
			play_sound('sound/weapons/magic/ash.ogg',get_turf(src),range_max=VIEW_RANGE)
