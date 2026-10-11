obj/item/clothing/back/storage/backpack/clown
	name = "小丑双肩包"
	desc = "轻便可靠！"
	desc_extended = "小型装备背具，可携带少量大件物品，是战场拾荒者的理想装备。"

	icon = 'icons/obj/item/clothing/back/backpack/clown.dmi'

	dynamic_inventory_count = MAX_INVENTORY_X*2

	size = MAX_INVENTORY_X*2*SIZE_4
	container_max_size = SIZE_4

	value = 160

obj/item/clothing/back/storage/backpack/clown/bag_of_bombs
	name = "小丑炸弹背包"
	desc = "糟糕。"
	desc_extended = "一个可疑的背包，装着近乎无穷无尽的炸弹，穿戴后即可取出。几乎被擦掉的警告写着：炸弹取出时已经点燃。"

	rarity = RARITY_MYTHICAL

	size = MAX_INVENTORY_X*2*SIZE_3

	dynamic_inventory_count = 0

	var/next_bomb = 0

obj/item/clothing/back/storage/backpack/clown/bag_of_bombs/get_base_value()
	. = ..()
	. += 5000

obj/item/clothing/back/storage/backpack/clown/bag_of_bombs/click_self(var/mob/activator,location,control,params)

	if(is_advanced(activator))
		var/mob/living/advanced/L = activator
		var/obj/hud/inventory/I = src.loc
		var/turf/T = get_turf(src)
		if(T && I.worn)
			INTERACT_CHECK
			INTERACT_DELAY(5)
			if(next_bomb >= world.time)
				activator.to_chat(span("notice","[src.name]正在补充，请稍候！"))
				return TRUE
			next_bomb = world.time + SECONDS_TO_DECISECONDS(4)
			var/obj/item/slime_bomb/SB = new(T)
			SB.owner = activator
			SB.loyalty_tag = L.loyalty_tag
			INITIALIZE(SB)
			GENERATE(SB)
			FINALIZE(SB)
			SB.light()
			L.visible_message(span("warning","[L.name]从[src.name]里掏出了已经点燃的[SB.name]！"),span("warning","你从[src.name]里掏出了已经点燃的[SB.name]！"))
			L.put_in_hands(SB,params)
			return TRUE

	. = ..()



