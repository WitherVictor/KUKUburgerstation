/obj/item/coin/
	name = "硬币"
	desc = "亮闪闪！"
	desc_extended = "一枚闪亮的硬币，价值取决于材质。"
	icon = 'icons/obj/item/coin.dmi'
	icon_state = "coin"

	drop_sound = 'sound/items/drop/ring.ogg'

	weight = 0.05
	size = SIZE_0


/obj/item/coin/bronze
	name = "太阳系青铜币"
	value = 25
	icon_state = "coin1"
	color = COLOR_BRONZE
	rarity = RARITY_COMMON

/obj/item/coin/iron
	name = "太阳系铁币"
	value = 50
	icon_state = "coin2"
	color = COLOR_IRON
	rarity = RARITY_COMMON

/obj/item/coin/silver
	name = "太阳系银币"
	value = 100
	icon_state = "coin3"
	color = COLOR_SILVER
	rarity = RARITY_UNCOMMON

/obj/item/coin/gold
	name = "太阳系金币"
	value = 250
	icon_state = "coin4"
	color = COLOR_GOLD
	rarity = RARITY_RARE

/obj/item/coin/phoron
	name = "太阳系佛隆币"
	value = 500
	icon_state = "coin5"
	color = COLOR_PHORON
	rarity = RARITY_RARE

/obj/item/coin/platinum
	name = "太阳系铂金币"
	value = 1000
	icon_state = "coin6"
	color = COLOR_PLATINUM
	rarity = RARITY_MYTHICAL

/obj/item/coin/diamond
	name = "太阳系钻石币"
	value = 2500
	icon_state = "coin7"
	color = COLOR_DIAMOND
	rarity = RARITY_MYTHICAL

/obj/item/coin/adamantium
	name = "太阳系精金币"
	value = 5000
	icon_state = "coin8"
	color = COLOR_ADAMANITUM_CARBON
	rarity = RARITY_LEGENDARY

/obj/item/coin/cursed
	name = "诡异硬币"
	desc = "永远选反面。"
	desc_extended = "一枚材质不明、令人不安的硬币。感觉捏碎它就能改变命运。"
	icon_state = "coin5"
	value = 2000
	rarity = RARITY_UNCOMMON

/obj/item/coin/cursed/click_self(var/mob/activator,location,control,params)

	INTERACT_CHECK
	INTERACT_DELAY(1)

	if(!activator)
		return ..()

	var/mob/living/L = activator

	activator.to_chat(span("warning","你捏碎了手中的硬币，祈求好运。"))
	if(prob(50))
		activator.to_chat(span("notice","你感觉还好。"))
	else if(prob(50))
		L.add_attribute_xp(ATTRIBUTE_LUCK,1,FALSE)
		activator.to_chat(span("notice","你觉得自己更幸运了！"))
	else
		L.add_attribute_xp(ATTRIBUTE_LUCK,-1,FALSE)
		activator.to_chat(span("danger","你觉得自己被诅咒了……"))
	qdel(src)

	return TRUE

/obj/item/coin/antag_token
	name = "对抗角色代币"
	desc = "合法击杀，还是乱杀？"
	desc_extended = "购买后在手中捏碎，可为账号增加1枚对抗角色代币。当回合允许加入对抗角色时，可在旁观状态下点击菜单中的\"成为对抗角色\"进行兑换。注意，名额有限。"
	icon_state = "antag_token_gold"
	value = 1000

	rarity = RARITY_RARE

	value_burgerbux = 3

/obj/item/coin/antag_token/click_self(var/mob/activator,location,control,params)

	INTERACT_CHECK
	INTERACT_DELAY(30)

	if(!is_player(activator))
		return FALSE

	if(!activator.client)
		return FALSE //literally how

	var/savedata/client/globals/GD = GLOBALDATA(activator.client.ckey)

	if(!GD)
		activator.to_chat(span("warning","你不知道该怎么用这东西……"))
		return TRUE

	GD.loaded_data["antag_tokens"] += 1 //We don't save here because there might be an exploit where you don't save or something.
	activator.to_chat(span("warning","你的对抗角色代币增加了1枚！现在共有[GD.loaded_data["antag_tokens"]]枚。"))
	GD.save()
	qdel(src)

	return TRUE


/obj/item/coin/bananium
	name = "蕉金币"
	desc = "叭！"
	desc_extended = "购买后捏碎，可传送到小丑星球上的商店。仅限纳米传讯成员在汉堡站使用。"
	icon_state = "bananium"
	value = 500
	rarity = RARITY_RARE


/obj/item/coin/bananium/click_self(var/mob/activator,location,control,params)

	INTERACT_CHECK
	INTERACT_DELAY(10)

	if(!is_player(activator))
		return FALSE

	var/mob/living/advanced/player/P = activator

	if(P.loyalty_tag != "NanoTrasen")
		activator.to_chat(span("notice","你不知道该怎么用这东西……"))
		return FALSE

	var/turf/T = get_turf(src)
	var/area/A = T.loc
	if(A.area_identifier != "Burgerstation")
		activator.to_chat(span("notice","现在似乎捏不碎这枚硬币。也许该在站内试试？"))
		return FALSE

	if(!length(clown_planet_markers))
		activator.to_chat(span("notice","现在似乎捏不碎这枚硬币。"))
		return FALSE

	var/obj/marker/clown_planet/M = pick(clown_planet_markers)
	P.force_move(get_turf(M))

	qdel(src)

	return TRUE
