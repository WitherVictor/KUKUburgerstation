/obj/item/fishing/lure
	icon = 'icons/obj/item/fishing/bob.dmi'
	drop_sound = 'sound/items/drop/scrap.ogg'
	size = SIZE_0
	weight = 1

	var/bob_icon_state = null

	var/chance_bonus = 0 //Chance for the lure to hook something.
	var/time_bonus = 0 //Time, in deciseconds, before the fish gets away.
	var/rarity_bonus = 0 //Bonus chance every decisecond to catch something.

	var/catchsound = "sound/ui/message_ping.ogg"

/obj/item/fishing/lure/t1
	name = "基础浮漂"
	icon_state = "generic"
	desc = "引几条鱼来。"
	desc_extended = "基础钓鱼浮漂，能用就行。"
	bob_icon_state = "generic"

	chance_bonus = 0
	time_bonus = 2
	rarity_bonus = 0

	value = 50

	rarity = RARITY_COMMON

/obj/item/fishing/lure/t1_easy
	name = "休闲浮漂"
	icon_state = "easy"
	desc = "天啊，我就想钓个鱼！"
	desc_extended = "适合新手的舒适商店自有品牌浮漂。虽然稍贵，但适合反应慢的钓鱼人，比如小孩或安保主管。"
	bob_icon_state = "easy"

	chance_bonus = -2
	time_bonus = 10
	rarity_bonus = -10

	value = 250

	rarity = RARITY_COMMON

/obj/item/fishing/lure/t2
	name = "商业级浮漂"
	icon_state = "commercial"
	desc = "商业化钓鱼。"
	desc_extended = "为高端钓鱼人准备的高档浮漂。非常昂贵，能更容易吸引鱼上钩，并留出更宽裕的收线时间。"
	bob_icon_state = "commercial"

	chance_bonus = 3
	time_bonus = 5
	rarity_bonus = 0

	value = 1000

	rarity = RARITY_UNCOMMON

/obj/item/fishing/lure/t3
	name = "麦硬汉浮漂"
	icon_state = "robust"
	desc = "警告：硬得很。"
	desc_extended = "极其结实、极其稀有的浮漂，专供最强悍的钓鱼人。可提高上钩频率和稀有鱼获的得分。"
	bob_icon_state = "robust"

	chance_bonus = 5
	time_bonus = 0
	rarity_bonus = 10

	value = 1000

	rarity = RARITY_RARE

/obj/item/fishing/lure/t3_clown
	name = "搞笑浮漂"
	icon_state = "clown"
	desc = "哪里好笑？"
	desc_extended = "古怪的小丑风格浮漂，可提高稀有鱼获的得分，但收线时间更短。代价就是这个？"
	bob_icon_state = "clown"
	catchsound = "sound/items/bikehorn.ogg"

	chance_bonus = 0
	time_bonus = -5
	rarity_bonus = 20

	value = 2000

	rarity = RARITY_RARE
